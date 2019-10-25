package makebook.model.vo;

import java.sql.Date;

//참여도서에서 한번에 받아올 여러 테이블 값 합치기용
public class MakeBookBBM implements java.io.Serializable {
	private static final long serialVersionUID = 2110995L;
	
	private String bookcode;
	private String booktitle;
	private String author;
	private String publisher;
	private Date publishdate;
	private int bookpage;
	private String bookoimg;
	private String bookrimg;
	private String makestatus;
	private String bookdelyn;
	private int makepage;
	private Date makedate;
	
	public MakeBookBBM() {}
	
	public MakeBookBBM(String bookcode, String booktitle, String author, String publisher, Date publishdate,
			int bookpage, String bookoimg, String bookrimg, String makestatus, String bookdelyn, int makepage,
			Date makedate) {
		super();
		this.bookcode = bookcode;
		this.booktitle = booktitle;
		this.author = author;
		this.publisher = publisher;
		this.publishdate = publishdate;
		this.bookpage = bookpage;
		this.bookoimg = bookoimg;
		this.bookrimg = bookrimg;
		this.makestatus = makestatus;
		this.bookdelyn = bookdelyn;
		this.makepage = makepage;
		this.makedate = makedate;
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

	public String getMakestatus() {
		return makestatus;
	}

	public void setMakestatus(String makestatus) {
		this.makestatus = makestatus;
	}

	public String getBookdelyn() {
		return bookdelyn;
	}

	public void setBookdelyn(String bookdelyn) {
		this.bookdelyn = bookdelyn;
	}

	public int getMakepage() {
		return makepage;
	}

	public void setMakepage(int makepage) {
		this.makepage = makepage;
	}

	public Date getMakedate() {
		return makedate;
	}

	public void setMakedate(Date makedate) {
		this.makedate = makedate;
	}

	@Override
	public String toString() {
		return "MakeBookBBM [bookcode=" + bookcode + ", booktitle=" + booktitle + ", author=" + author + ", publisher="
				+ publisher + ", publishdate=" + publishdate + ", bookpage=" + bookpage + ", bookoimg=" + bookoimg
				+ ", bookrimg=" + bookrimg + ", makestatus=" + makestatus + ", bookdelyn=" + bookdelyn + ", makepage="
				+ makepage + ", makedate=" + makedate + "]";
	}

}