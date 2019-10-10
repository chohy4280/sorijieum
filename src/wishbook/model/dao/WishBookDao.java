package wishbook.model.dao;

import java.sql.*;
import java.util.ArrayList;
import static common.JDBCTemplate.*;

import wishbook.model.vo.WishBook;

public class WishBookDao {
	
	public WishBookDao() {}

	// 관리자용 dao************************************************************************************************
	// 관리자 신청도서(대기) 조회용
	public ArrayList<WishBook> selectWaitWishBook(Connection conn){
		return null;
	}
	
	
	// 관리자 신청도서(전체) 조회용
	public ArrayList<WishBook> selectAll(Connection conn){
		return null;
	}
	
	
	// 관리자 신청도서 검색용
	public ArrayList<WishBook> selectWishBookSearch(Connection conn, String searchtype, String keyword, String wbstatus){
		return null;
	}
	
	
	// 관리자 신청도서 한 개 불러오기 용
	public WishBook selectWishBookOne(Connection conn, int wishno) {
		return null;
	}
	
	
	// 관리자 신청도서 승인반려처리용
	public WishBook insertWishBookResult(Connection conn, int wishno) {
		return null;
	}

}
