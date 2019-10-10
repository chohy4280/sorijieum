package wishbook.model.service;

import static common.JDBCTemplate.*;

import java.sql.*;
import java.util.ArrayList;

import wishbook.model.dao.WishBookDao;
import wishbook.model.vo.WishBook;

public class WishBookService {
	
	//의존성 주입
	public WishBookDao wbDao = new WishBookDao();
	
	public WishBookService() {}

	public ArrayList<WishBook> selectWaitWishBook() {
		Connection conn = getConnection();
		ArrayList<WishBook> wbWaitList = wbDao.selectWaitWishBook(conn);
		close(conn);
		return wbWaitList;
	}

}
