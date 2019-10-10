package quit.model.vo;

import java.sql.Date;

public class Quit implements java.io.Serializable{

	private static final long serialVersionUID = 111111L;
	
	private String userId;
	private String quitType;
	private String quitReason;
	private java.sql.Date quitDate;
	
	public Quit() {}

	public Quit(String userId, String quitType, String quitReason, Date quitDate) {
		super();
		this.userId = userId;
		this.quitType = quitType;
		this.quitReason = quitReason;
		this.quitDate = quitDate;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getQuitType() {
		return quitType;
	}

	public void setQuitType(String quitType) {
		this.quitType = quitType;
	}

	public String getQuitReason() {
		return quitReason;
	}

	public void setQuitReason(String quitReason) {
		this.quitReason = quitReason;
	}

	public java.sql.Date getQuitDate() {
		return quitDate;
	}

	public void setQuitDate(java.sql.Date quitDate) {
		this.quitDate = quitDate;
	}

	@Override
	public String toString() {
		return "Quit [userId=" + userId + ", quitType=" + quitType + ", quitReason=" + quitReason + ", quitDate="
				+ quitDate + "]";
	}
	
	

}
