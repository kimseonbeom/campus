<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="modal fade" id="studentSelectModalLeader" tabindex="-1" role="dialog" aria-hidden="true">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">팀장 선택</h5>
        <button type="button" class="close" data-dismiss="modal">&times;</button>
      </div>
      <div class="modal-body">
        <!-- 검색 입력 -->
        <input type="text" id="leaderSearchInput" placeholder="학생 이름 검색" class="form-control mb-3">
        <!-- 학생 리스트 (예: 체크박스 없이 클릭 선택) -->
        <ul id="leaderStudentList" class="list-group" style="max-height:300px; overflow-y:auto;">
          <!-- 동적으로 학생 리스트를 뿌려주세요 -->
        </ul>
      </div>
      <div class="modal-footer">
        <button type="button" id="selectLeaderBtn" class="btn btn-primary"
        style="background-color:#2ec4b6; border-radius:5px; width:150px; height:40px; border:none; font-weight:bold;"
         disabled>선택 완료</button>
      </div>
    </div>
  </div>
</div>