package book.model.vo;

import java.sql.Date;

public class BookPlay implements java.io.Serializable{
	
	private static final long serialVersionUID = 555L;
	
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
	private String bookmakestartstatus;
	private String bookmaketxt;
	private int bookmakepage;
	private int readpage;
	

	public BookPlay() {}


	public BookPlay(String bookCode, String bookTitle, String author, String publisher, Date publishDate, int bookPage,
			String bookInfo, String bookOimg, String bookRimg, String bookOpdf, String bookRpdf, Date bookDate,
			int bookViews, String makeStatus, String bookDelYN, String bookOtxt, String bookRtxt,
			String bookmakestartstatus, String bookmaketxt, int bookmakepage, int readpage) {
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
		this.bookDelYN = bookDelYN;
		this.bookOtxt = bookOtxt;
		this.bookRtxt = bookRtxt;
		this.bookmakestartstatus = bookmakestartstatus;
		this.bookmaketxt = bookmaketxt;
		this.bookmakepage = bookmakepage;
		this.readpage = readpage;
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


	public String getBookmakestartstatus() {
		return bookmakestartstatus;
	}


	public void setBookmakestartstatus(String bookmakestartstatus) {
		this.bookmakestartstatus = bookmakestartstatus;
	}


	public String getBookmaketxt() {
		return bookmaketxt;
	}


	public void setBookmaketxt(String bookmaketxt) {
		this.bookmaketxt = bookmaketxt;
	}


	public int getBookmakepage() {
		return bookmakepage;
	}


	public void setBookmakepage(int bookmakepage) {
		this.bookmakepage = bookmakepage;
	}


	public int getReadpage() {
		return readpage;
	}


	public void setReadpage(int readpage) {
		this.readpage = readpage;
	}


	@Override
	public String toString() {
		return "BookPlay [bookCode=" + bookCode + ", bookTitle=" + bookTitle + ", author=" + author + ", publisher="
				+ publisher + ", publishDate=" + publishDate + ", bookPage=" + bookPage + ", bookInfo=" + bookInfo
				+ ", bookOimg=" + bookOimg + ", bookRimg=" + bookRimg + ", bookOpdf=" + bookOpdf + ", bookRpdf="
				+ bookRpdf + ", bookDate=" + bookDate + ", bookViews=" + bookViews + ", makeStatus=" + makeStatus
				+ ", bookDelYN=" + bookDelYN + ", bookOtxt=" + bookOtxt + ", bookRtxt=" + bookRtxt
				+ ", bookmakestartstatus=" + bookmakestartstatus + ", bookmaketxt=" + bookmaketxt + ", bookmakepage="
				+ bookmakepage + ", readpage=" + readpage + "]";
	}

   
	
}
