<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 비밀번호 찾기</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/1.11.8/semantic.min.css"/>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/1.11.8/semantic.min.js"></script>
<link rel="stylesheet" type="text/css" href="/sori/resources/css/member.css">
<%@ include file="/inc/top.jsp" %>
</head>
<body>
<section class="my-section">

<center>
<div class="ui placeholder segment" style="margin-top:10%;width:800px">
  <div class="ui two column very relaxed stackable grid">
    <div class="column">
    <h2>아이디 찾기</h2>
    <form action="" method="post">
      <div class="ui form">
         <div class="inline field">
		    <label>이 름</label><br>
		    <input type="text" name="username" placeholder="이름 입력" style="width:300px;height:50px;">
		  </div>
         <div class="inline field">
		    <label>이 메 일</label><br>
		    <input type="email" name="email" placeholder="이메일 입력" style="width:300px;height:50px;">
		  </div>
        <div align="center">
		<a href="/sori/views/member/memberSearchIdComplete.jsp">
		<input type="button" value="아이디 찾기" class="ui grey button" style="color:black;width:200px;height:50px;font-size:15pt;"></a>
		</div>
      </div>
    </form>
    </div>
    <div class="middle aligned column">
    <h2>비밀번호 찾기</h2>
    <form action="" method="post">
      <div class="ui form">
         <div class="inline field">
		    <label>아 이 디</label><br>
		    <input type="text" name="userid" placeholder="아이디 입력" style="width:300px;height:50px;">
		  </div>
         <div class="inline field">
		    <label>이 메 일</label><br>
		    <input type="email" name="email" placeholder="이메일 입력" style="width:300px;height:50px;">
		  </div>
        <div align="center">
        <a href="/sori/views/member/memberSearchPwComplete.jsp">
		<input type="button" value="비밀번호 찾기" class="ui grey button" style="color:black;width:200px;height:50px;font-size:15pt;">
		</a>
		</div>
      </div>
    </form>
    </div>
  </div>
  <div class="ui vertical divider">
    Or
  </div>
</div>
<a href="/sori/views/member/memberSearchFail.jsp">찾기 실패 페이지</a>
</center>
</section>
</body>
</html>