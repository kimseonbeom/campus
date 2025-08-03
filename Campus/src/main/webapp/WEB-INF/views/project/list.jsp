<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<body style="width:100%;">
		<div class="card-header" style="border-bottom: none;">
  <h3 class="card-title ml-2 mt-2" style="font-size: 30px; font-weight: bold;">팀 목록</h3>
  <div class="card-tools">
    <a href="teamRegister.jsp" class="btn btn-primary btn-lg mt-2 mr-3" style="background-color:#2ec4b6; border:none;">
  <span style="color: #ffffff;">팀 등록</span>
</a>
  </div>
</div>

<div class="mx-auto d-flex p-2 align-items-center" style="border: 1px solid #ced4da; font-size: 15px; width:96%;">
<div class="d-flex align-items-center" style="width: auto;">
  <span class="ml-3 mr-3">학기</span>
  <select style="width: 110px; font-size: 13px; padding: 2px 4px; border-radius:5px; border: 1px solid #ced4da;">
    <option>학기 선택</option>
    <option>1학기</option>
    <option>2학기</option>
  </select>
</div>
<div class="ml-3">
<span>기간</span>
</div>
<div class="input-group date mt-2 mb-2 ml-3" id="datetimepicker1" data-target-input="nearest" style="width: 130px;">
  <input type="text" class="form-control datetimepicker-input" data-target="#datetimepicker1"
         style="width: 90px; height: 26px; font-size: 13px; padding: 4px 6px;">
  <div class="input-group-append" data-target="#datetimepicker1" data-toggle="datetimepicker">
    <div class="input-group-text" style="padding: 4px 6px;"><i class="far fa-minical"></i></div>
  </div>
</div>
<span class="ml-3"> ~ </span>
<div class="input-group date mt-2 mb-2 ml-3" id="datetimepicker2" data-target-input="nearest" style="width: 130px;">
  <input type="text" class="form-control datetimepicker-input" data-target="#datetimepicker2"
         style="width: 90px;height: 26px; font-size: 13px; padding: 4px 6px;">
  <div class="input-group-append" data-target="#datetimepicker2" data-toggle="datetimepicker">
    <div class="input-group-text" style="padding: 4px 6px;"><i class="far fa-minical"></i></div>
  </div>
</div>
<div class="input-group input-group-sm ml-auto" style="max-width:300px; width:auto;">
  <input class="form-control" type="search" placeholder="검색어를 입력해주세요." aria-label="Search"
         style="height: 35px; font-size: 13px; padding: 4px 6px; line-height: 1.2;">
  <div class="input-group-append">
    <button class="btn btn-navbar" type="submit" style="padding: 2px 10px;">
                <i class="fas fa-cpsearch ml-1"></i>
              </button>
  </div>
</div>
</div>
<div class= "d-flex" style="width:100%; height:100%;">
<div class="card card-primary" style="min-width: 20%; width:30%; margin:30px 19px 50px 26px; box-shadow: none; border-radius: 0 !important;">
              <div class="card-header d-flex align-items-center justify-content-between" 
              style="background-color:#2ec4b6; height:60px;border:none;box-shadow: none; border-radius: 0 !important;">
                
                <h3 class="card-title" style="font-size:18px; width:120px;">2025-2학기</h3>

                <div class="card-tools d-flex justify-content-end align-items-center" style="width:300px;">
                <span style="font-weight:bold; color:#ffffff;">Global Impact Studio</span>	
                </div>
              </div>
              <div class="card-body" style="width: 100%; height:450px;;border: 1px solid #ced4da;">
				
                </div>
              </div>
              <!-- /.card-body -->
            <div class="card card-primary" style="min-width: 20%; width:30%; margin:30px 19px 50px 26px;border: 1px solid #e7e7e7;  box-shadow: none;  border-radius: 0 !important;">
              <div class="card-header d-flex align-items-center justify-content-between" 
              style="background-color:#2ec4b6; height:60px;border:none;box-shadow: none;border-radius: 0 !important;">
                
                <h3 class="card-title" style="font-size:18px; width:120px;">2025-2학기</h3>

                <div class="card-tools d-flex justify-content-end align-items-center" style="width:300px;">
                <span style="font-weight:bold; color:#ffffff;">Global Impact Studio</span>	
                </div>
              </div>
              <div class="card-body p-0" style="width: 100%; height:450px; ;border: 1px solid #e7e7e7; color:#707070;">
				<div class="row text-center p-2 mt-2">
				<div class="col-6">
				<h2 style="font-size:16px; font-weight:bold; color:#707070;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;시작기한</h2>
				</div>
				<div class="col-6">
				<h2 style="font-size:16px; font-weight:bold; color:#707070;">마감기한&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</h2>
				</div>
				</div>
				<div class="row text-center">
				<div class="col-6">
				<span style="font-size:18px; color:#707070;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2025-03-18</span>
				</div>
				<div class="col-6">
				<span style="font-size:18px; color:#707070;">2025-03-18&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
				</div>
				</div>
				<div class="row">
				<div class="col-10 mx-auto">
  <hr>
</div>
				</div>
				<div class="row p-2">
				<div class="col-12 pl-5">
				<h3 style="font-size:16px; font-weight:bold; color:#707070;">금주 제출현황</h3>
				</div>
				</div>
				<div class="row p-1">
				<div class="col-6 pl-5">
				<span style="color:#707070;">&nbsp;로드맵</span></div>
				<div class="col-5 d-flex justify-content-end">
				<span class=""style="font-weight:bold; color:#2ec4b6;">제출완료</span></div>
				</div>
				<div class="row p-1">
				<div class="col-6 pl-5">
				<span style="color:#707070;">&nbsp;피드백</span></div>
				<div class="col-5 d-flex justify-content-end">
				<span class="" style="font-weight:bold; color:#a6a6a6;">미등록</span></div></div>
				
				<div class="row mx-0">
				<div class="col-12 px-0">
					<hr style="height: 1px; background-color: #E7E7E7; border: none; width: 100%;">
					</div>
					</div>
				<div class="row pb-1 pl-1">
				<div class="col-6 pl-5">
				<h3 style="font-size:16px; font-weight:bold; color:#707070;">담당 교수</h3>
				</div>
				<div class="col-6 pr-5 text-right" style="color:#707070;">김형민</div>
				</div>
				<div class="row pb-1 pl-1">
				<div class="col-6 pl-5">
				<h3 style="font-size:16px; font-weight:bold; color:#707070;">팀장</h3>
				</div>
				<div class="col-6 pr-5 text-right" style="color:#707070;">김원희</div>
				</div>
				<div class="row pl-1 pb-3">
				<div class="col-5 pl-5">
				<h3 style="font-size:16px; font-weight:bold; color:#707070;">팀원</h3>
				</div>
				<div class="col-7 pr-5 text-right" style="color:#707070;">권오규 김민주 김선범<br>박종원 윤용선</div>
				</div>
				<div class="row pt-2">
				<div class="col-1"></div>
				<div class="col-10">
				<button type="button" class="btn btn-block custom-btn" data-toggle="modal" data-target="#modifyModal">
  수정 요청
</button>
				</div>
				<div class="col-1"></div>
				</div>
              </div>
              </div>
                        <div class="card card-primary" style="min-width: 20%; width:30%; margin:30px 19px 50px 26px; box-shadow: none;border: 2px solid #E7E7E7;  border-radius: 0 !important;">
              <div class="card-header d-flex align-items-center justify-content-between" 
              style="background-color:#f5f5f5; height:60px;border:none;box-shadow: none; border-radius: 0 !important;">
                
                <h3 class="card-title" style="font-size:18px; width:120px;color:#707070;">2025-2학기</h3>

                <div class="card-tools d-flex justify-content-end align-items-center" style="width:300px;">
                <span style="font-weight:bold; color:#707070;">Global Impact Studio</span>	
                </div>
              </div>
              <div class="card-body p-0" style="width: 100%; height:450px;color:#707070;">
				<div class="row text-center p-2 mt-2">
				<div class="col-6">
				<h2 style="font-size:16px; font-weight:bold; color:#707070;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;시작기한</h2>
				</div>
				<div class="col-6">
				<h2 style="font-size:16px; font-weight:bold; color:#707070;">마감기한&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</h2>
				</div>
				</div>
				<div class="row text-center">
				<div class="col-6">
				<span style="font-size:18px; color:#707070;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2025-03-18</span>
				</div>
				<div class="col-6">
				<span style="font-size:18px; color:#707070;">2025-03-18&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
				</div>
				</div>
				<div class="row">
				<div class="col-10 mx-auto">
  <hr>
</div>
				</div>
				<div class="row p-2">
				<div class="col-12 pl-5">
				<h3 style="font-size:16px; font-weight:bold; color:#707070;">금주 제출현황</h3>
				</div>
				</div>
				<div class="row p-1">
				<div class="col-6 pl-5">
				<span style="color:#707070;">&nbsp;로드맵</span></div>
				<div class="col-5 d-flex justify-content-end">
				<span class=""style="font-weight:bold; color:#2ec4b6;">제출완료</span></div>
				</div>
				<div class="row p-1">
				<div class="col-6 pl-5">
				<span style="color:#707070;">&nbsp;피드백</span></div>
				<div class="col-5 d-flex justify-content-end">
				<span class="" style="font-weight:bold; color:#a6a6a6;">등록완료</span></div></div>
				
				<div class="row mx-0">
				<div class="col-12 px-0">
					<hr style="height: 1px; background-color: #E7E7E7; border: none; width: 100%;">
					</div>
					</div>
				<div class="row pb-1 pl-1">
				<div class="col-6 pl-5">
				<h3 style="font-size:16px; font-weight:bold; color:#707070;">담당 교수</h3>
				</div>
				<div class="col-6 pr-5 text-right" style="color:#707070;">김형민</div>
				</div>
				<div class="row pb-1 pl-1">
				<div class="col-6 pl-5">
				<h3 style="font-size:16px; font-weight:bold; color:#707070;">팀장</h3>
				</div>
				<div class="col-6 pr-5 text-right" style="color:#707070;">김원희</div>
				</div>
				<div class="row pl-1 pb-3">
				<div class="col-5 pl-5">
				<h3 style="font-size:16px; font-weight:bold; color:#707070;">팀원</h3>
				</div>
				<div class="col-7 pr-5 text-right" style="color:#707070;">권오규 김민주 김선범<br>박종원 윤용선</div>
				</div>
				<div class="row pt-2">
				<div class="col-1"></div>
				<div class="col-10">
				<button type="button" class="btn btn-block btn-secondary btn-flat" style="background-color: #e7e7e7; color:#707070; font-weight:bold;">로드맵</button>
				</div>
				<div class="col-1"></div>
				</div>
              </div>
              </div>
 
            </div>
                         <div class="row">
  <div class="col-12">
    <ul class="pagination justify-content-center mb-0">	
      <li class="page-item"><a class="page-link" href="#">«</a></li>
      <li class="page-item"><a class="page-link" href="#">1</a></li>
      <li class="page-item"><a class="page-link" href="#">2</a></li>
      <li class="page-item"><a class="page-link" href="#">3</a></li>
      <li class="page-item"><a class="page-link" href="#">»</a></li>
    </ul>
  </div>
</div>
  <script src="<%=request.getContextPath()%>/resources/bootstrap/plugins/jquery/jquery.min.js"></script>
  <script src="<%=request.getContextPath()%>/resources/bootstrap/plugins/moment/moment.min.js"></script>
  <script src="<%=request.getContextPath()%>/resources/bootstrap/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="<%=request.getContextPath()%>/resources/bootstrap/plugins/tempusdominus-bootstrap-4/js/tempusdominus-bootstrap-4.min.js"></script>

  <!-- 초기화 스크립트 -->
  <script>
    $(function () {
      $('#datetimepicker1').datetimepicker({
        format: 'L' // 날짜만 (MM/DD/YYYY 형식)
      });
    $('#datetimepicker2').datetimepicker({
        format: 'L'
      });
    });
    </script>
    <jsp:include page="modify.jsp" />
<script>
$(document).on('show.bs.modal', '.modal', function () {
	  $('body').css('padding-right', '0px');
	});
	$(document).on('hidden.bs.modal', '.modal', function () {
	  $('body').css('padding-right', '');
	});
</script>


</body>
