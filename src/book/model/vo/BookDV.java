package book.model.vo;

import java.sql.Date;

public class BookDV implements java.io.Serializable {

	private static final long serialVersionUID = 2441316959818871369L;
	
	private String bookCode;
	private String bookTitle;
	private String author;
	private String publisher;
	private java.sql.Date publishDate;
	private int bookPage;
	private String bookInfo;
	private String bookOimg;
	private String bookRimg;
	private String bookOpdf;
	private String bookRpdf;
	private java.sql.Date bookDate;
	private String makeStatus;
	private String bookotxt;
	private String bookrtxt;
	private String bookDelYN;
	
	public BookDV() {}

	public BookDV(String bookCode, String bookTitle, String author, String publisher, Date publishDate, int bookPage,
			String bookInfo, String bookOimg, String bookRimg, String bookOpdf, String bookRpdf, Date bookDate,
			String makeStatus, String bookotxt, String bookrtxt, String bookDelYN) {
		super();
		this.bookCode = bookCode;
		this.bookTitle = bookTitle;
		this.author = author;
		this.publisher = publisher;
		this.publishDate = publishDate;
		this.bookPage = bookPage;
		this.bookInfo = bookInfo;
		this.bookOimg = bookOimg;
		this.bookRimg = bookRimg;
		this.bookOpdf = bookOpdf;
		this.bookRpdf = bookRpdf;
		this.bookDate = bookDate;
		this.makeStatus = makeStatus;
		this.bookotxt = bookotxt;
		this.bookrtxt = bookrtxt;
		this.bookDelYN = bookDelYN;
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

	public java.sql.Date getPublishDate() {
		return publishDate;
	}

	public void setPublishDate(java.sql.Date publishDate) {
		this.publishDate = publishDate;
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

	public java.sql.Date getBookDate() {
		return bookDate;
	}

	public void setBookDate(java.sql.Date bookDate) {
		this.bookDate = bookDate;
	}

	public String getMakeStatus() {
		return makeStatus;
	}

	public void setMakeStatus(String makeStatus) {
		this.makeStatus = makeStatus;
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

	public String getBookDelYN() {
		return bookDelYN;
	}

	public void setBookDelYN(String bookDelYN) {
		this.bookDelYN = bookDelYN;
	}

	@Override
	public String toString() {
		return "BookDV [bookCode=" + bookCode + ", bookTitle=" + bookTitle + ", author=" + author + ", publisher="
				+ publisher + ", publishDate=" + publishDate + ", bookPage=" + bookPage + ", bookInfo=" + bookInfo
				+ ", bookOimg=" + bookOimg + ", bookRimg=" + bookRimg + ", bookOpdf=" + bookOpdf + ", bookRpdf="
				+ bookRpdf + ", bookDate=" + bookDate + ", makeStatus=" + makeStatus + ", bookotxt=" + bookotxt
				+ ", bookrtxt=" + bookrtxt + ", bookDelYN=" + bookDelYN + "]";
	}
	
	

}
