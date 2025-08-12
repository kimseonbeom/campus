<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<style>
  html, body {
    margin: 0;
    padding: 0;
    overflow-x: hidden;
    height: 100%;
  }
  </style>
  <body>
<jsp:useBean id="today" class="java.util.Date" />
<fmt:formatDate var="todayFormatted" value="${today}" pattern="yyyy-MM-dd" />
<div class="wrap" style="height:100vh;">
		<div class="card-header" style="border-bottom: none;">
  <h3 class="card-title ml-2 mt-2" style="font-size: 25px; font-weight: bold;">로드맵:<span>${project_name }</span></h3>
  <div class="card-tools">
   <div class="btn btn-primary btn-lg mt-2 mr-3 d-flex align-items-center justify-content-center"  onclick="location.href='<%=request.getContextPath() %>/roadmap/detail'; 
			  				window.parent.location.hash='<%=request.getContextPath() %>/roadmap/detail';"
   style="background-color:#2ec4b6; border:none; width:100px; height:40px;">
  <span style="color: #ffffff; font-size:17px; font-weight:bold;">임시상세</span>
</div>
   <div class="btn btn-primary btn-lg mt-2 mr-3 d-flex align-items-center justify-content-center"  onclick="location.href='<%=request.getContextPath() %>/roadmap/regist'; 
			  				window.parent.location.hash='<%=request.getContextPath() %>/roadmap/regist';"
   style="background-color:#2ec4b6; border:none; width:100px; height:40px;">
  <span style="color: #ffffff; font-size:17px; font-weight:bold;">자료 제출</span>
</div>
  </div>
</div>

<form action="${pageContext.request.contextPath}/roadmap/list/stu" method="get">
<div class="mx-auto d-flex p-2 align-items-center" style="border: 1px solid #ced4da; font-size: 15px; width:96%; border-top: 2px solid #2ec4b6;">
<div class="ml-3">
<label style="margin: 0;">기간</label>
</div>
<div class="input-group date mt-2 mb-2 ml-3" id="datetimepicker1" data-target-input="nearest" style="width: 130px;">
  <input type="text" name="project_stdate" class="form-control datetimepicker-input" data-target="#datetimepicker1"
         style="width: 90px; height: 26px; font-size: 13px; padding: 4px 6px;" value="${project_stdate != null ? project_stdate : ''}">
  <div class="input-group-append" data-target="#datetimepicker1" data-toggle="datetimepicker">
    <div class="input-group-text" style="padding: 4px 6px;"><i class="far fa-minical"></i></div>
  </div>
</div>
<span class="ml-3"> ~ </span>
<div class="input-group date mt-2 mb-2 ml-3" id="datetimepicker2" data-target-input="nearest" style="width: 130px;">
  <input type="text" name="project_endate" class="form-control datetimepicker-input" data-target="#datetimepicker2"
         style="width: 90px;height: 26px; font-size: 13px; padding: 4px 6px;" value="${project_endate != null ? project_endate : ''}">
  <div class="input-group-append" data-target="#datetimepicker2" data-toggle="datetimepicker">
    <div class="input-group-text" style="padding: 4px 6px;"><i class="far fa-minical"></i></div>
  </div>

</div>
<button type="submit" style="margin-left:20px;width:50px; background-color:#ffffff; border:2px solid #2ec4b6;border-radius:5px; color:#2ec4b6; font-weight:bold;">적용</button>
<div style="display: flex; align-items: center; height: 50px;width:40px; margin-left:320px;">
  <label style="margin: 0;">구분</label>
</div>
<div style="width:120px;">
  <select name="samester" style="width:110px; border: 1px solid #ced4da;">
    <option value="" ${selectedSamester == null ? "selected" : ""}>전체</option>
    <option value="1학기" ${selectedSamester == '1학기' ? "selected" : ""}>회의록</option>
    <option value="2학기" ${selectedSamester == '2학기' ? "selected" : ""}>업무일지</option>
    <option value="2학기" ${selectedSamester == '2학기' ? "selected" : ""}>산출물</option>
    <option value="2학기" ${selectedSamester == '2학기' ? "selected" : ""}>최종결과물</option>
    
  </select>
 </div>

<div class="input-group input-group-sm ml-auto" style="max-width:300px; width:auto;">
  <input id="project_name" name="project_name" class="form-control" type="search" value="${project_name }" placeholder="프로젝트명을 입력해주세요." aria-label="Search"
         style="height: 35px; font-size: 13px; padding: 4px 6px; line-height: 1.2;">
  <div class="input-group-append">
    <button class="btn btn-navbar" type="submit" style="padding: 2px 10px;">
                <i class="fas fa-cpsearch ml-1"></i>
              </button>
  </div>
</div>
</div>

	<div class="row d-flex justify-content-end align-items-center" style="margin-top:40px;">
  <div style="width:80px;">
    <label class="custom-checkbox">
   완료
  <input type="checkbox" name="evalutionRequest" value="true" ${param.modifyRequest == 'true' ? 'checked' : ''}/>
  <span class="checkmark"></span>
</label>
  </div>
  <div style="width:130px;">
<label class="custom-checkbox">
   미완료
  <input type="checkbox" name="evalutionNoRequest" value="true" ${param.modifyRequest == 'true' ? 'checked' : ''}/>
  <span class="checkmark"></span>
</label>
</div>
</div>
              </form>
	<div class="mx-auto d-flex p-2 align-items-center" style="border: 1px solid #ced4da; font-size: 15px;  width:96%;  background-color:#f5f5f5;">
	<div class="row d-flex p-2 align-items-center" style="width:100%; margin-left:1px;">
	<div class="col-1 text-center" style="font-weight:bold;">No</div></div>
	<div class="col-3 text-center" style="font-weight:bold;">구분</div>
	<div class="col-2 text-center" style="font-weight:bold;">제목</div>
	<div class="col-2 text-center" style="font-weight:bold;">작성자</div>
	<div class="col-3 text-center" style="font-weight:bold;">작성일</div>
	<div class="col-1 text-center" style="font-weight:bold;">평가여부</div>
	</div>
	
	<div class= "d-flex" style="width:100%;">
	<c:if test="${empty projectList }">
		<div class="row">
			<div class="col-4"></div>
			<div class="col-4" style="width:1600px; margin-top:60px; margin-bottom:60px; text-aline:center;">
				<span style="font-size:25px; font-weight:bold; color:#e0e0e0;">해당 내용이 없습니다.</span>
			</div>
			<div class="col-4"></div>
		</div>
				   	 
	</c:if>
	</div>
	<a href="<%=request.getContextPath() %>/roadmap/list/stu">
		<div class="mx-auto align-items-center" style="border: 1px solid #ced4da; font-size: 15px;  width:96%;">
		<c:forEach items="${projectList}" var="prolist">
  <fmt:formatDate var="endDateStr" value="${prolist.project_endate}" pattern="yyyy-MM-dd" />
  <fmt:formatDate var="todayStr" value="${today}" pattern="yyyy-MM-dd" />
  <c:choose>
  <c:when test="${endDateStr lt todayStr}">
	<div class="row p-2 align-items-center" style="cursor:pointer; width:1232px; background-color:#f5f5f5; margin-left:1px;" onclick="OpenWindow('${pageContext.request.contextPath}/project/detail/pro?project_id=${prolist.project_id}','상세 정보',700,800)">
	<div class="col-1 text-center">2025-${prolist.samester }</div>
	<div class="col-3 text-center">${prolist.project_name }</div>
	<div class="col-1 text-center">${prolist.leader_name }</div>
	<div class="col-3 text-center"><fmt:formatDate value="${prolist.project_stdate }" pattern="yyyy-MM-dd"/></div>
	<div class="col-3 text-center" style="color:#ff0000;"><fmt:formatDate value="${prolist.project_endate }" pattern="yyyy-MM-dd"/></div>
	<div class="col-1 text-center">	</div>
	</div>
	</c:when>
	 <c:otherwise>
	<div class="row p-2 align-items-center" style="width:100%;  margin-left:1px; ">
	<div class="col-1 text-center" style="cursor:pointer;">2025-${prolist.samester }</div>
	<div class="col-3 text-center" style="cursor:pointer;">${prolist.project_name }</div>
	<div class="col-1 text-center" style="cursor:pointer;">${prolist.leader_name }</div>
	<div class="col-3 text-center" style="cursor:pointer;"><fmt:formatDate value="${prolist.project_stdate }" pattern="yyyy-MM-dd"/></div>
	<div class="col-3 text-center" style="cursor:pointer;"><fmt:formatDate value="${prolist.project_endate }" pattern="yyyy-MM-dd"/></div>
	<div class="col-1 text-center">
	<c:choose>
  <c:when test="${fn:contains(projectEditStatusMap[prolist.project_id], '요청중')}">
    <button type="button" style="width:80px; background-color:#ffffff; border:2px solid #2ec4b6;border-radius:5px; color:#2ec4b6; font-weight:bold;"
      onclick="OpenWindow('${pageContext.request.contextPath}/project/modify/pro?project_id=${prolist.project_id}','수정 요청',700,800)">
      미완료
    </button>
  </c:when>
  <c:otherwise>
  <button type="button" style="width:80px; background-color:#ffffff; border:2px solid #2ec4b6;border-radius:5px; color:#2ec4b6; font-weight:bold;"
      onclick="OpenWindow('${pageContext.request.contextPath}/project/modify/pro?project_id=${prolist.project_id}','수정 요청',700,800)">
      완료
    </button>
  </c:otherwise>
</c:choose>
</div>
	</div>
	</c:otherwise>
	</c:choose>
    </c:forEach>
	</div>
	</a>
	  <div class="row mt-3">
   <div class="col-4"></div>
   <!--페이지  -->
   <div class="col-4">
<c:if test="${not empty projectListpro}">
  <%@ include file="/WEB-INF/views/module/paginationPro.jsp" %>
</c:if></div>
<div class="col-4"></div>
</div>
<script>
  const semesterSelect = document.getElementById('semesterSelect');
  const keywordInput = document.getElementById('keyword');

  semesterSelect.addEventListener('change', () => {
    keywordInput.value = semesterSelect.value; // 선택한 학기를 keyword에 넣음
  });
</script>
<script>
const checkbox = document.querySelector('input[name="evalutionRequest"]');
const form = document.querySelector('form');

checkbox.addEventListener('change', () => {
  form.submit(); // 체크박스가 변경될 때마다 폼 자동 제출
});
</script>
<script>
const checkbox = document.querySelector('input[name="evalutionNoRequest"]');
const form = document.querySelector('form');

checkbox.addEventListener('change', () => {
  form.submit(); // 체크박스가 변경될 때마다 폼 자동 제출
});
</script>
</body>		   
				   
		