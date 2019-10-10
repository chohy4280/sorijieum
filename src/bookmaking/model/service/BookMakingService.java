package bookmaking.model.service;

import java.util.ArrayList;

import book.model.vo.Book;
import bookmaking.model.dao.BookMakingDao;

public class BookMakingService {
	//의존성 주입
	private static BookMakingDao bmDao = new BookMakingDao();
	
	public BookMakingService() {}
	
	//도서제작 메인 리스트
	public ArrayList<Book> selectMakingBook(int bookcode){
		return null;
	}
	
	//제작해야할 도서 게시물 카운트
	public int getListCountWaiting(){
		return 0;
	}
	
	//제작해야할 도서 리스트
	public ArrayList<Book> selectWaitingBookList(int bookcode){
		return null;
	}
	
	//제작중 도서 게시물 카운트
	public int getListCountMaking(){
		return 0;
	}
	
	//제작중 도서 리스트
	public ArrayList<Book> selectMakingBookList(int bookcode){
		return null;
	}
	
	//도서 상세정보 
	public Book selectMakingBookOne(int bookcode){
		return null;
	}
	
	//불러올 pdf 리스트
	public ArrayList<Book> selectBookPdfLoad(){
		return null;
	}
	
	//제작완료 도서  카운트
	public int getMakedBookCount(){
		return 0;
	}
	
}
