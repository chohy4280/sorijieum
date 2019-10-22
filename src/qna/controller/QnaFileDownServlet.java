package qna.controller;

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
 * Servlet implementation class QnaFileDownServlet
 */
@WebServlet("/qfdown")
public class QnaFileDownServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QnaFileDownServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//공지사항의 첨부파일 다운로드 처리용 컨트롤러
		//현재 톰캣(WAS:웹컨테이너)에서 실행되고 있는 어플리케이션 내의 파일 저장폴더에서 다운파일 읽어서
		//요청한 클라이언트 브라우저로 전송 처리함(파일입출력)
		
		//다운 파일 저장 폴더
		String savePath = request.getSession().getServletContext().getRealPath("/resources/qna_upfiles");
		//전송 온 파일명 추출
		String ofile = request.getParameter("ofile");
		String rfile = request.getParameter("rfile");
		
		//파일 읽기용 스트림과 네트워크 출력용 스트림 생성
		File downFile = new File(savePath+ "/"+ rfile);
		BufferedInputStream bin = new BufferedInputStream(new FileInputStream(downFile));
		
		ServletOutputStream downOut = response.getOutputStream();
		
		//파일 다운 처리를 위한 response 셋팅
		response.setContentType("text/plain; charset=utf-8");
		//파일명에 한글이 있을 때 다운되는 브라우저의 문자셋으로 맞추기 설정
		response.addHeader("Content-Disposition", "attachment; filename=\""+
							new String(ofile.getBytes("UTF-8"),"ISO-8859-1")+ "\"");
		//다운될 파일의 크기(용량) 셋팅
		response.setContentLength((int)downFile.length());
		
		//파일 읽어서 클라이언트에게 내보내기
		int read = -1;
		while((read = bin.read()) != -1) {
			downOut.write(read);
			downOut.flush();
		}
		
		//스트림 닫기
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
