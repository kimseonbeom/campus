<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
  	<h3 class="card-title ml-2 mt-2" style="font-size: 25px; font-weight: bold;">평가</h3>
  	</div>
  	<label style="margin-left:40px; margin-top:40px;">
  		<span style="font-weight:bold;">피드백</span>
  	</label>
  	<form>
  	<div class="row d-flex" style=" border-top:3px solid #2ec4b6; width:400px; margin-left:40px; align-items:center;">
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
  	</div>