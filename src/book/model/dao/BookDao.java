package book.model.dao;

import java.sql.*;
import java.util.ArrayList;

import book.model.vo.Book;

public class BookDao {

	public BookDao() {}
	
	
	// 관리자용 dao************************************************************************************************
	// 관리자 도서 전체 목록 조회용
		public ArrayList<Book> selectAll(Connection conn){	
			return null;
		}
		
		
		// 관리자 도서 검색용
		public ArrayList<Book> selectBookSearch(Connection conn, String searchtype, String keyword, String bookstatus){
			return null;
		}
		
		
		// 관리자 도서 삭제용
		public int deleteBook(Connection conn, int bookcode) {
			return 0;
		}
		
		
		// 관리자 도서 한개 정보 불러오기용
		public Book selectBookOne(Connection conn, int bookcode) {
			return null;
		}
		
		
		// 관리자 도서 정보 수정용
		public Book updateBook(Connection conn, int bookcode) {
			return null;
		}
		
		
		// 관리자 도서 추가용
		public int insertBook(Connection conn, Book book) {
			return 0;
		}
		
		
		// 관리자 제작중인 도서 조회용
		public ArrayList<Book> selectMakeBook(Connection conn){
			return null;
		}
		
		
		// 관리자 제작 완료 도서 조회용
		public ArrayList<Book> selectDoneBook(Connection conn){
			return null;
		}
}
