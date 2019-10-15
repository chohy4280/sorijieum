package book.model.vo;

import java.sql.Date;

public class Book implements java.io.Serializable {

	private static final long serialVersionUID = 222L;
	
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
	private int bookViews;
	private String makeStatus;
	private String bookDelyn;
	

	public Book() {}


	public Book(String bookCode, String bookTitle, String author, String publisher, Date publishDate, int bookPage,
			String bookInfo, String bookOimg, String bookRimg, String bookOpdf, String bookRpdf, Date bookDate,
			int bookViews, String makeStatus, String bookDelyn) {
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
		this.bookViews = bookViews;
		this.makeStatus = makeStatus;
		this.bookDelyn = bookDelyn;
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


	public int getBookViews() {
		return bookViews;
	}


	public void setBookViews(int bookViews) {
		this.bookViews = bookViews;
	}


	public String getMakeStatus() {
		return makeStatus;
	}


	public void setMakeStatus(String makeStatus) {
		this.makeStatus = makeStatus;
	}


	public String getBookDelyn() {
		return bookDelyn;
	}


	public void setBookDelyn(String bookDelyn) {
		this.bookDelyn = bookDelyn;
	}


	@Override
	public String toString() {
		return "Book [bookCode=" + bookCode + ", bookTitle=" + bookTitle + ", author=" + author + ", publisher="
				+ publisher + ", publishDate=" + publishDate + ", bookPage=" + bookPage + ", bookInfo=" + bookInfo
				+ ", bookOimg=" + bookOimg + ", bookRimg=" + bookRimg + ", bookOpdf=" + bookOpdf + ", bookRpdf="
				+ bookRpdf + ", bookDate=" + bookDate + ", bookViews=" + bookViews + ", makeStatus=" + makeStatus
				+ ", bookDelyn=" + bookDelyn + "]";
	}


	
}
