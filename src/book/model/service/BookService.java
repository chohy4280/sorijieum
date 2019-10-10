package book.model.service;

import static common.JDBCTemplate.getConnection;

import java.sql.*;
import java.util.ArrayList;

import book.model.dao.BookDao;
import book.model.vo.Book;

public class BookService {

	//의존성 주입
	public BookDao bDao = new BookDao();
	
	public BookService() {}
	
	
	//관리자 서비스****************************************
	// 관리자 도서 전체 목록 조회용
	public ArrayList<Book> selectAll(){	
		return null;
	}
	
	
	// 관리자 도서 검색용
	public ArrayList<Book> selectBookSearch(String searchtype, String keyword, String bookstatus){
		return null;
	}
	
	
	// 관리자 도서 삭제용
	public int deleteBook(int bookcode) {
		return 0;
	}
	
	
	// 관리자 도서 한개 정보 불러오기용
	public Book selectBookOne(int bookcode) {
		return null;
	}
	
	
	// 관리자 도서 정보 수정용
	public Book updateBook(int bookcode) {
		return null;
	}
	
	
	// 관리자 도서 추가용
	public int insertBook(Book book) {
		return 0;
	}
	
	
	// 관리자 제작중인 도서 조회용
	public ArrayList<Book> selectMakeBook(){
		return null;
	}
	
	
	// 관리자 제작 완료 도서 조회용
	public ArrayList<Book> selectDoneBook(){
		return null;
	}
}
