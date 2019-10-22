--MEMBER 테이블 생성
DROP TABLE MEMBER CASCADE CONSTRAINT;

CREATE TABLE MEMBER (
   USERID   VARCHAR2(20)      NOT NULL,
   TYPENUMBER   NUMBER      NOT NULL,
   USERNAME   VARCHAR2(20)      NOT NULL,
   USERPWD   VARCHAR2(20)      NOT NULL,
   PHONE   VARCHAR2(11)      NOT NULL,
   EMAIL   VARCHAR2(50)      NOT NULL,
   GENDER   VARCHAR2(1)      NOT NULL,
   BIRTH   DATE      NOT NULL,
   ENROLLDATE   DATE   DEFAULT SYSDATE   NOT NULL,
   USEROFILE   VARCHAR2(100)      NULL,
   USERRFILE   VARCHAR2(100)      NULL,
   QUITYN   VARCHAR2(1)   DEFAULT 'N'   NOT NULL
);

COMMENT ON COLUMN MEMBER.USERID IS '회원아이디';

COMMENT ON COLUMN MEMBER.TYPENUMBER IS '회원(숫자)구분';

COMMENT ON COLUMN MEMBER.USERNAME IS '회원이름';

COMMENT ON COLUMN MEMBER.USERPWD IS '회원비밀번호';

COMMENT ON COLUMN MEMBER.PHONE IS '회원전화번호';

COMMENT ON COLUMN MEMBER.EMAIL IS '회원이메일';

COMMENT ON COLUMN MEMBER.GENDER IS '회원성별';

COMMENT ON COLUMN MEMBER.BIRTH IS '회원생년월일';

COMMENT ON COLUMN MEMBER.ENROLLDATE IS '회원가입일';

COMMENT ON COLUMN MEMBER.USEROFILE IS '장애인등록증 기존파일명';

COMMENT ON COLUMN MEMBER.USERRFILE IS '장애인등록증 변경파일명';

COMMENT ON COLUMN MEMBER.QUITYN IS '회원탈퇴여부';


--BOOK 테이블 생성
DROP TABLE BOOK CASCADE CONSTRAINT;

CREATE TABLE BOOK (
   BOOKCODE   VARCHAR2(15)      NOT NULL,
   BOOKTITLE   VARCHAR2(200)      NOT NULL,
   AUTHOR   VARCHAR2(100)      NOT NULL,
   PUBLISHER   VARCHAR2(100)      NOT NULL,
   PUBLISHDATE   DATE      NOT NULL,
   BOOKPAGE   NUMBER      NOT NULL,
   BOOKINFO   VARCHAR2(3000)      NOT NULL,
   BOOKOIMG   VARCHAR2(300)      NOT NULL,
   BOOKRIMG   VARCHAR2(300)      NOT NULL,
   BOOKOPDF   VARCHAR2(1000)      NOT NULL,
   BOOKRPDF   VARCHAR2(1000)      NOT NULL,
   BOOKDATE   DATE   DEFAULT SYSDATE   NOT NULL,
   BOOKVIEWS   NUMBER   DEFAULT 0   NOT NULL,
   MAKESTATUS   VARCHAR2(4)   DEFAULT 'WAIT'   NOT NULL,
   BOOKDELYN   VARCHAR2(2) DEFAULT 'N' NOT NULL
);

COMMENT ON COLUMN BOOK.BOOKCODE IS '도서코드';

COMMENT ON COLUMN BOOK.BOOKTITLE IS '도서명';

COMMENT ON COLUMN BOOK.AUTHOR IS '저자명';

COMMENT ON COLUMN BOOK.PUBLISHER IS '출판사';

COMMENT ON COLUMN BOOK.PUBLISHDATE IS '출판일';

COMMENT ON COLUMN BOOK.BOOKPAGE IS '전체쪽수';

COMMENT ON COLUMN BOOK.BOOKINFO IS '도서소개';

COMMENT ON COLUMN BOOK.BOOKOIMG IS '기존도서커버이미지';

COMMENT ON COLUMN BOOK.BOOKRIMG IS '변경도서커버이미지';

COMMENT ON COLUMN BOOK.BOOKOPDF IS '기존원본도서PDF';

COMMENT ON COLUMN BOOK.BOOKRPDF IS '변경도서원본PDF';

COMMENT ON COLUMN BOOK.BOOKDATE IS '도서등록일';

COMMENT ON COLUMN BOOK.BOOKVIEWS IS '도서조회수';

COMMENT ON COLUMN BOOK.MAKESTATUS IS '도서제작상태';

COMMENT ON COLUMN BOOK.BOOKDELYN IS '도서삭제여부';



--NOTICE 테이블 생성
DROP TABLE NOTICE CASCADE CONSTRAINT;

CREATE TABLE NOTICE (
   NOTICENO   NUMBER      NOT NULL,
   NOTICETITLE   VARCHAR2(200)      NOT NULL,
   NOTICEWRITER   VARCHAR2(20)      NOT NULL,
   NOTICECONTENT   VARCHAR2(4000)      NOT NULL,
   NOTICEDATE   DATE   DEFAULT SYSDATE   NOT NULL,
   NOTICEVIEWS   NUMBER   DEFAULT 0   NOT NULL,
   NOTICEOFILE   VARCHAR2(1000)      NULL,
   NOTICERFILE   VARCHAR2(1000)      NULL,
   NOTICERDATE   DATE      NULL,
   NOTICETOP   VARCHAR2(1)   DEFAULT 'N'   NOT NULL
);

COMMENT ON COLUMN NOTICE.NOTICENO IS '공지사항 번호';

COMMENT ON COLUMN NOTICE.NOTICETITLE IS '공지사항  제목';

COMMENT ON COLUMN NOTICE.NOTICEWRITER IS '공지사항 작성자';

COMMENT ON COLUMN NOTICE.NOTICECONTENT IS '공지사항  내용';

COMMENT ON COLUMN NOTICE.NOTICEDATE IS '공지사항  날짜';

COMMENT ON COLUMN NOTICE.NOTICEVIEWS IS '공지사항  조회수';

COMMENT ON COLUMN NOTICE.NOTICEOFILE IS '공지사항  기존 첨부파일';

COMMENT ON COLUMN NOTICE.NOTICERFILE IS '공지사항 변경 첨부 파일';

COMMENT ON COLUMN NOTICE.NOTICERDATE IS '공지사항 예약일';

COMMENT ON COLUMN NOTICE.NOTICETOP IS '공지사항 상단 고정 구분';


--QNA 테이블 생성
DROP TABLE QNA CASCADE CONSTRAINT;

CREATE TABLE QNA (
   QNANO   NUMBER      NOT NULL,
   QNATITLE   VARCHAR2(200)      NOT NULL,
   QNAWRITER   VARCHAR2(20)      NOT NULL,
   QNACONTENT   VARCHAR2(4000)      NOT NULL,
   QNADATE   DATE   DEFAULT SYSDATE   NOT NULL,
   QNAVIEWS   NUMBER   DEFAULT 0   NOT NULL,
   QNASTATUS   VARCHAR2(1)   DEFAULT 'N'   NOT NULL,
   QNAOFILE   VARCHAR2(1000)      NULL,
   QNARFILE   VARCHAR2(1000)      NULL,
   QNATOP   VARCHAR2(1)   DEFAULT 'N'   NOT NULL
);

COMMENT ON COLUMN QNA.QNANO IS 'QNA  번호';

COMMENT ON COLUMN QNA.QNATITLE IS 'QNA  제목';

COMMENT ON COLUMN QNA.QNAWRITER IS 'QNA  작성자';

COMMENT ON COLUMN QNA.QNACONTENT IS 'QNA  내용';

COMMENT ON COLUMN QNA.QNADATE IS 'QNA  날짜';

COMMENT ON COLUMN QNA.QNAVIEWS IS 'QNA  조회수';

COMMENT ON COLUMN QNA.QNASTATUS IS 'QNA  답변여부';

COMMENT ON COLUMN QNA.QNAOFILE IS 'QNA  기존 첨부파일';

COMMENT ON COLUMN QNA.QNARFILE IS 'QNA  변경 첨부파일';

COMMENT ON COLUMN QNA.QNATOP IS 'QNA 상단 고정구분';

--WISHBOOK 테이블 생성
DROP TABLE WISHBOOK CASCADE CONSTRAINT;

CREATE TABLE WISHBOOK (
   WISHNO   NUMBER      NOT NULL,
   WISHWRITER   VARCHAR2(20)      NOT NULL,
   WISHBOOKTITLE   VARCHAR2(200)      NOT NULL,
   WISHBOOKAUTHOR   VARCHAR2(100)      NOT NULL,
   WISHPUBLISHER   VARCHAR2(100)      NULL,
   WISHPUBLISHDATE   DATE      NULL,
   WISHDATE   DATE   DEFAULT SYSDATE   NOT NULL,
   WISHVIEWS   NUMBER   DEFAULT 0   NOT NULL,
   WISHSTATUS   VARCHAR2(4)   DEFAULT 'WAIT'   NOT NULL,
   RJCTREASON   VARCHAR2(300)      NULL,
   WISHSTATUSDATE   DATE      NULL,
   WISHTOP    VARCHAR2(1)   DEFAULT 'N'   NOT NULL,
   WISHBOOKADMIN VARCHAR2(20)   NULL
);

COMMENT ON COLUMN WISHBOOK.WISHNO IS '글번호';

COMMENT ON COLUMN WISHBOOK.WISHWRITER IS '게시글아이디';

COMMENT ON COLUMN WISHBOOK.WISHBOOKTITLE IS '도서명';

COMMENT ON COLUMN WISHBOOK.WISHBOOKAUTHOR IS '저자명';

COMMENT ON COLUMN WISHBOOK.WISHPUBLISHER IS '출판사';

COMMENT ON COLUMN WISHBOOK.WISHPUBLISHDATE IS '출판일';

COMMENT ON COLUMN WISHBOOK.WISHDATE IS '신청일';

COMMENT ON COLUMN WISHBOOK.WISHVIEWS IS '조회수';

COMMENT ON COLUMN WISHBOOK.WISHSTATUS IS '처리상태';

COMMENT ON COLUMN WISHBOOK.RJCTREASON IS '반려사유';

COMMENT ON COLUMN WISHBOOK.WISHSTATUSDATE IS '처리일시';

COMMENT ON COLUMN WISHBOOK.WISHTOP IS '상단 고정구분';

COMMENT ON COLUMN WISHBOOK.WISHBOOKADMIN IS '처리관리자';

--LIKEBOOK 테이블 생성
DROP TABLE LIKEBOOK CASCADE CONSTRAINT;

CREATE TABLE LIKEBOOK (
   USERID   VARCHAR2(20)      NOT NULL,
   BOOKCODE   VARCHAR2(15)      NOT NULL
);

COMMENT ON COLUMN LIKEBOOK.USERID IS '회원아이디';

COMMENT ON COLUMN LIKEBOOK.BOOKCODE IS '도서코드';


--MAKEBOOK 테이블 생성
DROP TABLE MAKEDBOOK CASCADE CONSTRAINT;

CREATE TABLE MAKEDBOOK (
   USERID   VARCHAR2(20)      NOT NULL,
   BOOKCODE   VARCHAR2(15)      NOT NULL,
   MAKEDATE   DATE   DEFAULT SYSDATE   NOT NULL
);

COMMENT ON COLUMN MAKEDBOOK.USERID IS '회원아이디';

COMMENT ON COLUMN MAKEDBOOK.BOOKCODE IS '도서코드';

COMMENT ON COLUMN MAKEDBOOK.MAKEDATE IS '제작 참여 날짜';


--MYBOOK 테이블 생성
DROP TABLE MYBOOK CASCADE CONSTRAINT;

CREATE TABLE MYBOOK (
   USERID   VARCHAR2(20)      NOT NULL,
   BOOKCODE   VARCHAR2(15)      NOT NULL,
   READPAGE   NUMBER      NOT NULL,
   READSDATE   DATE   DEFAULT SYSDATE   NOT NULL,
   READRDATE   DATE   DEFAULT SYSDATE   NOT NULL
);

COMMENT ON COLUMN MYBOOK.USERID IS '회원아이디';

COMMENT ON COLUMN MYBOOK.BOOKCODE IS '도서코드';

COMMENT ON COLUMN MYBOOK.READPAGE IS '이어읽을위치(쪽수)';

COMMENT ON COLUMN MYBOOK.READSDATE IS '처음 읽은 날짜';

COMMENT ON COLUMN MYBOOK.READRDATE IS '최근 읽은 날짜';


--ADMINMEMO 테이블 생성
DROP TABLE ADMINMEMO CASCADE CONSTRAINT;

CREATE TABLE ADMINMEMO (
   MEMONO   NUMBER   NOT NULL,
   USERID   VARCHAR2(20)      NOT NULL,
   ADMINID   VARCHAR2(20)      NOT NULL,
   ADMINMEMO   VARCHAR2(300)      NOT NULL,
   MEMODATE   DATE   DEFAULT SYSDATE   NOT NULL
);

COMMENT ON COLUMN ADMINMEMO.USERID IS '회원아이디';

COMMENT ON COLUMN ADMINMEMO.ADMINID IS '관리자아이디';

COMMENT ON COLUMN ADMINMEMO.ADMINMEMO IS '메모내용';

COMMENT ON COLUMN ADMINMEMO.MEMODATE IS '메모작성일';


--QUIT 테이블 생성
DROP TABLE QUIT CASCADE CONSTRAINT;

CREATE TABLE QUIT (
   USERID   VARCHAR2(20)      NOT NULL,
   QUITTYPE   VARCHAR2(1)      NOT NULL,
   QUITREASON   VARCHAR2(1000)      NOT NULL,
   QUITDATE   DATE   DEFAULT SYSDATE   NOT NULL
);

COMMENT ON COLUMN QUIT.USERID IS '탈퇴회원아이디';

COMMENT ON COLUMN QUIT.QUITTYPE IS '탈퇴유형(G일반/F강제)';

COMMENT ON COLUMN QUIT.QUITREASON IS '탈퇴사유';

COMMENT ON COLUMN QUIT.QUITDATE IS '탈퇴일자';


--BOOKMAKING 테이블 생성
DROP TABLE BOOKMAKING CASCADE CONSTRAINT;

CREATE TABLE BOOKMAKING (
   BOOKCODE   VARCHAR2(15)      NOT NULL,
   MAKESTART   DATE   DEFAULT SYSDATE   NOT NULL,
   MAKEFIN   DATE      NULL,
   BOOKOTXT   VARCHAR2(1000)      NULL,
   BOOKRTXT   VARCHAR2(1000)      NULL,
   MAKEPAGE   NUMBER   DEFAULT 0   NOT NULL
);

COMMENT ON COLUMN BOOKMAKING.BOOKCODE IS '도서코드';

COMMENT ON COLUMN BOOKMAKING.MAKESTART IS '제작시작일';

COMMENT ON COLUMN BOOKMAKING.MAKEFIN IS '제작완료일';

COMMENT ON COLUMN BOOKMAKING.BOOKOTXT IS '기존제작완료TXT';

COMMENT ON COLUMN BOOKMAKING.BOOKRTXT IS '변경제작완료TXT';

COMMENT ON COLUMN BOOKMAKING.MAKEPAGE IS '현재까지 제작된 쪽수';


--QNACOMMENT 테이블 생성
DROP TABLE QNACOMMENT CASCADE CONSTRAINT;

CREATE TABLE QNACOMMENT (
   QNANO   NUMBER      NOT NULL,
   QNACOMWRITER   VARCHAR2(20)      NOT NULL,
   QNACOMMENTS   VARCHAR2(1000)      NOT NULL,
   QNACOMDATE   DATE   DEFAULT SYSDATE   NOT NULL
);

COMMENT ON COLUMN QNACOMMENT.QNANO IS 'QNA 질문글 번호';

COMMENT ON COLUMN QNACOMMENT.QNACOMWRITER IS 'QNA 답변한 관리자 아이디';

COMMENT ON COLUMN QNACOMMENT.QNACOMMENTS IS 'QNA 답변 내용';

COMMENT ON COLUMN QNACOMMENT.QNACOMDATE IS 'QNA 답변 작성시간';


--USERTYPE 테이블 생성
DROP TABLE MEMBERTYPE CASCADE CONSTRAINT;

CREATE TABLE MEMBERTYPE (
   TYPENUMBER   NUMBER      NOT NULL,
   MEMBERTYPE   VARCHAR2(20)      NOT NULL
);

COMMENT ON COLUMN MEMBERTYPE.TYPENUMBER IS '회원구분(숫자)';

COMMENT ON COLUMN MEMBERTYPE.MEMBERTYPE IS '회원종류(글자)';


--제약조건 설정
ALTER TABLE MEMBER ADD CONSTRAINT PK_MEMBER PRIMARY KEY (
   USERID
);

ALTER TABLE BOOK ADD CONSTRAINT PK_BOOK PRIMARY KEY (
   BOOKCODE
);

ALTER TABLE NOTICE ADD CONSTRAINT PK_NOTICE PRIMARY KEY (
   NOTICENO
);

ALTER TABLE QNA ADD CONSTRAINT PK_QNA PRIMARY KEY (
   QNANO
);

ALTER TABLE WISHBOOK ADD CONSTRAINT PK_WISHBOOK PRIMARY KEY (
   WISHNO
);

ALTER TABLE LIKEBOOK ADD CONSTRAINT PK_LIKEBOOK PRIMARY KEY (
   USERID,
   BOOKCODE
);

ALTER TABLE MAKEDBOOK ADD CONSTRAINT PK_MAKEDBOOK PRIMARY KEY (
   USERID,
   BOOKCODE
);

ALTER TABLE MYBOOK ADD CONSTRAINT PK_MYBOOK PRIMARY KEY (
   USERID,
   BOOKCODE
);

ALTER TABLE ADMINMEMO ADD CONSTRAINT PK_ADMINMEMO PRIMARY KEY (
   USERID,
   ADMINID
);

ALTER TABLE QUIT ADD CONSTRAINT PK_QUIT PRIMARY KEY (
   USERID
);

ALTER TABLE BOOKMAKING ADD CONSTRAINT PK_BOOKMAKING PRIMARY KEY (
   BOOKCODE
);

ALTER TABLE QNACOMMENT ADD CONSTRAINT PK_QNACOMMENT PRIMARY KEY (
   QNANO
);

ALTER TABLE MEMBERTYPE ADD CONSTRAINT PK_MEMBERTYPE PRIMARY KEY (
   TYPENUMBER
);

ALTER TABLE MEMBER ADD CONSTRAINT FK_MEMBERTYPE_TO_MEMBER_1 FOREIGN KEY (
   TYPENUMBER
)
REFERENCES MEMBERTYPE (
   TYPENUMBER
);

ALTER TABLE NOTICE ADD CONSTRAINT FK_MEMBER_TO_NOTICE_1 FOREIGN KEY (
   NOTICEWRITER
)
REFERENCES MEMBER (
   USERID
);

ALTER TABLE QNA ADD CONSTRAINT FK_MEMBER_TO_QNA_1 FOREIGN KEY (
   QNAWRITER
)
REFERENCES MEMBER (
   USERID
);

ALTER TABLE WISHBOOK ADD CONSTRAINT FK_MEMBER_TO_WISHBOOK_1 FOREIGN KEY (
   WISHWRITER
)
REFERENCES MEMBER (
   USERID
);

ALTER TABLE LIKEBOOK ADD CONSTRAINT FK_MEMBER_TO_LIKEBOOK_1 FOREIGN KEY (
   USERID
)
REFERENCES MEMBER (
   USERID
);

ALTER TABLE LIKEBOOK ADD CONSTRAINT FK_BOOK_TO_LIKEBOOK_1 FOREIGN KEY (
   BOOKCODE
)
REFERENCES BOOK (
   BOOKCODE
);

ALTER TABLE MAKEDBOOK ADD CONSTRAINT FK_MEMBER_TO_MAKEDBOOK_1 FOREIGN KEY (
   USERID
)
REFERENCES MEMBER (
   USERID
);

ALTER TABLE MAKEDBOOK ADD CONSTRAINT FK_BOOK_TO_MAKEDBOOK_1 FOREIGN KEY (
   BOOKCODE
)
REFERENCES BOOK (
   BOOKCODE
);

ALTER TABLE MYBOOK ADD CONSTRAINT FK_MEMBER_TO_MYBOOK_1 FOREIGN KEY (
   USERID
)
REFERENCES MEMBER (
   USERID
);

ALTER TABLE MYBOOK ADD CONSTRAINT FK_BOOK_TO_MYBOOK_1 FOREIGN KEY (
   BOOKCODE
)
REFERENCES BOOK (
   BOOKCODE
);

ALTER TABLE ADMINMEMO ADD CONSTRAINT FK_MEMBER_TO_ADMINMEMO_1 FOREIGN KEY (
   USERID
)
REFERENCES MEMBER (
   USERID
);

ALTER TABLE ADMINMEMO ADD CONSTRAINT FK_MEMBER_TO_ADMINMEMO_2 FOREIGN KEY (
   ADMINID
)
REFERENCES MEMBER (
   USERID
);

ALTER TABLE QUIT ADD CONSTRAINT FK_MEMBER_TO_QUIT_1 FOREIGN KEY (
   USERID
)
REFERENCES MEMBER (
   USERID
);

ALTER TABLE BOOKMAKING ADD CONSTRAINT FK_BOOK_TO_BOOKMAKING_1 FOREIGN KEY (
   BOOKCODE
)

REFERENCES BOOK (
   BOOKCODE
);

ALTER TABLE QNACOMMENT ADD CONSTRAINT FK_QNA_TO_QNACOMMENT_1 FOREIGN KEY (
   QNANO
)
REFERENCES QNA (
   QNANO
);

ALTER TABLE QNACOMMENT ADD CONSTRAINT FK_MEMBER_TO_QNACOMMENT_1 FOREIGN KEY (
   QNACOMWRITER
)
REFERENCES MEMBER (
   USERID
);

ALTER TABLE MEMBER ADD CHECK (QUITYN IN('Y','N'));

ALTER TABLE MEMBER ADD CHECK (TYPENUMBER IN(1,2,3,4,5));

ALTER TABLE QUIT ADD CHECK (QUITTYPE IN('G','F'));

ALTER TABLE QNA ADD CHECK (QNASTATUS IN('Y','N'));

ALTER TABLE QNA ADD CHECK (QNATOP IN('Y','N'));

ALTER TABLE NOTICE ADD CHECK (NOTICETOP IN('Y','N'));

ALTER TABLE BOOK ADD CHECK (MAKESTATUS IN('WAIT','MAKE','DONE'));

ALTER TABLE WISHBOOK ADD CHECK (WISHSTATUS IN('WAIT','RJCT','DONE'));

COMMIT;


--게시판별 글번호 시퀀스 생성
DROP SEQUENCE SEQ_NOTICENO;

CREATE SEQUENCE SEQ_NOTICENO
INCREMENT BY 1
START WITH 1
NOMAXVALUE
NOCYCLE
NOCACHE;

DROP SEQUENCE SEQ_QNANO;

CREATE SEQUENCE SEQ_QNANO
INCREMENT BY 1
START WITH 1
NOMAXVALUE
NOCYCLE
NOCACHE;

DROP SEQUENCE SEQ_WISHNO;

CREATE SEQUENCE SEQ_WISHNO
INCREMENT BY 1
START WITH 1
NOMAXVALUE
NOCYCLE
NOCACHE;

COMMIT;


DROP SEQUENCE SEQ_MEMONO;

CREATE SEQUENCE SEQ_MEMONO
INCREMENT BY 1
START WITH 1
NOMAXVALUE
NOCYCLE
NOCACHE;

COMMIT;

--샘플 데이터 입력

--회원 구분 테이블 데이터 입력
INSERT INTO MEMBERTYPE VALUES(1,'이용대기자');
INSERT INTO MEMBERTYPE VALUES(2,'이용자');
INSERT INTO MEMBERTYPE VALUES(3,'제작자');
INSERT INTO MEMBERTYPE VALUES(4,'부관리자');
INSERT INTO MEMBERTYPE VALUES(5,'대표관리자');

COMMIT;

--회원 테이블 데이터 입력
INSERT INTO MEMBER VALUES(
'admin00',5,'최민영','adpass00','01000000000','admin@gmail.com','F','1993-06-14',DEFAULT,NULL,NULL,'N');

INSERT INTO MEMBER VALUES(
'admin01',4,'이유진','admin01','01001010101','admin01@gmail.com','F','1993-03-06',DEFAULT,NULL,NULL,'N');

INSERT INTO MEMBER VALUES(
'admin02',4,'관리자','admin02','01002020202','admin02@gmail.com','F','1990-10-17',DEFAULT,NULL,NULL,'N');

INSERT INTO MEMBER VALUES(
'user001',3,'박예은','pass001','01012341234','user001@naver.com','F','1995-12-04',DEFAULT,NULL,NULL,'N');

INSERT INTO MEMBER VALUES(
'user002',3,'조하영','pass002','01023452345','user002@naver.com','F','1993-04-28',DEFAULT,NULL,NULL,'N');

INSERT INTO MEMBER VALUES(
'user003',2,'이아무개','pass003','01034563456','user003@daum.net','M','1997-08-04',default,'등록증.jpg','201909211234.jpg','N');

INSERT INTO MEMBER VALUES(
'user004',1,'김첨지','pass004','01044443333','user004@naver.com','M','1978-05-17',DEFAULT,NULL,NULL,'N');

INSERT INTO MEMBER VALUES(
'user005',2,'박공주','pass005','01055556666','user005@gmail.com','F','1987-04-21',DEFAULT,'장애인등록증.jpg','201909272341.jpg','N');

INSERT INTO MEMBER VALUES(
'user006',1,'왕건','pass006','01066663444','user006@daum.net','M','1955-05-06',DEFAULT,NULL,NULL,'N');

INSERT INTO MEMBER VALUES(
'user007',3,'김철수','pass007','01087669877','user007@gmail.com','M','1985-11-19',default,null,null,'N');

COMMIT;

--관리자 메모 데이터 생성
INSERT INTO ADMINMEMO
VALUES(SEQ_MEMONO.NEXTVAL,'user001','admin00','제한 시간 안에 할당된 도서페이지를 완성 하지 못했음',SYSDATE);

INSERT INTO ADMINMEMO
VALUES(SEQ_MEMONO.NEXTVAL,'user005','admin01','사이트 이용중 도서재생에서 강제종료 된다고 전화로 항의함',SYSDATE);

--도서 데이터 입력
INSERT INTO BOOK VALUES ('8936434268', '아몬드', '손원평', '창비', '2017/03/31', 264, '영화보다 강렬하고 드라마처럼 팽팽한, 완전히 새로운 소설이 나타났다. 감정을 느끼지 못하는 소년의 특별한 성장 이야기로, 첫 장부터 강렬한 사건으로 시작해 다음 페이지가 궁금해지게 만드는 흡입력 강한 작품이다. 또한 타인의 감정에 무감각해진 공감 불능인 이 시대에 큰 울림을 주는 소설로, 작품 속 인물들이 타인과 관계 맺고 슬픔에 공감하며 성장해 나가는 과정을 탁월하게 묘사했다. 영화처럼 펼쳐지는 극적인 사건과 매혹적인 문체로 독자를 단숨에 사로잡을 것이다. 『완득이』, 『위저드 베이커리』를 잇는 제10회 창비청소년문학상 수상작.', '아몬드_손원평.jpg', '201901142208.jpg', '아몬드_손원평.pdf', '201901152110.pdf', '2019/01/15', 35, 'DONE', DEFAULT);

INSERT INTO BOOK VALUES ('8954641636', '쇼코의 미소', '최은영', '문학동네', '2016/07/04', 296, '등단작에 대해 흔히 우리가 걸게 되는 기대―기존 작품과 구별되는 ''낯섦''과 ''전위''에 대한 요구―로부터 물러나, 별다른 기교 없이 담백하게 이야기를 풀어나가고, 그 정통적인 방식을 통해 읽는 이의 마음을 움직였다는 것에 「쇼코의 미소」가 지닌 특별함이 담겨 있다. 그러니까, “고레에다 히로카즈나 이누도 잇신 감독의 어떤 영화들처럼 거의 모든 영역에서 ''진실하다''라는 느낌”(문학평론가 신형철)을 준다는 것, 그로부터 “소설이 주는 감동이란 무엇인가를 새삼 생각해보게 만들었다”(소설가 임철우)라는 것.', '쇼코의 미소_최은영.jpg', '201811241328.jpg', '쇼코의 미소_최은영.pdf', '201903031830.pdf', '2019/03/03', DEFAULT, 'MAKE', DEFAULT);

INSERT INTO BOOK VALUES ('8954655971', '여행의 이유', '김영하', '문학동네', '2019/04/17', 216, '『여행의 이유』는 작가 김영하가 처음 여행을 떠났던 순간부터 최근의 여행까지, 오랜 시간 여행을 하면서 느끼고 생각했던 것들을 아홉 개의 이야기로 풀어낸 산문이다. 여행지에서 겪은 경험을 풀어낸 여행담이기보다는, 여행을 중심으로 인간과 글쓰기, 타자와 삶의 의미로 주제가 확장되어가는 사유의 여행에 가깝다. 작품에 담긴 소설가이자 여행자로서 바라본 인간과 세상에 대한 이야기들은 놀랄 만큼 매혹적이다. 누구나 한번쯤은 떠올렸을 법한, 그러나 제대로 정리하지 못한 채 남겨두었던 상념의 자락들을 끄집어내 생기를 불어넣는 김영하 작가 특유의 (인)문학적 사유의 성찬이 담겼다.', '여행의 이유_김영하.jpg', '201902041944.jpg', '여행의 이유_김영하.pdf', '201904271126.pdf', '2019/04/27', DEFAULT, 'MAKE', DEFAULT);

INSERT INTO BOOK VALUES ('8937473135', '82년생 김지영', '조남주', '민음사', '2016/10/14', 192, '슬하에 딸을 두고 있는 서른네 살 김지영 씨가 어느 날 갑자기 이상 증세를 보인다. 시댁 식구들이 모여 있는 자리에서 친정 엄마로 빙의해 속말을 뱉어 내고, 남편의 결혼 전 애인으로 빙의해 그를 식겁하게 만들기도 한다. 이를 이상하게 여긴 남편이 김지영 씨의 정신 상담을 주선하고, 지영 씨는 정기적으로 의사를 찾아가 자신의 삶을 이야기한다. 소설은 김지영 씨의 이야기를 들은 담당 의사가 그녀의 인생을 재구성해 기록한 리포트 형식이다. 리포트에 기록된 김지영 씨의 기억은 ''여성''이라는 젠더적 기준으로 선별된 에피소드로 구성된다.', '82년생 김지영_조남주.jpg', '201906131208.jpg', '82년생 김지영_조남주.pdf', '201906140908.pdf', '2019/06/14', DEFAULT, DEFAULT, DEFAULT);

INSERT INTO BOOK VALUES ('8937473097', '보건교사 안은영', '정세랑', '민음사', '2015/12/07',   280, '소설은 제목 그대로 사립 M고의 보건교사 ''안은영''을 주인공으로 한다. 특별한 것 없는 직업과 평범한 이름이지만 안은영은 보통의 보건교사가 아니다. 복 중의 복, 일복 하나는 타고난 그녀는 직업으로 ''보건교사'' 역할에 열심히면서 동시에 자신만이 볼 수 있는 것들을 처치하고 쫓아내며, 또는 위로하는 ''퇴마사''의 운명에도 충실히 복무한다. 여기에 사립 M고의 한문교사이자 학교 설립자의 후손인 홍인표에게 흐르는 거대한 에너지는 안은영의 활약을 돕는 필수적인 영양제 역할을 한다. 에너지(기)를 보충하기 위해, 학교의 평화를 지키기 위해 둘은 내 거 아닌 내 것 같은 사이가 되어 힘을 합한다. 둘 앞에 나타나는 기이한 괴물들, 학생들에게 보이는 미스터리한 현상들, 학교 곳곳에 숨은 괴상한 힘들…… 사립 M고에는 어떤 비밀이 있는 것일까. 무엇보다 안은영과 홍인표의 썸(some)은 어떻게 마무리될까?', '보건교사 안은영_정세랑.jpg', '201908191645.jpg', '보건교사 안은영_정세랑.pdf', '201908201445pdf', '2019/08/20', DEFAULT, DEFAULT, DEFAULT);

INSERT INTO BOOK VALUES ('8982814477', '연금술사', '파울로 코엘료', '문학동네', '2001/12/01', 278, '청년의 가슴속에서, 알 수 없는 기쁨이 솟구쳤다. 자신은 이제 자아의 신화를 위해서, 그리고 파티마를 위해서 죽게 되리라. 낯선 기쁨의 실체는 바로 그것이었다. 표지들이 보여준 것은 끝내 사실이었던 것이다. 눈앞에 칼을 든 적이 있었지만, 그는 죽음을 걱정할 필요가 없었다. 만물의 정기가 그를 기다리고 있었고, 잠시 후면 그 정기의 일부가 될 터였다."이방인이 낯선 땅에서 무엇을 하고 있는가?", "자아의 신화를 찾으러 왔습니다. 당신은 절대 이해하지 못할 어떤 것을 찾아서."',   '연금술사_파울로 코엘료.jpg', '201909261556.jpg', '연금술사_파울로 코엘료.pdf', '201909271556.pdf', '2019/09/27', DEFAULT, DEFAULT, DEFAULT);

INSERT INTO BOOK VALUES ('8983925310', '해리포터와 마법사의 돌 1', 'J. K. 롤링', '문학수첩', '2014/12/18', 244, '어둠의 마왕 볼드모트에게 부모를 잃고 홀로 살아남은 아이, 해리는 안전을 위해 마법사가 아닌 사람인 ‘머글’ 페투니아 이모와 버논 이모부 손에 길러지며 불우한 어린 시절을 보낸다. 열한 번째 생일날, 해그리드를 통해 자신이 마법사라는 사실을 알게 된 해리는 호그와트 마법학교에 입학해 헤르미온느 그레인저, 론 위즐리라는 친구들과 함께 영생을 주는 마법사의 돌을 찾는 엄청난 모험을 시작하게 된다.', '해리포터와_마법사의_돌1.jpg', '201902142136.jpg', '해리포터와_마법사의_돌1.pdf', '201907252115.pdf', '2019/07/25', 55, 'DONE', DEFAULT);

INSERT INTO BOOK VALUES ('1162203625', '파과', '구병모', '위즈덤하우스', '2018/04/16', 344, '노인, 여성, 킬러. 도무지 어울릴 것 같지 않은 세 가지를 조합한 주인공 조각은 65세 여성 킬러다. 한국 소설 가운데 이토록 파격적인 주인공이 또 있을까. 그동안 아가미를 가진 소년([아가미]), 인간을 닮은 로봇([한 스푼의 시간]) 등 환상적인 상상력을 통해 독특한 주인공들을 탄생시킨 구병모 작가는 한국 소설에서 유례를 찾을 수 없는 ‘60대 여성 킬러’라는 독특한 캐릭터를 통해 새로운 여성 서사를 써내려가며 독자들에게 신선한 충격을 던져준다. 사회의 최약자로서 차별받아온 ‘노인’과 ‘여성’이라는 인물이 억압적이고 폭력적인 사회에 ‘킬러’라는 강렬한 이름으로 맞서 싸우는 것이다.
자신을 치료해준 강 박사에게 남다른 감정을 품게 된 조각, 그런 조각을 경멸하는 투우, 킬러들에게서 가족을 지키려는 강 박사. 마침내 투우가 강 박사의 딸을 납치하고, 조각이 투우에게 총을 겨누며 생애 마지막 작업을 실행키로 결심하면서 소설은 절정으로 향한다. 읽는 내내 한 편의 액션 영화를 보는 듯 박진감과 긴장감이 넘치는 이 소설의 말미에서 조각과 투우가 벌이는 총격전은 그야말로 압권이다.
[파과]는 내가 살아남기 위해 누군가를 죽여야만 하는 이 지독하고 잔혹한 현실 속에서 어떤 기대도 소망도 없이, 오늘도 눈을 떴기 때문에, 그저 살아 있기 때문에, 기꺼이 살아내는 모든 것들에게 따뜻한 응원과 위로를 전한다.', '파과.jpg', '201910072336.jpg', '파과.pdf', '201910072338.pdf', '2019/10/7', 0, 'WAIT', DEFAULT);

INSERT INTO BOOK VALUES ('9791130620459', '철학은 어떻게 삶의 무기가 되는가', '야마구치 슈', '다산초당', '2019/01/22', 336, '삶과 비즈니스 현장에서 철학적으로 생각하고 답을 도출하는 법을 알려 주는 실용 철학서. 세계 1위 경영·인사 컨설팅 기업 콘페리헤이그룹의 시니어 파트너인 저자는 대학교에서 철학을 전공하고 대학원에서 미학미술사를 공부한 ‘문사철’ 출신이다. 경영에 관한 정식 교육은 한 번도 받지 않았지만 컨설턴트로서 경영 전반에 걸친 기업 문제를 해결하는 데 어려움을 겪은 적은 없다. 눈앞의 상황을 철학이나 심리학, 경제학 개념에 맞춰 생각하면 언제나 해결의 실마리가 보였기 때문이다.
철학이 현실 세계와 동떨어진 학문이라는 말을 강하게 부정하는 저자는 사람들이 철학을 쓸모없다고 여기는 이유가 철학과 비즈니스를 연결시켜서 생각하는 법을 모르기 때문이라고 진단한다. 오히려 그는 본질을 꿰뚫고 최적의 솔루션을 찾아내는 철학적 사고법이야말로 현대인들에게 가장 필요한 무기라고 말한다. 그가 비즈니스 현장에서 유용하게 사용하는 50가지 철학·사상을 담은 『철학은 어떻게 삶의 무기가 되는가』는 철학의 쓸모를 새롭게 조명하는 세상에서 가장 실용적인 철학 사용 설명서다.', '철학은 어떻게 삶의 무기가 되는가.jpg', '201909121723.jpg', '철학은 어떻게 삶의 무기가 되는가.pdf', '201909121815.pdf', '2019/09/12', 0, 'MAKE', DEFAULT);

INSERT INTO BOOK VALUES ('9788934972464', '사피엔스', '유발 하라리', '김영사', '2015/11/23', 640, '인간의 역사와 미래에 대한 가장 논쟁적인 대서사!
문명의 배를 타고 진화의 바다를 항해한 인류는 이제 어디로 나아갈 것인가! 왜 사피엔스 종만이 지구상에 살아남았나? 인간은 왜 역사상 가장 치명적인 동물이 되었는가? 인간의 유효기간은 언제까지인가? 역사, 사회, 생물, 종교, 등 학문의 경계를 넘나들며 인류 역사의 시간을 종횡무진 써내려간 문명의 항해기가 우리 눈앞에 펼쳐진다!', '사피엔스.jpg', '201910131936.jpg', '사피엔스.pdf', '201910131856.pdf', '2019/10/13', 0, 'WAIT', DEFAULT);

INSERT INTO BOOK VALUES ('8982816631', '자기 앞의 생', '에밀 아자르', '문학동네', '2003/05/06', 363, '자신에게 주어진 생을 완전히 만족하며 살아가는 사람이 몇이나 될까? 작가는 실제 나이보다 많은 나이를 살고 있는 열네 살 모모의 눈으로 이해하지 못할 세상을 바라본다. 모모의 눈에 비친 세상은 결코 꿈같이 아름다운 세상이 아니다. 인종 차별받는 아랍인, 감옥에 끌려갔다가 살아 돌아온 유태인, 성전환자 등... 세상 모든 사람들은 스승이라고 했듯이 모모의 눈에도 소설속 모든 이들이 인생의 굳은살을 단단하게 해주는 인생선배들이다. 작은 상처에도 아파하는 독자들이여, 온전히 삶을 보듬길 바란다면 지금 이 책 앞에 서라.', '자기 앞의 생.jpg', '201910021429.jpg', '자기 앞의 생.pdf', '201910021215.pdf', '2019/10/02', 0, 'MAKE', DEFAULT);
                                              
INSERT INTO BOOK VALUES('8983925329','해리포터와 마법사의 돌 2','J.K. 롤링','문학수첩','2014/12/18',244,'어둠의 마왕 볼드모트에게 부모를 잃고 홀로 살아남은 아이,해리는 안전을 위해 마법사가 아닌 사람인 ‘머글’ 페투니아 이모와 버논 이모부 손에 길러지며 불우한 어린 시절을 보낸다. 열한 번째 생일날, 해그리드를 통해 자신이 마법사라는 사실을 알게 된 해리는 호그와트 마법학교에 입학해 헤르미온느 그레인저, 론 위즐리라는 친구들과 함께 영생을 주는 마법사의 돌을 찾는 엄청난 모험을 시작하게 된다.'
,'해리포터와_마법사의_돌2.jpg','201902142133.jpg','해리포터와_마법사의_돌2.pdf','201905112217.pdf','2019/05/11',3,'DONE', DEFAULT);

INSERT INTO BOOK VALUES('8983925337','해리포터와 비밀의 방 1','J.K. 롤링','문학수첩','2014/12/18',264,'더즐리 이모부네 집에서 끔찍한 방학을 보내던 해리에게 도비라는 집요정이 나타나 학교로 돌아가지 말라고 경고한다. 그 말을 무시하고 호그와트로 돌아간 해리는 머글 출신 아이들을 대상으로 한 의문의 습격 사건에 연루된다. 슬리데린의 후계자가 비밀의 방을 열고 괴물을 풀어줬다는 소문이 돌고 해리는 뱀의 말을 할 줄 안다는 이유로 습격사건의 범인으로 모함을 받는다. 헤르미온느마저 습격사건의 피해자가 되고 론의 동생 지니가 납치당해 사라지자 해리와 론은 직접 비밀의 방을 찾아 지니를 구해오기로 한다.',
'해리포터와_비밀의_방1.jpg','201902152130.jpg','해리포터와_비밀의_방1.pdf','201905120137.pdf','2019/05/12',4,'DONE',DEFAULT);

INSERT INTO BOOK VALUES('8983925353','해리포터와 아즈카반의 죄수 1','J.K. 롤링','문학수첩','2014/12/18',328,
'여느 때처럼 괴로운 여름방학을 보내던 해리는 심한 모욕을 받고 화가 난 나머지, 
더즐리 이모부의 여동생에게 무단으로 마법을 건다. 집을 뛰쳐나온 해리는 퇴학당할지도 모른다는 생각에 상심하지만, 
그를 기다리는 건 더 큰 문제다. 
바로 12년 동안 아즈카반이라는 마법사 감옥에 수감되어 있던 악명 높은 살인자, 시리우스 블랙이 탈옥해 해리를 노린다는 소식이다. 
론네 식구들에게 보호받으며 방학을 보낸 해리가 호그와트로 돌아가자, 시리우스 블랙이 침입한 흔적이 학교 곳곳에서 발견된다. 
그가 부모님을 배신하여 죽음에 이르게 했다는 것을 알게 된 해리는 단짝 친구들과 함께 시리우스 블랙을 찾아나선다.',
'해리포터와_아즈카반의_죄수1.jpg','201902162130.jpg','해리포터와_아즈카반의_죄수1.pdf','201905142111.pdf','2019/05/14',2,'DONE',DEFAULT);

INSERT INTO BOOK VALUES('8983925361','해리포터와 아즈카반의 죄수 2','J.K. 롤링','문학수첩','2014/12/18',300,
'여느 때처럼 괴로운 여름방학을 보내던 해리는 심한 모욕을 받고 화가 난 나머지, 
더즐리 이모부의 여동생에게 무단으로 마법을 건다. 집을 뛰쳐나온 해리는 퇴학당할지도 모른다는 생각에 상심하지만, 
그를 기다리는 건 더 큰 문제다. 
바로 12년 동안 아즈카반이라는 마법사 감옥에 수감되어 있던 악명 높은 살인자, 시리우스 블랙이 탈옥해 해리를 노린다는 소식이다. 
론네 식구들에게 보호받으며 방학을 보낸 해리가 호그와트로 돌아가자, 시리우스 블랙이 침입한 흔적이 학교 곳곳에서 발견된다. 
그가 부모님을 배신하여 죽음에 이르게 했다는 것을 알게 된 해리는 단짝 친구들과 함께 시리우스 블랙을 찾아나선다.',
'해리포터와_아즈카반의_죄수2.jpg','201902172133.jpg','해리포터와_아즈카반의_죄수2.pdf','201905152122.pdf','2019/05/15',2,'DONE',DEFAULT);

INSERT INTO BOOK VALUES('898392537X','해리포터와 불의 잔 1','J.K. 롤링','문학수첩','2014/12/18',328,
'마법사 세계의 최대 게임인 퀴디치 월드컵 중 볼드모트의 상징인 어둠의 표식이 밤하늘에 떠오른다. 
해리를 비롯한 마법사 세계가 다시 불안에 떠는 가운데 호그와트에서는 유럽의 유명한 세 마법학교에서각 한 명씩의 대표를 선발하여 겨루는 트리위저드 대회가 개최된다.
17세 이하는 출전할 수 없을 정도로 위험한 이 대회에 이미 호그와트의 대표로 케드릭 디고리가 뽑혔는데도, 전례 없이 네 번째 대표로 아직 나이 어린 해리가 또 뽑혀 구설수에오른다. 
누가 불의 잔을 조작해 해리가 뽑히게 된 것인지조차 모르는 상황에서 시합은 속행되고,
마지막 시합 날 함께 우승컵을 잡은 케드릭과 해리는 볼드모트가 있는 곳으로 소환된다. 
케드릭은 볼드모트에게 살해당하지만, 해리는 부모 영혼의 도움으로 그 자리를 간신히 탈출하여 다시 호그와트로 돌아온다.',
'해리포터와_불의_잔1.jpg','201902182134.jpg','해리포터와_불의_잔1.pdf','201905162123.pdf','2019/05/16',2,'DONE',DEFAULT);

INSERT INTO BOOK VALUES('8983925388','해리포터와 불의 잔 2','J.K. 롤링','문학수첩','2014/12/18',328,
'마법사 세계의 최대 게임인 퀴디치 월드컵 중 볼드모트의 상징인 어둠의 표식이 밤하늘에 떠오른다. 
해리를 비롯한 마법사 세계가 다시 불안에 떠는 가운데 호그와트에서는 유럽의 유명한 세 마법학교에서 각 한 명씩의 대표를 선발하여 겨루는 트리위저드 대회가 개최된다.
17세 이하는 출전할 수 없을 정도로 위험한 이 대회에 이미 호그와트의 대표로 케드릭 디고리가 뽑혔는데도, 
전례 없이 네 번째 대표로 아직 나이 어린 해리가 또 뽑혀 구설수에 오른다. 
누가 불의 잔을 조작해 해리가 뽑히게 된 것인지조차 모르는 상황에서 시합은 속행되고,
마지막 시합 날 함께 우승컵을 잡은 케드릭과 해리는 볼드모트가 있는 곳으로 소환된다. 
케드릭은 볼드모트에게 살해당하지만, 해리는 부모 영혼의 도움으로 그 자리를 간신히 탈출하여 
다시 호그와트로 돌아온다.',
'해리포터와_불의_잔2','201902192135.jpg','해리포터와_불의_잔2.pdf','201905172124.pdf','2019/05/17',2,'DONE',DEFAULT);

INSERT INTO BOOK VALUES('8983925396','해리포터와 불의 잔 3','J.K. 롤링','문학수첩','2014/12/18',312,
'마법사 세계의 최대 게임인 퀴디치 월드컵 중 볼드모트의 상징인 어둠의 표식이 밤하늘에 떠오른다. 
해리를 비롯한 마법사 세계가 다시 불안에 떠는 가운데 호그와트에서는 유럽의 유명한 세 마법학교에서
각 한 명씩의 대표를 선발하여 겨루는 트리위저드 대회가 개최된다.
17세 이하는 출전할 수 없을 정도로 위험한 이 대회에 이미 호그와트의 대표로 케드릭 디고리가 뽑혔는데도,
전례 없이 네 번째 대표로 아직 나이 어린 해리가 또 뽑혀 구설수에 오른다. 
누가 불의 잔을 조작해 해리가 뽑히게 된 것인지조차 모르는 상황에서 시합은 속행되고,
마지막 시합 날 함께 우승컵을 잡은 케드릭과 해리는 볼드모트가 있는 곳으로 소환된다. 
케드릭은 볼드모트에게 살해당하지만, 해리는 부모 영혼의 도움으로 그 자리를 간신히 탈출하여 다시 호그와트로 돌아온다.',
'해리포터와_불의_잔3.jpg','201902192136.jpg','해리포터와_불의_잔3.pdf','201905182125.pdf','2019/05/18',2,'DONE',DEFAULT);

INSERT INTO BOOK VALUES('898392540X','해리포터와 불의 잔 4','J.K. 롤링','문학수첩','2014/12/18',312,
'마법사 세계의 최대 게임인 퀴디치 월드컵 중 볼드모트의 상징인 어둠의 표식이 밤하늘에 떠오른다. 
해리를 비롯한 마법사 세계가 다시 불안에 떠는 가운데 호그와트에서는 유럽의 유명한 세 마법학교에서
각 한 명씩의 대표를 선발하여 겨루는 트리위저드 대회가 개최된다.
17세 이하는 출전할 수 없을 정도로 위험한 이 대회에 이미 호그와트의 대표로 케드릭 디고리가 뽑혔는데도, 
전례 없이 네 번째 대표로 아직 나이 어린 해리가 또 뽑혀 구설수에 오른다. 
누가 불의 잔을 조작해 해리가 뽑히게 된 것인지조차 모르는 상황에서 시합은 속행되고,
마지막 시합 날 함께 우승컵을 잡은 케드릭과 해리는 볼드모트가 있는 곳으로 소환된다. 
케드릭은 볼드모트에게 살해당하지만, 해리는 부모 영혼의 도움으로 그 자리를 간신히 탈출하여 다시 호그와트로 돌아온다.',
'해리포터와_불의_잔4.jpg','201902212133.jpg','해리포터와_불의_잔4.pdf','201905192126.pdf','2019/05/19',2,'DONE',DEFAULT);

INSERT INTO BOOK VALUES('8983925418','해리포터와 불사조 기사단 1','J.K. 롤링','문학수첩','2014/12/18',328,
'사사건건 해리를 괴롭히는 사촌 두들리와 다투다 디멘터의 습격을 받은 해리는 
우여곡절 끝에 친구 론과 헤르미온느가 있는 불사조 기사단의 비밀 본부로 가게 된다. 
볼드모트에 대항하는 비밀 단체였지만,
정작 해리는 나이가 어리다는 이유로 기사단에 가입하지 못한다.
한편 퍼지 마법부 장관의 심복인 돌로레스 제인 엄브릿지가 호그와트에 부임하여 
어둠의 마법 방어술을 전혀 익히지 못하게 하자,
해리는 론, 헤르미온느와 더불어 ‘덤블도어의 군대’라는 모임을 조직 몰래 마법을 익힌다.
 이 일로 해리가 퇴학당할 위기에 처하자 덤블도어는 대신 죄를 뒤집어쓰고 마법부의 감시를 피해 몸을 감춘다. 
한편 해리는 대부 시리우스가 볼드모트에 의해 마법부의 미스터리 부서로 끌려가는 꿈을 꾸고 친구들과 구출 작전을 개시한다.',
'해리포터와_불사조_기사단1.jpg','201902222237.jpg','해리포터와_불사조_기사단1.pdf','201905202127.pdf','2019/05/20',1,'DONE',DEFAULT);


INSERT INTO BOOK VALUES('8983925426','해리포터와 불사조 기사단 2','J.K. 롤링','문학수첩','2014/12/18',328,
'사사건건 해리를 괴롭히는 사촌 두들리와 다투다 디멘터의 습격을 받은 
해리는 우여곡절 끝에 친구 론과 헤르미온느가 있는 불사조 기사단의 비밀 본부로 가게 된다. 
볼드모트에 대항하는 비밀 단체였지만, 정작 해리는 나이가 어리다는 이유로 기사단에 가입하지 못한다. 
한편 퍼지 마법부 장관의 심복인 돌로레스 제인 엄브릿지가 호그와트에 부임하여 어둠의 마법 방어술을 전혀 익히지 못하게 하자, 
해리는 론, 헤르미온느와 더불어 ‘덤블도어의 군대’라는 모임을 조직 몰래 마법을 익힌다.
이 일로 해리가 퇴학당할 위기에 처하자 덤블도어는 대신 죄를 뒤집어쓰고 마법부의 감시를 피해 몸을 감춘다. 
한편 해리는 대부 시리우스가 볼드모트에 의해 마법부의 미스터리 부서로 끌려가는 꿈을 꾸고 친구들과 구출 작전을 개시한다.',
'해리포터와_불사조_기사단2.jpg','201902232131.jpg','해리포터와_불사조_기사단2.pdf','201905212128.pdf','2019/05/21',1,'DONE',DEFAULT);

INSERT INTO BOOK VALUES('8983925434','해리포터와 불사조 기사단 3','J.K. 롤링','문학수첩','2014/12/18',324,
'사사건건 해리를 괴롭히는 사촌 두들리와 다투다 디멘터의 습격을 받은 해리는 우여곡절 끝에 친구 론과 헤르미온느가 있는 불사조 기사단의 비밀 본부로 가게 된다. 
볼드모트에 대항하는 비밀 단체였지만, 정작 해리는 나이가 어리다는 이유로 기사단에 가입하지 못한다. 
 한편 퍼지 마법부 장관의 심복인 돌로레스 제인 엄브릿지가 호그와트에 부임하여 어둠의 마법 방어술을 전혀 익히지 못하게 하자, 
해리는 론, 헤르미온느와 더불어 ‘덤블도어의 군대’라는 모임을 조직 몰래 마법을 익힌다.
이 일로 해리가 퇴학당할 위기에 처하자 덤블도어는 대신 죄를 뒤집어쓰고 마법부의 감시를 피해 몸을 감춘다. 
한편 해리는 대부 시리우스가 볼드모트에 의해 마법부의 미스터리 부서로 끌려가는 꿈을 꾸고 친구들과 구출 작전을 개시한다.',
'해리포터와_불사조_기사단3.jpg','201902242130.jpg','해리포터와_불사조_기사단3.pdf','201905222129.pdf','2019/05/22',21,'DONE',DEFAULT);

INSERT INTO BOOK VALUES('8983925442','해리포터와 불사조 기사단 4','J.K. 롤링','문학수첩','2014/12/18',356,
'사사건건 해리를 괴롭히는 사촌 두들리와 다투다 디멘터의 습격을 받은 해리는 우여곡절 끝에 친구 론과 헤르미온느가 있는 불사조 기사단의 비밀 본부로 가게 된다.
볼드모트에 대항하는 비밀 단체였지만, 정작 해리는 나이가 어리다는 이유로 기사단에 가입하지 못한다. 
한편 퍼지 마법부 장관의 심복인 돌로레스 제인 엄브릿지가 호그와트에 부임하여 어둠의 마법 방어술을 전혀 익히지 못하게 하자, 
해리는 론, 헤르미온느와 더불어 ‘덤블도어의 군대’라는 모임을 조직 몰래 마법을 익힌다.
 이 일로 해리가 퇴학당할 위기에 처하자 덤블도어는 대신 죄를 뒤집어쓰고 마법부의 감시를 피해 몸을 감춘다. 
한편 해리는 대부 시리우스가 볼드모트에 의해 마법부의 미스터리 부서로 끌려가는 꿈을 꾸고 친구들과 구출 작전을 개시한다.',
'해리포터와_불사조_기사단4.jpg','201902252131.jpg','해리포터와_불사조_기사단4.pdf','201905232120.pdf','2019/05/23',20,'DONE',DEFAULT);

INSERT INTO BOOK VALUES('8983925469','해리포터와 혼혈왕자 1','J.K. 롤링','문학수첩','2014/12/18',304,
'볼드모트의 영향력이 커지는 가운데 마법사 세계와 머글 세계는 경계 상태에 들어가게 된다. 
덤블도어와 해리의 설득으로 호그와트 교수로 취임한 슬러그혼은 마법약 과목을 가르치고, 
스네이프는 어둠의 마법 방어술을 가르치게 된다. 
슬러그혼의 첫 수업에서 해리는 혼혈 왕자라는 별칭을 가진 소년이 쓰던 책을 받게 되고,
그 책의 도움으로 마법의 약 수업에서 두각을 보인다. 한편 덤블도어는 해리에게
볼드모트와 관련된 과거의 기억들을 보여주며 볼드모트가 자신의 영혼을 7개의 호크룩스에 나누어 놓았다는 사실을 알려준다. 
두 사람은 호크룩스를 찾기 위해 볼드모트가 어린 시절 들렀던 동굴을 찾지만 별 소득을 얻지 못한다. 
지친 몸으로 학교에 돌아온 해리는 잠입한 볼드모트의 추종자들과 맞닥뜨리고, 뼈아픈 상실을 경험하게 된다.',
'해리포터와_혼혈왕자1.jpg','201903012132.jpg','해리포터와_혼혈왕자1.pdf','201905242121.pdf','2019/05/24',19,'DONE',DEFAULT);

INSERT INTO BOOK VALUES('8983925477','해리포터와 혼혈왕자 2','J.K. 롤링','문학수첩','2014/12/18',320,
'볼드모트의 영향력이 커지는 가운데 마법사 세계와 머글 세계는 경계 상태에 들어가게 된다
덤블도어와 해리의 설득으로 호그와트 교수로 취임한 슬러그혼은 마법약 과목을 가르치고, 스네이프는 어둠의 마법 방어술을 가르치게 된다. 
슬러그혼의 첫 수업에서 해리는 혼혈 왕자라는 별칭을 가진 소년이 쓰던 책을 받게 되고, 그 책의 도움으로 마법의 약 수업에서 두각을 보인다. 
한편 덤블도어는 해리에게 볼드모트와 관련된 과거의 기억들을 보여주며 볼드모트가 자신의 영혼을 7개의 호크룩스에 나누어 놓았다는 사실을 알려준다. 
두 사람은 호크룩스를 찾기 위해 볼드모트가 어린 시절 들렀던 동굴을 찾지만 별 소득을 얻지 못한다. 
지친 몸으로 학교에 돌아온 해리는 잠입한 볼드모트의 추종자들과 맞닥뜨리고, 뼈아픈 상실을 경험하게 된다.',
'해리포터와_혼혈왕자2.jpg','201903022133.jpg','해리포터와_혼혈왕자2.pdf','201905252122.pdf','2019/05/25',17,'DONE',DEFAULT);

INSERT INTO BOOK VALUES('8983925485','해리포터와 혼혈왕자 3','J.K. 롤링','문학수첩','2014/12/18',292,
'볼드모트의 영향력이 커지는 가운데 마법사 세계와 머글 세계는 경계 상태에 들어가게 된다. 
덤블도어와 해리의 설득으로 호그와트 교수로 취임한 슬러그혼은 마법약 과목을 가르치고, 
스네이프는 어둠의 마법 방어술을 가르치게 된다. 슬러그혼의 첫 수업에서 해리는 혼혈 왕자라는 별칭을 가진 소년이 쓰던 책을 받게 되고,
그 책의 도움으로 마법의 약 수업에서 두각을 보인다. 한편 덤블도어는 해리에게 볼드모트와 관련된 과거의 기억들을 보여주며 
볼드모트가 자신의 영혼을 7개의 호크룩스에 나누어 놓았다는 사실을 알려준다. 두 사람은 호크룩스를 찾기 위해 
볼드모트가 어린 시절 들렀던 동굴을 찾지만 별 소득을 얻지 못한다. 지친 몸으로 학교에 돌아온 해리는 잠입한 
볼드모트의 추종자들과 맞닥뜨리고, 뼈아픈 상실을 경험하게 된다.',
'해리포터와_혼혈왕자3.jpg','201903042134.jpg','해리포터와_혼혈왕자3.pdf','201905262123.pdf','2019/05/26',2,'DONE',DEFAULT);

INSERT INTO BOOK VALUES('8983925493','해리포터와 혼혈왕자 4','J.K. 롤링','문학수첩','2014/12/18',288,
'볼드모트의 영향력이 커지는 가운데 마법사 세계와 머글 세계는 경계 상태에 들어가게 된다. 
덤블도어와 해리의 설득으로 호그와트 교수로 취임한 슬러그혼은 마법약 과목을 가르치고, 
스네이프는 어둠의 마법 방어술을 가르치게 된다. 슬러그혼의 첫 수업에서 해리는 혼혈 왕자라는 별칭을 가진 소년이 쓰던 책을 받게 되고,
그 책의 도움으로 마법의 약 수업에서 두각을 보인다. 한편 덤블도어는 해리에게 볼드모트와 관련된 과거의 기억들을 보여주며 
볼드모트가 자신의 영혼을 7개의 호크룩스에 나누어 놓았다는 사실을 알려준다. 두 사람은 호크룩스를 찾기 위해 
볼드모트가 어린 시절 들렀던 동굴을 찾지만 별 소득을 얻지 못한다. 지친 몸으로 학교에 돌아온 해리는 잠입한 
볼드모트의 추종자들과 맞닥뜨리고, 뼈아픈 상실을 경험하게 된다.',
'해리포터와_혼혈왕자4.jpg','201903052135.jpg','해리포터와_혼혈왕자4.pdf','201905272124.pdf','2019/05/27',13,'DONE',DEFAULT);

INSERT INTO BOOK VALUES('8983925507','해리포터와 죽음의 성물 1','J.K. 롤링','문학수첩','2014/12/18',360,
'열일곱 살이 되기 직전, 더즐리 가에 걸린 보호마법이 걷히기 전에 친구들의 미끼작전으로 은신처로 몸을 피한 해리는 론과 헤르미온느와 
함께 덤블도어의 뜻을 이어 호크룩스를 찾기로 결심한다.
덤블도어의 유품을 조사하던 중 죽음을 피하는 강력한 마법 물품인 
‘죽음의 성물’이 실제로 존재하며 그중 하나인 딱총나무 지팡이는 볼드모트가, 나머지 하나인 투명 망토는 자신이 갖고 있다는 것을 알게 된다. 
마지막 남은 죽음의 성물이 어디 있는지, 볼드모트와 대적할 방도는 무엇인지도 모른 채, 마지막 남은 호크룩스를 파괴하고 
볼드모트와의 결전을 치르기 위해 해리와 친구들은 죽음을 먹는 자들이 장악하고 있는 호그와트로 잠입한다.',
'해리포터와_죽음의_성물1.jpg','201903062119.jpg','해리포터와_죽음의_성물1.pdf','201905282125.pdf','2019/05/28',10,'DONE',DEFAULT);

INSERT INTO BOOK VALUES('8983925655','해리포터와 죽음의 성물 2','J.K. 롤링','문학수첩','2014/12/18',656,
'열일곱살이 되기 직전, 더즐리 가에 걸린 보호마법이 걷히기 전에 친구들의 미끼작전으로 은신처로 몸을 피한 해리는 론과 헤르미온느와 
함께 덤블도어의 뜻을 이어 호크룩스를 찾기로 결심한다. 
덤블도어의 유품을 조사하던 중 죽음을 피하는 강력한 마법 물품인 
‘죽음의 성물’이 실제로 존재하며 그중 하나인 딱총나무 지팡이는 볼드모트가, 나머지 하나인 투명 망토는 자신이 갖고 있다는 것을 알게 된다.
마지막 남은 죽음의 성물이 어디 있는지, 볼드모트와 대적할 방도는 무엇인지도 모른 채, 마지막 남은 호크룩스를 파괴하고 
볼드모트와의 결전을 치르기 위해 해리와 친구들은 죽음을 먹는 자들이 장악하고 있는 호그와트로 잠입한다.',
'해리포터와_죽음의_성물2jpg','201903072137.jpg','해리포터와_죽음의_성물2.pdf','201905292126.pdf','2019/05/29',1,'DONE',DEFAULT);

INSERT INTO BOOK VALUES('8983925523','해리포터와 죽음의 성물 3','J.K. 롤링','문학수첩','2014/12/18',328,
'열일곱 살이 되기 직전, 더즐리 가에 걸린 보호마법이 걷히기 전에 친구들의 미끼작전으로 은신처로 몸을 피한 해리는 론과 헤르미온느와 
함께 덤블도어의 뜻을 이어 호크룩스를 찾기로 결심한다. 
덤블도어의 유품을 조사하던 중 죽음을 피하는 강력한 마법 물품인 ‘죽음의 성물’이 실제로 존재하며 
그중 하나인 딱총나무 지팡이는 볼드모트가, 나머지 하나인 투명 망토는 자신이 갖고 있다는 것을 알게 된다.
마지막 남은 죽음의 성물이 어디 있는지, 볼드모트와 대적할 방도는 무엇인지도 모른 채, 마지막 남은 호크룩스를 파괴하고 
볼드모트와의 결전을 치르기 위해 해리와 친구들은 죽음을 먹는 자들이 장악하고 있는 호그와트로 잠입한다.',
'해리포터와_죽음의_성물3.jpg','201903082138.jpg','해리포터와_죽음의_성물3.pdf','201906012127.pdf','2019/06/01',1,'DONE',DEFAULT);

INSERT INTO BOOK VALUES('8983925531','해리포터와 죽음의 성물 4','J.K. 롤링','문학수첩','2014/12/18',336,
'열일곱 살이 되기 직전, 더즐리 가에 걸린 보호마법이 걷히기 전에 친구들의 미끼작전으로 은신처로 몸을 피한 해리는 론과 헤르미온느와 
함께 덤블도어의 뜻을 이어 호크룩스를 찾기로 결심한다.
덤블도어의 유품을 조사하던 중 죽음을 피하는 강력한 마법 물품인 ‘죽음의 성물’이 실제로 존재하며 
그중 하나인 딱총나무 지팡이는 볼드모트가, 나머지 하나인 투명 망토는 자신이 갖고 있다는 것을 
알게 된다. 마지막 남은 죽음의 성물이 어디 있는지, 볼드모트와 대적할 방도는 무엇인지도 모른 채, 마지막 남은 호크룩스를 파괴하고 
볼드모트와의 결전을 치르기 위해 해리와 친구들은 죽음을 먹는 자들이 장악하고 있는 호그와트로 잠입한다.',
'해리포터와_죽음의_성물4.jpg','201903092139.jpg','해리포터와_죽음의_성물4.pdf','201906022128.pdf','2019/06/02',5,'DONE',DEFAULT);

INSERT INTO BOOK VALUES('8954616518','희랍어의 시간','한강','문학동네','2011/11/10',194,
'200여 페이지 남짓의 짧은 장편소설, 그러나 이 짧은 소설이 던져주는 무게는 단단하다. 
이 책은 소멸하는 삶 속에서 서로를 단 한순간 마주보는 사람들의 이야기다.
점점 시력을 잃어가는 희랍어 강사와 지독한 침묵을 사이에 두고 수업을 듣는 말을 잃어가는 여자. 
작가는 슬프지만 담담한 시선을 시종일관 유지한 채 조용한 이들의 일상을 따라간다. 
희랍어라는 낯선 언어와 시력과 말을 잃어가는 주인공들, 
어쩌면 다른 세상의 이야기인 듯 하지만 소멸하고 빛을 잃어가는 사람들을 그렸다는 점에서 결국 우리 모두의 자화상이다.',
'희랍어의_시간.jpg','201907011111.jpg','희랍어의_시간.pdf','201909011221.pdf','2019/09/01',60,'DONE',DEFAULT);

INSERT INTO BOOK VALUES('8932034826','내 여자의 열매','한강','문학과지성사','2018/11/09',328,
'첫 소설집 이후 5년 만에 출간한 두번째 소설집.
채식주의자 연작의 씨앗이 된 내 여자의 열매 등을 포함한 단편 여덟 편의 배치를 바꾸고 표현과 문장을 다듬어 18년 만에 새롭게 선보인다.
내 여자의 열매에서 인간은 작은 박새처럼 쉽게 파괴될 수 있는 연약한 존재인 동시에, 
분열되고 찢긴 삶에 숨을 불어 넣어 다시 태어나고자 삶의 투쟁을 벌이기도 한다. 
새로 해설을 맡은 문학평론가 강지희는 한강 소설 속 여성 인물에 주목한다.',
'내_여자의_열매.jpg','201907021111.jpg','희랍어의_시간.pdf','201909021014.pdf','2019/09/02',73,'DONE',DEFAULT);

INSERT INTO BOOK VALUES('8936433598','채식주의자','한강','창비','2007/10/30',248,
'세계 3대 문학상 중 하나인 맨부커 국제상 수상작으로 화제가 되고있는 작품이다. 
이 소설은 맨부커선정위원회로부터 한국의 오늘에 대한 소설, 부끄러움과 욕망, 
타인을 이해하려는 불안정한 시도를 다루고 있다라는 찬사를 받았다. 
국제적 베스트셀러로 화제가 되고 있는 채식주의자.
미약한 존재가 난폭하고 어두운 세상과 어떤 식으로 대결 하는지 그리고 있다. 
약한 존재가 대항하는 법은 아이러니하게도 식물이 되는 것이라는데....
제목은 약해보이지만 책을 읽고 나면, 육식을 먹은 것 같은 강한 메시지가 가슴을 울릴 것이다.',
'채식주의자.jpg','201907030513.jpg','채식주의자.pdf','201909031014.pdf','2019/09/03',69,'DONE',DEFAULT);

INSERT INTO BOOK VALUES('8982811338','검은사슴','한강','문학동네','1998/08/19',440,
'1994년 서울신문 신춘문예를 통해 등단한 이후 줄곧 화제작을 발표하며 문단의 각별한 주목을 받아왔던 한강이
소설집 여수의 사랑을 발표한 직후부터 집필을 시작해 삼 년 만에 완성한 검은사슴. 
이 소설은 서사적 견고함과 염결한 작가정신이 어우러진 탁월한 작품으로, 
의심할 바 없이 90년대 문학이 거둔 가장 뛰어난 성과물 가운데 하나로 기록될 작품이다.',
'검은사슴.jpg','201907041837.jpg','검은사슴.pdf','201909041434.pdf','2019/09/04',80,'DONE', DEFAULT);

INSERT INTO BOOK VALUES('8932013047','그대의 차가운 손','한강','문학과지성사','2002/01/21',329,
'이듬해에 내가 입학한 초등학교는 집에서부터 버스로 세 정거장 거리에 있었다.
아버지의 승용차로 통학시켰으면 했던 어머니의 바람과 달리 아버지는 나를 걸어다니게 했다. 
될 수 있으면 아이들을 검소하고 엄하게 키운다는 것이 당시 아버지의 훈육 방침이었다.
어쨌든 나는 그 등학교 길을 좋아했다. 
그때만 해도 도로에 차량의 통행이 많지 않아 공기가 상쾌했으며, 
가다 보면 마음에 맞는 같은 반 아이들을 만날 수 있다는 것이 좋았다.
그해 가을 어느날 , 아침부터 하늘이 흐려 있더니 하교할 때쯤 부터부슬 비가 뿌리기 시작했다. 
마침 청소 당번이어서 시간을 지체한 것이 탈이었다. 
책가방을 양쪽 어깨에 메고 친구 몇과 나와보니, 어느새 장대처럼 굵어진 빗살이 모래 운동장에 닐꽂히고 있었다.',
'그대의_차가운_손.jpg','201907050945.jpg','그대의_차가운_손.pdf','201909052237.pdf','2019/09/05',76,'DONE',DEFAULT);

INSERT INTO BOOK VALUES ('9788950980726', '타인의 시선을 의식해 힘든 나에게', '글배우', '21세기북스', '2019/04/19', 184, '생각이 너무 많아 괴롭거나, 감정 기복이 심하거나, 작은 말에도 상처받는 이유는 우리가 알게 모르게 타인의 시선을 의식하며 살고 있기 때문이다. 수년 간 많은 이들의 고민을 직접 상담해오며 요즘 사람들이 가장 걱정하는 문제에 대해 같이 공감하고 이야기를 나눈 저자는 이들에게 실질적인 도움을 줄 수 있는 방법을 모아 이 책에 담았다.', '타인의 시선을 의식해 힘든 나에게.jpg', '201910031439.jpg', '타인의 시선을 의식해 힘든 나에게.pdf', '201910031235.pdf', '2019/10/03', 0, 'MAKE', DEFAULT);

INSERT INTO BOOK VALUES ('9788950981983', '2020 부의 지각변동', '박종훈', '21세기북스(북이십일)', '2019/07/10', 260, 'KBS 보도본부 경제부장 박종훈 기자는 『2020 부의 지각변동』을 통해 곧 도래할 ‘부의 지각변동’을 읽어내는 방법으로 ‘시그널’을 제안한다. 이 책은 2020에 정말 경제 위기가 올 것인지 분석하면서 쏟아지는 수많은 정보 중에서 가짜 시그널과 진짜 시그널을 가려내는 방법을 알려준다. 나아가 경제 이슈 중 가장 중요한 ‘금리, 부채, 버블, 환율, 중국, 인구, 쏠림’이라는 7가지 시그널을 소개하면서 이 시그널에서 어떤 변화에 주목해야 하며, 각각의 변화가 어떤 결과를 낳을지 전문가의 시선으로 날카롭게 예측한다. 마지막으로 머지않아 불어 닥칠 대규모 경제 위기 속에서 어떻게 하면 승자가 될 수 있을지 저자의 노하우를 담은 투자 전략을 알려준다.
경제 위기는 피할 수 없는 우리의 미래다. 이 책은 독자들이 부의 지각변동 속에서 무너지지 않고 기회를 만드는 결정적인 계기가 될 것이다.', '2020 부의 지각변동.jpg', '201910151626.jpg', '2020 부의 지각변동1.pdf', '201910151626.pdf', '2019/10/15', 0, 'WAIT', DEFAULT);
INSERT INTO BOOK VALUES ('9791188248674', '90년생이 온다', '임홍택', '웨일북', '2018/11/16', 336, '“이해하기 어렵다면 제대로 관찰하라!”
언어생활부터 소비성향, 가치관까지
세상을 주도하는 90년생을 파헤치다', '90년생이 온다.jpg', '201910151625.jpg', '90년생이 온다.pdf', '201910151625.pdf', '2019/10/15', 0, 'MAKE', DEFAULT);
INSERT INTO BOOK VALUES ('9788965134947', '너무 재밌어서 잠 못 드는 지구의 과학', '신규진', '생각의길', '2018/04/20', 224, '이 책에는 신비한 22가지 지구의 과학 이야기가 들어 있습니다. 2012년 교육과학기술부와 한국과학창의재단에서 ‘올해의 과학교사’로 꼽힌 저자 신규진은 스토리텔링으로 과학을 가르치는 현직 과학 교사이자 아이들이 찾아가는 상담교사입니다. 무엇보다 학생들과의 소통을 가장 중요하게 여겨 누구보다 가까이에서 학생들의 목소리를 경청합니다. 그래서 학생들이 흥미로울 만한 소재들로 질문을 던지며 지구과학을 자연스럽게 즐기며 공부할 수 있게 만들어줍니다.
저자는 지진, 날씨, 바다, 산 등 자연에서부터 온천, 나침반, 경위도, 대리석, 공룡 이야기까지 너무 재밌어서 잠 못 드는 22가지 지구 과학 이야기를 소개합니다.', '너무 재밌어서 잠못드는 지구의 과학.jpg', '201910151749.jpg', '너무 재밌어서 잠못드는 지구의 과학.pdf', '201910151749.pdf', '2019/10/15', 0, 'WAIT', DEFAULT);
INSERT INTO BOOK VALUES ('9788932919874', '핵을 들고 도망친 101세 노인', '요나스 요나손', '열린책들', '2019/09/25', 528, '베스트셀러 작가 요나스 요나손의 장편소설 『핵을 들고 도망친 101세 노인』이 열린책들에서 출간되었다. 요나손은 데뷔작 『창문 넘어 도망친 100세 노인』으로 인구 천만의 나라 스웨덴에서 120만 부, 전 세계적으로 1천만 부 이상 판매 기록을 세웠는데 이 작품이 바로 그 후속작이다. 지금까지 국내에서 출간된 요나손의 다른 소설들과 마찬가지로 전문 번역가 임호경이 번역을 맡았다.
스웨덴의 시골 마을에서 태어났지만 백 년이 넘는 세월을 살면서 본의 아니게 세계사의 주요 사건에 끼어들게 된 주인공 알란 칼손. 백 살 생일날 양로원 창문을 넘어 도망쳤던 알란이 이번에는 백 한 살 생일날 열기구를 탔다가 조난당하며 새로운 모험을 시작한다. 『핵을 들고 도망친 101세 노인』은 요나손의 통산 네 번째 소설이다.', '핵을 들고 도망친 101세 노인.jpg', '201910151843.jpg', '핵을 들고 도망친 101세 노인.pdf', '201910151843.pdf', '2019/10/15', 0, 'MAKE', DEFAULT);
INSERT INTO BOOK VALUES ('9788995563502', '부의 인문학', '브라운스톤(우석)', '오픈마인드', '2019/10/04', 294, '그동안 내 전망이 들어맞은 것은 내게 신기가 있어서가 아니다. 나의 전망이 적중률이 높은 것은 그것이 단지 내 개인의 경험과 생각에서 나온 것이 아니라 거인들의 통찰력을 빌렸기 때문이다. 나의 거인은 역사 속에 살아 있는 경제학 거장들이다.
나는 이 책을 통해서 내가 인문학을 공부하면서 알게 된 거인들의 투자 통찰을 아주 알기 쉽게 알려주려 한다. 이론과 메시지는 노벨 경제학상을 수상한 경제학자들을 중심으로 소개하고 있다. 왜냐하면 경제학 이론은 너무나도 다양하고 심지어는 상반된 이론을 주장하는 경제학자도 많기 때문이다. 노벨 경제학상 수상자들의 이론은 어쨌거나 까다로운 검증을 거친 것이라고 할 수 있고, 다른 것보다 신뢰할 수 있다고 생각하기 때문이다.
이 책에 실려 있는 내용만 잘 이해해도 여러분은 거인의 어깨에 올라서서 세상을 좀 더 잘 전망하고 올바른 판단을 내리게 될 것이다. 또 세상이 어떻게 돌아가는지 더 잘 이해하게 되고 무엇보다 하지 않아도 되는 실패를 피할 수 있을 것이다.
("프롤로그" 중에서)', '부의 인문학.jpg', '201910151926.jpg', '부의 인문학.pdf', '201910151926.pdf', '2019/10/15', 0, 'MAKE', DEFAULT);
INSERT INTO BOOK VALUES ('9791135445620', '시작하기엔 너무 늦지 않았을까? ', '벨라 마키', '비잉(로크미디어)', '2019/10/02', 348, '《시작하기엔 너무 늦지 않았을까》는 벨라 마키가 달리기를 통해 우울증, 불안, 공황장애 등 정신 질환을 이겨내고 정신 건강과 자존감을 함께 얻은 그녀의 스토리가 담겨 있다. 그러나 이 책은 그녀의 스토리만으로 끝나지 않는다. 벨라 마키는 달리기를 통해 되찾는 과정 속에서 ‘왜’라는 질문을 던진다. “우리는 왜 정신 건강을 진지하게 생각하지 않을까”와 같은 질문을 비롯하여 “우리가 자주 앓는 정신 질환은 무엇이 있을까.”, “달리기는 정신 건강에 어떤 효과를 줄까.”, “사회, 문화, 개인 등 여러 관점에서 우리를 달리지 못하게 하는 것이 무엇이 있을까.”처럼 우리가 생각하지 못했던 달리기와 정신 건강에 관한 정보를 참고 자료를 통해 자세하게 알려준다.', '시작하기엔 너무 늦지 않았을까1.jpg', '201910152026.jpg', '시작하기엔 너무 늦지 않았을까1.pdf', '201910152026.pdf', '2019/10/15', 0, 'MAKE', DEFAULT);
INSERT INTO BOOK VALUES ('9791187119845', '나는 나로 살기로 했다 ', '김수현', '도서출판마음의숲', '2016/11/25', 288, '진짜 "나"로 살기 위한 뜨거운 조언들! 어른이 처음인 당신을 위한 단단한 위로들!

"어른이 되어보니 세상은 냉담한 곳이었다." 김수현은 책을 펴내면서 이런 말을 했다. 부조리가 넘쳐났고, 사람들은 불필요할 정도로 서로에게 선을 긋고, 평범한 이들조차 기회가 있으면 차별과 멸시를 즐긴다. 우리는 자본주의 사회에서 철저한 갑과 을이 되어 살아가고 있다. 그것이 우리가 이토록 발버둥 치며 살고 있는 세상이다.', '나는 나로 살기로 했다.jpg', '201910152005.jpg', '나는 나로 살기로 했다.pdf', '201910152005.pdf', '2019/10/15', 0, 'MAKE', DEFAULT);
INSERT INTO BOOK VALUES ('9791162540640', '아주 작은 습관의 힘 ', '제임스 클리어', '비즈니스북스', '2019/02/26', 360, '[아주 작은 습관의 힘]은 저자의 생생한 경험과 생물학, 뇌과학, 심리학의 최신 연구 결과를 집약해서 습관 하나로 인생을 변화시킬 수 있는 노하우를 제시한다. 만약 당신이 "새해에 운동을 해야지"라고 결심을 했다면 저자의 관점에서 이 목표는 실패할 수밖에 없다. 왜냐하면 습관을 만들기 위해서는 결심이 분명해야 하고(제1법칙), 매력적이어야 하며(제2법칙), 쉬워야 하고(제3법칙), 만족스러워야 하기(제4법칙) 때문이다. 위의 결심은 여기에 단 한 가지도 해당되지 않는다. 정말 변화할 수 있는 습관을 만들기 위해서 당신의 방법은 완전히 달라져야 한다. 이 책에서는 이 네 가지 법칙을 바탕으로 어떻게 하면 빠르고, 효율적이고, 확실하게 변화할 수 있는지 알려준다. 금연, 다이어트에서부터 비즈니스에서 탁월한 성과를 이뤄내기까지, 저자가 제안하는 방법으로 매일 조금씩 좋은 습관을 만든다면 무엇을 결심하든 원하는 것을 얻을 것이다.', '아주 작은 습관의 힘.jpg', '201910152019.jpg', '아주 작은 습관의 힘.pdf', '201910152019.pdf', '2019/10/15', 0, 'MAKE', DEFAULT);

--도서 데이터 수정
UPDATE BOOK SET MAKESTATUS = 'MAKE'
WHERE BOOKCODE = '9791188248674';
UPDATE BOOK SET MAKESTATUS = 'MAKE'
WHERE BOOKCODE = '9788932919874';
UPDATE BOOK SET MAKESTATUS = 'MAKE'
WHERE BOOKCODE = '9788995563502';
UPDATE BOOK SET MAKESTATUS = 'MAKE'
WHERE BOOKCODE = '9791135445620';
UPDATE BOOK SET MAKESTATUS = 'MAKE'
WHERE BOOKCODE = '9791187119845';
UPDATE BOOK SET MAKESTATUS = 'MAKE'
WHERE BOOKCODE = '9791162540640';
                                              

--내서재 데이터 입력
INSERT INTO MYBOOK VALUES ('user005', '8954655971', 7, DEFAULT, DEFAULT);

--관심도서 데이터 입력
INSERT INTO LIKEBOOK VALUES ('user003', '8954655971');
INSERT INTO LIKEBOOK VALUES ('user003', '8954641636');
INSERT INTO LIKEBOOK VALUES ('user005', '8936434268');
INSERT INTO LIKEBOOK VALUES ('user005', '8937473135');
INSERT INTO LIKEBOOK VALUES ('user005', '8937473097');

--제작도서 데이터 입력
INSERT INTO MAKEDBOOK VALUES ('user001', '8954655971', DEFAULT);
INSERT INTO MAKEDBOOK VALUES ('user001', '8954641636', DEFAULT);
INSERT INTO MAKEDBOOK VALUES ('user001', '8936434268', DEFAULT);
INSERT INTO MAKEDBOOK VALUES ('user002', '8937473135', DEFAULT);
INSERT INTO MAKEDBOOK VALUES ('user007', '8937473097', DEFAULT);

--도서제작 데이터 입력
INSERT INTO BOOKMAKING VALUES ('8954655971', '2019-04-29', NULL, NULL, NULL, 43);
INSERT INTO BOOKMAKING VALUES ('8954641636', '2019-03-03', NULL, NULL, NULL, 121);
INSERT INTO BOOKMAKING VALUES ('8983925310', '2019-07-26', '2019-08-01', '해리포터와 마법사의 돌 1.txt', '201908011508.txt', 244);
INSERT INTO BOOKMAKING VALUES ('8936434268', '2019-01-15', '2019-01-31', '아몬드_손평원.txt', '201901312208.txt', 264);
INSERT INTO BOOKMAKING VALUES ('8937473135', SYSDATE, NULL, NULL, NULL, DEFAULT);
INSERT INTO BOOKMAKING VALUES ('8937473097', SYSDATE, NULL, NULL, NULL, DEFAULT);
INSERT INTO BOOKMAKING VALUES ('8982814477', SYSDATE, NULL, NULL, NULL, DEFAULT);
INSERT INTO BOOKMAKING VALUES ('1162203625', SYSDATE, NULL, NULL, NULL, DEFAULT);
INSERT INTO BOOKMAKING VALUES ('9791130620459', '2019-09-14', null, null, null, 20);
INSERT INTO BOOKMAKING VALUES ('9788934972464', sysdate, null, null, null, default);
INSERT INTO BOOKMAKING VALUES ('8982816631', '2019-10-03', null, null, null, 84);
INSERT INTO BOOKMAKING VALUES ('9788950980726', '2019-10-03', null, null, null, 15);
INSERT INTO BOOKMAKING VALUES ('9788950981983', sysdate, null, null, null, 0);
INSERT INTO BOOKMAKING VALUES ('9791188248674', sysdate, null, null, null, 231);
INSERT INTO BOOKMAKING VALUES ('9788965134947', sysdate, null, null, null, 0);
INSERT INTO BOOKMAKING VALUES ('9788932919874', sysdate, null, null, null, 12);
INSERT INTO BOOKMAKING VALUES ('9788995563502', sysdate, null, null, null, 46);
INSERT INTO BOOKMAKING VALUES ('9791135445620', sysdate, null, null, null, 15);
INSERT INTO BOOKMAKING VALUES ('9791187119845', sysdate, null, null, null, 67);
INSERT INTO BOOKMAKING VALUES ('9791162540640', sysdate, null, null, null, 154);
INSERT INTO BOOKMAKING VALUES ('8983925329', '19/05/12', '19/05/15', '해리포터와 마법사의 돌 2.txt', '201905152342.txt', 244);
INSERT INTO BOOKMAKING VALUES ('8983925337', '19/05/13', '19/05/16', '해리포터와 비밀의 방 1.txt', '201905162242.txt', 264);
INSERT INTO BOOKMAKING VALUES ('8983925353', '19/05/14', '19/05/17', '해리포터와 아즈카반의 죄수 1.txt', '201905172142.txt', 328);
INSERT INTO BOOKMAKING VALUES ('8983925361', '19/05/16', '19/05/18', '해리포터와 아즈카반의 죄수 2.txt', '201905182042.txt', 300);
INSERT INTO BOOKMAKING VALUES ('898392537X', '19/05/17', '19/05/19', '해리포터와 불의 잔 1.txt', '201905192442.txt', 328);
INSERT INTO BOOKMAKING VALUES ('8983925388', '19/05/18', '19/05/21', '해리포터와 불의 잔 2.txt', '201905212242.txt', 328);
INSERT INTO BOOKMAKING VALUES ('8983925396', '19/05/19', '19/05/21', '해리포터와 불의 잔 3.txt', '201905211242.txt', 312);
INSERT INTO BOOKMAKING VALUES ('898392540X', '19/05/20', '19/05/23', '해리포터와 불의 잔 4.txt', '201905232242.txt', 312);
INSERT INTO BOOKMAKING VALUES ('8983925418', '19/05/21', '19/05/23', '해리포터와 불사조 기사단 1.txt', '201905231222.txt', 328);
INSERT INTO BOOKMAKING VALUES ('8983925426', '19/05/21', '19/05/23', '해리포터와 불사조 기사단 2.txt', '201905231222.txt', 328);
INSERT INTO BOOKMAKING VALUES ('8983925434', '19/05/22', '19/05/24', '해리포터와 불사조 기사단 3.txt', '201905240932.txt', 324);
INSERT INTO BOOKMAKING VALUES ('8983925442', '19/05/23', '19/05/25', '해리포터와 불사조 기사단 4.txt', '201905251622.txt', 356);
INSERT INTO BOOKMAKING VALUES ('8983925469', '19/05/24', '19/05/27', '해리포터와 혼혈왕자 1.txt', '201905271152.txt', 304);
INSERT INTO BOOKMAKING VALUES ('8983925477', '19/05/25', '19/05/27', '해리포터와 혼혈왕자 2.txt', '201905271546.txt', 320);
INSERT INTO BOOKMAKING VALUES ('8983925485', '19/05/26', '19/05/29', '해리포터와 혼혈왕자 3.txt', '201905292312.txt', 292);
INSERT INTO BOOKMAKING VALUES ('8983925493', '19/05/27', '19/05/29', '해리포터와 혼혈왕자 4.txt', '201905291243.txt', 288);
INSERT INTO BOOKMAKING VALUES ('8983925507', '19/05/28', '19/05/30', '해리포터와 죽음의 성물 1.txt', '201905301222.txt', 360);
INSERT INTO BOOKMAKING VALUES ('8983925655', '19/05/29', '19/05/31', '해리포터와 죽음의 성물 2.txt', '201905311222.txt', 656);
INSERT INTO BOOKMAKING VALUES ('8983925523', '19/06/02', '19/06/04', '해리포터와 죽음의 성물 3.txt', '201906041722.txt', 328);
INSERT INTO BOOKMAKING VALUES ('8983925531', '19/06/03', '19/06/05', '해리포터와 죽음의 성물 4.txt', '201906051222.txt', 336);
INSERT INTO BOOKMAKING VALUES ('8954616518', '19/09/02', '19/09/05', '희랍어의 시간.txt', '201909051634.txt', 194);
INSERT INTO BOOKMAKING VALUES ('8932034826', '19/09/03', '19/09/05', '내 여자의 열매.txt', '201909052122.txt', 328);
INSERT INTO BOOKMAKING VALUES ('8936433598', '19/09/04', '19/09/06', '채식주의자.txt', '201909061522.txt', 248);
INSERT INTO BOOKMAKING VALUES ('8982811338', '19/09/05', '19/09/07', '검은사슴.txt', '201909071222.txt', 440);
INSERT INTO BOOKMAKING VALUES ('8932013047', '19/09/06', '19/09/09', '그대의 차가운 손.txt', '201909091312.txt', 329);

--도서신청 데이터 입력
INSERT INTO WISHBOOK VALUES (SEQ_WISHNO.NEXTVAL, 'user003', '아몬드', '손원평', '창비', '2017/03/31', '2019/01/12', 14, 'DONE', NULL, '2019/01/15', 'N', 'admin00');
INSERT INTO WISHBOOK VALUES (SEQ_WISHNO.NEXTVAL, 'user005', '쇼코의 미소', '최은영', '문학동네', NULL, '2019/02/25', 12, 'DONE', NULL, '2019/03/03', 'N', 'admin01');
INSERT INTO WISHBOOK VALUES (SEQ_WISHNO.NEXTVAL, 'user003', '쇼코의 미소', '최은영', NULL, NULL, '2019/03/02', 8, 'RJCT', '이미 신청된 도서입니다.', '2019/03/03', 'N' , 'admin00');
INSERT INTO WISHBOOK VALUES (SEQ_WISHNO.NEXTVAL, 'user005', '소년이 온다', '한강', NULL, NULL, '2019/09/02', 7, DEFAULT, NULL, NULL, 'N', NULL);
INSERT INTO WISHBOOK VALUES (SEQ_WISHNO.NEXTVAL, 'user005', '검사내전', '김웅', NULL, NULL, '2019/09/08', 5, DEFAULT, NULL, NULL, 'N', NULL);
INSERT INTO WISHBOOK VALUES (SEQ_WISHNO.NEXTVAL, 'user001', '여행의 이유', '김영하', NULL, NULL, '2019/09/08', 4, DEFAULT, NULL, NULL, 'N', NULL);
INSERT INTO WISHBOOK VALUES (SEQ_WISHNO.NEXTVAL, 'user002', '해리포터 시리즈', '제이케이롤링', NULL, NULL, '2019/09/09', 9, DEFAULT, NULL, NULL, 'N', NULL);
INSERT INTO WISHBOOK VALUES (SEQ_WISHNO.NEXTVAL, 'user002', '아몬드', '손원평', NULL, NULL, '2019/09/09', 8, DEFAULT, NULL, NULL, 'N', NULL);
INSERT INTO WISHBOOK VALUES (SEQ_WISHNO.NEXTVAL, 'user001', '너무 재밌어서 잠 못 드는 심리학 사전', '스벤야 아이젠브라운', NULL, NULL, '2019/09/10', 3, DEFAULT, NULL, NULL, 'N', NULL);
INSERT INTO WISHBOOK VALUES (SEQ_WISHNO.NEXTVAL, 'user004', '박막례, 이대로 죽을 순 없다', '박막례, 김유라', '위즈덤 하우스', NULL, '2019/09/11', 11, DEFAULT, NULL, NULL, 'N', NULL);
INSERT INTO WISHBOOK VALUES (SEQ_WISHNO.NEXTVAL, 'user003', '개미', '베르나르 베르베르', NULL, NULL, '2019/09/11', 7, DEFAULT, NULL, NULL, 'N', NULL);

--qna 데이터 입력
INSERT INTO QNA VALUES (SEQ_QNANO.NEXTVAL, '한자 작성은 어떻게 하면되나요', 'user002', '도서 중간중간 나오는 한자는 어떻게 작성하면 되나요?', '2019/09/23', 21, 'Y', NULL, NULL, 'N');
INSERT INTO QNA VALUES (SEQ_QNANO.NEXTVAL, '제작한 도서는 어떻게 이용할수 있나요??', 'user002', '제작자는 따로 이용못하는 건가요?', '2019/09/24', 10, 'Y', NULL, NULL, 'N');
INSERT INTO QNA VALUES (SEQ_QNANO.NEXTVAL, '도서 이어듣기는 어떻게 하는건가요?', 'user003', '기존에 읽었던 도서를 이어읽고 싶습니다. 어떻게 해야하나요?', '2019/09/25', 8, 'Y', NULL, NULL, 'N');
INSERT INTO QNA VALUES (SEQ_QNANO.NEXTVAL, '제작할 도서가 없습니다', 'user001', '도서 제작 페이지에 제작할 도서가 없다면 어떻게 해야되나요?', '2019/09/26', 14, 'Y', NULL, NULL, 'N');
INSERT INTO QNA VALUES (SEQ_QNANO.NEXTVAL, '표 작성은 어떻게 하는지 궁금합니다.', 'user001', '도서 내용에 표가 있다면 어떻게 작성하면 되나요?', '2019/09/27', 3, 'N', NULL, NULL, 'N');


--qna 답변 데이터 입력
INSERT INTO QNACOMMENT VALUES (1, 'admin02', '네이버 사전에 한자를 그려서 확인할수 있습니다.', '2019/09/24');
INSERT INTO QNACOMMENT VALUES (2, 'admin01', '네, 죄송합니다. 제작자는 도서 듣기를 이용할 수 없습니다. 이 사이트는 시각장애인들을 위한 사이트이므로 시각장애인인분들만 도서 듣기를 이용할 수 있습니다.', '2019/09/25');
INSERT INTO QNACOMMENT VALUES (3, 'admin01', '도서 듣기 메뉴 상단의 종료 버튼을 누르면 자동으로 이어듣기 북마크가 생성됩니다.', '2019/09/26');
INSERT INTO QNACOMMENT VALUES (4, 'admin00', '도서 제작에 제작할 도서가 없는것은 신청된 도서가 다 제작되었기 때문입니다. 며칠후 다시 확인부탁드립니다.', '2019/09/27');


--공지 데이터 입력
INSERT INTO NOTICE VALUES (SEQ_NOTICENO.NEXTVAL,'홈페이지 서버 오류에 대한 안내','admin02','안녕하세요, 소리지음 입니다.
먼저 6월 7일 홈페이지 서버 점검 작업 후
계속되는 오류로 인해 불편을 겪으신 봉사자 여러분께 사과의 말씀 드립니다.
이용에 불편을 드려 대단히 죄송합니다.','2019/06/13',321,null,null,null,'N');

INSERT INTO NOTICE VALUES (2,'신규도서 업로드 안내 02','admin02','안녕하세요, 
저희 소리지음에서 운영하는 나누는 책읽기 프로젝트는
자원봉사자 여러분들의 동시 협업을 통해 시각장애인 이용자들이 읽고 싶은 책을 빠른 시간에 제작하여 서비스함으로써
시각장애인의 책가뭄 문제를 해결하고자 기획되었습니다.
따라서 시각장애인 이용자분들의 신청 도서가 도착하는 대로 실시간 업로드하고 있으나,
1일 평균 500여분의 참여로 작업이 이루어지므로 빠른 시간 안에 준비된 도서가 모두 편집 완료되어 검수 대기 상태인 경우가 많습니다.
도서 업로드의 경우 시각장애인 이용자 분들의 요청으로 이루어진다는 점을 감안하여,
사이트에 수시로 접속하시어 신규 도서를 확인한 후 활동에 참여해주시면 감사하겠습니다.
시각장애인의 책가뭄 문제 해결과 독서권 확보를 위한 도서관 사업의 취지와 정책 운영에 협조 부탁드립니다.
감사합니다.','2019/08/05',221,null,null,null,'Y');

INSERT INTO NOTICE VALUES (3,'e북 제작 목록(2019년 1월~8월 기준)공유 드립니다','admin01','안녕하세요.
자원봉사자 선생님들께서 온라인 협업으로 제작하여 주신 
e북 제작 목록(2019년 9월~10월 기준)을 공유드립니다.
제작 도서는 정기적으로 시각장애인 이용자분들의 간담회 및 소리지음 도서선정위원회 개최를 통하여 추천 선정됩니다. 
다시한번 자원봉사자 선생님들의 자원활동에 깊은 감사를 드립니다.','2019/09/24',31,null,null,null,'Y');

INSERT INTO NOTICE VALUES (4,'긴급도서 ''김대균 토익킹''에 대한 안내','admin01','
현재 제작이 급한 도서로 업로드된 ''김대균 토익킹 2019/10''은시각장애인 이용자분이 
직접 신청하신 토익 교재로,다른 도서보다 더욱 꼼꼼한 편집이 필요합니다.
도서의 내용 모두를 빠짐없이 입력해주시기 바라며,
사소한 오타 하나로도 시험 등의 결과에 치명적일 수 있으므로책임감을 가지고 
정확한 오탈자 및 띄어쓰기 수정 부탁드리겠습니다. 
※ 주의사항첨부파일에 적용된 편집 방법을 준수하여 입력해주셔야 페이지 승인이 됩니다.
가이드라인을 확인한 후 봉사에 참여해주시기 바랍니다.','2019/09/25',25,null,null,null,'N');

INSERT INTO NOTICE VALUES (5,'긴급도서 ''이승과 저승을 잇는 다리 한국 신화''에 대한 안내','admin01','현재 제작이 급한 도서로 업로드된 
''이승과 저승을 잇는 다리 한국 신화''는시각장애인 이용자분이 직접 신청하신 책입니다.
다른 도서보다 더욱 꼼꼼한 편집이 필요하므로, 
책임감을 가지고가이드라인을 다시 한번 숙지한 후 작업에 참여해주시기 바랍니다.
특히, 정확한 오탈자 및 띄어쓰기 수정 부탁드리겠습니다.','2019/09/27',50,null,null,null,'N');


--회원탈퇴 데이터 입력
INSERT INTO MEMBER VALUES(
'quituser01',3,'김탈퇴','quit01','01011118888','quituser@gmail.com','M','1978-05-14',DEFAULT,NULL,NULL,'Y');

INSERT INTO QUIT VALUES('quituser01','F','사이트를 이용하지 않습니다.','2019-08-27');

alter table makedbook rename to makebook;
UPDATE BOOK SET BOOKRPDF = '8937473097.pdf'
WHERE BOOKCODE = '8937473097';

COMMIT;