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
	public ArrayList<Notice> selectAll(int startnum, int endnum) {
		Connection conn = getConnection();
		ArrayList<Notice> list =nDao.selectAll(conn, startnum, endnum);
		close(conn);
		return list;
	}

	public int insertNotice(Notice notice) { //새로운  공지사항 글 등록하기
		Connection conn = getConnection();
		int result = nDao.insertNotice(conn, notice);
		if(result >0)
			commit(conn);
		else
			rollback(conn);
			close(conn);
		return result;
	}

	public Notice selectOne(int noticeno) {
		Connection conn = getConnection();
		Notice notice = nDao.selectOne(conn, noticeno);
		close(conn);
		return notice;
	}

	public Notice selectOneForTop(int noticeno) {
		Connection conn = getConnection();
		Notice notice = nDao.selectOneForTop(conn, noticeno);
		close(conn);
		return notice;
	}

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

	public void updateReadCount(int noticeno) {
		Connection conn = getConnection();
		int result = nDao.updateReadCount(conn, noticeno);
		if(result > 0)
			commit(conn);
		else
			rollback(conn);
		close(conn);
		
	}

}
	
