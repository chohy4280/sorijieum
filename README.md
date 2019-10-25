<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Title</title>
<link rel="stylesheet" href="https://stackedit.io/res-min/themes/base.css">
<script type="text/javascript" src="https://cdn.mathjax.org/mathjax/latest/MathJax.js?config=TeX-AMS_HTML"></script>

<div class="container">

# Welcome to SORIJIEUM!

This project is Web Application for **Blind and Volunteer.**

Blind person can listen to a book and Volunteer can make a sound-book using this app.

* * *

## About

시각장애인들과 비장애인들이 ‘독서’라는 주제로 함께 이용할 수 있는 사이트입니다. 

웹 애플리케이션(Web Application) 형태이며 웹 개발 과정을 공부중인 학생의 프로젝트로 현재 운영되는 사이트는 아닙니다.

> **Intro:**
> 
> *   **시각장애인(이하 이용자), 자원봉사자(이하 제작자), 관리자**를 위한 페이지가 개별적으로 존재하고 각 회원들은 자신들에게 제공하는 서비스를 이용합니다.
> *   이용자는 제작이 완료된 도서 중 원하는 도서를 소리로 들을 수 있습니다. 원하는 도서가 없는 경우 도서를 신청할 수 있습니다. 또한 추후에 읽고싶은 도서를 관심도서로 추가할 수 있습니다.
> *   제작자는 이용자 신청을 받은 도서 중 관리자가 승인한 도서의 원본 PDF를 보며 직접 타이핑 할 수 있습니다.
> *   관리자는 회원관리, 도서관리, 문의글 관리, 권한관리 등 사이트의 모든 서비스를 관리할 수 있습니다.
> *   그 외에 각 회원들이 올린 문의글을 확인할 수 있는 Q&A공간도 마련되어 있습니다.

* * *

## Directory

**MVC 패턴방식으로 구현하였습니다.**

> **SORIJIEUM:**
> 
>   │   README.md 
> 
>   │ 
> 
>   └─  dbscript 
> 
>   │    └── sori.sql 
> 
>   │ 
> 
>   └─  src 
> 
>   │    └── controller 
> 
>   │    └── model 
> 
>   │ 
> 
>   └── web 
> 
>         │ 
> 
>         └──  views 
> 
>         │       └── view.jsp 
> 
>         │ 
> 
>         └──  resources 
> 
>                   └── css.css 
> 
>                   └── image 
> 
>                   └── Upload_files*   src : controller, vo, model, sql 저장

*   sql : 쿼리문 저장

*   web-index.jsp : 시작페이지 (회원 메인페이지)

*   web-views : 모든 view 페이지

*   web-css : 사이트 CSS파일

*   web-image : 공통으로 사용되는 이미지

*   web-Upload: 웹에서 업로드 되는 파일

*   startPage : **localhost:port/sori/index.jsp**



## Using

API

KAKAO map api

commons-fileupload-1.3.1.jar 

commons-io-2.4.jar 

commons-logging-1.2.jar 

cos.jar 

ojdbc6.jar 

pdfbox-1.8.3.jar

* * *

## Database Model

이미지추가

</div>
