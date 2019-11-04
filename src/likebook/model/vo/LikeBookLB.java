package likebook.model.vo;

import java.sql.Date;

//이용자 관심도서 정보 합치기용
public class LikeBookLB implements java.io.Serializable {
	private static final long serialVersionUID = 12345566L;
	
	private String bookcode;
	private String booktitle;
	private String author;
	private String publisher;
	private Date publishdate;
	private String userid;
	private String bookrimg;
	private String bookoimg;
	private Date likedate;
	
	public LikeBookLB() {}

	public LikeBookLB(String bookcode, String booktitle, String author, String publisher, Date publishdate,
			String userid, String bookrimg, String bookoimg, Date likedate) {
		super();
		this.bookcode = bookcode;
		this.booktitle = booktitle;
		this.author = author;
		this.publisher = publisher;
		this.publishdate = publishdate;
		this.userid = userid;
		this.bookrimg = bookrimg;
		this.bookoimg = bookoimg;
		this.likedate = likedate;
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

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getBookrimg() {
		return bookrimg;
	}

	public void setBookrimg(String bookrimg) {
		this.bookrimg = bookrimg;
	}

	public String getBookoimg() {
		return bookoimg;
	}

	public void setBookoimg(String bookoimg) {
		this.bookoimg = bookoimg;
	}

	public Date getLikedate() {
		return likedate;
	}

	public void setLikedate(Date likedate) {
		this.likedate = likedate;
	}

	@Override
	public String toString() {
		return "LikeBookLB [bookcode=" + bookcode + ", booktitle=" + booktitle + ", author=" + author + ", publisher="
				+ publisher + ", publishdate=" + publishdate + ", userid=" + userid + ", bookrimg=" + bookrimg
				+ ", bookoimg=" + bookoimg + ", likedate=" + likedate + "]";
	}


}
