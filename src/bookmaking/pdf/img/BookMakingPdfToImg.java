package bookmaking.pdf.img;

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.getConnection;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.imageio.ImageIO;

import org.apache.pdfbox.pdmodel.PDDocument;
import org.apache.pdfbox.pdmodel.PDPage;

import book.model.vo.BookMakingProgress;


public class BookMakingPdfToImg {

	public static ArrayList<BookMakingProgress> bookcode() {
		ArrayList<BookMakingProgress> blist = new ArrayList<BookMakingProgress>();
		Connection conn = getConnection();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = "select bookcode from book";
		
		try {
			pstmt = conn.prepareStatement(query);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				BookMakingProgress bmp = new BookMakingProgress();
				bmp.setBookCode(rset.getString("bookcode"));
				blist.add(bmp);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return blist;
	}
	
	public static void main(String[] args) throws IOException {
		// 도서제작 피디에프 파일의 이미지 저장
		for(int i = 0; i< bookcode().size(); i++) {
			String bookcode = bookcode().get(i).getBookCode();

			String sourceDir = "C:/Users/macbook/git/sorijieum/web/resources/book_upfiles/" + bookcode + ".pdf";
			String destinationDir = "C:/Users/macbook/git/sorijieum/web/resources/book_pdf_images/" + bookcode; //폴더 경로
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
		
	}

}
