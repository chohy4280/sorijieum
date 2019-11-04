package book.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.sql.Date;
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

import book.model.service.BookService;
import book.model.vo.Book;
import bookmaking.model.service.BookMakingService;

/**
 * Servlet implementation class bookInsertServlet
 */
@WebServlet("/binsert.ad")
public class AdBookInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdBookInsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 관리자 도서 추가용
		RequestDispatcher view = null;
		if(!ServletFileUpload.isMultipartContent(request)) {
			view = request.getRequestDispatcher("views/common/error.jsp");
			request.setAttribute("message", "form enctype 속성이 nultipart여야 합니다.");
			view.forward(request, response);
		}
		
		int maxSize = 1024 * 1024* 20;		// 20Mbyte;
		
		String savePath = request.getSession().getServletContext().getRealPath("/resources/book_upfiles");
		
		MultipartRequest mrequest = new MultipartRequest(request, savePath, maxSize, "utf-8", new DefaultFileRenamePolicy());
		
		Book b = new Book();
		String bookcode = mrequest.getParameter("bookcode");
		b.setBookTitle(mrequest.getParameter("booktitle"));
		b.setAuthor(mrequest.getParameter("author"));
		b.setPublisher(mrequest.getParameter("publisher"));
		b.setPublishDate(Date.valueOf(mrequest.getParameter("pubdate")));
		b.setBookPage(Integer.parseInt(mrequest.getParameter("bookpage")));
		b.setBookCode(bookcode);
		b.setBookInfo(mrequest.getParameter("bookinfo"));
		String bimgOriginalFileName = mrequest.getFilesystemName("bookoimg");
		String bpdfOriginalFileName = mrequest.getFilesystemName("bookopdf");
		b.setBookOimg(bimgOriginalFileName);
		b.setBookOpdf(bpdfOriginalFileName);
		
		if(bimgOriginalFileName != null && bpdfOriginalFileName != null) {
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHss");
			String bimgRenameFileName = sdf.format(new java.sql.Date(System.currentTimeMillis())) + "." + bimgOriginalFileName.substring(bimgOriginalFileName.lastIndexOf(".") + 1);
			String bpdfRenameFileName = bookcode + "." + bpdfOriginalFileName.substring(bpdfOriginalFileName.lastIndexOf(".") + 1);
			
			File bimgOriginFile = new File(savePath + "\\" + bimgOriginalFileName);
			File bimgRenameFile = new File(savePath + "\\" + bimgRenameFileName);
			File bpdfOriginFile = new File(savePath + "\\" + bpdfOriginalFileName);
			File bpdfRenameFile = new File(savePath + "\\" + bpdfRenameFileName);
			
			if(!bimgOriginFile.renameTo(bimgRenameFile)) {
				int read = -1;
				
				byte[] buf = new byte[1024];
				
				FileInputStream fin = new FileInputStream(bimgOriginFile);
				FileOutputStream fout = new FileOutputStream(bimgRenameFile);
				
				while((read = fin.read(buf, 0, buf.length)) != -1) {
					fout.write(buf, 0, read);
				}
					fin.close();
					fout.close();
					// 리네임 했으니 원본 삭제
					bimgOriginFile.delete();
					
			}else if(!bpdfOriginFile.renameTo(bpdfRenameFile)) {
				int read = -1;
				
				byte[] buf2 = new byte[1024];

				FileInputStream fin2 = new FileInputStream(bpdfOriginFile);
				FileOutputStream fout2 = new FileOutputStream(bpdfRenameFile);
				
				while((read = fin2.read(buf2, 0, buf2.length)) != -1) {
					fout2.write(buf2, 0, read);
				}
					fin2.close();
					fout2.close();
					// 리네임 했으니 원본 삭제
					bpdfOriginFile.delete();
			}
			
			b.setBookRimg(bimgRenameFileName);
			b.setBookRpdf(bpdfRenameFileName);
		}
		int result1 = new BookService().insertBook(b);
		// 도서추가시 bookmaking 테이블에도 같이 insert함
		int result2 = new BookMakingService().insertBook(b);
		int result3 = new BookMakingService().insertBookMakeCheck(b);
		if(result1 > 0 && result2 > 0 && result3 > 0) {
			response.sendRedirect("/sori/blist.ad");
		} else {
			view = request.getRequestDispatcher("views/common/error.jsp");
			request.setAttribute("message", "도서 추가 실패!");
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
