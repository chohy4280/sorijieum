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
   NOTICERFILE   VARCHAR2(1000)      NULL
);

COMMENT ON COLUMN NOTICE.NOTICENO IS '공지사항 번호';

COMMENT ON COLUMN NOTICE.NOTICETITLE IS '공지사항  제목';

COMMENT ON COLUMN NOTICE.NOTICEWRITER IS '공지사항 작성자';

COMMENT ON COLUMN NOTICE.NOTICECONTENT IS '공지사항  내용';

COMMENT ON COLUMN NOTICE.NOTICEDATE IS '공지사항  날짜';

COMMENT ON COLUMN NOTICE.NOTICEVIEWS IS '공지사항  조회수';

COMMENT ON COLUMN NOTICE.NOTICEOFILE IS '공지사항  기존 첨부파일';

COMMENT ON COLUMN NOTICE.NOTICERFILE IS '공지사항 변경 첨부 파일';


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
   QNATOP   VARCHAR2(1)   DEFAULT 'N'   NOT NULL,
   QNAALARM VARCHAR2(1) NULL
);

COMMENT ON COLUMN QNA.QNANO IS 'QNA  번호';

COMMENT ON COLUMN QNA.QNATITLE IS 'QNA  제목';

COMMENT ON COLUMN QNA.QNAWRITER IS 'QNA  작성자';

COMMENT ON COLUMN QNA.QNACONTENT IS 'QNA  내용';

COMMENT ON COLUMN QNA.QNADATE IS 'QNA  날짜';

COMMENT ON COLUMN QNA.QNAVIEWS IS 'QNA  조회수';

COMMENT ON COLUMN QNA.QNASTATUS IS 'QNA  답변여부';

COMMENT ON COLUMN QNA.QNATOP IS 'QNA 상단 고정구분';

COMMENT ON COLUMN QNA.QNAALARM IS 'QNA 답변 알림';

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
   WISHBOOKADMIN VARCHAR2(20)   NULL,
   WISHALARM  VARCHAR2(1) NULL
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

COMMENT ON COLUMN WISHBOOK.WISHBOOKADMIN IS '처리관리자';

COMMENT ON COLUMN WISHBOOK.WISHALARM IS '알림 읽음 표시';

--LIKEBOOK 테이블 생성
DROP TABLE LIKEBOOK CASCADE CONSTRAINT;

CREATE TABLE LIKEBOOK (
   USERID   VARCHAR2(20)      NOT NULL,
   BOOKCODE   VARCHAR2(15)      NOT NULL,
   LIKEDATE DATE  NOT NULL
);

COMMENT ON COLUMN LIKEBOOK.USERID IS '회원아이디';

COMMENT ON COLUMN LIKEBOOK.BOOKCODE IS '도서코드';

COMMENT ON COLUMN LIKEBOOK.LIKEDATE IS '관심등록날짜';


--MAKEBOOK 테이블 생성
DROP TABLE MAKEBOOK CASCADE CONSTRAINT;

CREATE TABLE MAKEBOOK (
   USERID   VARCHAR2(20)      NOT NULL,
   BOOKCODE   VARCHAR2(15)      NOT NULL,
   MAKEDATE   DATE   DEFAULT SYSDATE   NOT NULL
);

COMMENT ON COLUMN MAKEBOOK.USERID IS '회원아이디';

COMMENT ON COLUMN MAKEBOOK.BOOKCODE IS '도서코드';

COMMENT ON COLUMN MAKEBOOK.MAKEDATE IS '제작 참여 날짜';


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
   MAKESTART   DATE    NULL,
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

ALTER TABLE MAKEBOOK ADD CONSTRAINT PK_MAKEBOOK PRIMARY KEY (
   USERID,
   BOOKCODE
);

ALTER TABLE MYBOOK ADD CONSTRAINT PK_MYBOOK PRIMARY KEY (
   USERID,
   BOOKCODE
);

ALTER TABLE ADMINMEMO ADD CONSTRAINT PK_ADMINMEMO PRIMARY KEY (
   MEMONO
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

ALTER TABLE MAKEBOOK ADD CONSTRAINT FK_MEMBER_TO_MAKEBOOK_1 FOREIGN KEY (
   USERID
)
REFERENCES MEMBER (
   USERID
);

ALTER TABLE MAKEBOOK ADD CONSTRAINT FK_BOOK_TO_MAKEBOOK_1 FOREIGN KEY (
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
) ON DELETE CASCADE;

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
'admin00',5,'최민영','admin00','01033303358','my_choe@naver.com','F','1993-06-14',DEFAULT,NULL,NULL,'N');

INSERT INTO MEMBER VALUES(
'admin01',4,'이유진','admin01','01001010101','admin01@gmail.com','F','1993-03-06',DEFAULT,NULL,NULL,'N');

INSERT INTO MEMBER VALUES(
'admin02',4,'김연아','admin02','01002020202','admin02@gmail.com','F','1990-10-17',DEFAULT,NULL,NULL,'N');

INSERT INTO MEMBER VALUES(
'admin03',4,'남자현','admin03','01031311313','admin03@gmail.com','F','1919-03-01',DEFAULT,NULL,NULL,'N');

INSERT INTO MEMBER VALUES(
'admin04',4,'박병선','admin04','01072107210','admin04@gmail.com','F','1923-03-25',DEFAULT,NULL,NULL,'N');

INSERT INTO MEMBER VALUES(
'admin05',4,'임은정','admin05','01014253647','admin05@gmail.com','F','1974-07-14',DEFAULT,NULL,NULL,'N');



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

INSERT INTO MEMBER VALUES(
'user008',3,'손민수','pass008','01075756868','user008@gmail.com','F','1999-12-05',default,null,null,'N');

INSERT INTO MEMBER VALUES(
'user009',2,'오영곤','pass010','01085332222','user009@gmail.com','M','1985-10-03',default,null,null,'N');

INSERT INTO MEMBER VALUES(
'user010',1,'홍설','pass010','01087253647','user010@gmail.com','F','1991-03-19',default,null,null,'N');

INSERT INTO MEMBER VALUES(
'user011',2,'이성경','pass011','01055777887','user011@gmail.com','F','1990-05-18',default,null,null,'N');

INSERT INTO MEMBER VALUES(
'user012',1,'남주혁','pass012','01036488856','user012@gmail.com','F','1981-08-19',default,null,null,'N');

COMMIT;

--관리자 메모 데이터 생성
INSERT INTO ADMINMEMO
VALUES(SEQ_MEMONO.NEXTVAL,'user001','admin00','제한 시간 안에 할당된 도서페이지를 완성 하지 못했음', SYSDATE);

INSERT INTO ADMINMEMO
VALUES(SEQ_MEMONO.NEXTVAL,'user005','admin01','사이트 이용중 도서재생에서 강제종료 된다고 전화로 항의함', SYSDATE);

--도서 데이터 입력
INSERT INTO BOOK VALUES ('8936434268', '아몬드', '손원평', '창비', '2017/03/31', 264, '영화보다 강렬하고 드라마처럼 팽팽한, 완전히 새로운 소설이 나타났다. 감정을 느끼지 못하는 소년의 특별한 성장 이야기로, 첫 장부터 강렬한 사건으로 시작해 다음 페이지가 궁금해지게 만드는 흡입력 강한 작품이다. 또한 타인의 감정에 무감각해진 공감 불능인 이 시대에 큰 울림을 주는 소설로, 작품 속 인물들이 타인과 관계 맺고 슬픔에 공감하며 성장해 나가는 과정을 탁월하게 묘사했다. 영화처럼 펼쳐지는 극적인 사건과 매혹적인 문체로 독자를 단숨에 사로잡을 것이다. 『완득이』, 『위저드 베이커리』를 잇는 제10회 창비청소년문학상 수상작.', '아몬드_손원평.jpg', '8936434268.jpg', '아몬드_손원평.pdf', '8936434268.pdf', '2019/01/15', 'DONE', DEFAULT);

INSERT INTO BOOK VALUES ('8954641636', '쇼코의 미소', '최은영', '문학동네', '2016/07/04', 296, '등단작에 대해 흔히 우리가 걸게 되는 기대―기존 작품과 구별되는 ''낯섦''과 ''전위''에 대한 요구―로부터 물러나, 별다른 기교 없이 담백하게 이야기를 풀어나가고, 그 정통적인 방식을 통해 읽는 이의 마음을 움직였다는 것에 「쇼코의 미소」가 지닌 특별함이 담겨 있다. 그러니까, “고레에다 히로카즈나 이누도 잇신 감독의 어떤 영화들처럼 거의 모든 영역에서 ''진실하다''라는 느낌”(문학평론가 신형철)을 준다는 것, 그로부터 “소설이 주는 감동이란 무엇인가를 새삼 생각해보게 만들었다”(소설가 임철우)라는 것.', '쇼코의 미소_최은영.jpg', '8954641636.jpg', '쇼코의 미소_최은영.pdf', '8954641636.pdf', '2019/03/03', 'MAKE', DEFAULT);

INSERT INTO BOOK VALUES ('8954655971', '여행의 이유', '김영하', '문학동네', '2019/04/17', 216, '『여행의 이유』는 작가 김영하가 처음 여행을 떠났던 순간부터 최근의 여행까지, 오랜 시간 여행을 하면서 느끼고 생각했던 것들을 아홉 개의 이야기로 풀어낸 산문이다. 여행지에서 겪은 경험을 풀어낸 여행담이기보다는, 여행을 중심으로 인간과 글쓰기, 타자와 삶의 의미로 주제가 확장되어가는 사유의 여행에 가깝다. 작품에 담긴 소설가이자 여행자로서 바라본 인간과 세상에 대한 이야기들은 놀랄 만큼 매혹적이다. 누구나 한번쯤은 떠올렸을 법한, 그러나 제대로 정리하지 못한 채 남겨두었던 상념의 자락들을 끄집어내 생기를 불어넣는 김영하 작가 특유의 (인)문학적 사유의 성찬이 담겼다.', '여행의 이유_김영하.jpg', '8954655971.jpg', '여행의 이유_김영하.pdf', '8954655971.pdf', '2019/04/27', 'MAKE', DEFAULT);

INSERT INTO BOOK VALUES ('8937473135', '82년생 김지영', '조남주', '민음사', '2016/10/14', 192, '슬하에 딸을 두고 있는 서른네 살 김지영 씨가 어느 날 갑자기 이상 증세를 보인다. 시댁 식구들이 모여 있는 자리에서 친정 엄마로 빙의해 속말을 뱉어 내고, 남편의 결혼 전 애인으로 빙의해 그를 식겁하게 만들기도 한다. 이를 이상하게 여긴 남편이 김지영 씨의 정신 상담을 주선하고, 지영 씨는 정기적으로 의사를 찾아가 자신의 삶을 이야기한다. 소설은 김지영 씨의 이야기를 들은 담당 의사가 그녀의 인생을 재구성해 기록한 리포트 형식이다. 리포트에 기록된 김지영 씨의 기억은 ''여성''이라는 젠더적 기준으로 선별된 에피소드로 구성된다.', '82년생 김지영_조남주.jpg', '8937473135.jpg', '82년생 김지영_조남주.pdf', '8937473135.pdf', '2019/06/14', DEFAULT, DEFAULT);

INSERT INTO BOOK VALUES ('8982814477', '연금술사', '파울로 코엘료', '문학동네', '2001/12/01', 278, '청년의 가슴속에서, 알 수 없는 기쁨이 솟구쳤다. 자신은 이제 자아의 신화를 위해서, 그리고 파티마를 위해서 죽게 되리라. 낯선 기쁨의 실체는 바로 그것이었다. 표지들이 보여준 것은 끝내 사실이었던 것이다. 눈앞에 칼을 든 적이 있었지만, 그는 죽음을 걱정할 필요가 없었다. 만물의 정기가 그를 기다리고 있었고, 잠시 후면 그 정기의 일부가 될 터였다."이방인이 낯선 땅에서 무엇을 하고 있는가?", "자아의 신화를 찾으러 왔습니다. 당신은 절대 이해하지 못할 어떤 것을 찾아서."',   '연금술사_파울로 코엘료.jpg', '8982814477.jpg', '연금술사_파울로 코엘료.pdf', '8982814477.pdf', '2019/09/27', DEFAULT, DEFAULT);

INSERT INTO BOOK VALUES ('8983925310', '해리포터와 마법사의 돌 1', 'J. K. 롤링', '문학수첩', '2014/12/18', 244, '어둠의 마왕 볼드모트에게 부모를 잃고 홀로 살아남은 아이, 해리는 안전을 위해 마법사가 아닌 사람인 ‘머글’ 페투니아 이모와 버논 이모부 손에 길러지며 불우한 어린 시절을 보낸다. 열한 번째 생일날, 해그리드를 통해 자신이 마법사라는 사실을 알게 된 해리는 호그와트 마법학교에 입학해 헤르미온느 그레인저, 론 위즐리라는 친구들과 함께 영생을 주는 마법사의 돌을 찾는 엄청난 모험을 시작하게 된다.', '해리포터와_마법사의_돌1.jpg', '8983925310.jpg', '해리포터와_마법사의_돌1.pdf', '8983925310.pdf', '2019/07/25','DONE', DEFAULT);

INSERT INTO BOOK VALUES ('1162203625', '파과', '구병모', '위즈덤하우스', '2018/04/16', 344, '노인, 여성, 킬러. 도무지 어울릴 것 같지 않은 세 가지를 조합한 주인공 조각은 65세 여성 킬러다. 한국 소설 가운데 이토록 파격적인 주인공이 또 있을까. 그동안 아가미를 가진 소년([아가미]), 인간을 닮은 로봇([한 스푼의 시간]) 등 환상적인 상상력을 통해 독특한 주인공들을 탄생시킨 구병모 작가는 한국 소설에서 유례를 찾을 수 없는 ‘60대 여성 킬러’라는 독특한 캐릭터를 통해 새로운 여성 서사를 써내려가며 독자들에게 신선한 충격을 던져준다. 사회의 최약자로서 차별받아온 ‘노인’과 ‘여성’이라는 인물이 억압적이고 폭력적인 사회에 ‘킬러’라는 강렬한 이름으로 맞서 싸우는 것이다.
자신을 치료해준 강 박사에게 남다른 감정을 품게 된 조각, 그런 조각을 경멸하는 투우, 킬러들에게서 가족을 지키려는 강 박사. 마침내 투우가 강 박사의 딸을 납치하고, 조각이 투우에게 총을 겨누며 생애 마지막 작업을 실행키로 결심하면서 소설은 절정으로 향한다. 읽는 내내 한 편의 액션 영화를 보는 듯 박진감과 긴장감이 넘치는 이 소설의 말미에서 조각과 투우가 벌이는 총격전은 그야말로 압권이다.
[파과]는 내가 살아남기 위해 누군가를 죽여야만 하는 이 지독하고 잔혹한 현실 속에서 어떤 기대도 소망도 없이, 오늘도 눈을 떴기 때문에, 그저 살아 있기 때문에, 기꺼이 살아내는 모든 것들에게 따뜻한 응원과 위로를 전한다.', '파과.jpg', '1162203625.jpg', '파과.pdf', '1162203625.pdf', '2019/10/7', 'WAIT', DEFAULT);

INSERT INTO BOOK VALUES ('9791130620459', '철학은 어떻게 삶의 무기가 되는가', '야마구치 슈', '다산초당', '2019/01/22', 336, '삶과 비즈니스 현장에서 철학적으로 생각하고 답을 도출하는 법을 알려 주는 실용 철학서. 세계 1위 경영·인사 컨설팅 기업 콘페리헤이그룹의 시니어 파트너인 저자는 대학교에서 철학을 전공하고 대학원에서 미학미술사를 공부한 ‘문사철’ 출신이다. 경영에 관한 정식 교육은 한 번도 받지 않았지만 컨설턴트로서 경영 전반에 걸친 기업 문제를 해결하는 데 어려움을 겪은 적은 없다. 눈앞의 상황을 철학이나 심리학, 경제학 개념에 맞춰 생각하면 언제나 해결의 실마리가 보였기 때문이다.
철학이 현실 세계와 동떨어진 학문이라는 말을 강하게 부정하는 저자는 사람들이 철학을 쓸모없다고 여기는 이유가 철학과 비즈니스를 연결시켜서 생각하는 법을 모르기 때문이라고 진단한다. 오히려 그는 본질을 꿰뚫고 최적의 솔루션을 찾아내는 철학적 사고법이야말로 현대인들에게 가장 필요한 무기라고 말한다. 그가 비즈니스 현장에서 유용하게 사용하는 50가지 철학·사상을 담은 『철학은 어떻게 삶의 무기가 되는가』는 철학의 쓸모를 새롭게 조명하는 세상에서 가장 실용적인 철학 사용 설명서다.', '철학은 어떻게 삶의 무기가 되는가.jpg', '9791130620459.jpg', '철학은 어떻게 삶의 무기가 되는가.pdf', '9791130620459.pdf', '2019/09/12','MAKE', DEFAULT);

INSERT INTO BOOK VALUES ('9788934972464', '사피엔스', '유발 하라리', '김영사', '2015/11/23', 640, '인간의 역사와 미래에 대한 가장 논쟁적인 대서사!
문명의 배를 타고 진화의 바다를 항해한 인류는 이제 어디로 나아갈 것인가! 왜 사피엔스 종만이 지구상에 살아남았나? 인간은 왜 역사상 가장 치명적인 동물이 되었는가? 인간의 유효기간은 언제까지인가? 역사, 사회, 생물, 종교, 등 학문의 경계를 넘나들며 인류 역사의 시간을 종횡무진 써내려간 문명의 항해기가 우리 눈앞에 펼쳐진다!', '사피엔스.jpg', '9788934972464.jpg', '사피엔스.pdf', '9788934972464.pdf', '2019/10/13', 'WAIT', DEFAULT);

INSERT INTO BOOK VALUES ('8982816631', '자기 앞의 생', '에밀 아자르', '문학동네', '2003/05/06', 363, '자신에게 주어진 생을 완전히 만족하며 살아가는 사람이 몇이나 될까? 작가는 실제 나이보다 많은 나이를 살고 있는 열네 살 모모의 눈으로 이해하지 못할 세상을 바라본다. 모모의 눈에 비친 세상은 결코 꿈같이 아름다운 세상이 아니다. 인종 차별받는 아랍인, 감옥에 끌려갔다가 살아 돌아온 유태인, 성전환자 등... 세상 모든 사람들은 스승이라고 했듯이 모모의 눈에도 소설속 모든 이들이 인생의 굳은살을 단단하게 해주는 인생선배들이다. 작은 상처에도 아파하는 독자들이여, 온전히 삶을 보듬길 바란다면 지금 이 책 앞에 서라.', '자기 앞의 생.jpg', '8982816631.jpg', '자기 앞의 생.pdf', '8982816631.pdf', '2019/10/02', 'MAKE', DEFAULT);
                                              
INSERT INTO BOOK VALUES('8983925329','해리포터와 마법사의 돌 2','J.K. 롤링','문학수첩','2014/12/18',244,'어둠의 마왕 볼드모트에게 부모를 잃고 홀로 살아남은 아이,해리는 안전을 위해 마법사가 아닌 사람인 ‘머글’ 페투니아 이모와 버논 이모부 손에 길러지며 불우한 어린 시절을 보낸다. 열한 번째 생일날, 해그리드를 통해 자신이 마법사라는 사실을 알게 된 해리는 호그와트 마법학교에 입학해 헤르미온느 그레인저, 론 위즐리라는 친구들과 함께 영생을 주는 마법사의 돌을 찾는 엄청난 모험을 시작하게 된다.'
,'해리포터와_마법사의_돌2.jpg','8983925329.jpg','해리포터와_마법사의_돌2.pdf','8983925329.pdf','2019/05/11','DONE', DEFAULT);

INSERT INTO BOOK VALUES('8983925337','해리포터와 비밀의 방 1','J.K. 롤링','문학수첩','2014/12/18',264,'더즐리 이모부네 집에서 끔찍한 방학을 보내던 해리에게 도비라는 집요정이 나타나 학교로 돌아가지 말라고 경고한다. 그 말을 무시하고 호그와트로 돌아간 해리는 머글 출신 아이들을 대상으로 한 의문의 습격 사건에 연루된다. 슬리데린의 후계자가 비밀의 방을 열고 괴물을 풀어줬다는 소문이 돌고 해리는 뱀의 말을 할 줄 안다는 이유로 습격사건의 범인으로 모함을 받는다. 헤르미온느마저 습격사건의 피해자가 되고 론의 동생 지니가 납치당해 사라지자 해리와 론은 직접 비밀의 방을 찾아 지니를 구해오기로 한다.',
'해리포터와_비밀의_방1.jpg','8983925337.jpg','해리포터와_비밀의_방1.pdf','8983925337.pdf','2019/05/12','DONE',DEFAULT);

INSERT INTO BOOK VALUES('8983925353','해리포터와 아즈카반의 죄수 1','J.K. 롤링','문학수첩','2014/12/18',328,
'여느 때처럼 괴로운 여름방학을 보내던 해리는 심한 모욕을 받고 화가 난 나머지, 
더즐리 이모부의 여동생에게 무단으로 마법을 건다. 집을 뛰쳐나온 해리는 퇴학당할지도 모른다는 생각에 상심하지만, 
그를 기다리는 건 더 큰 문제다. 
바로 12년 동안 아즈카반이라는 마법사 감옥에 수감되어 있던 악명 높은 살인자, 시리우스 블랙이 탈옥해 해리를 노린다는 소식이다. 
론네 식구들에게 보호받으며 방학을 보낸 해리가 호그와트로 돌아가자, 시리우스 블랙이 침입한 흔적이 학교 곳곳에서 발견된다. 
그가 부모님을 배신하여 죽음에 이르게 했다는 것을 알게 된 해리는 단짝 친구들과 함께 시리우스 블랙을 찾아나선다.',
'해리포터와_아즈카반의_죄수1.jpg','8983925353.jpg','해리포터와_아즈카반의_죄수1.pdf','8983925353.pdf','2019/05/14','DONE',DEFAULT);

INSERT INTO BOOK VALUES('8983925361','해리포터와 아즈카반의 죄수 2','J.K. 롤링','문학수첩','2014/12/18',300,
'여느 때처럼 괴로운 여름방학을 보내던 해리는 심한 모욕을 받고 화가 난 나머지, 
더즐리 이모부의 여동생에게 무단으로 마법을 건다. 집을 뛰쳐나온 해리는 퇴학당할지도 모른다는 생각에 상심하지만, 
그를 기다리는 건 더 큰 문제다. 
바로 12년 동안 아즈카반이라는 마법사 감옥에 수감되어 있던 악명 높은 살인자, 시리우스 블랙이 탈옥해 해리를 노린다는 소식이다. 
론네 식구들에게 보호받으며 방학을 보낸 해리가 호그와트로 돌아가자, 시리우스 블랙이 침입한 흔적이 학교 곳곳에서 발견된다. 
그가 부모님을 배신하여 죽음에 이르게 했다는 것을 알게 된 해리는 단짝 친구들과 함께 시리우스 블랙을 찾아나선다.',
'해리포터와_아즈카반의_죄수2.jpg','8983925361.jpg','해리포터와_아즈카반의_죄수2.pdf','8983925361.pdf','2019/05/15','DONE',DEFAULT);

INSERT INTO BOOK VALUES('9788983925374','해리포터와 불의 잔 1','J.K. 롤링','문학수첩','2014/12/18',328,
'마법사 세계의 최대 게임인 퀴디치 월드컵 중 볼드모트의 상징인 어둠의 표식이 밤하늘에 떠오른다. 
해리를 비롯한 마법사 세계가 다시 불안에 떠는 가운데 호그와트에서는 유럽의 유명한 세 마법학교에서각 한 명씩의 대표를 선발하여 겨루는 트리위저드 대회가 개최된다.
17세 이하는 출전할 수 없을 정도로 위험한 이 대회에 이미 호그와트의 대표로 케드릭 디고리가 뽑혔는데도, 전례 없이 네 번째 대표로 아직 나이 어린 해리가 또 뽑혀 구설수에오른다. 
누가 불의 잔을 조작해 해리가 뽑히게 된 것인지조차 모르는 상황에서 시합은 속행되고,
마지막 시합 날 함께 우승컵을 잡은 케드릭과 해리는 볼드모트가 있는 곳으로 소환된다. 
케드릭은 볼드모트에게 살해당하지만, 해리는 부모 영혼의 도움으로 그 자리를 간신히 탈출하여 다시 호그와트로 돌아온다.',
'해리포터와_불의_잔1.jpg','9788983925374.jpg','해리포터와_불의_잔1.pdf','9788983925374.pdf','2019/05/16','DONE',DEFAULT);

INSERT INTO BOOK VALUES('8983925388','해리포터와 불의 잔 2','J.K. 롤링','문학수첩','2014/12/18',328,
'마법사 세계의 최대 게임인 퀴디치 월드컵 중 볼드모트의 상징인 어둠의 표식이 밤하늘에 떠오른다. 
해리를 비롯한 마법사 세계가 다시 불안에 떠는 가운데 호그와트에서는 유럽의 유명한 세 마법학교에서 각 한 명씩의 대표를 선발하여 겨루는 트리위저드 대회가 개최된다.
17세 이하는 출전할 수 없을 정도로 위험한 이 대회에 이미 호그와트의 대표로 케드릭 디고리가 뽑혔는데도, 
전례 없이 네 번째 대표로 아직 나이 어린 해리가 또 뽑혀 구설수에 오른다. 
누가 불의 잔을 조작해 해리가 뽑히게 된 것인지조차 모르는 상황에서 시합은 속행되고,
마지막 시합 날 함께 우승컵을 잡은 케드릭과 해리는 볼드모트가 있는 곳으로 소환된다. 
케드릭은 볼드모트에게 살해당하지만, 해리는 부모 영혼의 도움으로 그 자리를 간신히 탈출하여 
다시 호그와트로 돌아온다.',
'해리포터와_불의_잔2','8983925388.jpg','해리포터와_불의_잔2.pdf','8983925388.pdf','2019/05/17','DONE',DEFAULT);

INSERT INTO BOOK VALUES('8983925396','해리포터와 불의 잔 3','J.K. 롤링','문학수첩','2014/12/18',312,
'마법사 세계의 최대 게임인 퀴디치 월드컵 중 볼드모트의 상징인 어둠의 표식이 밤하늘에 떠오른다. 
해리를 비롯한 마법사 세계가 다시 불안에 떠는 가운데 호그와트에서는 유럽의 유명한 세 마법학교에서
각 한 명씩의 대표를 선발하여 겨루는 트리위저드 대회가 개최된다.
17세 이하는 출전할 수 없을 정도로 위험한 이 대회에 이미 호그와트의 대표로 케드릭 디고리가 뽑혔는데도,
전례 없이 네 번째 대표로 아직 나이 어린 해리가 또 뽑혀 구설수에 오른다. 
누가 불의 잔을 조작해 해리가 뽑히게 된 것인지조차 모르는 상황에서 시합은 속행되고,
마지막 시합 날 함께 우승컵을 잡은 케드릭과 해리는 볼드모트가 있는 곳으로 소환된다. 
케드릭은 볼드모트에게 살해당하지만, 해리는 부모 영혼의 도움으로 그 자리를 간신히 탈출하여 다시 호그와트로 돌아온다.',
'해리포터와_불의_잔3.jpg','8983925396.jpg','해리포터와_불의_잔3.pdf','8983925396.pdf','2019/05/18','DONE',DEFAULT);

INSERT INTO BOOK VALUES('9788983925404','해리포터와 불의 잔 4','J.K. 롤링','문학수첩','2014/12/18',312,
'마법사 세계의 최대 게임인 퀴디치 월드컵 중 볼드모트의 상징인 어둠의 표식이 밤하늘에 떠오른다. 
해리를 비롯한 마법사 세계가 다시 불안에 떠는 가운데 호그와트에서는 유럽의 유명한 세 마법학교에서
각 한 명씩의 대표를 선발하여 겨루는 트리위저드 대회가 개최된다.
17세 이하는 출전할 수 없을 정도로 위험한 이 대회에 이미 호그와트의 대표로 케드릭 디고리가 뽑혔는데도, 
전례 없이 네 번째 대표로 아직 나이 어린 해리가 또 뽑혀 구설수에 오른다. 
누가 불의 잔을 조작해 해리가 뽑히게 된 것인지조차 모르는 상황에서 시합은 속행되고,
마지막 시합 날 함께 우승컵을 잡은 케드릭과 해리는 볼드모트가 있는 곳으로 소환된다. 
케드릭은 볼드모트에게 살해당하지만, 해리는 부모 영혼의 도움으로 그 자리를 간신히 탈출하여 다시 호그와트로 돌아온다.',
'해리포터와_불의_잔4.jpg','9788983925404.jpg','해리포터와_불의_잔4.pdf','9788983925404.pdf','2019/05/19','DONE',DEFAULT);

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
'해리포터와_불사조_기사단1.jpg','8983925418.jpg','해리포터와_불사조_기사단1.pdf','8983925418.pdf','2019/05/20','DONE',DEFAULT);


INSERT INTO BOOK VALUES('8983925426','해리포터와 불사조 기사단 2','J.K. 롤링','문학수첩','2014/12/18',328,
'사사건건 해리를 괴롭히는 사촌 두들리와 다투다 디멘터의 습격을 받은 
해리는 우여곡절 끝에 친구 론과 헤르미온느가 있는 불사조 기사단의 비밀 본부로 가게 된다. 
볼드모트에 대항하는 비밀 단체였지만, 정작 해리는 나이가 어리다는 이유로 기사단에 가입하지 못한다. 
한편 퍼지 마법부 장관의 심복인 돌로레스 제인 엄브릿지가 호그와트에 부임하여 어둠의 마법 방어술을 전혀 익히지 못하게 하자, 
해리는 론, 헤르미온느와 더불어 ‘덤블도어의 군대’라는 모임을 조직 몰래 마법을 익힌다.
이 일로 해리가 퇴학당할 위기에 처하자 덤블도어는 대신 죄를 뒤집어쓰고 마법부의 감시를 피해 몸을 감춘다. 
한편 해리는 대부 시리우스가 볼드모트에 의해 마법부의 미스터리 부서로 끌려가는 꿈을 꾸고 친구들과 구출 작전을 개시한다.',
'해리포터와_불사조_기사단2.jpg','8983925426.jpg','해리포터와_불사조_기사단2.pdf','8983925426.pdf','2019/05/21','DONE',DEFAULT);

INSERT INTO BOOK VALUES('8983925434','해리포터와 불사조 기사단 3','J.K. 롤링','문학수첩','2014/12/18',324,
'사사건건 해리를 괴롭히는 사촌 두들리와 다투다 디멘터의 습격을 받은 해리는 우여곡절 끝에 친구 론과 헤르미온느가 있는 불사조 기사단의 비밀 본부로 가게 된다. 
볼드모트에 대항하는 비밀 단체였지만, 정작 해리는 나이가 어리다는 이유로 기사단에 가입하지 못한다. 
 한편 퍼지 마법부 장관의 심복인 돌로레스 제인 엄브릿지가 호그와트에 부임하여 어둠의 마법 방어술을 전혀 익히지 못하게 하자, 
해리는 론, 헤르미온느와 더불어 ‘덤블도어의 군대’라는 모임을 조직 몰래 마법을 익힌다.
이 일로 해리가 퇴학당할 위기에 처하자 덤블도어는 대신 죄를 뒤집어쓰고 마법부의 감시를 피해 몸을 감춘다. 
한편 해리는 대부 시리우스가 볼드모트에 의해 마법부의 미스터리 부서로 끌려가는 꿈을 꾸고 친구들과 구출 작전을 개시한다.',
'해리포터와_불사조_기사단3.jpg','8983925434.jpg','해리포터와_불사조_기사단3.pdf','8983925434.pdf','2019/05/22','DONE',DEFAULT);

INSERT INTO BOOK VALUES('8983925442','해리포터와 불사조 기사단 4','J.K. 롤링','문학수첩','2014/12/18',356,
'사사건건 해리를 괴롭히는 사촌 두들리와 다투다 디멘터의 습격을 받은 해리는 우여곡절 끝에 친구 론과 헤르미온느가 있는 불사조 기사단의 비밀 본부로 가게 된다.
볼드모트에 대항하는 비밀 단체였지만, 정작 해리는 나이가 어리다는 이유로 기사단에 가입하지 못한다. 
한편 퍼지 마법부 장관의 심복인 돌로레스 제인 엄브릿지가 호그와트에 부임하여 어둠의 마법 방어술을 전혀 익히지 못하게 하자, 
해리는 론, 헤르미온느와 더불어 ‘덤블도어의 군대’라는 모임을 조직 몰래 마법을 익힌다.
 이 일로 해리가 퇴학당할 위기에 처하자 덤블도어는 대신 죄를 뒤집어쓰고 마법부의 감시를 피해 몸을 감춘다. 
한편 해리는 대부 시리우스가 볼드모트에 의해 마법부의 미스터리 부서로 끌려가는 꿈을 꾸고 친구들과 구출 작전을 개시한다.',
'해리포터와_불사조_기사단4.jpg','8983925442.jpg','해리포터와_불사조_기사단4.pdf','8983925442.pdf','2019/05/23','DONE',DEFAULT);

INSERT INTO BOOK VALUES('8983925469','해리포터와 혼혈왕자 1','J.K. 롤링','문학수첩','2014/12/18',304,
'볼드모트의 영향력이 커지는 가운데 마법사 세계와 머글 세계는 경계 상태에 들어가게 된다. 
덤블도어와 해리의 설득으로 호그와트 교수로 취임한 슬러그혼은 마법약 과목을 가르치고, 
스네이프는 어둠의 마법 방어술을 가르치게 된다. 
슬러그혼의 첫 수업에서 해리는 혼혈 왕자라는 별칭을 가진 소년이 쓰던 책을 받게 되고,
그 책의 도움으로 마법의 약 수업에서 두각을 보인다. 한편 덤블도어는 해리에게
볼드모트와 관련된 과거의 기억들을 보여주며 볼드모트가 자신의 영혼을 7개의 호크룩스에 나누어 놓았다는 사실을 알려준다. 
두 사람은 호크룩스를 찾기 위해 볼드모트가 어린 시절 들렀던 동굴을 찾지만 별 소득을 얻지 못한다. 
지친 몸으로 학교에 돌아온 해리는 잠입한 볼드모트의 추종자들과 맞닥뜨리고, 뼈아픈 상실을 경험하게 된다.',
'해리포터와_혼혈왕자1.jpg','8983925469.jpg','해리포터와_혼혈왕자1.pdf','8983925469.pdf','2019/05/24','DONE',DEFAULT);

INSERT INTO BOOK VALUES('8983925477','해리포터와 혼혈왕자 2','J.K. 롤링','문학수첩','2014/12/18',320,
'볼드모트의 영향력이 커지는 가운데 마법사 세계와 머글 세계는 경계 상태에 들어가게 된다
덤블도어와 해리의 설득으로 호그와트 교수로 취임한 슬러그혼은 마법약 과목을 가르치고, 스네이프는 어둠의 마법 방어술을 가르치게 된다. 
슬러그혼의 첫 수업에서 해리는 혼혈 왕자라는 별칭을 가진 소년이 쓰던 책을 받게 되고, 그 책의 도움으로 마법의 약 수업에서 두각을 보인다. 
한편 덤블도어는 해리에게 볼드모트와 관련된 과거의 기억들을 보여주며 볼드모트가 자신의 영혼을 7개의 호크룩스에 나누어 놓았다는 사실을 알려준다. 
두 사람은 호크룩스를 찾기 위해 볼드모트가 어린 시절 들렀던 동굴을 찾지만 별 소득을 얻지 못한다. 
지친 몸으로 학교에 돌아온 해리는 잠입한 볼드모트의 추종자들과 맞닥뜨리고, 뼈아픈 상실을 경험하게 된다.',
'해리포터와_혼혈왕자2.jpg','8983925477.jpg','해리포터와_혼혈왕자2.pdf','8983925477.pdf','2019/05/25','DONE',DEFAULT);

INSERT INTO BOOK VALUES('8983925485','해리포터와 혼혈왕자 3','J.K. 롤링','문학수첩','2014/12/18',292,
'볼드모트의 영향력이 커지는 가운데 마법사 세계와 머글 세계는 경계 상태에 들어가게 된다. 
덤블도어와 해리의 설득으로 호그와트 교수로 취임한 슬러그혼은 마법약 과목을 가르치고, 
스네이프는 어둠의 마법 방어술을 가르치게 된다. 슬러그혼의 첫 수업에서 해리는 혼혈 왕자라는 별칭을 가진 소년이 쓰던 책을 받게 되고,
그 책의 도움으로 마법의 약 수업에서 두각을 보인다. 한편 덤블도어는 해리에게 볼드모트와 관련된 과거의 기억들을 보여주며 
볼드모트가 자신의 영혼을 7개의 호크룩스에 나누어 놓았다는 사실을 알려준다. 두 사람은 호크룩스를 찾기 위해 
볼드모트가 어린 시절 들렀던 동굴을 찾지만 별 소득을 얻지 못한다. 지친 몸으로 학교에 돌아온 해리는 잠입한 
볼드모트의 추종자들과 맞닥뜨리고, 뼈아픈 상실을 경험하게 된다.',
'해리포터와_혼혈왕자3.jpg','8983925485.jpg','해리포터와_혼혈왕자3.pdf','8983925485.pdf','2019/05/26','DONE',DEFAULT);

INSERT INTO BOOK VALUES('8983925493','해리포터와 혼혈왕자 4','J.K. 롤링','문학수첩','2014/12/18',288,
'볼드모트의 영향력이 커지는 가운데 마법사 세계와 머글 세계는 경계 상태에 들어가게 된다. 
덤블도어와 해리의 설득으로 호그와트 교수로 취임한 슬러그혼은 마법약 과목을 가르치고, 
스네이프는 어둠의 마법 방어술을 가르치게 된다. 슬러그혼의 첫 수업에서 해리는 혼혈 왕자라는 별칭을 가진 소년이 쓰던 책을 받게 되고,
그 책의 도움으로 마법의 약 수업에서 두각을 보인다. 한편 덤블도어는 해리에게 볼드모트와 관련된 과거의 기억들을 보여주며 
볼드모트가 자신의 영혼을 7개의 호크룩스에 나누어 놓았다는 사실을 알려준다. 두 사람은 호크룩스를 찾기 위해 
볼드모트가 어린 시절 들렀던 동굴을 찾지만 별 소득을 얻지 못한다. 지친 몸으로 학교에 돌아온 해리는 잠입한 
볼드모트의 추종자들과 맞닥뜨리고, 뼈아픈 상실을 경험하게 된다.',
'해리포터와_혼혈왕자4.jpg','8983925493.jpg','해리포터와_혼혈왕자4.pdf','8983925493.pdf','2019/05/27','DONE',DEFAULT);

INSERT INTO BOOK VALUES('8983925507','해리포터와 죽음의 성물 1','J.K. 롤링','문학수첩','2014/12/18',360,
'열일곱 살이 되기 직전, 더즐리 가에 걸린 보호마법이 걷히기 전에 친구들의 미끼작전으로 은신처로 몸을 피한 해리는 론과 헤르미온느와 
함께 덤블도어의 뜻을 이어 호크룩스를 찾기로 결심한다.
덤블도어의 유품을 조사하던 중 죽음을 피하는 강력한 마법 물품인 
‘죽음의 성물’이 실제로 존재하며 그중 하나인 딱총나무 지팡이는 볼드모트가, 나머지 하나인 투명 망토는 자신이 갖고 있다는 것을 알게 된다. 
마지막 남은 죽음의 성물이 어디 있는지, 볼드모트와 대적할 방도는 무엇인지도 모른 채, 마지막 남은 호크룩스를 파괴하고 
볼드모트와의 결전을 치르기 위해 해리와 친구들은 죽음을 먹는 자들이 장악하고 있는 호그와트로 잠입한다.',
'해리포터와_죽음의_성물1.jpg','8983925507.jpg','해리포터와_죽음의_성물1.pdf','8983925507.pdf','2019/05/28','DONE',DEFAULT);

INSERT INTO BOOK VALUES('8983925655','해리포터와 죽음의 성물 2','J.K. 롤링','문학수첩','2014/12/18',656,
'열일곱살이 되기 직전, 더즐리 가에 걸린 보호마법이 걷히기 전에 친구들의 미끼작전으로 은신처로 몸을 피한 해리는 론과 헤르미온느와 
함께 덤블도어의 뜻을 이어 호크룩스를 찾기로 결심한다. 
덤블도어의 유품을 조사하던 중 죽음을 피하는 강력한 마법 물품인 
‘죽음의 성물’이 실제로 존재하며 그중 하나인 딱총나무 지팡이는 볼드모트가, 나머지 하나인 투명 망토는 자신이 갖고 있다는 것을 알게 된다.
마지막 남은 죽음의 성물이 어디 있는지, 볼드모트와 대적할 방도는 무엇인지도 모른 채, 마지막 남은 호크룩스를 파괴하고 
볼드모트와의 결전을 치르기 위해 해리와 친구들은 죽음을 먹는 자들이 장악하고 있는 호그와트로 잠입한다.',
'해리포터와_죽음의_성물2jpg','8983925655.jpg','해리포터와_죽음의_성물2.pdf','8983925655.pdf','2019/05/29','DONE',DEFAULT);

INSERT INTO BOOK VALUES('8983925523','해리포터와 죽음의 성물 3','J.K. 롤링','문학수첩','2014/12/18',328,
'열일곱 살이 되기 직전, 더즐리 가에 걸린 보호마법이 걷히기 전에 친구들의 미끼작전으로 은신처로 몸을 피한 해리는 론과 헤르미온느와 
함께 덤블도어의 뜻을 이어 호크룩스를 찾기로 결심한다. 
덤블도어의 유품을 조사하던 중 죽음을 피하는 강력한 마법 물품인 ‘죽음의 성물’이 실제로 존재하며 
그중 하나인 딱총나무 지팡이는 볼드모트가, 나머지 하나인 투명 망토는 자신이 갖고 있다는 것을 알게 된다.
마지막 남은 죽음의 성물이 어디 있는지, 볼드모트와 대적할 방도는 무엇인지도 모른 채, 마지막 남은 호크룩스를 파괴하고 
볼드모트와의 결전을 치르기 위해 해리와 친구들은 죽음을 먹는 자들이 장악하고 있는 호그와트로 잠입한다.',
'해리포터와_죽음의_성물3.jpg','8983925523.jpg','해리포터와_죽음의_성물3.pdf','8983925523.pdf','2019/06/01','DONE',DEFAULT);

INSERT INTO BOOK VALUES('8983925531','해리포터와 죽음의 성물 4','J.K. 롤링','문학수첩','2014/12/18',336,
'열일곱 살이 되기 직전, 더즐리 가에 걸린 보호마법이 걷히기 전에 친구들의 미끼작전으로 은신처로 몸을 피한 해리는 론과 헤르미온느와 
함께 덤블도어의 뜻을 이어 호크룩스를 찾기로 결심한다.
덤블도어의 유품을 조사하던 중 죽음을 피하는 강력한 마법 물품인 ‘죽음의 성물’이 실제로 존재하며 
그중 하나인 딱총나무 지팡이는 볼드모트가, 나머지 하나인 투명 망토는 자신이 갖고 있다는 것을 
알게 된다. 마지막 남은 죽음의 성물이 어디 있는지, 볼드모트와 대적할 방도는 무엇인지도 모른 채, 마지막 남은 호크룩스를 파괴하고 
볼드모트와의 결전을 치르기 위해 해리와 친구들은 죽음을 먹는 자들이 장악하고 있는 호그와트로 잠입한다.',
'해리포터와_죽음의_성물4.jpg','8983925531.jpg','해리포터와_죽음의_성물4.pdf','8983925531.pdf','2019/06/02','DONE',DEFAULT);

INSERT INTO BOOK VALUES('8954616518','희랍어의 시간','한강','문학동네','2011/11/10',194,
'200여 페이지 남짓의 짧은 장편소설, 그러나 이 짧은 소설이 던져주는 무게는 단단하다. 
이 책은 소멸하는 삶 속에서 서로를 단 한순간 마주보는 사람들의 이야기다.
점점 시력을 잃어가는 희랍어 강사와 지독한 침묵을 사이에 두고 수업을 듣는 말을 잃어가는 여자. 
작가는 슬프지만 담담한 시선을 시종일관 유지한 채 조용한 이들의 일상을 따라간다. 
희랍어라는 낯선 언어와 시력과 말을 잃어가는 주인공들, 
어쩌면 다른 세상의 이야기인 듯 하지만 소멸하고 빛을 잃어가는 사람들을 그렸다는 점에서 결국 우리 모두의 자화상이다.',
'희랍어의_시간.jpg','8954616518.jpg','희랍어의_시간.pdf','8954616518.pdf','2019/09/01','DONE',DEFAULT);

INSERT INTO BOOK VALUES('8932034826','내 여자의 열매','한강','문학과지성사','2018/11/09',328,
'첫 소설집 이후 5년 만에 출간한 두번째 소설집.
채식주의자 연작의 씨앗이 된 내 여자의 열매 등을 포함한 단편 여덟 편의 배치를 바꾸고 표현과 문장을 다듬어 18년 만에 새롭게 선보인다.
내 여자의 열매에서 인간은 작은 박새처럼 쉽게 파괴될 수 있는 연약한 존재인 동시에, 
분열되고 찢긴 삶에 숨을 불어 넣어 다시 태어나고자 삶의 투쟁을 벌이기도 한다. 
새로 해설을 맡은 문학평론가 강지희는 한강 소설 속 여성 인물에 주목한다.',
'내_여자의_열매.jpg','8932034826.jpg','희랍어의_시간.pdf','8932034826.pdf','2019/09/02','DONE',DEFAULT);

INSERT INTO BOOK VALUES('8936433598','채식주의자','한강','창비','2007/10/30',248,
'세계 3대 문학상 중 하나인 맨부커 국제상 수상작으로 화제가 되고있는 작품이다. 
이 소설은 맨부커선정위원회로부터 한국의 오늘에 대한 소설, 부끄러움과 욕망, 
타인을 이해하려는 불안정한 시도를 다루고 있다라는 찬사를 받았다. 
국제적 베스트셀러로 화제가 되고 있는 채식주의자.
미약한 존재가 난폭하고 어두운 세상과 어떤 식으로 대결 하는지 그리고 있다. 
약한 존재가 대항하는 법은 아이러니하게도 식물이 되는 것이라는데....
제목은 약해보이지만 책을 읽고 나면, 육식을 먹은 것 같은 강한 메시지가 가슴을 울릴 것이다.',
'채식주의자.jpg','8936433598.jpg','채식주의자.pdf','8936433598.pdf','2019/09/03','DONE',DEFAULT);

INSERT INTO BOOK VALUES('8982811338','검은사슴','한강','문학동네','1998/08/19',440,
'1994년 서울신문 신춘문예를 통해 등단한 이후 줄곧 화제작을 발표하며 문단의 각별한 주목을 받아왔던 한강이
소설집 여수의 사랑을 발표한 직후부터 집필을 시작해 삼 년 만에 완성한 검은사슴. 
이 소설은 서사적 견고함과 염결한 작가정신이 어우러진 탁월한 작품으로, 
의심할 바 없이 90년대 문학이 거둔 가장 뛰어난 성과물 가운데 하나로 기록될 작품이다.',
'검은사슴.jpg','8982811338.jpg','검은사슴.pdf','8982811338.pdf','2019/09/04','DONE', DEFAULT);

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
'그대의_차가운_손.jpg','8932013047.jpg','그대의_차가운_손.pdf','8932013047.pdf','2019/09/05','DONE',DEFAULT);

INSERT INTO BOOK VALUES ('9788950980726', '타인의 시선을 의식해 힘든 나에게', '글배우', '21세기북스', '2019/04/19', 184, '생각이 너무 많아 괴롭거나, 감정 기복이 심하거나, 작은 말에도 상처받는 이유는 우리가 알게 모르게 타인의 시선을 의식하며 살고 있기 때문이다. 수년 간 많은 이들의 고민을 직접 상담해오며 요즘 사람들이 가장 걱정하는 문제에 대해 같이 공감하고 이야기를 나눈 저자는 이들에게 실질적인 도움을 줄 수 있는 방법을 모아 이 책에 담았다.', '타인의 시선을 의식해 힘든 나에게.jpg', '9788950980726.jpg', '타인의 시선을 의식해 힘든 나에게.pdf', '9788950980726.pdf', '2019/10/03', 'MAKE', DEFAULT);

INSERT INTO BOOK VALUES ('9788950981983', '2020 부의 지각변동', '박종훈', '21세기북스(북이십일)', '2019/07/10', 260, 'KBS 보도본부 경제부장 박종훈 기자는 『2020 부의 지각변동』을 통해 곧 도래할 ‘부의 지각변동’을 읽어내는 방법으로 ‘시그널’을 제안한다. 이 책은 2020에 정말 경제 위기가 올 것인지 분석하면서 쏟아지는 수많은 정보 중에서 가짜 시그널과 진짜 시그널을 가려내는 방법을 알려준다. 나아가 경제 이슈 중 가장 중요한 ‘금리, 부채, 버블, 환율, 중국, 인구, 쏠림’이라는 7가지 시그널을 소개하면서 이 시그널에서 어떤 변화에 주목해야 하며, 각각의 변화가 어떤 결과를 낳을지 전문가의 시선으로 날카롭게 예측한다. 마지막으로 머지않아 불어 닥칠 대규모 경제 위기 속에서 어떻게 하면 승자가 될 수 있을지 저자의 노하우를 담은 투자 전략을 알려준다.
경제 위기는 피할 수 없는 우리의 미래다. 이 책은 독자들이 부의 지각변동 속에서 무너지지 않고 기회를 만드는 결정적인 계기가 될 것이다.', '2020 부의 지각변동.jpg', '9788950981983.jpg', '2020 부의 지각변동1.pdf', '9788950981983.pdf', '2019/10/15', 'WAIT', DEFAULT);
INSERT INTO BOOK VALUES ('9791188248674', '90년생이 온다', '임홍택', '웨일북', '2018/11/16', 336, '“이해하기 어렵다면 제대로 관찰하라!”
언어생활부터 소비성향, 가치관까지
세상을 주도하는 90년생을 파헤치다', '90년생이 온다.jpg', '9791188248674.jpg', '90년생이 온다.pdf', '9791188248674.pdf', '2019/10/15', 'MAKE', DEFAULT);
INSERT INTO BOOK VALUES ('9788965134947', '너무 재밌어서 잠 못 드는 지구의 과학', '신규진', '생각의길', '2018/04/20', 224, '이 책에는 신비한 22가지 지구의 과학 이야기가 들어 있습니다. 2012년 교육과학기술부와 한국과학창의재단에서 ‘올해의 과학교사’로 꼽힌 저자 신규진은 스토리텔링으로 과학을 가르치는 현직 과학 교사이자 아이들이 찾아가는 상담교사입니다. 무엇보다 학생들과의 소통을 가장 중요하게 여겨 누구보다 가까이에서 학생들의 목소리를 경청합니다. 그래서 학생들이 흥미로울 만한 소재들로 질문을 던지며 지구과학을 자연스럽게 즐기며 공부할 수 있게 만들어줍니다.
저자는 지진, 날씨, 바다, 산 등 자연에서부터 온천, 나침반, 경위도, 대리석, 공룡 이야기까지 너무 재밌어서 잠 못 드는 22가지 지구 과학 이야기를 소개합니다.', '너무 재밌어서 잠못드는 지구의 과학.jpg', '9788965134947.jpg', '너무 재밌어서 잠못드는 지구의 과학.pdf', '9788965134947.pdf', '2019/10/15', 'WAIT', DEFAULT);
INSERT INTO BOOK VALUES ('9788932919874', '핵을 들고 도망친 101세 노인', '요나스 요나손', '열린책들', '2019/09/25', 528, '베스트셀러 작가 요나스 요나손의 장편소설 『핵을 들고 도망친 101세 노인』이 열린책들에서 출간되었다. 요나손은 데뷔작 『창문 넘어 도망친 100세 노인』으로 인구 천만의 나라 스웨덴에서 120만 부, 전 세계적으로 1천만 부 이상 판매 기록을 세웠는데 이 작품이 바로 그 후속작이다. 지금까지 국내에서 출간된 요나손의 다른 소설들과 마찬가지로 전문 번역가 임호경이 번역을 맡았다.
스웨덴의 시골 마을에서 태어났지만 백 년이 넘는 세월을 살면서 본의 아니게 세계사의 주요 사건에 끼어들게 된 주인공 알란 칼손. 백 살 생일날 양로원 창문을 넘어 도망쳤던 알란이 이번에는 백 한 살 생일날 열기구를 탔다가 조난당하며 새로운 모험을 시작한다. 『핵을 들고 도망친 101세 노인』은 요나손의 통산 네 번째 소설이다.', '핵을 들고 도망친 101세 노인.jpg', '9788932919874.jpg', '핵을 들고 도망친 101세 노인.pdf', '9788932919874.pdf', '2019/10/15', 'MAKE', DEFAULT);
INSERT INTO BOOK VALUES ('9788995563502', '부의 인문학', '브라운스톤(우석)', '오픈마인드', '2019/10/04', 294, '그동안 내 전망이 들어맞은 것은 내게 신기가 있어서가 아니다. 나의 전망이 적중률이 높은 것은 그것이 단지 내 개인의 경험과 생각에서 나온 것이 아니라 거인들의 통찰력을 빌렸기 때문이다. 나의 거인은 역사 속에 살아 있는 경제학 거장들이다.
나는 이 책을 통해서 내가 인문학을 공부하면서 알게 된 거인들의 투자 통찰을 아주 알기 쉽게 알려주려 한다. 이론과 메시지는 노벨 경제학상을 수상한 경제학자들을 중심으로 소개하고 있다. 왜냐하면 경제학 이론은 너무나도 다양하고 심지어는 상반된 이론을 주장하는 경제학자도 많기 때문이다. 노벨 경제학상 수상자들의 이론은 어쨌거나 까다로운 검증을 거친 것이라고 할 수 있고, 다른 것보다 신뢰할 수 있다고 생각하기 때문이다.
이 책에 실려 있는 내용만 잘 이해해도 여러분은 거인의 어깨에 올라서서 세상을 좀 더 잘 전망하고 올바른 판단을 내리게 될 것이다. 또 세상이 어떻게 돌아가는지 더 잘 이해하게 되고 무엇보다 하지 않아도 되는 실패를 피할 수 있을 것이다.
("프롤로그" 중에서)', '부의 인문학.jpg', '9788995563502.jpg', '부의 인문학.pdf', '9788995563502.pdf', '2019/10/15', 'MAKE', DEFAULT);
INSERT INTO BOOK VALUES ('9791135445620', '시작하기엔 너무 늦지 않았을까? ', '벨라 마키', '비잉(로크미디어)', '2019/10/02', 348, '《시작하기엔 너무 늦지 않았을까》는 벨라 마키가 달리기를 통해 우울증, 불안, 공황장애 등 정신 질환을 이겨내고 정신 건강과 자존감을 함께 얻은 그녀의 스토리가 담겨 있다. 그러나 이 책은 그녀의 스토리만으로 끝나지 않는다. 벨라 마키는 달리기를 통해 되찾는 과정 속에서 ‘왜’라는 질문을 던진다. “우리는 왜 정신 건강을 진지하게 생각하지 않을까”와 같은 질문을 비롯하여 “우리가 자주 앓는 정신 질환은 무엇이 있을까.”, “달리기는 정신 건강에 어떤 효과를 줄까.”, “사회, 문화, 개인 등 여러 관점에서 우리를 달리지 못하게 하는 것이 무엇이 있을까.”처럼 우리가 생각하지 못했던 달리기와 정신 건강에 관한 정보를 참고 자료를 통해 자세하게 알려준다.', '시작하기엔 너무 늦지 않았을까1.jpg', '9791135445620.jpg', '시작하기엔 너무 늦지 않았을까1.pdf', '9791135445620.pdf', '2019/10/15', 'MAKE', DEFAULT);
INSERT INTO BOOK VALUES ('9791187119845', '나는 나로 살기로 했다 ', '김수현', '도서출판마음의숲', '2016/11/25', 288, '진짜 "나"로 살기 위한 뜨거운 조언들! 어른이 처음인 당신을 위한 단단한 위로들! "어른이 되어보니 세상은 냉담한 곳이었다." 김수현은 책을 펴내면서 이런 말을 했다. 부조리가 넘쳐났고, 사람들은 불필요할 정도로 서로에게 선을 긋고, 평범한 이들조차 기회가 있으면 차별과 멸시를 즐긴다. 우리는 자본주의 사회에서 철저한 갑과 을이 되어 살아가고 있다. 그것이 우리가 이토록 발버둥 치며 살고 있는 세상이다.', '나는 나로 살기로 했다.jpg', '9791187119845.jpg', '나는 나로 살기로 했다.pdf', '9791187119845.pdf', '2019/10/15', 'MAKE', DEFAULT);
INSERT INTO BOOK VALUES ('9791162540640', '아주 작은 습관의 힘 ', '제임스 클리어', '비즈니스북스', '2019/02/26', 360, '[아주 작은 습관의 힘]은 저자의 생생한 경험과 생물학, 뇌과학, 심리학의 최신 연구 결과를 집약해서 습관 하나로 인생을 변화시킬 수 있는 노하우를 제시한다. 만약 당신이 "새해에 운동을 해야지"라고 결심을 했다면 저자의 관점에서 이 목표는 실패할 수밖에 없다. 왜냐하면 습관을 만들기 위해서는 결심이 분명해야 하고(제1법칙), 매력적이어야 하며(제2법칙), 쉬워야 하고(제3법칙), 만족스러워야 하기(제4법칙) 때문이다. 위의 결심은 여기에 단 한 가지도 해당되지 않는다. 정말 변화할 수 있는 습관을 만들기 위해서 당신의 방법은 완전히 달라져야 한다. 이 책에서는 이 네 가지 법칙을 바탕으로 어떻게 하면 빠르고, 효율적이고, 확실하게 변화할 수 있는지 알려준다. 금연, 다이어트에서부터 비즈니스에서 탁월한 성과를 이뤄내기까지, 저자가 제안하는 방법으로 매일 조금씩 좋은 습관을 만든다면 무엇을 결심하든 원하는 것을 얻을 것이다.', '아주 작은 습관의 힘.jpg', '9791162540640.jpg', '아주 작은 습관의 힘.pdf', '9791162540640.pdf', '2019/10/15', 'MAKE', DEFAULT);


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
INSERT INTO MYBOOK VALUES ('user005', '8936434268', 7, DEFAULT, DEFAULT);
INSERT INTO MYBOOK VALUES ('user005', '8983925310', 8, DEFAULT, DEFAULT);
INSERT INTO MYBOOK VALUES ('user005', '8983925329', 9, DEFAULT, DEFAULT);
INSERT INTO MYBOOK VALUES ('user005', '8983925337', 10, DEFAULT, DEFAULT);
INSERT INTO MYBOOK VALUES ('user005', '8983925353', 11, DEFAULT, DEFAULT);
INSERT INTO MYBOOK VALUES ('user005', '8983925361', 12, DEFAULT, DEFAULT);
INSERT INTO MYBOOK VALUES ('user005', '9788983925374', 13, DEFAULT, DEFAULT);
INSERT INTO MYBOOK VALUES ('user005', '8983925388', 14, DEFAULT, DEFAULT);
INSERT INTO MYBOOK VALUES ('user005', '8983925396', 15, DEFAULT, DEFAULT);

--관심도서 데이터 입력
INSERT INTO LIKEBOOK VALUES ('user003', '9788983925404', SYSDATE);
INSERT INTO LIKEBOOK VALUES ('user003', '8983925418', SYSDATE);
INSERT INTO LIKEBOOK VALUES ('user003', '8983925426', SYSDATE);
INSERT INTO LIKEBOOK VALUES ('user003', '8983925434', SYSDATE);
INSERT INTO LIKEBOOK VALUES ('user003', '8983925442', SYSDATE);
INSERT INTO LIKEBOOK VALUES ('user005', '8983925442', SYSDATE);
INSERT INTO LIKEBOOK VALUES ('user005', '8983925469', SYSDATE);
INSERT INTO LIKEBOOK VALUES ('user005', '8983925353', SYSDATE);
INSERT INTO LIKEBOOK VALUES ('user005', '8983925310', SYSDATE);
INSERT INTO LIKEBOOK VALUES ('user005', '9788983925404', SYSDATE);

--제작도서 데이터 입력
INSERT INTO MAKEBOOK VALUES ('user001', '8954655971', DEFAULT);
INSERT INTO MAKEBOOK VALUES ('user001', '8954641636', DEFAULT);
INSERT INTO MAKEBOOK VALUES ('user001', '8936434268', DEFAULT);
INSERT INTO MAKEBOOK VALUES ('user001', '8983925531', DEFAULT);
INSERT INTO MAKEBOOK VALUES ('user002', '8954655971', DEFAULT);
INSERT INTO MAKEBOOK VALUES ('user002', '8954641636', DEFAULT);
INSERT INTO MAKEBOOK VALUES ('user002', '8936434268', DEFAULT);
INSERT INTO MAKEBOOK VALUES ('user002', '8983925531', DEFAULT);

--도서제작 데이터 입력
INSERT INTO BOOKMAKING VALUES ('8954655971', '2019-04-29', NULL, NULL, NULL, 43);
INSERT INTO BOOKMAKING VALUES ('8954641636', '2019-03-03', NULL, NULL, NULL, 121);
INSERT INTO BOOKMAKING VALUES ('8983925310', '2019-07-26', '2019-08-01', '해리포터와 마법사의 돌 1.txt', '8983925310.txt', 244);
INSERT INTO BOOKMAKING VALUES ('8936434268', '2019-01-15', '2019-01-31', '아몬드_손평원.txt', '8936434268.txt', 264);
INSERT INTO BOOKMAKING VALUES ('8937473135', NULL, NULL, NULL, NULL, DEFAULT);
INSERT INTO BOOKMAKING VALUES ('8982814477', NULL, NULL, NULL, NULL, DEFAULT);
INSERT INTO BOOKMAKING VALUES ('1162203625', NULL, NULL, NULL, NULL, DEFAULT);
INSERT INTO BOOKMAKING VALUES ('9791130620459', '2019-09-14', null, null, null, 20);
INSERT INTO BOOKMAKING VALUES ('9788934972464', NULL, null, null, null, default);
INSERT INTO BOOKMAKING VALUES ('8982816631', '2019-10-03', null, null, null, 84);
INSERT INTO BOOKMAKING VALUES ('9788950980726', '2019-10-03', null, null, null, 15);
INSERT INTO BOOKMAKING VALUES ('9788950981983', NULL, null, null, null, DEFAULT);
INSERT INTO BOOKMAKING VALUES ('9788965134947', NULL, null, null, null, DEFAULT);
INSERT INTO BOOKMAKING VALUES ('8983925329', '19/05/12', '19/05/15', '해리포터와 마법사의 돌 2.txt', '8983925329.txt', 244);
INSERT INTO BOOKMAKING VALUES ('8983925337', '19/05/13', '19/05/16', '해리포터와 비밀의 방 1.txt', '8983925337.txt', 264);
INSERT INTO BOOKMAKING VALUES ('8983925353', '19/05/14', '19/05/17', '해리포터와 아즈카반의 죄수 1.txt', '8983925353.txt', 328);
INSERT INTO BOOKMAKING VALUES ('8983925361', '19/05/16', '19/05/18', '해리포터와 아즈카반의 죄수 2.txt', '8983925361.txt', 300);
INSERT INTO BOOKMAKING VALUES ('9788983925374', '19/05/17', '19/05/19', '해리포터와 불의 잔 1.txt', '9788983925374.txt', 328);
INSERT INTO BOOKMAKING VALUES ('8983925388', '19/05/18', '19/05/21', '해리포터와 불의 잔 2.txt', '8983925388.txt', 328);
INSERT INTO BOOKMAKING VALUES ('8983925396', '19/05/19', '19/05/21', '해리포터와 불의 잔 3.txt', '8983925396.txt', 312);
INSERT INTO BOOKMAKING VALUES ('9788983925404', '19/05/20', '19/05/23', '해리포터와 불의 잔 4.txt', '9788983925404.txt', 312);
INSERT INTO BOOKMAKING VALUES ('8983925418', '19/05/21', '19/05/23', '해리포터와 불사조 기사단 1.txt', '8983925418.txt', 328);
INSERT INTO BOOKMAKING VALUES ('8983925426', '19/05/21', '19/05/23', '해리포터와 불사조 기사단 2.txt', '8983925426.txt', 328);
INSERT INTO BOOKMAKING VALUES ('8983925434', '19/05/22', '19/05/24', '해리포터와 불사조 기사단 3.txt', '8983925434.txt', 324);
INSERT INTO BOOKMAKING VALUES ('8983925442', '19/05/23', '19/05/25', '해리포터와 불사조 기사단 4.txt', '8983925442.txt', 356);
INSERT INTO BOOKMAKING VALUES ('8983925469', '19/05/24', '19/05/27', '해리포터와 혼혈왕자 1.txt', '8983925469.txt', 304);
INSERT INTO BOOKMAKING VALUES ('8983925477', '19/05/25', '19/05/27', '해리포터와 혼혈왕자 2.txt', '8983925477.txt', 320);
INSERT INTO BOOKMAKING VALUES ('8983925485', '19/05/26', '19/05/29', '해리포터와 혼혈왕자 3.txt', '8983925485.txt', 292);
INSERT INTO BOOKMAKING VALUES ('8983925493', '19/05/27', '19/05/29', '해리포터와 혼혈왕자 4.txt', '8983925493.txt', 288);
INSERT INTO BOOKMAKING VALUES ('8983925507', '19/05/28', '19/05/30', '해리포터와 죽음의 성물 1.txt', '8983925507.txt', 360);
INSERT INTO BOOKMAKING VALUES ('8983925655', '19/05/29', '19/05/31', '해리포터와 죽음의 성물 2.txt', '8983925655.txt', 656);
INSERT INTO BOOKMAKING VALUES ('8983925523', '19/06/02', '19/06/04', '해리포터와 죽음의 성물 3.txt', '8983925523.txt', 328);
INSERT INTO BOOKMAKING VALUES ('8983925531', '19/06/03', '19/06/05', '해리포터와 죽음의 성물 4.txt', '8983925531.txt', 336);
INSERT INTO BOOKMAKING VALUES ('8954616518', '19/09/02', '19/09/05', '희랍어의 시간.txt', '8954616518.txt', 194);
INSERT INTO BOOKMAKING VALUES ('8932034826', '19/09/03', '19/09/05', '내 여자의 열매.txt', '8932034826.txt', 328);
INSERT INTO BOOKMAKING VALUES ('8936433598', '19/09/04', '19/09/06', '채식주의자.txt', '8936433598.txt', 248);
INSERT INTO BOOKMAKING VALUES ('8982811338', '19/09/05', '19/09/07', '검은사슴.txt', '8982811338.txt', 440);
INSERT INTO BOOKMAKING VALUES ('8932013047', '19/09/06', '19/09/09', '그대의 차가운 손.txt', '8932013047.txt', 329);

--도서신청 데이터 입력
INSERT INTO WISHBOOK VALUES (SEQ_WISHNO.NEXTVAL, 'user003', '아몬드', '손원평', '창비', '2017/03/31', '2019/01/12', 14, 'DONE', NULL, '2019/01/15', 'admin00', 'A');
INSERT INTO WISHBOOK VALUES (SEQ_WISHNO.NEXTVAL, 'user005', '쇼코의 미소', '최은영', '문학동네', NULL, '2019/02/25', 12, 'DONE', NULL, '2019/03/03', 'admin01', 'A');
INSERT INTO WISHBOOK VALUES (SEQ_WISHNO.NEXTVAL, 'user003', '쇼코의 미소', '최은영', NULL, NULL, '2019/03/02', 8, 'RJCT', '이미 신청된 도서입니다.', '2019/03/03', 'admin00', 'A');
INSERT INTO WISHBOOK VALUES (SEQ_WISHNO.NEXTVAL, 'user005', '소년이 온다', '한강', NULL, NULL, '2019/09/02', 7, DEFAULT, NULL, NULL, NULL, NULL);
INSERT INTO WISHBOOK VALUES (SEQ_WISHNO.NEXTVAL, 'user005', '검사내전', '김웅', NULL, NULL, '2019/09/08', 5, DEFAULT, NULL, NULL, NULL, NULL);
INSERT INTO WISHBOOK VALUES (SEQ_WISHNO.NEXTVAL, 'user009', '여행의 이유', '김영하', NULL, NULL, '2019/09/08', 4, DEFAULT, NULL, NULL, NULL, NULL);
INSERT INTO WISHBOOK VALUES (SEQ_WISHNO.NEXTVAL, 'user011', '해리포터 시리즈', '제이케이롤링', NULL, NULL, '2019/09/09', 9, DEFAULT, NULL, NULL, NULL, NULL);
INSERT INTO WISHBOOK VALUES (SEQ_WISHNO.NEXTVAL, 'user009', '아몬드', '손원평', NULL, NULL, '2019/09/09', 8, DEFAULT, NULL, NULL, NULL, NULL);
INSERT INTO WISHBOOK VALUES (SEQ_WISHNO.NEXTVAL, 'user011', '너무 재밌어서 잠 못 드는 심리학 사전', '스벤야 아이젠브라운', NULL, NULL, '2019/09/10', 3, DEFAULT, NULL, NULL, NULL, NULL);
INSERT INTO WISHBOOK VALUES (SEQ_WISHNO.NEXTVAL, 'user003', '개미', '베르나르 베르베르', NULL, NULL, '2019/09/11', 7, DEFAULT, NULL, NULL, NULL, NULL);

--qna 데이터 입력
INSERT INTO QNA VALUES (SEQ_QNANO.NEXTVAL, '한자 작성은 어떻게 하면되나요', 'user002', '도서 중간중간 나오는 한자는 어떻게 작성하면 되나요?', '2019/09/23', 21, 'Y', 'N', 'A');
INSERT INTO QNA VALUES (SEQ_QNANO.NEXTVAL, '제작한 도서는 어떻게 이용할수 있나요??', 'user002', '제작자는 따로 이용못하는 건가요?', '2019/09/24', 10, 'Y', 'N', NULL);
INSERT INTO QNA VALUES (SEQ_QNANO.NEXTVAL, '도서 이어듣기는 어떻게 하는건가요?', 'user003', '기존에 읽었던 도서를 이어읽고 싶습니다. 어떻게 해야하나요?', '2019/09/25', 8, 'Y', 'N', 'A');
INSERT INTO QNA VALUES (SEQ_QNANO.NEXTVAL, '제작할 도서가 없습니다', 'user001', '도서 제작 페이지에 제작할 도서가 없다면 어떻게 해야되나요?', '2019/09/26', 14, 'Y', 'N', 'A');
INSERT INTO QNA VALUES (SEQ_QNANO.NEXTVAL, '표 작성은 어떻게 하는지 궁금합니다.', 'user001', '도서 내용에 표가 있다면 어떻게 작성하면 되나요?', '2019/09/27', 3, 'N', 'N', 'A');


--qna 답변 데이터 입력
INSERT INTO QNACOMMENT VALUES (1, 'admin02', '네이버 사전에 한자를 그려서 확인할수 있습니다.', '2019/09/24');
INSERT INTO QNACOMMENT VALUES (2, 'admin01', '네, 죄송합니다. 제작자는 도서 듣기를 이용할 수 없습니다. 이 사이트는 시각장애인들을 위한 사이트이므로 시각장애인인분들만 도서 듣기를 이용할 수 있습니다.', '2019/09/25');
INSERT INTO QNACOMMENT VALUES (3, 'admin01', '도서 듣기 메뉴 상단의 종료 버튼을 누르면 자동으로 이어듣기 북마크가 생성됩니다.', '2019/09/26');
INSERT INTO QNACOMMENT VALUES (4, 'admin00', '도서 제작에 제작할 도서가 없는것은 신청된 도서가 다 제작되었기 때문입니다. 며칠후 다시 확인부탁드립니다.', '2019/09/27');


--공지 데이터 입력
INSERT INTO NOTICE VALUES (SEQ_NOTICENO.NEXTVAL,'홈페이지 서버 오류에 대한 안내','admin02','안녕하세요, 소리지음 입니다.
먼저 6월 7일 홈페이지 서버 점검 작업 후
계속되는 오류로 인해 불편을 겪으신 봉사자 여러분께 사과의 말씀 드립니다.
이용에 불편을 드려 대단히 죄송합니다.','2019/06/13',321,null,null);

INSERT INTO NOTICE VALUES (2,'신규도서 업로드 안내 02','admin02','안녕하세요, 
저희 소리지음에서 운영하는 나누는 책읽기 프로젝트는
자원봉사자 여러분들의 동시 협업을 통해 시각장애인 이용자들이 읽고 싶은 책을 빠른 시간에 제작하여 서비스함으로써
시각장애인의 책가뭄 문제를 해결하고자 기획되었습니다.
따라서 시각장애인 이용자분들의 신청 도서가 도착하는 대로 실시간 업로드하고 있으나,
1일 평균 500여분의 참여로 작업이 이루어지므로 빠른 시간 안에 준비된 도서가 모두 편집 완료되어 검수 대기 상태인 경우가 많습니다.
도서 업로드의 경우 시각장애인 이용자 분들의 요청으로 이루어진다는 점을 감안하여,
사이트에 수시로 접속하시어 신규 도서를 확인한 후 활동에 참여해주시면 감사하겠습니다.
시각장애인의 책가뭄 문제 해결과 독서권 확보를 위한 도서관 사업의 취지와 정책 운영에 협조 부탁드립니다.
감사합니다.','2019/08/05',221,null,null);

INSERT INTO NOTICE VALUES (3,'e북 제작 목록(2019년 1월~8월 기준)공유 드립니다','admin01','안녕하세요.
자원봉사자 선생님들께서 온라인 협업으로 제작하여 주신 
e북 제작 목록(2019년 9월~10월 기준)을 공유드립니다.
제작 도서는 정기적으로 시각장애인 이용자분들의 간담회 및 소리지음 도서선정위원회 개최를 통하여 추천 선정됩니다. 
다시한번 자원봉사자 선생님들의 자원활동에 깊은 감사를 드립니다.','2019/09/24',31,null,null);

INSERT INTO NOTICE VALUES (4,'긴급도서 ''김대균 토익킹''에 대한 안내','admin01','
현재 제작이 급한 도서로 업로드된 ''김대균 토익킹 2019/10''은시각장애인 이용자분이 
직접 신청하신 토익 교재로,다른 도서보다 더욱 꼼꼼한 편집이 필요합니다.
도서의 내용 모두를 빠짐없이 입력해주시기 바라며,
사소한 오타 하나로도 시험 등의 결과에 치명적일 수 있으므로책임감을 가지고 
정확한 오탈자 및 띄어쓰기 수정 부탁드리겠습니다. 
※ 주의사항첨부파일에 적용된 편집 방법을 준수하여 입력해주셔야 페이지 승인이 됩니다.
가이드라인을 확인한 후 봉사에 참여해주시기 바랍니다.','2019/09/25',25,null,null);

INSERT INTO NOTICE VALUES (5,'긴급도서 ''이승과 저승을 잇는 다리 한국 신화''에 대한 안내','admin01','현재 제작이 급한 도서로 업로드된 
''이승과 저승을 잇는 다리 한국 신화''는시각장애인 이용자분이 직접 신청하신 책입니다.
다른 도서보다 더욱 꼼꼼한 편집이 필요하므로, 
책임감을 가지고가이드라인을 다시 한번 숙지한 후 작업에 참여해주시기 바랍니다.
특히, 정확한 오탈자 및 띄어쓰기 수정 부탁드리겠습니다.','2019/09/27',50,null,null);


--회원탈퇴 데이터 입력
INSERT INTO MEMBER VALUES(
'quituser01',3,'김하나','quit01','01011118888','quituser1@gmail.com','M','1978-05-14',DEFAULT,NULL,NULL,'Y');

INSERT INTO MEMBER VALUES(
'quituser02',2,'박두리','quit02','01011117777','quituser2@gmail.com','F','1979-08-14',DEFAULT,NULL,NULL,'Y');

INSERT INTO MEMBER VALUES(
'quituser03',1,'유세찌','quit02','01011116666','quituser3@gmail.com','F','1980-11-14',DEFAULT,NULL,NULL,'Y');



INSERT INTO QUIT VALUES('quituser01','F','도서 제작 불량으로 인한 강제탈퇴.','2019-08-27');

INSERT INTO QUIT VALUES('quituser02','G','개인 사유로 인한 탈퇴','2019-08-29');

INSERT INTO QUIT VALUES('quituser03','G','사이트를 이용하지 않습니다.','2019-08-30');

-- 도서제작확인 테이블 생성
DROP TABLE BOOKMAKINGCHECK CASCADE CONSTRAINT;

CREATE TABLE BOOKMAKINGCHECK (
   BOOKCODE   VARCHAR2(15)      NOT NULL,
   BOOKTITLE  VARCHAR2(200)  NULL,
   BOOKMAKESTARTSTATUS VARCHAR2(4) DEFAULT 'N' NOT NULL,
   BOOKMAKETXT   VARCHAR2(4000)      NULL,
   BOOKMAKEPAGE   NUMBER   DEFAULT 0   NOT NULL,
   USERID   VARCHAR2(20)   NULL,
   BOOKCOMPLETEYN VARCHAR2(4) DEFAULT 'N' NOT NULL
);

COMMENT ON COLUMN BOOKMAKINGCHECK.BOOKCODE IS '도서코드';

COMMENT ON COLUMN BOOKMAKINGCHECK.BOOKTITLE IS '도서명';

COMMENT ON COLUMN BOOKMAKINGCHECK.BOOKMAKESTARTSTATUS IS '제작실행여부';

COMMENT ON COLUMN BOOKMAKINGCHECK.BOOKMAKETXT IS '제작된 내용';

COMMENT ON COLUMN BOOKMAKINGCHECK.BOOKMAKEPAGE IS '제작된 쪽수';

COMMENT ON COLUMN BOOKMAKINGCHECK.USERID IS '회원아이디';

COMMENT ON COLUMN BOOKMAKINGCHECK.BOOKCOMPLETEYN IS '제출여부';

ALTER TABLE BOOKMAKINGCHECK ADD CONSTRAINT FK_BOOK_TO_BOOKMAKINGCHECK_1 FOREIGN KEY (
   BOOKCODE
)

REFERENCES BOOK (
   BOOKCODE
);

ALTER TABLE BOOKMAKINGCHECK ADD CONSTRAINT FK_MEMBER_TO_USERID_1 FOREIGN KEY (
   USERID
)

REFERENCES MEMBER (
   USERID
);

ALTER TABLE BOOKMAKINGCHECK ADD CHECK (BOOKMAKESTARTSTATUS IN('N','Y'));

ALTER TABLE BOOKMAKINGCHECK ADD CHECK (BOOKCOMPLETEYN IN('N','Y'));

INSERT INTO BOOKMAKINGCHECK VALUES ('8954641636', NULL, DEFAULT, NULL, 1, NULL, DEFAULT);
INSERT INTO BOOKMAKINGCHECK VALUES ('8954641636', NULL, DEFAULT, NULL, 11, NULL, DEFAULT);
INSERT INTO BOOKMAKINGCHECK VALUES ('8954641636', NULL, DEFAULT, NULL, 21, NULL, DEFAULT);

INSERT INTO BOOKMAKINGCHECK VALUES ('8954655971', NULL, DEFAULT, NULL, 1, NULL, DEFAULT);
INSERT INTO BOOKMAKINGCHECK VALUES ('8954655971', NULL, DEFAULT, NULL, 11, NULL, DEFAULT);
INSERT INTO BOOKMAKINGCHECK VALUES ('8954655971', NULL, DEFAULT, NULL, 21, NULL, DEFAULT);

INSERT INTO BOOKMAKINGCHECK VALUES ('8937473135', NULL, DEFAULT, NULL, 1, NULL, DEFAULT);
INSERT INTO BOOKMAKINGCHECK VALUES ('8937473135', NULL, DEFAULT, NULL, 11, NULL, DEFAULT);
INSERT INTO BOOKMAKINGCHECK VALUES ('8937473135', NULL, DEFAULT, NULL, 21, NULL, DEFAULT);

INSERT INTO BOOKMAKINGCHECK VALUES ('8982814477', NULL, DEFAULT, NULL, 1, NULL, DEFAULT);
INSERT INTO BOOKMAKINGCHECK VALUES ('8982814477', NULL, DEFAULT, NULL, 11, NULL, DEFAULT);
INSERT INTO BOOKMAKINGCHECK VALUES ('8982814477', NULL, DEFAULT, NULL, 21, NULL, DEFAULT);

INSERT INTO BOOKMAKINGCHECK VALUES ('1162203625', NULL, DEFAULT, NULL, 1, NULL, DEFAULT);
INSERT INTO BOOKMAKINGCHECK VALUES ('1162203625', NULL, DEFAULT, NULL, 11, NULL, DEFAULT);
INSERT INTO BOOKMAKINGCHECK VALUES ('1162203625', NULL, DEFAULT, NULL, 21, NULL, DEFAULT);

INSERT INTO BOOKMAKINGCHECK VALUES ('9791130620459', NULL, DEFAULT, NULL, 1, NULL, DEFAULT);
INSERT INTO BOOKMAKINGCHECK VALUES ('9791130620459', NULL, DEFAULT, NULL, 11, NULL, DEFAULT);
INSERT INTO BOOKMAKINGCHECK VALUES ('9791130620459', NULL, DEFAULT, NULL, 21, NULL, DEFAULT);

INSERT INTO BOOKMAKINGCHECK VALUES ('9788934972464', NULL, DEFAULT, NULL, 1, NULL, DEFAULT);
INSERT INTO BOOKMAKINGCHECK VALUES ('9788934972464', NULL, DEFAULT, NULL, 11, NULL, DEFAULT);
INSERT INTO BOOKMAKINGCHECK VALUES ('9788934972464', NULL, DEFAULT, NULL, 21, NULL, DEFAULT);

INSERT INTO BOOKMAKINGCHECK VALUES ('8982816631', NULL, DEFAULT, NULL, 1, NULL, DEFAULT);
INSERT INTO BOOKMAKINGCHECK VALUES ('8982816631', NULL, DEFAULT, NULL, 11, NULL, DEFAULT);
INSERT INTO BOOKMAKINGCHECK VALUES ('8982816631', NULL, DEFAULT, NULL, 21, NULL, DEFAULT);

INSERT INTO BOOKMAKINGCHECK VALUES ('9788950980726', NULL, DEFAULT, NULL, 1, NULL, DEFAULT);
INSERT INTO BOOKMAKINGCHECK VALUES ('9788950980726', NULL, DEFAULT, NULL, 11, NULL, DEFAULT);
INSERT INTO BOOKMAKINGCHECK VALUES ('9788950980726', NULL, DEFAULT, NULL, 21, NULL, DEFAULT);

INSERT INTO BOOKMAKINGCHECK VALUES ('9788950981983', NULL, DEFAULT, NULL, 1, NULL, DEFAULT);
INSERT INTO BOOKMAKINGCHECK VALUES ('9788950981983', NULL, DEFAULT, NULL, 11, NULL, DEFAULT);
INSERT INTO BOOKMAKINGCHECK VALUES ('9788950981983', NULL, DEFAULT, NULL, 21, NULL, DEFAULT);

INSERT INTO BOOKMAKINGCHECK VALUES ('9791188248674', NULL, DEFAULT, NULL, 1, NULL, DEFAULT);
INSERT INTO BOOKMAKINGCHECK VALUES ('9791188248674', NULL, DEFAULT, NULL, 11, NULL, DEFAULT);
INSERT INTO BOOKMAKINGCHECK VALUES ('9791188248674', NULL, DEFAULT, NULL, 21, NULL, DEFAULT);

INSERT INTO BOOKMAKINGCHECK VALUES ('9788965134947', NULL, DEFAULT, NULL, 1, NULL, DEFAULT);
INSERT INTO BOOKMAKINGCHECK VALUES ('9788965134947', NULL, DEFAULT, NULL, 11, NULL, DEFAULT);
INSERT INTO BOOKMAKINGCHECK VALUES ('9788965134947', NULL, DEFAULT, NULL, 21, NULL, DEFAULT);

INSERT INTO BOOKMAKINGCHECK VALUES ('9788932919874', NULL, DEFAULT, NULL, 1, NULL, DEFAULT);
INSERT INTO BOOKMAKINGCHECK VALUES ('9788932919874', NULL, DEFAULT, NULL, 11, NULL, DEFAULT);
INSERT INTO BOOKMAKINGCHECK VALUES ('9788932919874', NULL, DEFAULT, NULL, 21, NULL, DEFAULT);

INSERT INTO BOOKMAKINGCHECK VALUES ('9788995563502', NULL, DEFAULT, NULL, 1, NULL, DEFAULT);
INSERT INTO BOOKMAKINGCHECK VALUES ('9788995563502', NULL, DEFAULT, NULL, 11, NULL, DEFAULT);
INSERT INTO BOOKMAKINGCHECK VALUES ('9788995563502', NULL, DEFAULT, NULL, 21, NULL, DEFAULT);

INSERT INTO BOOKMAKINGCHECK VALUES ('9791135445620', NULL, DEFAULT, NULL, 1, NULL, DEFAULT);
INSERT INTO BOOKMAKINGCHECK VALUES ('9791135445620', NULL, DEFAULT, NULL, 11, NULL, DEFAULT);
INSERT INTO BOOKMAKINGCHECK VALUES ('9791135445620', NULL, DEFAULT, NULL, 21, NULL, DEFAULT);

INSERT INTO BOOKMAKINGCHECK VALUES ('9791187119845', NULL, DEFAULT, NULL, 1, NULL, DEFAULT);
INSERT INTO BOOKMAKINGCHECK VALUES ('9791187119845', NULL, DEFAULT, NULL, 11, NULL, DEFAULT);
INSERT INTO BOOKMAKINGCHECK VALUES ('9791187119845', NULL, DEFAULT, NULL, 21, NULL, DEFAULT);

INSERT INTO BOOKMAKINGCHECK VALUES ('9791162540640', NULL, DEFAULT, NULL, 1, NULL, DEFAULT);
INSERT INTO BOOKMAKINGCHECK VALUES ('9791162540640', NULL, DEFAULT, NULL, 11, NULL, DEFAULT);
INSERT INTO BOOKMAKINGCHECK VALUES ('9791162540640', NULL, DEFAULT, NULL, 21, NULL, DEFAULT);

INSERT INTO BOOKMAKINGCHECK VALUES ('9788983925374', '해리포터와 불의 잔1','Y', 
'제1장 리들 하우스
리들 가족이 그 저택에서 살았던 것은 벌써 수십 년 전의 일이다. 
하지만 리틀 행글턴 마을 사람들은 아직까지도 그 저택을 리들 하우스라고 불렀다. 
기들 하우스는 마을이 한눈에 내려다 보이는 언덕 위에 있었는데, 오랫동안 손을 보지 않아서 유리창이 여기저기 깨져 있었으며 
지붕도 군데군데 기와가 떨어져 나가고 없었다. 깨진 창문들을 가리기 위해 덕지덕지 붙여 놓은 나무 판자는 마치 흉터처럼 보였다. 
제멋대로 뻗은 담쟁이 덩굴은 리들 하우스를 온통 무성하게 뒤덮고 있었다. 
한때는 훌륭한 정원이 딸린, 인근 몇 킬로미터 내에서 가장 웅장하고 장엄한 건물이라는 명성을 자랑했던 
리들 하우스는 이제 아무도 살지않는 황폐하고 버려진 저택이 되었다. 리틀 행글턴 사람들은 한결같이 입을 모아서
그 낡은 저택이 어쩐지 으스스하다고 말했다. 
그것은 50년 전에 리들 하우스에서 벌어진 어떤 이상하고 끔찍한 사건 때문이었다. 
마을 노인들은 아직까지도 얘깃거리가 떨어지면 으레 그 당시에 벌어졌던 비극적인 사건에 대해 떠들기를 좋아했다. 
오랜 세월 동안 수없이 우려낸 그 이야기는 여기저기 새로운 내용이 덧붙여져서 이제는 더 이상 진실이 무엇인지 아무도 알 수가 없게 되었다. 
하지만 누가 이야기하든 처음 시작 부분은 똑같았다. 
50년 전의 어느 여름날 새벽, 하녀가 거실로 들어갔다가 리들 가족 세 사람이 모두 처참하게 죽어 있는 모습을 발견했다. 
리들 하우스가 웅장한 위용을 자랑하던 시절에 벌어진 비극적인 사건이었다. 깜짝 놀란 하녀는 비명을 지르면서 미친 듯이 마을로 달려갔다. 
그리고 잠자던 사람들을 닥치는 대로 깨웠다.', 1, 'user001', 'Y');
INSERT INTO BOOKMAKINGCHECK VALUES ('9788983925374', '해리포터와 불의 잔1','Y', 
'"주인님 식구들이 모두 죽었어요! 두 눈을 부릅뜬 채, 바닥에 쓰러져 있어요! 얼음처럼 차갑게 식었어요! 저녁 식사 때 모습 그대로 말이에요!"
경찰은 그 신고를 받자마자 즉시 출동했다.
리틀 행글턴 마을 전체가 온통 커다란 충격에 휩싸였다.
리들 가족의 참사를 보고 흥분과 호기심을 감출 수 없었던 마을 사람들은 삼삼오오 짝을 지어서 시끌벅적하게 떠들었다. 
하지만 아무도 빈말이나마 리들 가족을 애도하는 시늉조차 하지 않았다. 
리들 가족은 그 마을에서 원성이 자자했기 때문이었다. 리들 부부는 돈이 많은 부자였지만 거만하고 무례한 속물이었으며, 
아들인 톰은 부모보다 한 술 더 뜨는 인물이었다. 그러므로 마을 사람들이 관심을 기울이는 건 오직 살인자가 과연 누구일까 하는 것이었다. 
멀쩡히 살아 있던 건강한 가족 세 명이 하룻밤 사이에 아무런 이유도 없이 떼죽음을 당할 리는 만무하기 때문이었다.
그날 밤에 사형수라는 이름의 선술집은 수많은 손님들로 북적거렸다. 온 마을이 살인자에 대해서 이러쿵 저러쿵 떠들어대고 있었다. 
바로 그때 리들 하우스에서 요리사로 일하던 사람이 나타나자, 일순 분위기가 조용하게 가라앉았다. 
요리사는 선술집에 모여 있던 사람들에게, 조금 전에 프랭크 브라이스가 체포되었다는 소식을 전해 주었다. 
따뜻한 집을 놔두고 선술집으로 몰려든 사람들은 충분히 그 보상을 받은 셈이었다.', 2, 'user001', 'Y');
INSERT INTO BOOKMAKINGCHECK VALUES ('9788983925374', '해리포터와 불의 잔1','Y', 
'"프랭크가!" 그 소식을 듣고 몇 사람이 깜짝 놀라면서 소리쳤다. "그럴 리가 없어!"
프랭크 브라이스는 리들 하우스를 관리하는 정원사였다. 프랭크는 리들 하우스 정원에 있는 아주 초라한 오두막집에서 혼자 살고 있었다. 딱딱하게 마비된 다리를 끌고  전쟁터에서 돌아온 프랭크는 지금까지 줄곧 리들 하우스에서 일하고 있었는데, 성미가 유별나서 사람들이 많이 모이거나 시끄러운 것을 지독하게 싫어했다. 사람들은 좀더 자세한 이야기를 듣기 위해 요리사에게 술을 사 주면서 주위로 몰려들었다.
 "나는 항상 그 사람이 이상하다고 생각했죠." 백포도주를 네잔이나 마신 후에 요리사는 
열심히 귀를 기울이고 있는 마을 사람들을 향해 말했다. "성격이 좀 무뚝뚝했어요. 아마도 
백번은 더 대접했을 거예요. 하지만 프랭크는 절대로 사람들과 어울리려고 하지 않았어요."
"아, 그건..." 바에 있던 한 여자가 입을 열었다. "프랭크는 아주 끔찍한 전쟁을 
겪었어요. 그래서 혼자 조용히 살고 싶었을 거예요. 그렇다고 해서 그게 이런 끔찍한 일을 
저지를 만한 이유는..."', 3, 'user001', 'Y');

INSERT INTO BOOKMAKINGCHECK VALUES ('9788983925374', '해리포터와 불의 잔1','Y', 
'"그 사람 말고는 또 누가 뒷문 열쇠를 갖고 있죠?" 요리사가지지 않고 소리를 질렀다."정원사는 오두막집에 항상 비상 열쇠를 보관하고 있었어요! 그리고 지난 밤에 강제로 문을 
부수고 들어온 흔적은 전혀 없어요! 깨진 창문도 없다구요! 프랭크는 우리가 잠자고 있는 
틈을 타서 그 커다란 저택으로 몰래 들어갔던 거예요."마을 사람들은 서로 의혹에 찬 시선을 주고받았다."나는 항상 그 사람이 험상궂게 보인다고 생각했어. 그런 일을 저지르고도 남을 사람이야."바에 있던 한 남자가 툴툴거렸다."프랭크의 성격이 괴팍하게 변한 건 다 전쟁 탓이라오."선술집 주인이 한마디 거들었다."전에도 제가 한번 말한 적이 있죠. 나라면 절대로 프랭크의 성질을 건드리지 
않겠다고. 안 그래요, 도트?"구석에 앉아 있던 여자가 약간 흥분한 듯이 말했다."그래, 성질이 더럽긴 하지." 도트가 고개를 끄덕이면서 대답했다. "아직도 생각나.프랭크가 어렸을 때……."다음날 아침이 되자, 리틀 행글턴 마을에서는 프랭크 브라이스가 리들 가족을 
살해했다는 사실을 아무도 의심하지 않았다.하지만 이웃 마을 그레이트 행글턴의 어둠침침한 경찰서에서는 프랭크가 완강하게 자신의 결백을 거듭 주장하고 있었다. 그는 리들 가족이 죽던 날 밤에 그 저택 근처에서 본 사람이라고는 새까만 머리카락에 얼굴이 창백한, 그 마을에서 처음 본 십대 소년뿐이라고 
되풀이해서 말했다. 하지만 리틀 행글턴에 살고 있는 마을 사람들 중에서 그런 소년을 본 사람은 아무도 없었으므로, 경찰은 프랭크가 꾸며 낸 이야기가 분명하다고 확신했다. 사태는 프랭크에게 아주 불리하게 돌아가고 있었다. 그런데 리들 가족의 검시 결과는 단번에 모든 상황을 바꿔 놓고 말았다. 정말 이상한 일이었다. 경찰도 이렇게 이상한 보고서를 받아 보기는 처음이었다. 시체를 부검한 검시관 팀은, 리들 가족 중에서 어느 누구도 독살되거나 날카로운 무기에 찔리거나 총에 맞거나 목이 졸렸거나 혹은 그들이 파악할 수 있는 그 어떤 종류의 상해도 입은 흔적이 없다는 결론을 내렸다. 검시관이 작성한 보고서에는, 리들 가족은 죽었다는 점 이외에는 모두들 더할 나위 없이 건강한 상태라고 적혀 있었다. 검시관들도 그 시체를 보고 몹시 당황한 것 같았다. 보고서 끝 부분에는(그래도 그 시체에서 무엇인가 이상한 점을 반드시 찾아내겠다고 굳게 결심한 듯이) 리들 가족은 모두 잔뜩 겁에 질린 표정을 짓고 있었다는 내용이 덧붙여져 있었다.하지만 경찰이 그 보고서를 보고 몹시 실망하면서 투덜거린 것처럼, 도대체 하루 전까지만 해도 건강하던 사람들이 별다른 이유도 없이 그냥 겁에 질려서 죽었다는 말을 
곧이곧대로 들을 사람들이 어디 있겠는가? 그것도 세 사람이 한꺼번에 죽임을 당하다니. 리들 가족이 살해되었다는 증거를 전혀 발견할 수 없었던 경찰은 프랭크를 석방하지 않을 수가 없었다. 얼마 후에 리들 가족은 리틀 행글턴 마을의 교회 묘지에 매장되었다. 리들 가족의 묘는 한참 동안이나 마을 사람들의 관심을 끌었다. 그런데 아직 의혹의 검은 구름이 미처 가시기도 전에, 프랭크 브라이스가 리들 하우스의 정원에 있는 자신의 오두막집으로 돌아갔다.
 "난 프랭크가 리들 가족을 죽인 게 분명하다고 생각해. 경찰이 무슨 말을 하든 나는 믿을 수 없어."', 4, 'user001', 'Y');
 
 INSERT INTO BOOKMAKINGCHECK VALUES ('9788983925374', '해리포터와 불의 잔1','Y', 
'사형수 선술집에서 술을 마시던 도트가 말을 이었다. "만약 프랭크에게 
조금이라도 양심이 있다면 이 마을을 떠나겠지. 프랭크가 그런 짓을 저질렀다는 걸 우리가 
뻔히 다 알고 있는데……별 수 있겠어?"하지만 도트의 예측은 보기 좋게 빗나갔다. 프랭크는 리틀 행글턴을 떠나지 않았다.프랭크는 여전히 리들 하우스에 머물면서 새로 입주한 다른 가족을 위해 정원을 가꾸어 
주었다. 그리고 또 그 다음에 이사온 가족을 위해서……. 왜냐하면 리들 하우스에서 
오랫동안 머물렀던 가족은 아무도 없었기 때문이다. 리들 하우스에 입주한 사람들은 
한결같이 그 저택이 어쩐지 불쾌한 기분이 든다고 말했다. 어쩌면 그 원인이 가운데 하나가 
프랭크였는지도 모른다. 어쨌거나 더 이상 사람이 살지 않게 되자 그 저택은 곧 황폐해지기 
시작했다. 최근에 어떤 사람이 리들 하우스를 구입했다. 그런데 새로운 주인은 그 마을에서 살지도 
않았으며 그 저택을 다른 용도로 사용하지도 않았다. 마을 사람들은 그 사람이 세금상의 
이유로 저택을 보유만 하고 있는 거라고 수군거렸지만, 그 내막을 정확하게 아는 사람은 
아무도 없었다. 그러나 부유한 소유주는 정원 일을 하는 프랭크에게 계속해서 임금을 주었다. 일흔일곱 
번째 생일을 얼마 남겨 놓지 않은 프랭크는 거동이 몹시 불편한 상태였다.', 5, 'user001', 'Y');
 INSERT INTO BOOKMAKINGCHECK VALUES ('9788983925374', '해리포터와 불의 잔1','Y', 
'귀도 거의 들리지 않았으며 부상당한 다리도 점점 더 뻣뻣하게 굳어지고 있었다. 하지만 날씨가 좋을 
때에는 여전히 꽃밭 주위에서 어슬렁거리는 모습이 마을 사람들에 의해 목격되곤 했다.그래도 잡초들은 아랑곳하지 않고 무성하게 자라서 거의 프랭크를 뒤덮을 정도였다.잡초를 뽑는 일이 몹시 힘들긴 했지만, 마들 소년들의 적대적인 태도에 비하면 아무것도 
아니었다. 마을 소년들은 습관적으로 리들 하우스의 창문을 향해 돌을 던지곤 했다. 마을 
소년들은 또 프랭크가 열심히 일해서 말끔하게 가꾸어 놓은 잔디밭으로 자전거를 몰고 
들어오기 일쑤였다. 한두 번은 그냥 낡은 저택 안으로 침입한 적도 있었다.마을 소년들은 프랭크 노인이 헌신적으로 저택과 정원을 가꾸고 있다는 사실을 잘 알고 
있었다. 그들은 다리를 절뚝거리면서 정원으로 나온 프랭크가 지팡이를 마구 휘둘러 가며 쉰 목소리로 고함을 질러대는 모습을 보고는 재미있다는 듯이 웃음을 터뜨렸다. 왜 마을 소년들이 자신을 괴롭히는지 프랭크는 그 이유를 너무나 분명하게 알고 있었다. 그 애들은 프랭크가 리들 가족을 죽인 살인자라고 굳게 믿고 있었다. 그 애들을 키우는 부모나 할아버지, 할머니처럼. 그래서 8월의 어느 날 밤, 문득 잠에서 깨어난 프랭크가 낡은 저택에서 뭔가 아주 이상한 일이 벌어지고 있는 걸 보았을 때에도, 처음에는 그저 마을 소년들이 또다시 짓궂은 장난을 하는 줄만 알았다. 프랭크가 잠에서 깨어난 건 다리의 통증 때문이었다. 점차 나이가 들면서 다리의 통증이 점점 더 심해지고 있었다. 프랭크는 뻐근한 무릎의 통증을 달래기 위해 물병에 더운 물이나 
다시 채울 요량으로 다리를 절뚝거리면서 계단을 내려갔다.', 6, 'user001', 'Y');

INSERT INTO BOOKMAKINGCHECK VALUES ('9788983925374', '해리포터와 불의 잔1','Y', 
'. 부엌으로 들어간 프랭크는 수도꼭지를 틀어서 주전자에 물을 받기 시작했다. 그러다가 문득 고개를 든 프랭크의 눈에, 리들 하우스의 이층 창문에서 희미하게 깜박거리는 불빛이 보였다. 프랭크는 단번에 무슨 일이 벌어지고 있는지 알아차렸다. 마을 소년들이 또다시 저택으로 침입한 것이다. 불빛이 깜박거리는 걸 보면, 이제 막 불을 피우기 시작한 것 
같았다. 리들 가족 살해 사건으로 조사를 받기 위해 경찰서로 가서 심문을 당했던 프랭크는 그 이후로 줄곧 경찰을 불신하고 있었다. 
그렇기 때문에 애시당초 경찰서에 연락할 생각 같은 건 하지 않았다.
게다가 프랭크의 오두막집에는 전화기가 없었다. 
프랭크는 즉시 주전자를 내려놓은 후에 아픈 다리를 이끌고 이층으로 올라가서 주섬주섬 옷을 챙겨 입었다.
잠시 후에 다시 부엌으로 들어간 프랭크는 고리에 걸려 있던 녹슬고 낡은 열쇠를 집어 들었다. 
그리고 벽에 기대 놓았던 지팡이를 짚고 밖으로 나갔다. 리들 하우스의 현관은 억지로 문을 열고 들어간 흔적이 전혀 없었다.
창문도 역시 마찬가지였다. 절뚝거리면서 저택 뒤로 걸어간 프랭크는 담쟁이 덩굴로 거의 가려진 뒷문을 향해 살며시 다가갔다. 
그리고 낡은 열쇠를 꺼내서 자물쇠에 집어 넣고 소리가 나지 않도록 조용히 문을 열었다.프랭크는 동굴처럼 어두운 부엌으로 들어갔다.
무엇인가 썩는 것 같은 고약한 냄새가 코를 찔렀다. 비록 여러 해 동안 저택으로 들어가 본 적이 없었지만,
프랭크는 짙은 어둠 속에서도 현관으로 통하는 문의 위치를 똑똑히 기억할 수 있었다.
프랭크는 손으로 앞을 더듬으면서 문이 있는 곳을 향해 걸어갔다. 
혹시라도 누군가의 발소리나 목소리가 들리지 않을까 싶어서 귀를 쫑긋 세운 채,
프랭크는 현관으로 걸어갔다.현관문 양쪽에 있는 창살이 달린 창문 덕분에 그 주위는 약간 밝았다. 
프랭크는 바닥에 먼지가 잔뜩 쌓여 있는 것을 천만 다행으로 여기면서 조심스럽게 계단을 올라가기 시작했다
두껍게 쌓인 먼지 덕분에 프랭크가 올라가는 발소리나 지팡이 소리가 전혀 들리지 않았던 것이다.
층계참에서 오른쪽으로 막 돌아섰을 때, 프랭크는 단번에 침입자들이 어디에 있는지 알아챘다.
복도 끝에 있는 문이 조금 열려있었던 것이다. 그 틈새로 흘러나온 불빛이 어두운 복도를 희미하게 비추고 있었다.
프랭크는 지팡이를 잡은 손에 힘을 주면서 조용히 그 문을 향해 다가갔다. 프랭크는 조심스럽게 방을 살짝 엿보았다.
벽난로에서 불길이 활활 타오르고 있었다. 대관절 누가 벽난로에 불을 피운 것일까? 갑자기 방에서 어떤 남자의 목소리가 흘러나왔다.
프랭크는 조용히 귀를 기울였다. 그런데 이상하게도 그 목소리는 잔뜩 겁에 질려서 덜덜 떨고 있는 것 같았다.', 7, 'user001', 'Y');
INSERT INTO BOOKMAKINGCHECK VALUES ('9788983925374', '해리포터와 불의 잔1','Y', 
'"시장하지 않으십니까? 아직 병에 조금 더 남아 있습니다, 주인님."
 "그건 나중에 먹도록 하지." 또 다른 목소리가 대답했다. 이번에도 역시 어떤 남자의 
목소리였지만, 아주 날카롭고 찬 바람이 쌩 지나갈 정도로 차가운 느낌이 들었다. 그 
목소리를 듣자, 프랭크는 뒤통수에 드문드문 나 있는 머리카락이 바싹 곤두서는 듯한 
느낌이 들었다. "웜테일, 나를 옮겨라. 벽난로와 좀 더 가까운 곳으로."
프랭크는 좀더 잘 들으려고 오른쪽 귀를 문에 바싹 갖다대었다. 달그락하고 무엇인가 딱딱한 것 위에 병을 내려놓는 소리가 나더니, 곧이어 무거운 의자가 움직이면서 마룻바닥을 긁는 것 같은 둔탁한 소리가 들렸다. 작달막한 체구의 남자가 문쪽으로 등을 돌린 채, 의자를 밀고 있는 모습이 보였다. 검은 망토를 걸치고 있는 그 사람의 뒤통수는 머리카락이 거의 없는 대머리였다. 잠시 후에 그 사람의 모습이 프랭크의 시야에서 사라졌다.
 "내기니는 어디 있나?" 차가운 목소리가 물었다.', 8, 'user001', 'Y');
 INSERT INTO BOOKMAKINGCHECK VALUES ('9788983925374', '해리포터와 불의 잔1','Y', 
'"저도... 저도 잘 모르겠습니다, 주인님. 아마도 주위를 감시하기 위해 나간 것 같습니다."
웜테일이 초조한 목소리로 대답했다."잠자리에 들기 전에 내기니의 독을 뽑아라, 웜테일." 두 번째 목소리가 명령했다.
 "아무래도 나는 밤에 다시 그걸 먹어야 할 것 같다. 여행을 해서 그런지 몹시 피곤하군."
프랭크는 이맛살을 잔뜩 찌푸린 채, 귀를 바싹 갖다대고 한마디도 놓치지 않으려고 애를 
썼다. 무거운 침묵이 흘렀다. 잠시 후에 웜테일이 다시 입을 열었다."주인님, 얼마 동안 이곳에 머무를 예정입니까?""일주일." 차가운 목소리가 대답했다. "어쩌면 좀더 오랫동안 있게 될지도 모르지. 이곳은 
그런대로 편안하군. 그 계획은 아직 시작할 수 없어. 퀴디치 월드컵이 끝나기 전에 행동하는 
건 어리석은 짓이니까……."그 순간 프랭크는 자신의 귀를 의심하면서 마디가 굵은 손가락으로 귓구멍을 후볐다. 퀴디치라는 이상한 말을 듣긴 들었지만, 아마도 귓속을 메우고 있는 귀지 때문에 잘못 
들은 거라고 생각했던 것이다."퀴…… 퀴디치 월드컵이라뇨, 주인님?" 웜테일이 의아스러운 듯한 목소리로 질문을 했다(프랭크는 손가락으로 훨씬 더 세게 귓구멍을 후볐다).
 "용서하세요, 주인님. 하지만... 좀처럼 이해가 되질 않아요. 어째서 월드컵이 끝날 때까지 기다려야 하는 겁니까?"
 "정말 멍청하군, 웜테일. 지금은 세계의 모든 마법사들이 영국으로 몰려들고 있단 말이다.그리고 골치 아픈 마법부 놈들이 전부 나서서 눈에 불을 켜고 일거수 일투족을 감시하고 있어. 조금이라도 이상한 낌새를 보이는 사람이 있으면 즉시 신원을 확인할 거야. 머글들이 아무런 눈치도 채지 못하도록 철통같이 보안에 신경을 쓰고 있을 테니까. 적당한 때를 기다리는 게 좋아."
프랭크는 더 이상 귀를 후비지 않았다. 마법부와 마법사 그리고 머글이라는 이상한 단어들을 자신의 귀로 똑똑히 들었던 것이다. 이런 식의 표현들은 어떤 비밀스러운 것을 의미하는 게 분명했다. 이런 암호를 사용하는 사람들은 딱 두 종류밖에 없었다. 스파이와 범죄자. 프랭크는 지팡이를 더욱 단단히 잡으면서 열심히 귀를 기울였다.
 "주인님의 생각은 여전히 변함이 없습니까?"웜테일이 신중하게 물었다.',9 , 'user001', 'Y');
 INSERT INTO BOOKMAKINGCHECK VALUES ('9788983925374', '해리포터와 불의 잔1','Y', 
'물론이다, 웜테일."
차가운 목소리가 마치 위협이라도 하듯이 날카롭게 대답했다. 잠시 동안 답답한 침묵이 흘렀다. 웜테일은 가늘게 떨리는 목소리로 재빨리 말했다. 마치 용기를 잃어버리기 전에 꼭 말해야겠다는 듯이.
 "해리 포터가 없더라도 가능하지 않겠습니까, 주인님?"또다시 침묵이 이어졌다. 이번에는 침묵이 조금 더 길었다."해리 포터 없이 그 일을 하자는 말이냐?" 두 번째 목소리가 나지막이 말했다.
 "알겠다."
 "주인님, 제가 그 아이를 걱정해서 이런 말을 하는 건 절대로 아닙니다!" 웜테일의 
목소리가 조금씩 높아지고 있었다. "그 아이는 저에게 아무런 의미도 없습니다. 그냥 
아무것도 아니에요! 그저 만약에 우리가 다른 마녀나 마법사를 이용할 수만 있다면, 일이 
훨씬 더 빨리 끝날 수도 있다는 걸 말하고 싶었을 뿐입니다! 어떤 마법사를 이용하더라도 
상관이 없지 않겠습니까? 저는 이틀 안에 적당한 사람을 데리고 돌아올 자신이 있습니다!만약 잠시 동안 주인님 곁을 떠날 수 있도록 허락해 주신다면 말입니다. 제가 변장에 아주 
능숙하다는 걸 아시지 않습니까?""다른 마법사를 이용할 수도 있지. 그건 사실이야……."두 번째 목소리가 신중하게 말했다."주인님, 그렇다면 아주 쉽게 일을 처리할 수 있습니다. 해리 포터에게 손을 뻗치는 건 굉장히 어려운 일입니다. 그 애는 워낙 철저한 보호를 받고 있어서..."웜테일은 이제 한시름 놓았다는 듯이 말했다.
 "그러니까 자네는 자진해서 다른 마법사를 데리고 오겠다는 건가? 나를 돌보는 일이 귀찮고 따분해서 그런 게 아닌가? 웜테일, 혹시 나를 버리고 달아나겠다는 속셈이 아닌가?"
 "주인님! 전... 전 주인님을 떠날 마음이 전혀 없습니다, 전혀!"
 "거짓말하지 마!" 두 번째 목소리가 마치 위협을 하듯이 말했다.
 "웜테일, 난 모든 걸 알 수 있어! 너는 나에게 돌아온 걸 후회하고 있지. 그래, 내 모습을 바라볼 때마다 비위가 상하는 거야, 나를 볼 때마다 네가 움찔움찔 한다는 걸 다 알고 있어. 나를 만질 때마다 
몸서리를 치는 것도 다 느낄 수 있지.',10 , 'user001', 'Y');
 INSERT INTO BOOKMAKINGCHECK VALUES ('9788983925374', '해리포터와 불의 잔1','Y', 
' "아니에요! 저는 헌신적으로 주인님께..."
 "나에게 헌신하는 건 단지 네가 비겁하기 때문이야. 달리 갈 곳이 있었다면 굳이 나를 찾아오지도 않았겠지. 하지만 자네가 없으면 내가 어떻게 살아남을 수 있을까? 몇 시간마다 그걸 먹어야 하는데? 도대체 누가 내기니의 독을 뽑아 줄 수 있단 말인가?"
 "하지만 주인님은 기력을 많이 회복하신 것 같습니다. 힘도 아주 강해졌고."
 "거짓말!" 두 번째 목소리가 단호하게 말했다. "나는 조금도 강해지지 않았어. 단지 
며칠만이라도 혼자 남게 되면……. 너의 서투른 간호로 그나마 회복한 힘마저도 죄다 
잃어버리고 말 거야. 입닥쳐!"무슨 뜻인지 전혀 알 수 없는 말을 혼자 중얼거리고 있던 웜테일이 즉시 입을 다물었다.잠시 동안 프랭크는 딱딱거리면서 타 들어가는 장작 소리 말고는 아무런 소리도 듣지 
못했다. 또다시 두 번째 남자가 저의 쉬쉬거리는 듯한 나지막한 목소리로 속삭였다."그 아이를 이용하는 건 내가 이미 너에게 설명한 것처럼 그럴 만한 이유가 있기 
때문이다. 나는 이 일에 다른 마법사를 이용할 생각이 추호도 없다. 나는 무려 13년 
동안이나 끈기 있게 기다렸어. 몇 달 정도 더 기다린다고 해서 달라질 건 없지. 내 계획대로 
하기만 하면, 그 아이를 감싸고 있는 보호 따위는 무용지물이 될 거야. 오직 네가 약간만 더 
용기를 내면 된다, 웜테일. 볼드모트 경의 엄청난 분노를 보고 싶지 않다면 어서 용기를 
되찾으란 말이다!""주인님, 하지만 이 말은 꼭 하고 싶습니다! 여행을 하는 동안 저는 머리 속에서 그 계획을 
하나씩 하나씩 정리해 보았습니다. 주인님, 버사 조킨스의 실종은 금방 세상에 알려지게 될 
겁니다. 만약 우리가 계속 이 일을 진행한다면, 만약 제가 저주를 내린다면……."웜테일은 거의 정신이 나간 사람처럼 지껄였다."만약이라구?" 두 번째 목소리가 속삭였다. "만약? 만약 웜테일, 네가 충실하게 나의 계획을 따르기만 한다면, 마법부는 그런 일에 신경조차 쓰지 않을 것이다. 조용히 
해치우도록. 공연히 법석 떨지 말고……. 내가 직접 그 일을 처리할 수만 있다면 얼마나 
좋을까? 하지만 지금의 내 상태로는……. 자, 웜테일. 이제 장애물 하나만 더 없애면 해리 
포터를 손에 넣는 건 식은 죽 먹기야. 너 혼자 그 일을 하라는 게 아니다. 때가 되면, 나의 
충실한 부하가 다시 우리와 합류할 것이다!"
"저도 충실한 부하입니다!"웜테일은 약간 토라진 목소리로 말했다."웜테일, 난 똑똑한 두뇌를 가진 사람이 필요해. 절대로 흔들리지 않는 충성심을 갖고 있는 
사람도……. 그런데 자네는 불행하게도 그 어느 쪽으로도 나를 만족시키지 못해.""하지만 주인님을 찾아낸 건 접니다." 
웜테일은 언짢은 기색을 그대로 드러내면서 말했다."주인님을 찾아낸 건 바로 저라구요, 게다가 버사 조킨스를 데리고 온 사람도……."',11, 'user001', 'Y');
 INSERT INTO BOOKMAKINGCHECK VALUES ('9788983925374', '해리포터와 불의 잔1','Y', 
' "그건 사실이지." 두 번째 남자가 재미있다는 투로 말했다. "그런데 웜테일, 네가 어떻게 해서 그런 똑똑한 생각을 할 수 있었는지 모르겠군. 하지만 자네는 그 여자가 얼마나 유용한지 전혀 모르고 있지 않았나? 안 그런가? 자네가 버사를 잡아 왔을 때만 해도…….""저는…… 저는 버사가 유용할지도 모른다고 생각했습니다, 주인님!""거짓말!" 두 번째 목소리가 다시 말했다. 이전보다도 더욱 재미있다는 투였다."하지만……버사의 정보가 매우 요긴했다는 사실만은 부인하지 않겠다. 만약 그것이 
없었다면, 우리는 절대로 계획을 세우지 못했을 테니까……. 그 점에 대한 보상은 충분히 
받게 될 것이다, 윔테일. 나는 자네가 날 위해 가장 중요한 일을 수행하도록 할 생각이다.나를 따르는 수많은 추종자들이 하고 싶어서 안달이 날 지경인 그런 일을 말이다.…….""저…… 정말이세요, 주인님? 혹시 무슨 일인지?"웜테일은 다시 겁에 질린 것 같았다."아, 웜테일. 지금 그 일을 알려 주면 뜻밖의 선물이 될 수 없지 않은가? 자네의 역할은 
제일 마지막에 있을 거야……. 하지만 약속하지, 자네는 버사 조킨스만큼이나 유용했었다는 
영예를 안게 될 거야.""혹시……. 혹시……." 입이 바짝 말랐는지 웜테일의 목소리가 갑자기 탁하게 변했다.
 "저도…… 죽이려는…… 건가요?"
 "웜테일, 웜테일." 차가운 목소리가 달래듯이 말했다.',12, 'user001', 'Y');
 INSERT INTO BOOKMAKINGCHECK VALUES ('9788983925374', '해리포터와 불의 잔1','Y', 
' "내가 왜 자네를 죽이겠나? 내가 버사를 죽인 건 그럴 수밖에 없었기 때문이었어. 심문이 끝난 후에 버사는 더 이상 아무런 쓸모가 없었지. 한마디로 무용지물이었어. 마법부로 돌아간 버사가 휴가를 즐기던 도중에 자네를 만났다고 상부에 보고하면 어떻게 되겠나? 마법부는 당장 벌집을 쑤셔 놓은 것처럼 
발칵 뒤집히겠지. 마법부의 마녀가 지금까지 죽은 줄로만 알고 있었던 마법사들을 길가 여관에서 우연히 만났다고 하면 좋을 게 뭐가 있겠나?"
웜테일은 프랭크가 잘 알아들을 수 없을 정도로 낮게 중얼거렸다. 갑자기 두 번째 남자가 웃음을 터뜨렸다. 그러나 그 웃음 소리는 말투만큼이나 차갑고 불쾌한 인상을 주었다.
 "차라리 버사의 기억을 바꾸는 게 좋았을 거라구? 그녀를 죽이지 않고 말이지? 아니야, 웜테일, 그건 너무 위험해. 기억력 마법은 강력한 마법사의 힘으로 깨어질 수도 있거든. 내가 버사를 심문할 때 이미 입증되었던 것처럼. 버사로부터 빼낸 정보를 사용하지 않는다면, 그녀의 기억력에 대한 모욕이 될 거야, 웜테일."
복도에 서 있던 프랭크는 손에서 지팡이가 미끄러지는 것을 느꼈다. 손바닥에서 땀이 축축하게 배어 나왔기 때문이다. 무서운 음모가 진행되고 있었다. 차가운 목소리의 남자가 어떤 여자를 살해했다! 그리고 그 남자는 양심의 가책도 없이 태연하게 그 사실을 말하고 있다. 아니, 오히려 즐거운 듯이. 그 남자는 몹시 위험한 인물이다. 미치광이다. 그리고 더욱 많은 살인을 계획하고 있다. 해리 포터! 누군지는 모르겠지만 지금 그 아이는 심각한 위험에 처해 있는 것이다.프랭크는 지금부터 자신이 어떻게 행동해야 하는지 잘 알고 있었다. 사악한 음모가 벌어지고 있다는 사실을 즉시 경찰에 알려야만 한다. 몰래 이 저택에서 빠져나간 후에 곧장 마을로 내려가서 공중전화 박스로 달려가야만 한다. 그 때 차가운 목소리가 다시 입을 열었다. 프랭크는 엉거주춤 그 자리에 서서 가만히 귀를 기울였다.
 "한 번만 더 저주를 내리면……호그와트에 있는 나의 충실한 부하가……. 해리 포터는 
이미 내 손아귀에 들어온 거나 마찬가지다, 웜테일. 그건 분명해. 더 이상의 논쟁은 하지 
않겠다. 쉿! 조용히. 내기니의 소리를 들은 것 같은데..."',13, 'user001', 'Y');
 INSERT INTO BOOKMAKINGCHECK VALUES ('9788983925374', '해리포터와 불의 잔1','Y', 
'갑자기 두 번째 남자의 목소리가 야릇하게 변했다. 그 남자는 프랭크가 지금까지 한번도 들어보지 못했던 소리를 내기 시작했다. 프랭크는 아마도 그 남자가 발작을 일으키고 있는게 분명하다고 생각했다. 당장이라도 숨이 넘어갈 듯이 쉿쉿 거리면서 섬뜩한 소리를 내뱉었기 때문이었다.그런데 프랭크의 등 뒤에서 뭔가 움직이는 소리가 들렸다. 어두운 복도를 향해 고개를 돌린 프랭크는 깜짝 놀라서 그만 온몸이 차갑게 얼어붙고 말았다. 어떤 물체가 주르르 미끄러지듯이 다가오고 있었다. 그 물체가 벽난로 불빛이 비치는 곳까지 다가오자, 프랭크는 그것이 길이가 무려 4미터나 되는 거대한 뱀이라는 사실을 깨달았다.거대한 뱀은 두꺼운 먼지가 쌓인 마룻바닥에 구불구불한 자국을 남기면서 점점 더 가까이 다가오고 있었다. 프랭크는 너무나 무서워서 꼼짝도 하지 못하고 그 자리에 가만히 서 있었다. 어떻게 해야 할까? 그 뱀을 피하는 방법은 오직 살인자들이 있는 방으로 들어가는 길뿐이었다. 만약 프랭크가 여전히 그 자리에서 꾸물거린다면 거대한 뱀이 달려들어서 죽이고 말 것이다.그러나 미처 결정을 내리기도 전에 그 뱀은 벌써 프랭크의 발 밑을 기어가고 있었다!그리고 매우 놀라운 일이 벌어졌다! 거대한 뱀이 프랭크를 스치면서 지나갔던 것이다. 마치 기적이라도 일어난 것처럼. 거대한 뱀은 문간 너머에 있는 차가운 목소리의 주인공이 내는 쉿쉿거리는 소리를 따라가고 있었다. 순식간에 다이아몬드 모양의 뱀꼬리가 문틈 사이로 사라졌다.프랭크는 이마에서 식은땀이 흐르는 것을 느낄 수 있었다. 지팡이를 잡고 있는 손이 마치 경련이라도 일어나 것처럼 부들부들 떨렸다. 차가운 목소리의 남자는 잠시도 쉬지 않고 계속 쉿쉿거렸다. 문득 프랭크는 이상한 생각이 들었다. 그것은 도저히 있을 수 없는 일이었다. 저 남자는 지금 뱀과 이야기를 나누고 있어!프랭크는 지금 무슨 일이 벌어지고 있는 것인지 도저히 이해할 수가 없었다. 당장이라도 뜨거운 물병을 가지고 편안한 침대로 돌아가고 싶은 생각이 간절했다. 그런데 문제는 다리가 전혀 움직이려고 하지 않는다는 것이었다. 다리가 저절로 후들후들 떨렸다.
 "조금 전에 내기니가 흥미로운 말을 했다네, 웜테일." 차가운 목소리가 불쑥 입을 열었다.
 "저... 정말인가요, 주인님?" 웜테일이 궁금하다는 듯이 물었다.
 "정말이야, 그래." 차가운 목소리가 말을 이었다. "지금 방문 앞에서 머글 늙은이가 서 
있다는 거야. 우리의 말을 엿들으면서."
갑자기 발자국 소리가 들리더니 거칠게 방문이 열렸다. 프랭크는 미처 몸을 숨길 틈이 
없었다. 땅딸막한 체구의 대머리 남자가 공포와 불안감에 사로잡힌 표정으로 프랭크를 
쳐다보고 있었다. 대머리 남자의 눈은 축축하게 젖어 있었으며 코는 불쾌한 느낌이 들 
정도로 뾰족했다. 나이가 별로 많은 것 같진 않았지만 머리카락은 온통 하얗게 세어 있었다.
"어서 그 사람을 안으로 모시게, 웜테일. 손님이 오셨는데 예의를 차려야지?
"차가운 목소리는 벽난로 앞에 놓여 있는 낡은 안락의자에서 흘러나오고 있었다.',14, 'user001', 'Y');
 INSERT INTO BOOKMAKINGCHECK VALUES ('9788983925374', '해리포터와 불의 잔1','Y', 
'"머글이라고 불렀다." 차가운 목소리가 말을 이었다. "그 말은 당신이 마법사가 아니라는 
뜻이지.""마법사라니? 그게 도대체 무슨 뜻인지 난 모르겠소." 프랭크의 목소리가 점점 더 커지기 
시작했다. "내가 아는 건 그저 오늘 밤에 경찰이 관심을 가질 만한 이야기를 들었다는 
것뿐이오. 당신은 이미 살인을 저질렀고 앞으로 더욱 많은 살인을 저지르기 위한 계획을 
세우고 있소! 하지만 당신은 나를 해칠 수 없을 거요." 프랭크는 문득 생각이 난 것처럼 
이렇게 덧붙었다. "아내는 지금 내가 이곳에 있다는 걸 알고 있소. 만약 내가 돌아가지 
않으면...""당신은 아내가 없어." 차가운 목소리가 아주 조용히 말했다. "게다가 당신이 여기에 있는 
걸 아는 사람은 아무도 없지. 당신은 이곳에 온다는 말을 어느 누구에게도 하지 않았어.볼드모트 경에게 거짓말을 하지 마, 머글. 나는 다 알고 있어……. 언제나 다 알고 있단 
말이야…….""그래?" 프랭크가 거칠게 말했다. "자네가 귀족이란 말이지? 그런데 당신은 아주 무례하군.도통 예의가 없어. 뒤로 돌아서서 남자답게 얼굴이라도 좀 보고 말하는 게 어때?""하지만 난 보통남자가 아니야, 머글." 차가운 목소리는 간신히 들릴 정도로 나지막이 
말했다. 불꽃이 탁탁 소리를 내면서 타오르고 있었다. "나는 인간보다 훨씬, 훨씬 더 위대한 
존재니까. 하지만…… 왜 안 되겠나? 좋아. 
당신의 얼굴을 한번 쳐다보도록 하지…….웜테일, 의자를 좀 돌려라."
부하가 투덜거리면서 불평을 늘어놓았다."지금 뭘 하고 있나, 웜테일?"
작달막한 체구의 남자는 영 마음에 내키지 않는다는 듯이 얼굴을 잔뜩 찌푸렸다.
웜테일은 볼드모트가 앉아 있는 안락의자를 향해 터벅터벅 걸음을 옮겼다. 벽난로 깔개 위에는 거대한 뱀이 똬리를 틀고 있었다. 
웜테일은 서서히 안락의자를 돌리기 시작했다. 
안락의자의 다리가 벽난로 깔개에 걸리자, 뱀이 삼각형 모양의 징그러운 머리를 꼿꼿하게 치켜들었다
.잠시 후에 벽난로를 향해 놓여 있던 안락의자가 방향을 바꾸었다. 프랭크는 안락의자에 앉아 있는 것을 보았다.
프랭크는 자신도 모르는 사이에 지팡이를 마룻바닥으로 떨어뜨리고 말았다. 그리고는 공포에 마구 질려서 마구 비명을 질렀다.
완전히 넋이 빠져버린 프랭크는 안락의자에 앉아 있던 그것이 요술지팡이를 들어올리면서 중얼거리는 소리를 전혀 들을 수가 없었다.
프랭크는 초록색 불빛이 번쩍 빛나는 것을 보았다. 그리고 뭔가 허공을 가르면서 휙 날아오는 소리가 들렸다.
프랭크 브라이스는 썩은 통나무처럼 쓰러지고 말았다. 그리고 몸이 바닥에 채 닿기도 전에 죽었다. 
리들 하우스에서 300여 킬로미터 떨어진 곳, 해리 포터는 소스라치게 놀라면서 벌떡 일어났다.',15, 'user001', 'Y');
INSERT INTO BOOKMAKINGCHECK VALUES ('8936434268', '아몬드','Y', 
'제1장 리들 하우스
리들 가족이 그 저택에서 살았던 것은 벌써 수십 년 전의 일이다. 
하지만 리틀 행글턴 마을 사람들은 아직까지도 그 저택을 리들 하우스라고 불렀다. 
기들 하우스는 마을이 한눈에 내려다 보이는 언덕 위에 있었는데, 오랫동안 손을 보지 않아서 유리창이 여기저기 깨져 있었으며 
지붕도 군데군데 기와가 떨어져 나가고 없었다. 깨진 창문들을 가리기 위해 덕지덕지 붙여 놓은 나무 판자는 마치 흉터처럼 보였다. 
제멋대로 뻗은 담쟁이 덩굴은 리들 하우스를 온통 무성하게 뒤덮고 있었다. 
한때는 훌륭한 정원이 딸린, 인근 몇 킬로미터 내에서 가장 웅장하고 장엄한 건물이라는 명성을 자랑했던 
리들 하우스는 이제 아무도 살지않는 황폐하고 버려진 저택이 되었다. 리틀 행글턴 사람들은 한결같이 입을 모아서
그 낡은 저택이 어쩐지 으스스하다고 말했다. 
그것은 50년 전에 리들 하우스에서 벌어진 어떤 이상하고 끔찍한 사건 때문이었다. 
마을 노인들은 아직까지도 얘깃거리가 떨어지면 으레 그 당시에 벌어졌던 비극적인 사건에 대해 떠들기를 좋아했다. 
오랜 세월 동안 수없이 우려낸 그 이야기는 여기저기 새로운 내용이 덧붙여져서 이제는 더 이상 진실이 무엇인지 아무도 알 수가 없게 되었다. 
하지만 누가 이야기하든 처음 시작 부분은 똑같았다. 
50년 전의 어느 여름날 새벽, 하녀가 거실로 들어갔다가 리들 가족 세 사람이 모두 처참하게 죽어 있는 모습을 발견했다. 
리들 하우스가 웅장한 위용을 자랑하던 시절에 벌어진 비극적인 사건이었다. 깜짝 놀란 하녀는 비명을 지르면서 미친 듯이 마을로 달려갔다. 
그리고 잠자던 사람들을 닥치는 대로 깨웠다.', 1, 'user001', 'Y');
INSERT INTO BOOKMAKINGCHECK VALUES ('8936434268', '아몬드','Y', 
'"주인님 식구들이 모두 죽었어요! 두 눈을 부릅뜬 채, 바닥에 쓰러져 있어요! 얼음처럼 차갑게 식었어요! 저녁 식사 때 모습 그대로 말이에요!"
경찰은 그 신고를 받자마자 즉시 출동했다.
리틀 행글턴 마을 전체가 온통 커다란 충격에 휩싸였다.
리들 가족의 참사를 보고 흥분과 호기심을 감출 수 없었던 마을 사람들은 삼삼오오 짝을 지어서 시끌벅적하게 떠들었다. 
하지만 아무도 빈말이나마 리들 가족을 애도하는 시늉조차 하지 않았다. 
리들 가족은 그 마을에서 원성이 자자했기 때문이었다. 리들 부부는 돈이 많은 부자였지만 거만하고 무례한 속물이었으며, 
아들인 톰은 부모보다 한 술 더 뜨는 인물이었다. 그러므로 마을 사람들이 관심을 기울이는 건 오직 살인자가 과연 누구일까 하는 것이었다. 
멀쩡히 살아 있던 건강한 가족 세 명이 하룻밤 사이에 아무런 이유도 없이 떼죽음을 당할 리는 만무하기 때문이었다.
그날 밤에 사형수라는 이름의 선술집은 수많은 손님들로 북적거렸다. 온 마을이 살인자에 대해서 이러쿵 저러쿵 떠들어대고 있었다. 
바로 그때 리들 하우스에서 요리사로 일하던 사람이 나타나자, 일순 분위기가 조용하게 가라앉았다. 
요리사는 선술집에 모여 있던 사람들에게, 조금 전에 프랭크 브라이스가 체포되었다는 소식을 전해 주었다. 
따뜻한 집을 놔두고 선술집으로 몰려든 사람들은 충분히 그 보상을 받은 셈이었다.', 3, 'user001', 'Y');
INSERT INTO BOOKMAKINGCHECK VALUES ('8936434268', '아몬드','Y', 
'"프랭크가!" 그 소식을 듣고 몇 사람이 깜짝 놀라면서 소리쳤다. "그럴 리가 없어!"
프랭크 브라이스는 리들 하우스를 관리하는 정원사였다. 프랭크는 리들 하우스 정원에 있는 아주 초라한 오두막집에서 혼자 살고 있었다. 딱딱하게 마비된 다리를 끌고  전쟁터에서 돌아온 프랭크는 지금까지 줄곧 리들 하우스에서 일하고 있었는데, 성미가 유별나서 사람들이 많이 모이거나 시끄러운 것을 지독하게 싫어했다. 사람들은 좀더 자세한 이야기를 듣기 위해 요리사에게 술을 사 주면서 주위로 몰려들었다.
 "나는 항상 그 사람이 이상하다고 생각했죠." 백포도주를 네잔이나 마신 후에 요리사는 
열심히 귀를 기울이고 있는 마을 사람들을 향해 말했다. "성격이 좀 무뚝뚝했어요. 아마도 
백번은 더 대접했을 거예요. 하지만 프랭크는 절대로 사람들과 어울리려고 하지 않았어요."
"아, 그건..." 바에 있던 한 여자가 입을 열었다. "프랭크는 아주 끔찍한 전쟁을 
겪었어요. 그래서 혼자 조용히 살고 싶었을 거예요. 그렇다고 해서 그게 이런 끔찍한 일을 
저지를 만한 이유는..."', 4, 'user001', 'Y');

INSERT INTO BOOKMAKINGCHECK VALUES ('8936434268', '아몬드','Y', 
'"그 사람 말고는 또 누가 뒷문 열쇠를 갖고 있죠?" 요리사가지지 않고 소리를 질렀다."정원사는 오두막집에 항상 비상 열쇠를 보관하고 있었어요! 그리고 지난 밤에 강제로 문을 
부수고 들어온 흔적은 전혀 없어요! 깨진 창문도 없다구요! 프랭크는 우리가 잠자고 있는 
틈을 타서 그 커다란 저택으로 몰래 들어갔던 거예요."마을 사람들은 서로 의혹에 찬 시선을 주고받았다."나는 항상 그 사람이 험상궂게 보인다고 생각했어. 그런 일을 저지르고도 남을 사람이야."바에 있던 한 남자가 툴툴거렸다."프랭크의 성격이 괴팍하게 변한 건 다 전쟁 탓이라오."선술집 주인이 한마디 거들었다."전에도 제가 한번 말한 적이 있죠. 나라면 절대로 프랭크의 성질을 건드리지 
않겠다고. 안 그래요, 도트?"구석에 앉아 있던 여자가 약간 흥분한 듯이 말했다."그래, 성질이 더럽긴 하지." 도트가 고개를 끄덕이면서 대답했다. "아직도 생각나.프랭크가 어렸을 때……."다음날 아침이 되자, 리틀 행글턴 마을에서는 프랭크 브라이스가 리들 가족을 
살해했다는 사실을 아무도 의심하지 않았다.하지만 이웃 마을 그레이트 행글턴의 어둠침침한 경찰서에서는 프랭크가 완강하게 자신의 결백을 거듭 주장하고 있었다. 그는 리들 가족이 죽던 날 밤에 그 저택 근처에서 본 사람이라고는 새까만 머리카락에 얼굴이 창백한, 그 마을에서 처음 본 십대 소년뿐이라고 
되풀이해서 말했다. 하지만 리틀 행글턴에 살고 있는 마을 사람들 중에서 그런 소년을 본 사람은 아무도 없었으므로, 경찰은 프랭크가 꾸며 낸 이야기가 분명하다고 확신했다. 사태는 프랭크에게 아주 불리하게 돌아가고 있었다. 그런데 리들 가족의 검시 결과는 단번에 모든 상황을 바꿔 놓고 말았다. 정말 이상한 일이었다. 경찰도 이렇게 이상한 보고서를 받아 보기는 처음이었다. 시체를 부검한 검시관 팀은, 리들 가족 중에서 어느 누구도 독살되거나 날카로운 무기에 찔리거나 총에 맞거나 목이 졸렸거나 혹은 그들이 파악할 수 있는 그 어떤 종류의 상해도 입은 흔적이 없다는 결론을 내렸다. 검시관이 작성한 보고서에는, 리들 가족은 죽었다는 점 이외에는 모두들 더할 나위 없이 건강한 상태라고 적혀 있었다. 검시관들도 그 시체를 보고 몹시 당황한 것 같았다. 보고서 끝 부분에는(그래도 그 시체에서 무엇인가 이상한 점을 반드시 찾아내겠다고 굳게 결심한 듯이) 리들 가족은 모두 잔뜩 겁에 질린 표정을 짓고 있었다는 내용이 덧붙여져 있었다.하지만 경찰이 그 보고서를 보고 몹시 실망하면서 투덜거린 것처럼, 도대체 하루 전까지만 해도 건강하던 사람들이 별다른 이유도 없이 그냥 겁에 질려서 죽었다는 말을 
곧이곧대로 들을 사람들이 어디 있겠는가? 그것도 세 사람이 한꺼번에 죽임을 당하다니. 리들 가족이 살해되었다는 증거를 전혀 발견할 수 없었던 경찰은 프랭크를 석방하지 않을 수가 없었다. 얼마 후에 리들 가족은 리틀 행글턴 마을의 교회 묘지에 매장되었다. 리들 가족의 묘는 한참 동안이나 마을 사람들의 관심을 끌었다. 그런데 아직 의혹의 검은 구름이 미처 가시기도 전에, 프랭크 브라이스가 리들 하우스의 정원에 있는 자신의 오두막집으로 돌아갔다.
 "난 프랭크가 리들 가족을 죽인 게 분명하다고 생각해. 경찰이 무슨 말을 하든 나는 믿을 수 없어."', 5, 'user001', 'Y');
 
 INSERT INTO BOOKMAKINGCHECK VALUES ('8936434268', '아몬드','Y', 
'사형수 선술집에서 술을 마시던 도트가 말을 이었다. "만약 프랭크에게 
조금이라도 양심이 있다면 이 마을을 떠나겠지. 프랭크가 그런 짓을 저질렀다는 걸 우리가 
뻔히 다 알고 있는데……별 수 있겠어?"하지만 도트의 예측은 보기 좋게 빗나갔다. 프랭크는 리틀 행글턴을 떠나지 않았다.프랭크는 여전히 리들 하우스에 머물면서 새로 입주한 다른 가족을 위해 정원을 가꾸어 
주었다. 그리고 또 그 다음에 이사온 가족을 위해서……. 왜냐하면 리들 하우스에서 
오랫동안 머물렀던 가족은 아무도 없었기 때문이다. 리들 하우스에 입주한 사람들은 
한결같이 그 저택이 어쩐지 불쾌한 기분이 든다고 말했다. 어쩌면 그 원인이 가운데 하나가 
프랭크였는지도 모른다. 어쨌거나 더 이상 사람이 살지 않게 되자 그 저택은 곧 황폐해지기 
시작했다. 최근에 어떤 사람이 리들 하우스를 구입했다. 그런데 새로운 주인은 그 마을에서 살지도 
않았으며 그 저택을 다른 용도로 사용하지도 않았다. 마을 사람들은 그 사람이 세금상의 
이유로 저택을 보유만 하고 있는 거라고 수군거렸지만, 그 내막을 정확하게 아는 사람은 
아무도 없었다. 그러나 부유한 소유주는 정원 일을 하는 프랭크에게 계속해서 임금을 주었다. 일흔일곱 
번째 생일을 얼마 남겨 놓지 않은 프랭크는 거동이 몹시 불편한 상태였다.', 6, 'user001', 'Y');
 INSERT INTO BOOKMAKINGCHECK VALUES ('8936434268', '아몬드','Y', 
'귀도 거의 들리지 않았으며 부상당한 다리도 점점 더 뻣뻣하게 굳어지고 있었다. 하지만 날씨가 좋을 
때에는 여전히 꽃밭 주위에서 어슬렁거리는 모습이 마을 사람들에 의해 목격되곤 했다.그래도 잡초들은 아랑곳하지 않고 무성하게 자라서 거의 프랭크를 뒤덮을 정도였다.잡초를 뽑는 일이 몹시 힘들긴 했지만, 마들 소년들의 적대적인 태도에 비하면 아무것도 
아니었다. 마을 소년들은 습관적으로 리들 하우스의 창문을 향해 돌을 던지곤 했다. 마을 
소년들은 또 프랭크가 열심히 일해서 말끔하게 가꾸어 놓은 잔디밭으로 자전거를 몰고 
들어오기 일쑤였다. 한두 번은 그냥 낡은 저택 안으로 침입한 적도 있었다.마을 소년들은 프랭크 노인이 헌신적으로 저택과 정원을 가꾸고 있다는 사실을 잘 알고 
있었다. 그들은 다리를 절뚝거리면서 정원으로 나온 프랭크가 지팡이를 마구 휘둘러 가며 쉰 목소리로 고함을 질러대는 모습을 보고는 재미있다는 듯이 웃음을 터뜨렸다. 왜 마을 소년들이 자신을 괴롭히는지 프랭크는 그 이유를 너무나 분명하게 알고 있었다. 그 애들은 프랭크가 리들 가족을 죽인 살인자라고 굳게 믿고 있었다. 그 애들을 키우는 부모나 할아버지, 할머니처럼. 그래서 8월의 어느 날 밤, 문득 잠에서 깨어난 프랭크가 낡은 저택에서 뭔가 아주 이상한 일이 벌어지고 있는 걸 보았을 때에도, 처음에는 그저 마을 소년들이 또다시 짓궂은 장난을 하는 줄만 알았다. 프랭크가 잠에서 깨어난 건 다리의 통증 때문이었다. 점차 나이가 들면서 다리의 통증이 점점 더 심해지고 있었다. 프랭크는 뻐근한 무릎의 통증을 달래기 위해 물병에 더운 물이나 
다시 채울 요량으로 다리를 절뚝거리면서 계단을 내려갔다.', 7, 'user001', 'Y');

INSERT INTO BOOKMAKINGCHECK VALUES ('8936434268', '아몬드','Y', 
'. 부엌으로 들어간 프랭크는 수도꼭지를 틀어서 주전자에 물을 받기 시작했다. 그러다가 문득 고개를 든 프랭크의 눈에, 리들 하우스의 이층 창문에서 희미하게 깜박거리는 불빛이 보였다. 프랭크는 단번에 무슨 일이 벌어지고 있는지 알아차렸다. 마을 소년들이 또다시 저택으로 침입한 것이다. 불빛이 깜박거리는 걸 보면, 이제 막 불을 피우기 시작한 것 
같았다. 리들 가족 살해 사건으로 조사를 받기 위해 경찰서로 가서 심문을 당했던 프랭크는 그 이후로 줄곧 경찰을 불신하고 있었다. 
그렇기 때문에 애시당초 경찰서에 연락할 생각 같은 건 하지 않았다.
게다가 프랭크의 오두막집에는 전화기가 없었다. 
프랭크는 즉시 주전자를 내려놓은 후에 아픈 다리를 이끌고 이층으로 올라가서 주섬주섬 옷을 챙겨 입었다.
잠시 후에 다시 부엌으로 들어간 프랭크는 고리에 걸려 있던 녹슬고 낡은 열쇠를 집어 들었다. 
그리고 벽에 기대 놓았던 지팡이를 짚고 밖으로 나갔다. 리들 하우스의 현관은 억지로 문을 열고 들어간 흔적이 전혀 없었다.
창문도 역시 마찬가지였다. 절뚝거리면서 저택 뒤로 걸어간 프랭크는 담쟁이 덩굴로 거의 가려진 뒷문을 향해 살며시 다가갔다. 
그리고 낡은 열쇠를 꺼내서 자물쇠에 집어 넣고 소리가 나지 않도록 조용히 문을 열었다.프랭크는 동굴처럼 어두운 부엌으로 들어갔다.
무엇인가 썩는 것 같은 고약한 냄새가 코를 찔렀다. 비록 여러 해 동안 저택으로 들어가 본 적이 없었지만,
프랭크는 짙은 어둠 속에서도 현관으로 통하는 문의 위치를 똑똑히 기억할 수 있었다.
프랭크는 손으로 앞을 더듬으면서 문이 있는 곳을 향해 걸어갔다. 
혹시라도 누군가의 발소리나 목소리가 들리지 않을까 싶어서 귀를 쫑긋 세운 채,
프랭크는 현관으로 걸어갔다.현관문 양쪽에 있는 창살이 달린 창문 덕분에 그 주위는 약간 밝았다. 
프랭크는 바닥에 먼지가 잔뜩 쌓여 있는 것을 천만 다행으로 여기면서 조심스럽게 계단을 올라가기 시작했다
두껍게 쌓인 먼지 덕분에 프랭크가 올라가는 발소리나 지팡이 소리가 전혀 들리지 않았던 것이다.
층계참에서 오른쪽으로 막 돌아섰을 때, 프랭크는 단번에 침입자들이 어디에 있는지 알아챘다.
복도 끝에 있는 문이 조금 열려있었던 것이다. 그 틈새로 흘러나온 불빛이 어두운 복도를 희미하게 비추고 있었다.
프랭크는 지팡이를 잡은 손에 힘을 주면서 조용히 그 문을 향해 다가갔다. 프랭크는 조심스럽게 방을 살짝 엿보았다.
벽난로에서 불길이 활활 타오르고 있었다. 대관절 누가 벽난로에 불을 피운 것일까? 갑자기 방에서 어떤 남자의 목소리가 흘러나왔다.
프랭크는 조용히 귀를 기울였다. 그런데 이상하게도 그 목소리는 잔뜩 겁에 질려서 덜덜 떨고 있는 것 같았다.', 8, 'user001', 'Y');
INSERT INTO BOOKMAKINGCHECK VALUES ('8936434268', '아몬드','Y', 
'"시장하지 않으십니까? 아직 병에 조금 더 남아 있습니다, 주인님."
 "그건 나중에 먹도록 하지." 또 다른 목소리가 대답했다. 이번에도 역시 어떤 남자의 
목소리였지만, 아주 날카롭고 찬 바람이 쌩 지나갈 정도로 차가운 느낌이 들었다. 그 
목소리를 듣자, 프랭크는 뒤통수에 드문드문 나 있는 머리카락이 바싹 곤두서는 듯한 
느낌이 들었다. "웜테일, 나를 옮겨라. 벽난로와 좀 더 가까운 곳으로."
프랭크는 좀더 잘 들으려고 오른쪽 귀를 문에 바싹 갖다대었다. 달그락하고 무엇인가 딱딱한 것 위에 병을 내려놓는 소리가 나더니, 곧이어 무거운 의자가 움직이면서 마룻바닥을 긁는 것 같은 둔탁한 소리가 들렸다. 작달막한 체구의 남자가 문쪽으로 등을 돌린 채, 의자를 밀고 있는 모습이 보였다. 검은 망토를 걸치고 있는 그 사람의 뒤통수는 머리카락이 거의 없는 대머리였다. 잠시 후에 그 사람의 모습이 프랭크의 시야에서 사라졌다.
 "내기니는 어디 있나?" 차가운 목소리가 물었다.', 9, 'user001', 'Y');
 INSERT INTO BOOKMAKINGCHECK VALUES ('8936434268', '아몬드','Y', 
'"저도... 저도 잘 모르겠습니다, 주인님. 아마도 주위를 감시하기 위해 나간 것 같습니다."
웜테일이 초조한 목소리로 대답했다."잠자리에 들기 전에 내기니의 독을 뽑아라, 웜테일." 두 번째 목소리가 명령했다.
 "아무래도 나는 밤에 다시 그걸 먹어야 할 것 같다. 여행을 해서 그런지 몹시 피곤하군."
프랭크는 이맛살을 잔뜩 찌푸린 채, 귀를 바싹 갖다대고 한마디도 놓치지 않으려고 애를 
썼다. 무거운 침묵이 흘렀다. 잠시 후에 웜테일이 다시 입을 열었다."주인님, 얼마 동안 이곳에 머무를 예정입니까?""일주일." 차가운 목소리가 대답했다. "어쩌면 좀더 오랫동안 있게 될지도 모르지. 이곳은 
그런대로 편안하군. 그 계획은 아직 시작할 수 없어. 퀴디치 월드컵이 끝나기 전에 행동하는 
건 어리석은 짓이니까……."그 순간 프랭크는 자신의 귀를 의심하면서 마디가 굵은 손가락으로 귓구멍을 후볐다. 퀴디치라는 이상한 말을 듣긴 들었지만, 아마도 귓속을 메우고 있는 귀지 때문에 잘못 
들은 거라고 생각했던 것이다."퀴…… 퀴디치 월드컵이라뇨, 주인님?" 웜테일이 의아스러운 듯한 목소리로 질문을 했다(프랭크는 손가락으로 훨씬 더 세게 귓구멍을 후볐다).
 "용서하세요, 주인님. 하지만... 좀처럼 이해가 되질 않아요. 어째서 월드컵이 끝날 때까지 기다려야 하는 겁니까?"
 "정말 멍청하군, 웜테일. 지금은 세계의 모든 마법사들이 영국으로 몰려들고 있단 말이다.그리고 골치 아픈 마법부 놈들이 전부 나서서 눈에 불을 켜고 일거수 일투족을 감시하고 있어. 조금이라도 이상한 낌새를 보이는 사람이 있으면 즉시 신원을 확인할 거야. 머글들이 아무런 눈치도 채지 못하도록 철통같이 보안에 신경을 쓰고 있을 테니까. 적당한 때를 기다리는 게 좋아."
프랭크는 더 이상 귀를 후비지 않았다. 마법부와 마법사 그리고 머글이라는 이상한 단어들을 자신의 귀로 똑똑히 들었던 것이다. 이런 식의 표현들은 어떤 비밀스러운 것을 의미하는 게 분명했다. 이런 암호를 사용하는 사람들은 딱 두 종류밖에 없었다. 스파이와 범죄자. 프랭크는 지팡이를 더욱 단단히 잡으면서 열심히 귀를 기울였다.
 "주인님의 생각은 여전히 변함이 없습니까?"웜테일이 신중하게 물었다.',10 , 'user001', 'Y');
 INSERT INTO BOOKMAKINGCHECK VALUES ('8936434268', '아몬드','Y', 
'물론이다, 웜테일."
차가운 목소리가 마치 위협이라도 하듯이 날카롭게 대답했다. 잠시 동안 답답한 침묵이 흘렀다. 웜테일은 가늘게 떨리는 목소리로 재빨리 말했다. 마치 용기를 잃어버리기 전에 꼭 말해야겠다는 듯이.
 "해리 포터가 없더라도 가능하지 않겠습니까, 주인님?"또다시 침묵이 이어졌다. 이번에는 침묵이 조금 더 길었다."해리 포터 없이 그 일을 하자는 말이냐?" 두 번째 목소리가 나지막이 말했다.
 "알겠다."
 "주인님, 제가 그 아이를 걱정해서 이런 말을 하는 건 절대로 아닙니다!" 웜테일의 
목소리가 조금씩 높아지고 있었다. "그 아이는 저에게 아무런 의미도 없습니다. 그냥 
아무것도 아니에요! 그저 만약에 우리가 다른 마녀나 마법사를 이용할 수만 있다면, 일이 
훨씬 더 빨리 끝날 수도 있다는 걸 말하고 싶었을 뿐입니다! 어떤 마법사를 이용하더라도 
상관이 없지 않겠습니까? 저는 이틀 안에 적당한 사람을 데리고 돌아올 자신이 있습니다!만약 잠시 동안 주인님 곁을 떠날 수 있도록 허락해 주신다면 말입니다. 제가 변장에 아주 
능숙하다는 걸 아시지 않습니까?""다른 마법사를 이용할 수도 있지. 그건 사실이야……."두 번째 목소리가 신중하게 말했다."주인님, 그렇다면 아주 쉽게 일을 처리할 수 있습니다. 해리 포터에게 손을 뻗치는 건 굉장히 어려운 일입니다. 그 애는 워낙 철저한 보호를 받고 있어서..."웜테일은 이제 한시름 놓았다는 듯이 말했다.
 "그러니까 자네는 자진해서 다른 마법사를 데리고 오겠다는 건가? 나를 돌보는 일이 귀찮고 따분해서 그런 게 아닌가? 웜테일, 혹시 나를 버리고 달아나겠다는 속셈이 아닌가?"
 "주인님! 전... 전 주인님을 떠날 마음이 전혀 없습니다, 전혀!"
 "거짓말하지 마!" 두 번째 목소리가 마치 위협을 하듯이 말했다.
 "웜테일, 난 모든 걸 알 수 있어! 너는 나에게 돌아온 걸 후회하고 있지. 그래, 내 모습을 바라볼 때마다 비위가 상하는 거야, 나를 볼 때마다 네가 움찔움찔 한다는 걸 다 알고 있어. 나를 만질 때마다 
몸서리를 치는 것도 다 느낄 수 있지.',11, 'user001', 'Y');
 INSERT INTO BOOKMAKINGCHECK VALUES ('8936434268', '아몬드','Y', 
' "아니에요! 저는 헌신적으로 주인님께..."
 "나에게 헌신하는 건 단지 네가 비겁하기 때문이야. 달리 갈 곳이 있었다면 굳이 나를 찾아오지도 않았겠지. 하지만 자네가 없으면 내가 어떻게 살아남을 수 있을까? 몇 시간마다 그걸 먹어야 하는데? 도대체 누가 내기니의 독을 뽑아 줄 수 있단 말인가?"
 "하지만 주인님은 기력을 많이 회복하신 것 같습니다. 힘도 아주 강해졌고."
 "거짓말!" 두 번째 목소리가 단호하게 말했다. "나는 조금도 강해지지 않았어. 단지 
며칠만이라도 혼자 남게 되면……. 너의 서투른 간호로 그나마 회복한 힘마저도 죄다 
잃어버리고 말 거야. 입닥쳐!"무슨 뜻인지 전혀 알 수 없는 말을 혼자 중얼거리고 있던 웜테일이 즉시 입을 다물었다.잠시 동안 프랭크는 딱딱거리면서 타 들어가는 장작 소리 말고는 아무런 소리도 듣지 
못했다. 또다시 두 번째 남자가 저의 쉬쉬거리는 듯한 나지막한 목소리로 속삭였다."그 아이를 이용하는 건 내가 이미 너에게 설명한 것처럼 그럴 만한 이유가 있기 
때문이다. 나는 이 일에 다른 마법사를 이용할 생각이 추호도 없다. 나는 무려 13년 
동안이나 끈기 있게 기다렸어. 몇 달 정도 더 기다린다고 해서 달라질 건 없지. 내 계획대로 
하기만 하면, 그 아이를 감싸고 있는 보호 따위는 무용지물이 될 거야. 오직 네가 약간만 더 
용기를 내면 된다, 웜테일. 볼드모트 경의 엄청난 분노를 보고 싶지 않다면 어서 용기를 
되찾으란 말이다!""주인님, 하지만 이 말은 꼭 하고 싶습니다! 여행을 하는 동안 저는 머리 속에서 그 계획을 
하나씩 하나씩 정리해 보았습니다. 주인님, 버사 조킨스의 실종은 금방 세상에 알려지게 될 
겁니다. 만약 우리가 계속 이 일을 진행한다면, 만약 제가 저주를 내린다면……."웜테일은 거의 정신이 나간 사람처럼 지껄였다."만약이라구?" 두 번째 목소리가 속삭였다. "만약? 만약 웜테일, 네가 충실하게 나의 계획을 따르기만 한다면, 마법부는 그런 일에 신경조차 쓰지 않을 것이다. 조용히 
해치우도록. 공연히 법석 떨지 말고……. 내가 직접 그 일을 처리할 수만 있다면 얼마나 
좋을까? 하지만 지금의 내 상태로는……. 자, 웜테일. 이제 장애물 하나만 더 없애면 해리 
포터를 손에 넣는 건 식은 죽 먹기야. 너 혼자 그 일을 하라는 게 아니다. 때가 되면, 나의 
충실한 부하가 다시 우리와 합류할 것이다!"
"저도 충실한 부하입니다!"웜테일은 약간 토라진 목소리로 말했다."웜테일, 난 똑똑한 두뇌를 가진 사람이 필요해. 절대로 흔들리지 않는 충성심을 갖고 있는 
사람도……. 그런데 자네는 불행하게도 그 어느 쪽으로도 나를 만족시키지 못해.""하지만 주인님을 찾아낸 건 접니다." 
웜테일은 언짢은 기색을 그대로 드러내면서 말했다.
"주인님을 찾아낸 건 바로 저라구요.게다가 버사 조킨스를 데리고 온 사람도……."',12, 'user001', 'Y');

COMMIT;