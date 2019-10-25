package book.controller;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class AdBookTxtFileDownServlet
 */
@WebServlet("/btxtfdown.ad")
public class AdBookTxtFileDownServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdBookTxtFileDownServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 도서 텍스트 파일 다운 컨트롤러
		
		// 다운 파일 저장 폴더 위치 알아내기
		String savePath = request.getSession().getServletContext().getRealPath("/resources/book_upfiles");
		
		// 파일명 꺼내기
		String originalFileName = request.getParameter("ofile");
		String renameFileName = request.getParameter("rfile");
		
		// 파일 내용 읽기용 & 네트워크 출력용 스트림 생성
		File downFile = new File(savePath + "/" + renameFileName);
		
		// 파일 읽을 때 버퍼(보조스트림)를 사용하면 처리 성능이 좋아짐(단독생성불가)
		BufferedInputStream bin = new BufferedInputStream(new FileInputStream(downFile));
		
		// 파일을 내보낼 스트림 생성(네트워크는 아웃풋 스트림이 아닌 서블릿 아웃풋 스트림 사용)
		// 요청한 사용자의 정보와 연결되어야 함(response)
		ServletOutputStream downOut = response.getOutputStream();
		
		// 파일 다운처리를 위한 response 세팅(얘가 있어야 파일 세팅됨.안되면 그냥 페이지로 열림)
		response.setContentType("text/plain; charset=utf-8"); //오타내면 파일 선택하라는 다이얼로그 자꾸 뜨니 주의!
		
		// 파일명에 한글이 있을 때, 다운되는 시스템의 os문자셋 맞추기 설정
		response.addHeader("Content-Disposition", "attachment; filename=\"" 
				+ new String(originalFileName.getBytes("UTF-8"), "ISO-8859-1") + "\"");
		// \" 하면 ""따옴표 안에서도 "따옴표로 인식 됨.	한글일 경우 new String을 통해 문자셋 변경 해야함.
		// 바이트 배열로 바뀐 utf-8문자를 ISO-8859-1로 바꿔 저장할 수 있게 함. 문자셋 변환 처리.
		
		// 다운될 파일의 크기(용량) 여기서 파일 쓰려고 위에 File downFile 객체 생성함.(49번째 줄)
		// 스트링으로 안쓰고 파일 객체로 되어있으면 length를 알 수 있음.
		response.setContentLength((int)downFile.length());	// 롱형으로 리턴되니 (int)로 다운캐스팅.
		
		// 파일 읽어서 클라이언트에게 내보내기
		int read = -1;
		// 몇 번 읽을 지 모르니 while로 설정
		while((read = bin.read()) != -1) {
			downOut.write(read);
			downOut.flush();
		}
		
		// 다 읽어서 처리 끝나면 스트림 닫기
		downOut.close();
		bin.close();

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
