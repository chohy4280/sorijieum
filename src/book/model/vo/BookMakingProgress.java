package book.model.vo;

import java.sql.Date;

public class BookMakingProgress implements java.io.Serializable{
	
	private static final long serialVersionUID = 223L;
	
	private String bookCode;
	private String bookTitle;
	private String author;
	private String publisher;
	private int bookPage;
	private String bookInfo;
	private String bookOimg;
	private String bookRimg;
	private String bookOpdf;
	private String bookRpdf;
	private String makeStatus;
	private java.sql.Date makestart;
	private java.sql.Date makefin;
	private String bookotxt;
	private String bookrtxt;
	private int makepage;	

	public BookMakingProgress() {}
	
	public BookMakingProgress(String bookCode, int bookPage, int makepage) {}

	public BookMakingProgress(String bookCode, String bookTitle, String author, String publisher, int bookPage,
			String bookInfo, String bookOimg, String bookRimg, String bookOpdf, String bookRpdf, String makeStatus,
			Date makestart, Date makefin, String bookotxt, String bookrtxt, int makepage) {
		super();
		this.bookCode = bookCode;
		this.bookTitle = bookTitle;
		this.author = author;
		this.publisher = publisher;
		this.bookPage = bookPage;
		this.bookInfo = bookInfo;
		this.bookOimg = bookOimg;
		this.bookRimg = bookRimg;
		this.bookOpdf = bookOpdf;
		this.bookRpdf = bookRpdf;
		this.makeStatus = makeStatus;
		this.makestart = makestart;
		this.makefin = makefin;
		this.bookotxt = bookotxt;
		this.bookrtxt = bookrtxt;
		this.makepage = makepage;
	}

	public String getBookCode() {
		return bookCode;
	}

	public void setBookCode(String bookCode) {
		this.bookCode = bookCode;
	}

	public String getBookTitle() {
		return bookTitle;
	}

	public void setBookTitle(String bookTitle) {
		this.bookTitle = bookTitle;
	}

	public String getAuthor() {
		return author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	public String getPublisher() {
		return publisher;
	}

	public void setPublisher(String publisher) {
		this.publisher = publisher;
	}

	public int getBookPage() {
		return bookPage;
	}

	public void setBookPage(int bookPage) {
		this.bookPage = bookPage;
	}

	public String getBookInfo() {
		return bookInfo;
	}

	public void setBookInfo(String bookInfo) {
		this.bookInfo = bookInfo;
	}

	public String getBookOimg() {
		return bookOimg;
	}

	public void setBookOimg(String bookOimg) {
		this.bookOimg = bookOimg;
	}

	public String getBookRimg() {
		return bookRimg;
	}

	public void setBookRimg(String bookRimg) {
		this.bookRimg = bookRimg;
	}

	public String getBookOpdf() {
		return bookOpdf;
	}

	public void setBookOpdf(String bookOpdf) {
		this.bookOpdf = bookOpdf;
	}

	public String getBookRpdf() {
		return bookRpdf;
	}

	public void setBookRpdf(String bookRpdf) {
		this.bookRpdf = bookRpdf;
	}

	public String getMakeStatus() {
		return makeStatus;
	}

	public void setMakeStatus(String makeStatus) {
		this.makeStatus = makeStatus;
	}

	public java.sql.Date getMakestart() {
		return makestart;
	}

	public void setMakestart(java.sql.Date makestart) {
		this.makestart = makestart;
	}

	public java.sql.Date getMakefin() {
		return makefin;
	}

	public void setMakefin(java.sql.Date makefin) {
		this.makefin = makefin;
	}

	public String getBookotxt() {
		return bookotxt;
	}

	public void setBookotxt(String bookotxt) {
		this.bookotxt = bookotxt;
	}

	public String getBookrtxt() {
		return bookrtxt;
	}

	public void setBookrtxt(String bookrtxt) {
		this.bookrtxt = bookrtxt;
	}

	public int getMakepage() {
		return makepage;
	}

	public void setMakepage(int makepage) {
		this.makepage = makepage;
	}

	@Override
	public String toString() {
		return "BookMakingProgress [bookCode=" + bookCode + ", bookTitle=" + bookTitle + ", author=" + author
				+ ", publisher=" + publisher + ", bookPage=" + bookPage + ", bookInfo=" + bookInfo + ", bookOimg="
				+ bookOimg + ", bookRimg=" + bookRimg + ", bookOpdf=" + bookOpdf + ", bookRpdf=" + bookRpdf
				+ ", makeStatus=" + makeStatus + ", makestart=" + makestart + ", makefin=" + makefin + ", bookotxt="
				+ bookotxt + ", bookrtxt=" + bookrtxt + ", makepage=" + makepage + "]";
	}

}
