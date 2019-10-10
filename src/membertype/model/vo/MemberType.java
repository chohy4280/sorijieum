package membertype.model.vo;

public class MemberType implements java.io.Serializable{

	private static final long serialVersionUID = 121212L;
	
	private int typeNumber;
	private String memberType;
	
	public MemberType() {}

	public MemberType(int typeNumber, String memberType) {
		super();
		this.typeNumber = typeNumber;
		this.memberType = memberType;
	}

	public int getTypeNumber() {
		return typeNumber;
	}

	public void setTypeNumber(int typeNumber) {
		this.typeNumber = typeNumber;
	}

	public String getMemberType() {
		return memberType;
	}

	public void setMemberType(String memberType) {
		this.memberType = memberType;
	}

	@Override
	public String toString() {
		return "MemberType [typeNumber=" + typeNumber + ", memberType=" + memberType + "]";
	}
	
	

}