package wishbook.model.dao;

import java.sql.*;
import java.util.ArrayList;
import static common.JDBCTemplate.*;

import wishbook.model.vo.WishBook;

public class WishBookDao {
	
	public WishBookDao() {}

	public ArrayList<WishBook> selectWaitWishBook(Connection conn) {
		ArrayList<WishBook> wbWaitList = new ArrayList<WishBook>();
		Statement stmt = null;
		ResultSet rset = null;
		
		String query = "SELECT * FROM WISHBOOK WHERE WISHSTATUS = 'WAIT'";
		
		try {
			stmt = conn.createStatement();
			rset = stmt.executeQuery(query);
			
			while(rset.next()) {
				WishBook wb = new WishBook();
				
				wb.setWishNo(rset.getInt("wishno"));

				wbWaitList.add(wb);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}
		return wbWaitList;
	}

}
