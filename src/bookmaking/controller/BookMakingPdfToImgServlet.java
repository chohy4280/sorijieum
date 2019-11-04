package bookmaking.controller;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.util.*;
import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.pdfbox.pdmodel.PDDocument;
import org.apache.pdfbox.pdmodel.PDPage;

/**
 * Servlet implementation class BookMakingPdfToImgServlet
 */
@WebServlet("/bpimg")
public class BookMakingPdfToImgServlet extends HttpServlet {
   private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BookMakingPdfToImgServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
  
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 도서제작 피디에프 파일의 이미지 저장
	 	request.setCharacterEncoding("utf-8");
		String bookcode = request.getParameter("bookcode");
		System.out.println(bookcode);
		
	   String rootPaths = this.getClass().getResource("/").getPath();
	   String src = "/resources/book_upfiles/" + bookcode + ".pdf";
	   String plus = rootPaths+src;
	   String[] splt = plus.split("/WEB-INF/classes/");
	   String finSrc = "";
	   for(int i=0; i<splt.length; i++){
	      finSrc += splt[i];
	   }
	   String rootPathss = this.getClass().getResource("/").getPath();
	   String srcs = "/resources/book_pdf_images/" + bookcode;
	   String pluss = rootPathss+srcs;
	   String[] splts = pluss.split("/WEB-INF/classes/");
	   String finSrcs = "";
	   for(int i=0; i<splts.length; i++){
	      finSrcs += splts[i];
	   }
	   /* String rootPaths = System.getProperty("user.home"); */
	   System.out.println("rootpaths: "+ finSrc);
	   System.out.println("rootpathss: "+ finSrcs);
		 
		String sourceDir = finSrc;
		String destinationDir = finSrcs; //폴더 경로
		File sourceFile = new File(sourceDir);
		File destinationFile = new File(destinationDir);
		File Folder = new File(destinationDir);// 해당 디렉토리가 없을경우 디렉토리를 생성합니다.
		if (!Folder.exists()) {
		    Folder.mkdir(); //폴더 생성합니다.
		    System.out.println("Folder Created -> " + destinationFile.getAbsolutePath());
        }
		if (sourceFile.exists()) {
			PDDocument document = PDDocument.load(sourceDir);
			@SuppressWarnings("unchecked")
			List<PDPage> list = document.getDocumentCatalog().getAllPages();
			String fileName = sourceFile.getName().replace(".pdf", "");
			int pageNumber = 1;
			for (PDPage page : list) {
				BufferedImage image = page.convertToImage();
				File outputfile = new File(destinationDir + "/" + fileName + "_" + pageNumber + ".jpg");
				ImageIO.write(image, "jpg", outputfile);
				pageNumber++;
			}
			document.close();
			System.out.println("Image saved at -> " + destinationFile.getAbsolutePath());
		} else {
			System.err.println(sourceFile.getName() + " File does not exist");
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