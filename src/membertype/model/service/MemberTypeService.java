package membertype.model.service;

import static common.JDBCTemplate.*;

import membertype.model.dao.MemberTypeDao;

public class MemberTypeService {
	
	//의존성주입
	public MemberTypeDao utDao = new MemberTypeDao();
	
	public MemberTypeService() {}

}
