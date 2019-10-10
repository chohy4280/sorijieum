package book.model.service;

import book.model.dao.BookDao;
import static common.JDBCTemplate.*;

public class BookService {

	//의존성 주입
	public BookDao bDao = new BookDao();
	
	public BookService() {}
}
