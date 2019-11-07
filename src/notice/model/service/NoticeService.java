package notice.model.service;

import notice.model.dao.NoticeDao;
import notice.model.vo.Notice;

import static common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

public class NoticeService {

	
	public NoticeDao nDao = new NoticeDao();
	
	public NoticeService() {}
    
	public int getListCount() {
	Connection conn = getConnection();
	int nocount = nDao.getListCount(conn);
	close(conn);
	return nocount;
	}
	
	//공지사항 전체조회
	public ArrayList<Notice> selectAll(int startnum, int endnum) {
		Connection conn = getConnection();
		ArrayList<Notice> list =nDao.selectAll(conn, startnum, endnum);
		close(conn);
		return list;
	}
    
	//공지사항 글 조회
	public int insertNotice(Notice notice) { 
		Connection conn = getConnection();
		int result = nDao.insertNotice(conn, notice);
		if(result >0)
			commit(conn);
		else
			rollback(conn);
		close(conn);
		return result;
	}

	//공지사항 한개만 조회
	public Notice selectOne(int noticeno) {
		Connection conn = getConnection();
		Notice notice = nDao.selectOne(conn, noticeno);
		close(conn);
		return notice;
	}
   
	//공지사항 수정하기
	public int modifyNotice(Notice notice) {
		Connection conn = getConnection();
		int result = nDao.modifyNotice(conn, notice);
		if(result > 0)
			commit(conn);
		else
			rollback(conn);
		close(conn);
		return result;
	
	}

	//공지사항 삭제하기 
	public int deleteNotice(int noticeNo) {
		Connection conn = getConnection();
		int result = nDao.deleteNotice(conn, noticeNo);
	if(result > 0)
		commit(conn);
	else
		rollback(conn);
	close(conn);
	return result;
	}

	//공지사항 조회수 증가
	public void updateReadCount(int noticeno) {
		Connection conn = getConnection();
		int result = nDao.updateReadCount(conn, noticeno);
		if(result > 0)
			commit(conn);
		else
			rollback(conn);
		close(conn);
		
	}

	/*public ArrayList<Notice> selectTopFixed() {
		Connection conn = getConnection();
		ArrayList<Notice> toplist = nDao.selectTopFixed(conn);
		close(conn);
		return toplist;
	}*/

	public ArrayList<Notice> selectNoitceSearch(String keyword, int startnum, int endnum) {
		Connection conn = getConnection();
		ArrayList<Notice> list = nDao.selectNoticeSearch(conn,keyword,startnum,endnum);
		close(conn);
		return list;
	}

	public int getListCountNoticeSearch(String keyword) {
		Connection conn = getConnection();
		int listCount = nDao.getListCountNoticeSearch(conn,keyword);
		close(conn);
		return listCount;
	}

}
	
