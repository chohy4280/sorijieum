package mybook.model.vo;

import java.sql.Date;

//내서재에서 받아올 값 테이블 합치기용
public class MyBookMYB implements java.io.Serializable {
	private static final long serialVersionUID = 11555864321L;
	
	public MyBookMYB() {}
	
	private String bookcode;
	private String booktitle;
	private String author;
	private String publisher;
	private Date publishdate;
	private int bookpage;
	private int readpage;
	private Date readsdate;
	private Date readrdate;
	private String bookoimg;
	private String bookrimg;
	private String userid;

	public MyBookMYB(String bookcode, String booktitle, String author, String publisher, Date publishdate,
			int bookpage, int readpage, Date readsdate, Date readrdate, String bookoimg, String bookrimg,
			String userid) {
		super();
		this.bookcode = bookcode;
		this.booktitle = booktitle;
		this.author = author;
		this.publisher = publisher;
		this.publishdate = publishdate;
		this.bookpage = bookpage;
		this.readpage = readpage;
		this.readsdate = readsdate;
		this.readrdate = readrdate;
		this.bookoimg = bookoimg;
		this.bookrimg = bookrimg;
		this.userid = userid;
	}

	public String getBookcode() {
		return bookcode;
	}

	public void setBookcode(String bookcode) {
		this.bookcode = bookcode;
	}

	public String getBooktitle() {
		return booktitle;
	}

	public void setBooktitle(String booktitle) {
		this.booktitle = booktitle;
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

	public Date getPublishdate() {
		return publishdate;
	}

	public void setPublishdate(Date publishdate) {
		this.publishdate = publishdate;
	}

	public int getBookpage() {
		return bookpage;
	}

	public void setBookpage(int bookpage) {
		this.bookpage = bookpage;
	}

	public int getReadpage() {
		return readpage;
	}

	public void setReadpage(int readpage) {
		this.readpage = readpage;
	}

	public java.sql.Date getReadsdate() {
		return readsdate;
	}

	public void setReadsdate(java.sql.Date readsdate) {
		this.readsdate = readsdate;
	}

	public java.sql.Date getReadrdate() {
		return readrdate;
	}

	public void setReadrdate(java.sql.Date readrdate) {
		this.readrdate = readrdate;
	}

	public String getBookoimg() {
		return bookoimg;
	}

	public void setBookoimg(String bookoimg) {
		this.bookoimg = bookoimg;
	}

	public String getBookrimg() {
		return bookrimg;
	}

	public void setBookrimg(String bookrimg) {
		this.bookrimg = bookrimg;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	@Override
	public String toString() {
		return "MyBookMYB [bookcode=" + bookcode + ", booktitle=" + booktitle + ", author=" + author + ", publisher="
				+ publisher + ", publishdate=" + publishdate + ", bookpage=" + bookpage + ", readpage=" + readpage
				+ ", readsdate=" + readsdate + ", readrdate=" + readrdate + ", bookoimg=" + bookoimg + ", bookrimg="
				+ bookrimg + ", userid=" + userid + "]";
	}

}
