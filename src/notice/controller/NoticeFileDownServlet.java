package notice.controller;

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
 * Servlet implementation class NoticeFileDownServlet
 */
@WebServlet("/nfdown")
public class NoticeFileDownServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeFileDownServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//다운 파일을 읽어서 요청한 클라이언트 브라우저로 전송처리함
		
	   //다운 파일 저장 폴더 설장
		String savePath = request.getSession().getServletContext().getRealPath("resources/notice_upfiles");
		
		//전송온 파일명 추출
		String originalFileName = request.getParameter("ofile");
		String renameFileName = request.getParameter("rfile");
		
		//파일 읽기용 스트림과 네트워크 출력용 스트림 생성
		File downFile = new File(savePath + "/" + renameFileName);
		BufferedInputStream bin = new BufferedInputStream(new FileInputStream(downFile));
		
		ServletOutputStream downOut = response.getOutputStream();
		
		//파일 다운 처리를 위한 response 셋팅
		response.setContentType("text/plain; charset=utf-8");
		//파일명에 한글이 있을 때 다운되는 브라우저의 문자셋으로 맞추기 설정
		response.addHeader("Content-Disposition", "attachment; filename=\""
		+ new String(originalFileName.getBytes("UTF-8"),"ISO-8859-1") + "\"");
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
