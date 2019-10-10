package adminmemo.model.vo;

import java.sql.Date;

public class AdminMemo implements java.io.Serializable {

	private static final long serialVersionUID = 111L;
	
	private int memoNo;
	private String userId;
	private String adminId;
	private String adminMemo;
	private java.sql.Date memoDate;
	
	public AdminMemo() {}

	public AdminMemo(int memoNo, String userId, String adminId, String adminMemo, Date memoDate) {
		super();
		this.memoNo = memoNo;
		this.userId = userId;
		this.adminId = adminId;
		this.adminMemo = adminMemo;
		this.memoDate = memoDate;
	}

	public int getMemoNo() {
		return memoNo;
	}

	public void setMemoNo(int memoNo) {
		this.memoNo = memoNo;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getAdminId() {
		return adminId;
	}

	public void setAdminId(String adminId) {
		this.adminId = adminId;
	}

	public String getAdminMemo() {
		return adminMemo;
	}

	public void setAdminMemo(String adminMemo) {
		this.adminMemo = adminMemo;
	}

	public java.sql.Date getMemoDate() {
		return memoDate;
	}

	public void setMemoDate(java.sql.Date memoDate) {
		this.memoDate = memoDate;
	}

	@Override
	public String toString() {
		return "AdminMemo [memoNo=" + memoNo + ", userId=" + userId + ", adminId=" + adminId + ", adminMemo="
				+ adminMemo + ", memoDate=" + memoDate + "]";
	}
	
	
}
