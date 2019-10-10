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

	
	//관리자 서비스****************************************
	// 관리자 신청도서(대기) 조회용
	public ArrayList<WishBook> selectWaitWishBook(){
		return null;
	}
	
	
	// 관리자 신청도서(전체) 조회용
	public ArrayList<WishBook> selectAll(){
		return null;
	}
	
	
	// 관리자 신청도서 검색용
	public ArrayList<WishBook> selectWishBookSearch(String searchtype, String keyword, String wbstatus){
		return null;
	}
	
	
	// 관리자 신청도서 한 개 불러오기 용
	public WishBook selectWishBookOne(int wishno) {
		return null;
	}
	
	
	// 관리자 신청도서 승인반려처리용
	public WishBook insertWishBookResult(int wishno) {
		return null;
	}

}
