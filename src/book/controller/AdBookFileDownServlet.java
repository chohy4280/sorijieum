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
 * Servlet implementation class bookFileDownServlet
 */
@WebServlet("/bfdown.ad")
public class AdBookFileDownServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdBookFileDownServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 도서 파일 다운로드용 서블릿
		
		// 다운 파일 저장 폴더 위치 알아내기
		String savePath = request.getSession().getServletContext().getRealPath("/resources/book_upfiles");
		
		// 파일명 꺼내기
		String bimgOFileName = request.getParameter("bookoimg");
		String bimgRFileName = request.getParameter("bookrimg");
		
		String bpdfOFileName = request.getParameter("bookopdf");
		String bpdfRFileName = request.getParameter("bookrpdf");
		
		String btxtOFileName = request.getParameter("bookotxt");
		String btxtRFileName = request.getParameter("bookrtxt");
		
		// 파일 내용 읽기용 & 네트워크 출력용 스트림 생성
		File imgDownFile = new File(savePath + "/" + bimgRFileName);
		File pdfDownFile = new File(savePath + "/" + bpdfRFileName);
		File txtDownFile = new File(savePath + "/" + btxtRFileName);
		
		// 처리 성능 향상을 위한 버퍼 연결
		BufferedInputStream imgbin = new BufferedInputStream(new FileInputStream(imgDownFile));
		BufferedInputStream pdfbin = new BufferedInputStream(new FileInputStream(pdfDownFile));
		BufferedInputStream txtbin = new BufferedInputStream(new FileInputStream(txtDownFile));
		
		// 파일을 내보낼 스트림 생성
		ServletOutputStream downOut = response.getOutputStream();
		
		// 파일 다운처리를 위한 response 세팅
		response.setContentType("text/plain; charset=utf-8");
		
		// 파일명에 한글이 있을 때, 다운되는 시스템의 os문자셋 맞추기 설정
		response.addHeader("Content-Disposition", "attachment; filename=\"" 
				+ new String(bimgOFileName.getBytes("UTF-8"), "ISO-8859-1") + "\"");
		
		response.addHeader("Content-Disposition", "attachment; filename=\"" 
				+ new String(bpdfOFileName.getBytes("UTF-8"), "ISO-8859-1") + "\"");
		
		response.addHeader("Content-Disposition", "attachment; filename=\"" 
				+ new String(btxtOFileName.getBytes("UTF-8"), "ISO-8859-1") + "\"");
		
		
		// 다운될 파일의 크기(용량)알아내기
		response.setContentLength((int)imgDownFile.length());
		response.setContentLength((int)pdfDownFile.length());
		response.setContentLength((int)txtDownFile.length());
		
		int read = -1;
		
		while(((read = imgbin.read()) != -1) && ((read = pdfbin.read()) != -1) && ((read = txtbin.read()) != -1)) {
			downOut.write(read);
			downOut.flush();
		}
		
		downOut.close();
		imgbin.close();
		pdfbin.close();
		txtbin.close();
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
