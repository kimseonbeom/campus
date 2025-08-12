<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
  html, body {
    margin: 0;
    padding: 0;
    overflow-x: hidden;
    height: 100%;
  }
</style>
<body>
	<div class="wrap" style="height:100vh;">
			<div class="card-header" style="border-bottom: none;">
  	<h3 class="card-title ml-2 mt-2" style="font-size: 25px; font-weight: bold;">로드맵:<span>${project_name }</span></h3>
  	</div>
  	<div class="row" style="margin-top:40px;">
  		<div class="col-8" style="margin-left:40px;">
  			<h3>Camp_us 프로젝트 최종 제출</h3>
  		</div>
  	</div>
  	<div class="row mb-2" style="margin-left:40px; line-height:30px;">
  		<div class="col-10 mt-1">
  			<span>최종 결과물 | 작성자 : 김선범 | 2025-07-30 10:36</span>
  		</div>
  		<div class="col-1 mb-1 mt-1">
  		<button type="button"
  		style="background-color:#aaaaaa; border-radius:5px; width:90px; height:35px; border:none;margin-left:44px;font-weight:bold; font-size:17px; color:#ffffff;"
  		>삭제</button>
  		</div>
  		</div>
  	<div class="row">
  		<div class="col-11" style="width:100%; height:250px; border-top:3px solid #aaaaaa; margin-left:50px;"> 	
  		내용이 들어갈 곳
  		</div>
  	</div>
  	<div class="row">
  	<div class="col-5">
  	<label style="margin-left:40px;">
  		<span style="font-weight:bold;">첨부파일</span>
  	</label>
  	</div>
  	</div>
  	<div class="row">
  	<div class="col-11" style="width:100%;  border-top:3px solid #aaaaaa; margin-left:49px;">  	
  	<span>이미지 Camp_us 최종제출.pdf</span>
  	
  	</div>
  	</div>
  	<label style="margin-left:40px; margin-top:40px;">
  		<span style="font-weight:bold;">피드백</span>
  	</label>
  	<form>
  	<div class="row d-flex" style=" border-top:3px solid #2ec4b6; width:1179px; margin-left:47px; align-items:center;">
  		<div class="col-8" style="width:80%;">  	
  			사진 이름 <br/>
  			하고싶은 말
  		</div>
  		<div class="col-2">
  			<button type="button" onclick="OpenWindow('${pageContext.request.contextPath}/roadmap/evalution','평가',700,800)"
  			style="background-color:#2ec4b6; border-radius:5px; width:90px; height:35px; border:none;margin-left:275px;font-weight:bold; font-size:17px; color:#ffffff;"
  			>평가</button>
  		</div>
  	</div>
  		</form>
  	<div class="row">
  		<div class="col-10"></div>
  		<div class="col-1 mb-1 mt-2">
  		<button type="button"
  		style="background-color:#2ec4b6; border-radius:5px; width:90px; height:35px; border:none;margin-left:44px;font-weight:bold; font-size:17px; color:#ffffff;"
  		>목록</button>
  		</div>
  	</div>
	</div>
</body>