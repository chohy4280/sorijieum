package makebook.model.service;

import makebook.model.dao.MakeBookDao;
import static common.JDBCTemplate.*;

public class MakeBookService {
	
	//의존성 주입
	public MakeBookDao mbDao = new MakeBookDao();
	
	public MakeBookService() {}

}
