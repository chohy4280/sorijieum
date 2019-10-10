package mybook.model.service;

import mybook.model.dao.MyBookDao;
import static common.JDBCTemplate.*;

public class MyBookService {
	
	//의존성 주입
	public MyBookDao mbDao = new MyBookDao();
	
	public MyBookService() {}

}
