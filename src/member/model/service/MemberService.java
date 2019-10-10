package member.model.service;

import member.model.dao.MemberDao;

public class MemberService {
	
	//의존성 주입
	public MemberDao mDao = new MemberDao();
	
	public MemberService() {}
	
	

}
