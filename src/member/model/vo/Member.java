package member.model.vo;

import java.sql.Date;

public class Member implements java.io.Serializable{

	private static final long serialVersionUID = 666L;
	
	private String userId;
	private int typeNumber;
	private String userName;
	private String userPwd;
	private String phone;
	private String email;
	private String gender;
	private java.sql.Date birth;
	private java.sql.Date enrollDate;
	private String userOfile;
	private String userRfile;
	private String quitYN;
	
	public Member() {}

	public Member(String userId, int typeNumber, String userName, String userPwd, String phone, String email,
			String gender, Date birth, Date enrollDate, String userOfile, String userRfile, String quitYN) {
		super();
		this.userId = userId;
		this.typeNumber = typeNumber;
		this.userName = userName;
		this.userPwd = userPwd;
		this.phone = phone;
		this.email = email;
		this.gender = gender;
		this.birth = birth;
		this.enrollDate = enrollDate;
		this.userOfile = userOfile;
		this.userRfile = userRfile;
		this.quitYN = quitYN;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public int getTypeNumber() {
		return typeNumber;
	}

	public void setTypeNumber(int typeNumber) {
		this.typeNumber = typeNumber;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserPwd() {
		return userPwd;
	}

	public void setUserPwd(String userPwd) {
		this.userPwd = userPwd;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public java.sql.Date getBirth() {
		return birth;
	}

	public void setBirth(java.sql.Date birth) {
		this.birth = birth;
	}

	public java.sql.Date getEnrollDate() {
		return enrollDate;
	}

	public void setEnrollDate(java.sql.Date enrollDate) {
		this.enrollDate = enrollDate;
	}

	public String getUserOfile() {
		return userOfile;
	}

	public void setUserOfile(String userOfile) {
		this.userOfile = userOfile;
	}

	public String getUserRfile() {
		return userRfile;
	}

	public void setUserRfile(String userRfile) {
		this.userRfile = userRfile;
	}

	public String getQuitYN() {
		return quitYN;
	}

	public void setQuitYN(String quitYN) {
		this.quitYN = quitYN;
	}

	@Override
	public String toString() {
		return "Member [userId=" + userId + ", typeNumber=" + typeNumber + ", userName=" + userName + ", userPwd="
				+ userPwd + ", phone=" + phone + ", email=" + email + ", gender=" + gender + ", birth=" + birth
				+ ", enrollDate=" + enrollDate + ", userOfile=" + userOfile + ", userRfile=" + userRfile + ", quitYN="
				+ quitYN + "]";
	}
	
	

}
