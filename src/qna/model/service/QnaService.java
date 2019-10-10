package qna.model.service;

import qna.model.dao.QnaDao;
import static common.JDBCTemplate.*;

public class QnaService {
	
	//의존성 주입
	public QnaDao qDao = new QnaDao();
	
	public QnaService() {}

}
