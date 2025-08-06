<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="modal fade" id="professorSelectModal" tabindex="-1" role="dialog" aria-hidden="true">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">담당교수 선택</h5>
        <button type="button" class="close" data-dismiss="modal">&times;</button>
      </div>
      <div class="modal-body">
        <!-- 검색 입력 -->
        <input type="text" id="professorSearchInput" placeholder="교수 이름 검색" class="form-control mb-3">
        <!-- 학생 리스트 (예: 체크박스 없이 클릭 선택) -->
        <ul id="professorList" class="list-group" style="max-height:300px; overflow-y:auto;">
           <c:forEach var="professor" items="${professorList}">
    <li class="list-group-item leader-student-item" 
    	data-pro-picture="${professor.picture }"
        data-pro-id="${professor.mem_id}" 
        data-pro-name="${professor.mem_name}"
        style="cursor:pointer;">
        <img src="<%=request.getContextPath() %>/member/getPicture?id=${professor.mem_id}" class="img-circle img-md" alt="User Image" style="width:45px; height:45px; object-fit:cover;">
      ${professor.mem_name} (${professor.mem_id})
    </li>
  </c:forEach>
        </ul>
      </div>
      <div class="modal-footer">
        <button type="button" id="selectprofessorBtn" class="btn btn-primary"
        style="background-color:#2ec4b6; border-radius:5px; width:150px; height:40px; border:none; font-weight:bold;"
         disabled>선택 완료</button>
      </div>
    </div>
  </div>
</div>
<script>
$(document).ready(function() {
    // 교수 리스트 클릭 시 (단일 선택)
    $(document).on('click', '#professorList .leader-student-item', function() {
        // 기존 선택 해제
        $('#professorList .leader-student-item').removeClass('active');

        // 현재 항목 선택
        $(this).addClass('active');

        // 버튼 활성화
        $('#selectprofessorBtn').prop('disabled', false);
    });

    // 선택 완료 버튼 클릭 시
    $('#selectprofessorBtn').on('click', function() {
        const selectedItem = $('#professorList .leader-student-item.active');
        const professorId = selectedItem.data('pro-id');
        const professorName = selectedItem.data('pro-name');

        // 부모 화면에 표시
        $('#professorName').val(professorName);
        $('#professorId').val(professorId);

        // 모달 닫기
        $('#professorSelectModal').modal('hide');
        $('.modal-backdrop').remove();
        $('body').removeClass('modal-open');

        // 초기화
        selectedItem.removeClass('active');
        $('#selectprofessorBtn').prop('disabled', true);
    });

    // 검색 기능
    $('#professorSearchInput').on('keyup', function() {
        const search = $(this).val().toLowerCase();
        $('#professorList .leader-student-item').each(function() {
            const name = $(this).data('pro-name').toLowerCase();
            $(this).toggle(name.includes(search));
        });
    });
});
</script>
