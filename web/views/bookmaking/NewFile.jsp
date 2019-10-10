<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="/../inc/cdn.jsp"%>
<script type="text/javascript">

$(function($){
		   $('.ui .item').on('click', function() {
		      $('.ui .item').removeClass('active');
		      $(this).addClass('active');
		   }); 
		   
		   $('.tab.segment').on('click', function() {
			      $('.tab.segment').removeClass('active');
			      $(this).addClass('active');
			   }); 
	
});
</script>
</head>
<body>		
	<div class="ui grid page">
    <div class="column">
        <div class="ui pointing secondary menu" id="tabsTwo">
            <a class="active red item" data-tab="first">One</a>
            <a class="blue item" data-tab="second">Two</a>
            <a class="green item" data-tab="third">Three</a>
        </div>
        <div class="ui tab segment active" data-tab="first">First</div>
        <div class="ui tab segment" data-tab="second">Second</div>
        <div class="ui tab segment" data-tab="third">Third</div>
    </div>
</div>
</body>
</html>