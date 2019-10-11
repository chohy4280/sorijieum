package bookmaking.model.vo;

import java.sql.Date;

public class BookMaking implements java.io.Serializable{

	private static final long serialVersionUID = 222L;
	
	private String bookcode;
	private java.sql.Date makestart;
	private java.sql.Date makefin;
	private String bookotxt;
	private String bookrtxt;
	private int makepage;
	
	public BookMaking() {}

	public BookMaking(String bookcode, Date makestart, Date makefin, String bookotxt, String bookrtxt, int makepage) {
		super();
		this.bookcode = bookcode;
		this.makestart = makestart;
		this.makefin = makefin;
		this.bookotxt = bookotxt;
		this.bookrtxt = bookrtxt;
		this.makepage = makepage;
	}

	public String getBookcode() {
		return bookcode;
	}

	public void setBookcode(String bookcode) {
		this.bookcode = bookcode;
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
		return "BookMaking [bookcode=" + bookcode + ", makestart=" + makestart + ", makefin=" + makefin + ", bookotxt="
				+ bookotxt + ", bookrtxt=" + bookrtxt + ", makepage=" + makepage + "]";
	}
	
	

}
