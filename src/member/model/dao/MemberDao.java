package member.model.dao;


import static common.JDBCTemplate.close;

import java.sql.*;
import java.util.ArrayList;

import member.model.vo.Member;

public class MemberDao {
	
	public MemberDao() {}
	
	//로그인
	public Member loginCheck(Connection conn, String userid, String userpwd) {
		Member member = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = "select * from member where userid=? and userpwd=?";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, userid);
			pstmt.setString(2, userpwd);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				member = new Member();
				
				member.setUserId(userid);
				member.setTypeNumber(rset.getInt("typenumber"));
				member.setUserName(rset.getString("username"));
				member.setUserPwd(userpwd);
				member.setPhone(rset.getString("phone"));
				member.setEmail(rset.getString("email"));
				member.setGender(rset.getString("gender"));
				member.setBirth(rset.getDate("birth"));
				member.setEnrollDate(rset.getDate("enrolldate"));
				member.setUserOfile(rset.getString("userofile"));
				member.setUserRfile(rset.getString("userrfile"));
				member.setQuitYN(rset.getString("quityn"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return member;
	}
	
	//가입
	public int insertMember(Connection conn, Member member) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String query = "insert into member values(?,?,?,?,?,?,?,?,sysdate,null,null,'N')";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, member.getUserId());
			pstmt.setInt(2, member.getTypeNumber());
			pstmt.setString(3, member.getUserName());
			pstmt.setString(4, member.getUserPwd());
			pstmt.setString(5, member.getPhone());
			pstmt.setString(6, member.getEmail());
			pstmt.setString(7, member.getGender());
			pstmt.setDate(8, member.getBirth());
			
			result = pstmt.executeUpdate();			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	//아이디 중복체크
	public int checkUserId(Connection conn, String userid) {
		int result = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = "select * from member where userid=?";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, userid);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) 
				result = 1;
			else
				result = 0;
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return result;
	}
	
/*	//아이디 중복체크
	public String checkUserId2(Connection conn, String userid) {
		String dbid = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = "select * from member where userid=?";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, userid);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) 
				dbid = "adc"
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return dbid;
	}*/
	
	//탈퇴
	public int deleteMember(Connection conn, String userId) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String query = "update member set quityn='Y' where userid=?";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, userId);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}
	
	//수정
	public int updateMember(Connection conn, Member member) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String query = "update member set userpwd=?,email=?,phone=? where userid=?";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, member.getUserPwd());
			pstmt.setString(2, member.getEmail());
			pstmt.setString(3, member.getPhone());
			pstmt.setString(4, member.getUserId());
			
			result = pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	public Member selectMember(Connection conn, String userId) {
		Member member = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = "select * from member where userid=?";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, userId);
			
			rset = pstmt.executeQuery();
			if(rset.next()) {
				member = new Member();
				member.setUserId(userId);
				member.setUserName(rset.getString("username"));
				member.setUserPwd(rset.getString("userpwd"));
				member.setTypeNumber(rset.getInt("typenumber"));
				member.setPhone(rset.getString("phone"));
				member.setEmail(rset.getString("email"));
				member.setGender(rset.getString("gender"));
				member.setBirth(rset.getDate("birth"));
				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return member;
	}
	
	public ArrayList<Member> selectMemberList(Connection conn){
		return null;
	}
	
	//내 문의내역
	public ArrayList<Member> selectMyQnaList(Connection conn, String userid) {
		return null;
	}
	
	//내 신청내역
	public ArrayList<Member> selectMyWishList(Connection conn, String userid) {
		return null;
	}
	
	//아이디찾기
	public Member selectMemberSearchId(Connection conn, String username, String phone) {
		Member member = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = "select * from member where username=? and phone=?";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, username);
			pstmt.setString(2, phone);
			
			rset = pstmt.executeQuery();
			if(rset.next()) {
				member = new Member();
				
				member.setUserId(rset.getString("userid"));
				member.setUserName(rset.getString("username"));
				member.setQuitYN(rset.getString("quityn"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return member;
	}
	
	//임시비밀번호 적용
	public void updateTempPwd(Connection conn, String userid) {
		PreparedStatement pstmt = null;
		
		String query = "update member set userpwd=? where userid=?";
		
		//임시비밀번호 발생
		int index = 0;  
        char[] charSet = new char[] {  
                '0','1','2','3','4','5','6','7','8','9'    
                ,'a','b','c','d','e','f','g','h','i','j','k','l','m'  
                ,'n','o','p','q','r','s','t','u','v','w','x','y','z'};  
          
        StringBuffer sb = new StringBuffer();  
        for (int i=0; i<6; i++) {  
            index =  (int)(Math.random()*charSet.length);  
            sb.append(charSet[index]);  
        }  
        
        String tempPwd = sb.toString();   
        
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, tempPwd);
			pstmt.setString(2, userid);
			
			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
	}

	//비밀번호 찾기
	public Member selectMemberSearchPwd(Connection conn, String userid, String email) {
		Member member = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = "select * from member where userid=? and email=?";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, userid);
			pstmt.setString(2, email);
			
			rset = pstmt.executeQuery();
			if(rset.next()) {
				updateTempPwd(conn,userid);
				
				member = new Member();
				
				member.setUserId(rset.getString("userid"));
				member.setUserPwd(rset.getString("userpwd"));
				member.setQuitYN(rset.getString("quityn"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return member;
	}
	
	
	
  
  	// 관리자용 dao************************************************************************************************
	// 관리자 리스트카운트 출력용
	public int getListCountAdmin(Connection conn) {
		int listCount = 0;
		Statement stmt = null;
		ResultSet rset = null;
		
		String query = "select count(*) from (select * from member where quityn = 'N') where typenumber in (4,5)";
		
		try {
			stmt = conn.createStatement();
			rset = stmt.executeQuery(query);
			
			if(rset.next())
				listCount = rset.getInt(1);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}
		return listCount;
	}
	
	// 관리자 전체 조회용
	public ArrayList<Member> selectAdminAll(Connection conn, int startRow, int endRow){
		ArrayList<Member> list = new ArrayList<Member>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = "select * from (select rownum rnum, typenumber, userid, username, email, phone, enrolldate from (select * from member where quityn = 'N'and typenumber in (4,5) order by typenumber desc, enrolldate desc)) where rnum between ? and ?";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Member m = new Member();
				
				m.setUserId(rset.getString("userid"));
				m.setUserName(rset.getString("username"));
				m.setEmail(rset.getString("email"));
				m.setPhone(rset.getString("phone"));
				m.setTypeNumber(rset.getInt("typenumber"));
				m.setEnrollDate(rset.getDate("enrolldate"));
				
				list.add(m);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}
	
	// 관리자 추가용
	public int insertAdmin(Connection conn, Member m) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String query = "insert into member values (?, 4, ?, ?, ?, ?, ?, ?, sysdate, null, null, 'N')";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, m.getUserId());
			pstmt.setString(2, m.getUserName());
			pstmt.setString(3, m.getUserPwd());
			pstmt.setString(4, m.getPhone());
			pstmt.setString(5, m.getEmail());
			pstmt.setString(6, m.getGender());
			pstmt.setDate(7, m.getBirth());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	// 관리자 수정용
	public int updateAdmin(Connection conn, Member m) {
		int result = 0;
		PreparedStatement pstmt= null;
		
		String query = "update member set userpwd = ?, phone = ?, email = ?, birth = ? where userid = ?";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, m.getUserPwd());
			pstmt.setString(2, m.getPhone());
			pstmt.setString(3, m.getEmail());
			pstmt.setDate(4, m.getBirth());
			pstmt.setString(5, m.getUserId());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	// 관리자 검색용 리스트카운트 출력
	public int getListCountSearchAdmin(Connection conn, String searchtype, String keyword) {
		int listCount = 0;
		Statement stmt = null;
		ResultSet rset = null;
		
		String query = "select count(*) from (select * from member where typenumber in (4, 5) and quityn = 'N') where " + searchtype + " like '%" + keyword + "%'";
		
		try {
			stmt = conn.createStatement();
			rset = stmt.executeQuery(query);
			if(rset.next())
				listCount = rset.getInt(1);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}
		return  listCount;
	}
	
	
	// 관리자 검색용
	public ArrayList<Member> selectAdminOne(Connection conn, String searchtype, String keyword, int startRow, int endRow) {
		ArrayList<Member> list = new ArrayList<Member>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = "select * from (select rownum rnum, typenumber, userid, username, email, phone, enrolldate from (select * from (select * from member where quityn = 'N' and typenumber in (4, 5) order by typenumber desc, enrolldate desc) where " + searchtype + " like '%" + keyword + "%')) where rnum between ? and ?";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Member m = new Member();
				
				m.setTypeNumber(rset.getInt("typenumber"));
				m.setUserId(rset.getString("userid"));
				m.setUserName(rset.getString("username"));
				m.setEmail(rset.getString("email"));
				m.setPhone(rset.getString("phone"));
				m.setEnrollDate(rset.getDate("enrolldate"));
				
				list.add(m);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}
	
	// 전체회원 리스트카운트 출력용
	public int getListCountMemberAdmin(Connection conn) {
		int listCount = 0;
		Statement stmt = null;
		ResultSet rset = null;
		
		String query = "select count(*) from (select * from member where quityn = 'N') where typenumber in (1,2,3)";
		
		try {
			stmt = conn.createStatement();
			rset = stmt.executeQuery(query);
			
			if(rset.next())
				listCount = rset.getInt(1);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}
		return listCount;
	}
	

	
	// 관리자 전체회원 조회용
	public ArrayList<Member> selectAll(Connection conn, int startRow, int endRow){
		ArrayList<Member> list = new ArrayList<Member>();
		PreparedStatement pstmt = null;
		ResultSet rset= null;
		
		String query = "select * from (select rownum rnum, typenumber, username, userid, gender, email, phone, enrolldate from (select * from member where quityn = 'N' and typenumber in (1,2,3) order by enrolldate desc)) where rnum between ? and ?";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Member m = new Member();
				
				m.setTypeNumber(rset.getInt("typenumber"));
				m.setUserName(rset.getString("username"));
				m.setUserId(rset.getString("userid"));
				m.setGender(rset.getString("gender"));
				m.setPhone(rset.getString("phone"));
				m.setEmail(rset.getString("email"));
				m.setEnrollDate(rset.getDate("enrolldate"));
				
				list.add(m);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}
	
	// 관리자 회원 검색 리스트카운트 출력용
	public int getListCountMemberSearchAdmin(Connection conn, String searchtype, String keyword, String gender,
			String typenumber) {
		int listCount = 0;
		Statement stmt = null;
		ResultSet rset = null;
		
		String query = null;
		/*		경우의 수
 		1-1. 키워드 X, 성별전체, 회원유형 전체
		1-2. 키워드 X, 성별 O, 회원유형 전체
		1-3. 키워드 X, 성별 전체, 회원유형 O
			1-3.1 메인회면 이용자 신규회원용 typenumber=4
			1-3.2 메인화면 이용자 TOTAL용 typenumber=5
			1-3.3 메인화면 제작자 신규회원용 typenumber=6
		1-4. 키워드 X, 성별O, 회원유형O

		2-1. 키워드 O, 성별전체, 회원유형 전체
		2-2. 키워드 O, 성별 O, 회원유형 전체
		2-3. 키워드 O, 성별 전체, 회원유형 O
		2-4. 키워드 O, 성별O, 회원유형O*/
		
		if(keyword == null) {
			if(gender.equals("ALL") && typenumber.equals("ALL"))		// 1-1
				query = "select count(*) from (select * from member where quityn = 'N') where gender in ('F', 'M') and typenumber in (1,2,3) order by enrolldate desc";
			
			else if((!gender.equals("ALL")) && typenumber.equals("ALL"))	// 1-2
				query = "select count(*) from (select * from member where quityn = 'N') where gender = '" + gender + "' and typenumber in (1,2,3) order by enrolldate desc";
			
			else if(gender.equals("ALL") && !typenumber.equals("ALL")) {	// 1-3
				if(typenumber.equals("4"))	// 메인화면 이용자 신규회원용
					query = "select count(*) from (select * from member where quityn = 'N' and enrolldate = sysdate) where gender in ('F', 'M') and typenumber in (1,2) order by enrolldate desc";
				
				else if(typenumber.equals("5"))	// 메인화면 이용자 TOTAL용
					query = "select count(*) from (select * from member where quityn = 'N') where gender in ('F', 'M') and typenumber in (1,2) order by enrolldate desc";
				
				else if(typenumber.equals("6")) // 메인화면 제작자 신규회원용
					query = "select count(*) from (select * from member where quityn = 'N' and enrolldate = sysdate) where gender in ('F', 'M') and typenumber = 3 order by enrolldate desc";
				else
				query = "select count(*) from (select * from member where quityn = 'N') where gender in ('F', 'M') and typenumber = " + typenumber + " order by enrolldate desc";
				
			}else if((!gender.equals("ALL")) && !typenumber.equals("ALL"))	// 1-4
				query = "select count(*) from (select * from member where quityn = 'N') where gender = '" + gender + "' and typenumber = " + typenumber + " order by enrolldate desc";
		} else {
			if(gender.equals("ALL") && typenumber.equals("ALL"))		// 2-1
				query = "select count(*) from (select * from member where quityn = 'N') where " + searchtype + " like '%" + keyword + "%' and gender in ('F', 'M') and typenumber in (1,2,3) order by enrolldate desc";
			else if((!gender.equals("ALL")) && typenumber.equals("ALL"))	// 2-2
				query = "select count(*) from (select * from member where quityn = 'N') where " + searchtype + " like '%" + keyword + "%' and gender = '" + gender + "' and typenumber in (1,2,3) order by enrolldate desc";
			else if(gender.equals("ALL") && !typenumber.equals("ALL"))	// 2-3
				query = "select count(*) from (select * from member where quityn = 'N') where " + searchtype + " like '%" + keyword + "%' and gender in ('F', 'M') and typenumber = " + typenumber + " order by enrolldate desc";
			else if((!gender.equals("ALL")) && !typenumber.equals("ALL"))	// 2-4
			query = "select count(*) from (select * from member where quityn = 'N') where " + searchtype + " like '%" + keyword + "%' and gender = '" + gender + "' and typenumber = " + typenumber + " order by enrolldate desc";
		}
		
		try {
			stmt = conn.createStatement();
			rset = stmt.executeQuery(query);
			if(rset.next())
				listCount = rset.getInt(1);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}
		
		
		return  listCount;
	}
	
	
	// 관리자 회원 검색용
	public ArrayList<Member> selectMemberSearch(Connection conn, String searchtype, String keyword, String gender, String typenumber, int startRow, int endRow){
		ArrayList<Member> list = new ArrayList<Member>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = null;
		
/*		경우의 수
 		1-1. 키워드 X, 성별전체, 회원유형 전체
		1-2. 키워드 X, 성별 O, 회원유형 전체
		1-3. 키워드 X, 성별 전체, 회원유형 O
			1-3.1 메인회면 이용자 신규회원용 typenumber=4
			1-3.2 메인화면 이용자 TOTAL용 typenumber=5
			1-3.3 메인화면 제작자 신규회원용 typenumber=6
		1-4. 키워드 X, 성별O, 회원유형O

		2-1. 키워드 O, 성별전체, 회원유형 전체
		2-2. 키워드 O, 성별 O, 회원유형 전체
		2-3. 키워드 O, 성별 전체, 회원유형 O
		2-4. 키워드 O, 성별O, 회원유형O*/
		
		//반복되는 문장 스트링 변수 처리
		String sentence = "select * from (select rownum rnum, typenumber, username, userid, gender, email, phone, enrolldate from (select * from (select * from member where quityn='N' order by enrolldate desc))";
		
		if(keyword == null) {
			if(gender.equals("ALL") && typenumber.equals("ALL"))		// 1-1
				query = sentence+" where gender in ('F', 'M') and typenumber in (1,2,3)) where rnum between ? and ?";
			
			else if((!gender.equals("ALL")) && typenumber.equals("ALL"))	// 1-2
				query = sentence+" where gender = '" + gender + "' and typenumber in (1,2,3)) where rnum between ? and ?";
			
			else if(gender.equals("ALL") && !typenumber.equals("ALL")) {	// 1-3
				if(typenumber.equals("4"))	// 메인화면 이용자 신규회원용
					query = sentence+" where gender in ('F', 'M') and typenumber in (1,2) and enrolldate like sysdate) where rnum between ? and ?";
				
				else if(typenumber.equals("5"))	// 메인화면 이용자 TOTAL용
					query = sentence+" where gender in ('F', 'M') and typenumber in (1,2)) where rnum between ? and ?";
				
				else if(typenumber.equals("6")) // 메인화면 제작자 신규회원용
					query = sentence+" where gender in ('F', 'M') and typenumber = 3 and enrolldate like sysdate) where rnum between ? and ?";
				else
				query = sentence+" where gender in ('F', 'M') and typenumber = " + typenumber + ") where rnum between ? and ?";
				
			}else if((!gender.equals("ALL")) && !typenumber.equals("ALL"))	// 1-4
				query = sentence+" where gender = '" + gender + "' and typenumber = " + typenumber + ") where rnum between ? and ?";
		} else {
			if(gender.equals("ALL") && typenumber.equals("ALL"))		// 2-1
				query = sentence+" where " + searchtype + " like '%" + keyword + "%' and gender in ('F', 'M') and typenumber in (1,2,3)) where rnum between ? and ?";
			
			else if((!gender.equals("ALL")) && typenumber.equals("ALL"))	// 2-2
				query = sentence+" where " + searchtype + " like '%" + keyword + "%' and gender = '" + gender + "' and typenumber in (1,2,3)) where rnum between ? and ?";
			
			else if(gender.equals("ALL") && !typenumber.equals("ALL"))	// 2-3
				query = sentence+" where " + searchtype + " like '%" + keyword + "%' and gender in ('F', 'M') and typenumber = " + typenumber + ") where rnum between ? and ?";
			
			else if((!gender.equals("ALL")) && !typenumber.equals("ALL"))	// 2-4
			query = sentence+" where " + searchtype + " like '%" + keyword + "%' and gender = '" + gender + "' and typenumber = " + typenumber + ") where rnum between ? and ?";
		}
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Member m = new Member();
				
				m.setTypeNumber(rset.getInt("typenumber"));
				m.setUserName(rset.getString("username"));
				m.setUserId(rset.getString("userid"));
				m.setGender(rset.getString("gender"));
				m.setEmail(rset.getString("email"));
				m.setPhone(rset.getString("phone"));
				m.setEnrollDate(rset.getDate("enrolldate"));
				
				list.add(m);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}
	
	// 관리자 한명 출력용
		public Member selectAdminOneDetail(Connection conn, String userid) {
			Member m = null;
			Statement stmt = null;
			ResultSet rset = null;
			
			String query = "select * from member where userid = '" + userid + "'";
			try {
				stmt = conn.createStatement();
				rset = stmt.executeQuery(query);
				
				if(rset.next()) {
					m = new Member();
					
					m.setUserId(userid);
					m.setUserName(rset.getString("username"));
					m.setUserPwd(rset.getString("userpwd"));
					m.setPhone(rset.getString("phone"));
					m.setEmail(rset.getString("email"));
					m.setGender(rset.getString("gender"));
					m.setBirth(rset.getDate("birth"));
					
				}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(rset);
				close(stmt);
			}
			return m;
		}
		
	// 관리자 회원 한명 조회용
	public Member selectMemberOne(Connection conn, String userid) {
		Member m = null;
		Statement stmt = null;
		ResultSet rset = null;
		
		String query = "select * from member where userid = '" + userid + "'";
		try {
			stmt = conn.createStatement();
			rset = stmt.executeQuery(query);
			
			if(rset.next()) {
				m = new Member();
				
				m.setUserId(userid);
				m.setTypeNumber(rset.getInt("typenumber"));
				m.setUserName(rset.getString("username"));
				m.setUserPwd(rset.getString("userpwd"));
				m.setPhone(rset.getString("phone"));
				m.setEmail(rset.getString("email"));
				m.setGender(rset.getString("gender"));
				m.setBirth(rset.getDate("birth"));
				m.setEnrollDate(rset.getDate("enrolldate"));
				m.setUserOfile(rset.getString("userofile"));
				m.setUserRfile(rset.getString("userrfile"));
				m.setQuitYN(rset.getString("quityn"));
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}
		return m;
	}
	
	// 관리자 회원 정보 수정용
	public int updateMemberAdmin(Connection conn, Member m) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String query = "update member set userpwd = ?, phone = ?, typenumber = ?, userofile = ?, userrfile = ?, email = ? where userid = ?";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, m.getUserPwd());
			pstmt.setString(2, m.getPhone());
			pstmt.setInt(3, m.getTypeNumber());
			pstmt.setString(4, m.getUserOfile());
			pstmt.setString(5, m.getUserRfile());
			pstmt.setString(6, m.getEmail());
			pstmt.setString(7, m.getUserId());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	
	// 관리자 이용자 신규회원(Sysdate) 검색용
	public ArrayList<Member> selectNewUserSystdate(Connection conn){
		ArrayList<Member> newUList = new ArrayList<Member>();
		Statement stmt = null;
		ResultSet rset = null;
		
		String query = "select * from member where typenumber between 1 and 2 and enrolldate like sysdate";
		
		try {
			stmt = conn.createStatement();
			rset = stmt.executeQuery(query);
			
			while(rset.next()) {
				Member m = new Member();
				
				m.setUserId(rset.getString("userid"));
				newUList.add(m);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}
		return newUList;
	}
	
	// 관리자 제작자 신규회원(Sysdate) 검색용
		public ArrayList<Member> selectNewMakerSystdate(Connection conn){
			ArrayList<Member> newMList = new ArrayList<Member>();
			Statement stmt = null;
			ResultSet rset = null;
			
			String query = "select * from (select * from member where enrolldate like sysdate) where typenumber = '3'";
			
			try {
				stmt = conn.createStatement();
				rset = stmt.executeQuery(query);
				
				while(rset.next()) {
					Member m = new Member();
					
					m.setUserId(rset.getString("userid"));
					newMList.add(m);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(rset);
				close(stmt);
			}
			return newMList;
		}
		

	// 관리자 이용자 전체회원 조회용
		public ArrayList<Member> selectAllUser(Connection conn){
			ArrayList<Member> totalUList = new ArrayList<Member>();
			Statement stmt = null;
			ResultSet rset = null;
			
			String query = "select * from member where typenumber between 1 and 2 and quityn = 'N'";
			
			try {
				stmt = conn.createStatement();
				rset = stmt.executeQuery(query);
				
				while(rset.next()) {
					Member m = new Member();
					
					m.setUserId(rset.getString("userid"));
					totalUList.add(m);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(rset);
				close(stmt);
			}
			return totalUList;
		}
		
	// 관리자 제작자 전체회원 조회용
		public ArrayList<Member> selectAllMaker(Connection conn){
			ArrayList<Member> totalMList = new ArrayList<Member>();
			Statement stmt = null;
			ResultSet rset = null;
			
			String query = "select * from member where typenumber = 3 and quityn = 'N'";
			
			try { 
				stmt = conn.createStatement();
				rset = stmt.executeQuery(query);
				
				while(rset.next()) {
					Member m = new Member();
					
					m.setUserId(rset.getString("userid"));
					
					totalMList.add(m);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(rset);
				close(stmt);
			}
			return totalMList;
		}




}
