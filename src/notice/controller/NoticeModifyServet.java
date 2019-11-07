package notice.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.sql.Date;
import java.text.SimpleDateFormat;

import javax.servlet.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import notice.model.service.NoticeService;
import notice.model.vo.Notice;

/**
 * Servlet implementation class NoticeModifyServet
 */
@WebServlet("/nomidi")
public class NoticeModifyServet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeModifyServet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//공지글 수정 처리용 컨트롤러(관리자만 가능) : 파일 업로드 처리 기능 포함(cos.jar 라이브러리 사용)
		
		//1. multipart  방식으로 전송왔는지 확인함 : 아니면 에러 페이지 내보낸다.
		
		RequestDispatcher view = null;
		if(!ServletFileUpload.isMultipartContent(request)) {
			view = request.getRequestDispatcher("views/common/error.jsp");
			request.setAttribute("message", "form enctype 속성이 multipart 여야 합니다.");
			view.forward(request, response);
		}
		
		//2. 업로드할 파일을 용량 제한 설정 : 10Mbtype로 제한한다면
		int maxSize = 1024 * 1024 * 10;
		
		//3.업로드한 파일이 저장될 폴더 지정
		//현재 서버 엔진에서 실행되고 있는 애플리케이션의 루트 안의 폴더
		String savePath = request.getSession().getServletContext().getRealPath(
				"resources/notice_upfiles");
		
		//4. 파일업로드 실행함
		//cos.jar는 MultipartRequest 클래스를 사용해서 request를 MulitpartRequset로 바꿈
		MultipartRequest mrequest = new MultipartRequest(request, savePath, maxSize,"UTF-8", new DefaultFileRenamePolicy());
		
		//5. 전송온 값 꺼내서 객체에 저장하기
		int currentPage = Integer.parseInt(mrequest.getParameter("page"));
		int noticeno = Integer.parseInt(mrequest.getParameter("noticeno"));
		Notice notice = new Notice();
		
		notice.setNoticeNo(noticeno);
		notice.setNoticeTitle(mrequest.getParameter("title"));
	    notice.setNoticeContent(mrequest.getParameter("content"));
	    //notice.setNoticeDate(Date.valueOf((mrequest.getParameter("noticedate")))); -->날짜는 Date.valueOf
	    
	    //업로드 저장된 파일이름만 추출해서 변수에 기록
	    String originalFileName = mrequest.getFilesystemName("upfile");
	    
	    //파일명을 바꾸기
	    if(originalFileName !=null) {
	    	notice.setNoticeOfile(originalFileName);
	    	
	    	SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
	    	String renameFileName = sdf.format(new java.sql.Date(System.currentTimeMillis()))
	    			+ "." + originalFileName.substring(originalFileName.lastIndexOf(".") + 1);
	    	
	    	//파일명을 바꾸려면 File 객체의 renameTo() 사용함
	    	File originFile = new File(savePath + "\\" + originalFileName);
	    	File renameFile = new File(savePath + "\\" + renameFileName);
	    	
	    	//파일 이름 바꾸기 실행함 --> 실행한 경우에는 직접 바꿔야함
	    	if(!originFile.renameTo(renameFile)) {
	    		int read = -1;
	    		byte[]buf = new byte[1024];
	    		
	    		FileInputStream fin = new FileInputStream(originFile);
	    		FileOutputStream fout = new FileOutputStream(renameFile);
	    		
	    		while((read = fin.read(buf,0,buf.length)) != -1) {
	    			fout.write(buf,0,read);
	    		}
	    		
	    		fin.close();
	    		fout.close();
	    		originFile.delete(); //원본파일 삭제하기
	    	}
	    	
	    	notice.setNoticeRfile(renameFileName);
	    	
	    	//새로운 첨부파일이 업로드되었다면, 이전 파일을 찾아서 폴더에서 삭제한다.
	    	new File(savePath + "\\" + mrequest.getParameter("rfile")).delete();
	   
	    }else {
	    	notice.setNoticeOfile(mrequest.getParameter("ofile"));
	    	notice.setNoticeRfile(mrequest.getParameter("rfile"));
	    }
	    
	    //6. 모델 서비스로 전달하고, 결과 받기
	    int result = new NoticeService().modifyNotice(notice);
	    
	    //7. 받은 결과로 성공/실패 페이지 내보내기
	    if(result > 0) {
	    	response.sendRedirect("/sori/ndlist?noticeno="+noticeno+"&page="+currentPage);
	    	
	    }else {
	    	view = request.getRequestDispatcher("views/common/error.jsp");
	    	request.setAttribute("message", notice.getNoticeNo() + "번 공지글 수정 실패!");
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
