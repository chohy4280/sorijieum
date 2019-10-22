
<h1 id="welcome-to-sorijieum">Welcome to SORIJIEUM!</h1>

<p>This project is Web Application for <strong>Blind and Volunteer.</strong> <br>
Blind person can listen to a book and Volunteer can make a sound-book using this app.</p>

<hr>



<h2 id="about">About</h2>

<hr>

<p>시각장애인들과 비장애인들이 ‘독서’라는 주제로 함께 이용할 수 있는 사이트입니다. <br>
웹 애플리케이션(Web Application) 형태이며 웹 개발 과정을 공부중인 학생의 프로젝트로 현재 운영되는 사이트는 아닙니다.</p>

<blockquote>
  <p><strong>Intro:</strong></p>
  
  <ul>
  <li><strong>시각장애인(이하 이용자), 자원봉사자(이하 제작자), 관리자</strong>를 위한 페이지가 개별적으로 존재하고 각 회원들은 자신들에게 제공하는 서비스를 이용합니다.</li>
  <li>이용자는 제작이 완료된 도서 중 원하는 도서를 소리로 들을 수 있습니다. 원하는 도서가 없는 경우 도서를 신청할 수 있습니다. 또한 추후에 읽고싶은 도서를 관심도서로 추가할 수 있습니다.</li>
  <li>제작자는 이용자 신청을 받은 도서 중 관리자가 승인한 도서의 원본 PDF를 보며 직접 타이핑 할 수 있습니다.</li>
  <li>관리자는 회원관리, 도서관리, 문의글 관리, 권한관리 등 사이트의 모든 서비스를 관리할 수 있습니다. </li>
  <li>그 외에 각 회원들이 올린 문의글을 확인할 수 있는 Q&amp;A공간도 마련되어 있습니다.</li>
  </ul>
</blockquote>

<hr>



<h2 id="directory">Directory</h2>

<hr>

<p><i class="icon-file"></i><strong>MVC 패턴방식으로 구현하였습니다.</strong> </p>

<blockquote>
  <p><strong>SORIJIEUM:</strong> <br>
  │   README.md <br>
  │ <br>
  └─  dbscript <br>
  │    └── sori.sql <br>
  │ <br>
  └─  src <br>
  │    └── controller <br>
  │    └── model <br>
  │ <br>
  └── web <br>
        │ <br>
        └──  views <br>
        │       └── view.jsp <br>
        │ <br>
        └──  resources <br>
                  └── css.css <br>
                  └── image <br>
                  └── Upload_files</p>
</blockquote>

<ul>
<li><p>src : controller, vo, model, sql 저장</p></li>
<li><p>sql : 쿼리문 저장</p></li>
<li><p>web-index.jsp : 시작페이지 (회원 메인페이지)</p></li>
<li><p>web-views : 모든 view 페이지</p></li>
<li><p>web-css : 사이트 CSS파일</p></li>
<li><p>web-image : 공통으로 사용되는 이미지</p></li>
<li><p>web-Upload: 웹에서 업로드 되는 파일</p></li>
<li><p>startPage : <strong>localhost:port/sori/index.jsp</strong></p></li>
</ul>

<hr>



<h2 id="using">Using</h2>

<hr>

<p>API</p>

<p>KAKAO map api</p>

<p>commons-fileupload-1.3.1.jar <br>
commons-io-2.4.jar <br>
commons-logging-1.2.jar <br>
cos.jar <br>
ojdbc6.jar <br>
pdfbox-1.8.3.jar</p>

<hr>



<h2 id="database-model">Database Model</h2>

<hr>

<p>이미지추가</p>
