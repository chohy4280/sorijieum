package book.model.service;

import static common.JDBCTemplate.*;

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
		Connection conn = getConnection();
		ArrayList<Book> list = bDao.selectAll(conn);
		close(conn);
		return list;
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
	public int insertBook(Book b) {
		Connection conn = getConnection();
		int result = bDao.insertBook(conn, b);
		if(result > 0)
			commit(conn);
		else
			rollback(conn);
		close(conn);		
		return result;
	}
	
	// 관리자 제작대기 도서 조회용
	public ArrayList<Book> seletWaitBook() {
		Connection conn = getConnection();
		ArrayList<Book> wbList = bDao.selectWaitBook(conn);
		close(conn);
		return wbList;
	}
	
	// 관리자 제작중인 도서 조회용
	public ArrayList<Book> selectMakeBook(){
		Connection conn = getConnection();
		ArrayList<Book> mbList = bDao.selectMakeBook(conn);
		close(conn);
		return mbList;
	}
	
	
	// 관리자 제작 완료 도서 조회용
	public ArrayList<Book> selectDoneBook(){
		Connection conn = getConnection();
		ArrayList<Book> dbList = bDao.selectDoneBook(conn);
		close(conn);
		return dbList;
	}
	////////////////////////////////////////////////////////////////////
	
	//도서검색 전체목록
		 public ArrayList<Book> selectAll2(){
		      Connection conn = getConnection();
		      ArrayList<Book> list = bDao.selectAll2(conn);
		      close(conn);
		      return list;
		   }
		 //도서검색 한개만 불러오기
		 public Book selectOne(int bookcode) {
			 Connection conn = getConnection();
			 Book book = bDao.selectOne(conn,bookcode);
			 close(conn);
			 return book;
		 }
		 //도서검색 제목명 검색
		 public ArrayList<Book> selectTitleSearch(String keyword){
		      Connection conn = getConnection();
		      ArrayList<Book> list = bDao.selectTitleSearch(conn, keyword);
		      close(conn);
		      return list;
		   }
	             //도서검색 저자명 검색
		 public ArrayList<Book> selectAuthorSearch(String keyword){
		      Connection conn = getConnection();
		      ArrayList<Book> list = bDao.selectTitleSearch(conn, keyword);
		      close(conn);
		      return list;
		   }

	}

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	


