<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>sorijieum</title>

  <!-- 시맨틱유아이 cdn -->

 <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.css">
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.js"></script>
<!-- <link rel = "stylesheet" type="text/css" href="/sori/resources/css/main.css"> -->
</head>
<body>
<header>
<div align="right">
<button onclick="location.href='/sori/views/member/memberEnrollAgree.jsp'">회원가입</button>
<button onclick="location.href='/sori/views/member/memberLoginView.jsp'">로그인</a></button> &nbsp;
</div>
<center><a href="/sori/index.jsp"><img src="/sori/resources/images/logo.png" width="10%" height="10%"></a></center>
</header>

<div align="center">

<button class="ui yellow button" onclick="location.href='/sori/index.jsp'" style="width: 400px; height: 300px; margin: 10px 10px; font-size: 50px; font-weight:600;">홈</button>
<button class="ui yellow button" onclick="location.href='/sori/views/sorijieumIntro.jsp'"style="width: 400px; height: 300px; margin: 10px 10px; font-size: 50px; font-weight:600;">사이트소개</button>
<button class="ui yellow button" style="width: 400px; height: 300px; margin: 10px 10px; font-size: 50px; font-weight:600;"><a href= "/sori/views/booksearch/bookSearchList.jsp">도서검색</button></a><br>
<button class="ui yellow button" onclick="location.href='/sori/views/bookmaking/bmmain.jsp'" style="width: 400px; height: 300px; margin: 10px 10px; font-size: 50px; font-weight:600;">도서제작</button>
<button class="ui yellow button" style="width: 400px; height: 300px; margin: 10px 10px; font-size: 50px; font-weight:600;">도서신청</button>
<button class="ui yellow button" style="width: 400px; height: 300px; margin: 10px 10px; font-size: 50px; font-weight:600;">게시판</button>

</div>
<section>
<br><br>

</section>
<br><br><br><br>

<footer>

</footer>
</body>
</html>