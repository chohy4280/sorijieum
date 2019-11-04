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

import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import book.model.service.BookService;
import book.model.vo.Book;
import bookmaking.model.service.BookMakingService;

/**
 * Servlet implementation class bookUpdateServlet
 */
@WebServlet("/bup.ad")
public class AdBookUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdBookUpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 도서 수정처리용 컨트롤러
		
		request.setCharacterEncoding("utf-8");
		
		RequestDispatcher view = null;
		if(!ServletFileUpload.isMultipartContent(request)) { 
			view = request.getRequestDispatcher("views/common/error.jsp");
			request.setAttribute("message", "enctype으로 변경하여 폼 전송해야 합니다.");
			view.forward(request, response);
		}
		
		int maxSize = 1024 * 1024 * 20;
		
		String savePath = request.getSession().getServletContext().getRealPath("/resources/book_upfiles");
		
		MultipartRequest mrequest = new MultipartRequest(request, savePath, maxSize, "utf-8", new DefaultFileRenamePolicy());
		
		Book b = new Book();
		int currentPage = Integer.parseInt(mrequest.getParameter("page"));
		String bookcode = mrequest.getParameter("bookcode");
		b.setBookTitle(mrequest.getParameter("booktitle"));
		b.setAuthor(mrequest.getParameter("author"));
		b.setPublisher(mrequest.getParameter("publisher"));
		b.setPublishDate(Date.valueOf(mrequest.getParameter("pubdate")));
		b.setBookPage(Integer.parseInt(mrequest.getParameter("bookpage")));
		b.setBookCode(bookcode);
		b.setBookInfo(mrequest.getParameter("bookinfo"));
		
		String bookoimg = mrequest.getParameter("bookoimg");
		String bookrimg = mrequest.getParameter("bookrimg");
		String bookopdf = mrequest.getParameter("bookopdf");
		String bookrpdf = mrequest.getParameter("bookrpdf");
		String bookotxt = mrequest.getParameter("bookotxt");
		String bookrtxt = mrequest.getParameter("bookrtxt");
		
		String bimgOriginalFileName = mrequest.getFilesystemName("upbookoimg");
		String bpdfOriginalFileName = mrequest.getFilesystemName("upbookopdf");
		String btxtOriginalFileName = mrequest.getFilesystemName("upbookotxt");
		
		
		if(bimgOriginalFileName != null) {
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHss");
			String bimgRenameFileName = sdf.format(new java.sql.Date(System.currentTimeMillis())) + "." + bimgOriginalFileName.substring(bimgOriginalFileName.lastIndexOf(".") + 1);
			
			File bimgOriginFile = new File(savePath + "\\" + bimgOriginalFileName);
			File bimgRenameFile = new File(savePath + "\\" + bimgRenameFileName);

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
					// 이전 rename 파일도 삭제
					new File(savePath + "\\" + bookrimg).delete();
			}
			b.setBookOimg(bimgOriginalFileName);
			b.setBookRimg(bimgRenameFileName);
		}else if(bimgOriginalFileName == null){
			b.setBookOimg(bookoimg);
			b.setBookRimg(bookrimg);
		}


		if(bpdfOriginalFileName != null){
			String bpdfRenameFileName = bookcode + "." + bpdfOriginalFileName.substring(bpdfOriginalFileName.lastIndexOf(".") + 1);
			
			File bpdfOriginFile = new File(savePath + "\\" + bpdfOriginalFileName);
			File bpdfRenameFile = new File(savePath + "\\" + bpdfRenameFileName);

			if(!bpdfOriginFile.renameTo(bpdfRenameFile)) {
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
					// 이전 rename 파일도 삭제
					new File(savePath + "\\" + bookrpdf).delete();
					
			}
			b.setBookOpdf(bpdfOriginalFileName);
			b.setBookRpdf(bpdfRenameFileName);
		}else if(bpdfOriginalFileName == null){
			b.setBookOpdf(bookopdf);
			b.setBookRpdf(bookrpdf);
		}
		

		if(btxtOriginalFileName != null) {
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHss");
			String btxtRenameFileName = sdf.format(new java.sql.Date(System.currentTimeMillis())) + "." + btxtOriginalFileName.substring(btxtOriginalFileName.lastIndexOf(".") + 1);

			File btxtOriginFile = new File(savePath + "\\" + btxtOriginalFileName);
			File btxtRenameFile = new File(savePath + "\\" + btxtRenameFileName);
			
			if(!btxtOriginFile.renameTo(btxtRenameFile)) {
				int read = -1;
				
				byte[] buf3 = new byte[1024];

				FileInputStream fin3 = new FileInputStream(btxtOriginFile);
				FileOutputStream fout3 = new FileOutputStream(btxtRenameFile);
				
				while((read = fin3.read(buf3, 0, buf3.length)) != -1) {
					fout3.write(buf3, 0, read);
				}
					fin3.close();
					fout3.close();
					// 리네임 했으니 원본 삭제
					btxtOriginFile.delete();
					// 이전 rename 파일도 삭제
					new File(savePath + "\\" + bookrtxt).delete();
			}
			b.setBookOtxt(btxtOriginalFileName);
			b.setBookRtxt(btxtRenameFileName);
		}else if(btxtOriginalFileName == null){
			b.setBookOtxt(bookotxt);
			b.setBookRtxt(bookrtxt);
		}
		

		
		// 서비스로 전달하고 결과 받기
		int result1 = new BookService().updateBook(b);
		// 도서추가시 bookmaking 테이블에도 같이 insert함
		int result2 = new BookMakingService().updateBookadmin(b);
		
		if(result1 > 0 && result2 > 0) {
			response.sendRedirect("/sori/bdetail.ad?bookcode="+bookcode+"&page="+currentPage);
		} else {
			view = request.getRequestDispatcher("views/common/error.jsp");
			request.setAttribute("message", "도서 수정 실패!");
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
