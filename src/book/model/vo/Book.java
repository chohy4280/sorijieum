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
	private String bookDelYN;
	private String bookOtxt;
	private String bookRtxt;
	
	public Book() {}

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

	public String getBookDelYN() {
		return bookDelYN;
	}

	public void setBookDelYN(String bookDelYN) {
		this.bookDelYN = bookDelYN;
	}

	public String getBookOtxt() {
		return bookOtxt;
	}

	public void setBookOtxt(String bookOtxt) {
		this.bookOtxt = bookOtxt;
	}

	public String getBookRtxt() {
		return bookRtxt;
	}

	public void setBookRtxt(String bookRtxt) {
		this.bookRtxt = bookRtxt;
	}

	@Override
	public String toString() {
		return "Book [bookCode=" + bookCode + ", bookTitle=" + bookTitle + ", author=" + author + ", publisher="
				+ publisher + ", publishDate=" + publishDate + ", bookPage=" + bookPage + ", bookInfo=" + bookInfo
				+ ", bookOimg=" + bookOimg + ", bookRimg=" + bookRimg + ", bookOpdf=" + bookOpdf + ", bookRpdf="
				+ bookRpdf + ", bookDate=" + bookDate + ", bookViews=" + bookViews + ", makeStatus=" + makeStatus
				+ ", bookDelYN=" + bookDelYN + ", bookOtxt=" + bookOtxt + ", bookRtxt=" + bookRtxt + "]";
	}


	
}
