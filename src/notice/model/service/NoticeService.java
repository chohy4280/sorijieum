package notice.model.service;

import notice.model.dao.NoticeDao;
import static common.JDBCTemplate.*;

public class NoticeService {

	//의존성 주입
	public NoticeDao nDao = new NoticeDao();
	
	public NoticeService() {}
}
