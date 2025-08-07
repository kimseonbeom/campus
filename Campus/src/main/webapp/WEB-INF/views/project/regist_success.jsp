<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script>
alert("프로젝트가 등록되었습니다.");

// 글 목록 페이지로 이동하면서 새로고침 (예: /project/list 로 이동)
location.href = "<%=request.getContextPath() %>/project/list/stu?mem_id=${loginUser.mem_id }";
</script>