package notice.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.text.SimpleDateFormat;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import notice.model.service.NoticeService;
import notice.model.vo.Notice;

/**
 * Servlet implementation class NoticeWriteServlet
 */
@WebServlet("/nwrite")
public class NoticeNewWriteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeNewWriteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	  //관리자용 공지글 등록 처리용 컨트롤러 : 파일 업로드 처리 기능 포함 (cos.jar 라이브러리 사용)
		
		//1. multipart 방식으로 전송왔는지 확인함 : 아니면 에러 페이지 내보냄
		RequestDispatcher view = null;
		if(!ServletFileUpload.isMultipartContent(request)) {  //Multipart방식으로 전송 온게 아니라면
		   view = request.getRequestDispatcher("views/common/error.jsp");
		   request.setAttribute("message", "form enctype 속성이 multipart 여야 합니다.");
		   view.forward(request, response);
		}
		
		//2. 업로드할 파일의 용량 제한 설정 : 10Mbtype 로 제한한다면
		int maxSize = 1024 * 1024 * 10;
		
		//3. 업로드할 파일 저장할 폴더 지정
		//"c:\\work\\savefiles" 해도 되고
		//현재 서버 엔진(웹 컨테이너)에서 실행되고 있는 에플리케이션의 루트 안의 폴더일 때는
		String savePath = request.getSession().getServletContext().getRealPath("/resources/notice_upfiles"); // (/)가 루트라는 뜻이다
	    
		//4. 파일업로드 실행함
		//cos.jar 는 MultipartRequest 클래스를 사용해서 request를 MultipartRequest로 바꾼다.
		MultipartRequest mrequest = new MultipartRequest(request, savePath, 
				maxSize, "UTF-8", new DefaultFileRenamePolicy());
		//객체 생성과 동시에 파일 업로드 된다.
		
		//5.전송온 값 꺼내서 객체에 저장하기
		Notice notice = new Notice();
		
		notice.setNoticeTitle(mrequest.getParameter("title"));   //noticeWriteForm에 있는 name하고
		                                                                   //getParameter("안에 변수명")일치하게 써야 한다.
		notice.setNoticeContent(mrequest.getParameter("content"));
		notice.setNoticeWriter(mrequest.getParameter("userid"));
		
		
		//업로드 저장된 파일이름만 추출해서 변수에 기록
		String originalFileName = mrequest.getFilesystemName("upfile");
		notice.setNoticeOfile(originalFileName);
		 //파일 이름만 꺼낼때는 getFilesystemName
		
		//System.out.println("notice : " + notice );
		//저장 폴더에 파일명 중복 해결 방법 : 파일명을 "yyyyMMddHHmmss.확장자"로 바꾸기
		//원본의 확장자는 그대로 가져와야 한다 ex) ppt를 exel로 변경 불가
		if(originalFileName != null) { //업로드 된 파일이 있을 경우
		    SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss"); //문자열의 형태를 연월일시분초로 바꿔라
		    String renameFileName = sdf.format(new java.sql.Date(System.currentTimeMillis()))  //컴퓨터에서 현재 연월일시분초 정보를 조회 할 수 있다. 
		     +"." + originalFileName.substring(originalFileName.lastIndexOf(".") + 1); //오리지날 파일명은 String
		                                                                                             // 쩜 다음 글자서 부터 확장자((".") +1) 
		                                                                                           //lastIndxOf = 뒤에서 부터 
		//파일명을 바꾸려면 File 객체의 renameTo()를 사용
		//1.파일 객체 만들기
		  File originFile = new File(savePath + "\\" + originalFileName); //-->이름과 저장한 폴더(savePath)
		  File renameFile = new File(savePath + "\\" + renameFileName);
		  
		  //파일 이름 바꾸기 실패 하는 경우 직접 바꿔야 한다. 
		  if(!originFile.renameTo(renameFile)) { //이름바꾸기 실패(!) 했다면 원본꺼 읽어서 기록
			 //파일 입출력 스트림을 생성하고, 원본을 읽어서 바꿀이름 파일에 기록함
			  int read = -1; 
			  byte[] buf = new byte[1024]; //한번에 1kbyte[1024] 씩 읽고 buf에 저장한다. 
 			  
			  FileInputStream fin = new FileInputStream(originFile); // 40번줄에 이미 throws로 예외처리 완료 되있기 때문에 try catch 하지 않아도 된다.
			  FileOutputStream fout = new FileOutputStream(renameFile);
			  
			  while((read = fin.read(buf, 0, buf.length)) != -1) {} //return 값이 -1 될때 까지 읽어라 //read 한테는 몇바이트 읽었다는 숫자 리턴해라
		              fout.write(buf); //buf의 0번 index부터 byte index 까지 기록해라 //read 사이즈 만큼 읽어서 기록해라
		 
		  fin.close();
		  fout.close();
		  originFile.delete(); //원본 파일 삭제
		} 
		
		notice.setNoticeRfile(renameFileName);
		}
		//6. 모델 서비스로 전달하고, 결과 받기
		int result = new NoticeService().insertNotice(notice);
		
		//7. 받은 결과로 성공/실패 페이지 내보내기
		if(result > 0) {
			  response.sendRedirect("/sori/nlist");  //servlet으로 호출한다.
		}else {
			  view = request.getRequestDispatcher("views/common/error.jsp");
			  request.setAttribute("message", "새 공지글 등록 실패!");
			  view.forward(request, response);
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
