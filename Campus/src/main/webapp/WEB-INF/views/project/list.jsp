<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<body style="font-size:10px;">
		<div class="card-header" style="border-bottom: none;">
  <h3 class="card-title ml-2 mt-2" style="font-size: 30px; font-weight: bold;">팀 목록</h3>
  <div class="card-tools">
    <button type="button" class="btn btn-primary btn-lg mt-2 mr-3"  style="background-color:#2ec4b6; border:none;">
    <span style="color: #ffffff;">팀 등록</span></button>
  </div>
</div>

<div class="mx-auto d-flex p-2 align-items-center" style="border: 1px solid #ced4da; font-size: 15px; width:1390px;">
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
<div class= "d-flex" style="widrh:100%; height:100%;">
<div class="card card-primary" style="min-width: 20%; width:30%; margin:30px 20px 50px 27px; border-radius: 0 !important;">
              <div class="card-header d-flex align-items-center justify-content-between" 
              style="background-color:#2ec4b6; height:60px; border-radius: 0 !important;">
                <h3 class="card-title">2025-2학기</h3>

                <div class="card-tools align-items-center">
                <span class="ml-auto"style="font-weight:bold; color:#ffffff;">Global Impact Studio</span>
                </div>
              </div>
              <div class="card-body" style="width: 30%;">
                <div class="chart"><div class="chartjs-size-monitor"><div class="chartjs-size-monitor-expand"><div class=""></div></div><div class="chartjs-size-monitor-shrink"><div class=""></div></div></div>
                  <canvas id="areaChart" style="min-height: 250px; height: 350px; max-height: 350px; max-width: 30%; display: block; width: 400px;" width="413" height="312" class="chartjs-render-monitor"></canvas>
                </div>
              </div>
              <!-- /.card-body -->
            </div>
            <div class="card card-primary" style="min-width: 20%%; width:30%; margin:30px 20px 50px 27px; border-radius: 0 !important;">
              <div class="card-header" style="background-color:#2ec4b6; border-radius: 0 !important;">
                <h3 class="card-title" style="height:30px;">2025-2학기</h3>

                <div class="card-tools">
                </div>
              </div>
              <div class="card-body" style="width: 30%;">
                <div class="chart"><div class="chartjs-size-monitor"><div class="chartjs-size-monitor-expand"><div class=""></div></div><div class="chartjs-size-monitor-shrink"><div class=""></div></div></div>
                  <canvas id="areaChart" style="min-width: 30%; min-height: 250px; height: 350px; max-height: 350px; max-width: 30%; display: block; width: 400px;" width="413" height="312" class="chartjs-render-monitor"></canvas>
                </div>
              </div>
              <!-- /.card-body -->
            </div>
            <div class="card card-primary" style="min-width: 20%; width:30%; margin:30px 20px 50px 27px; border-radius: 0 !important;">
              <div class="card-header" style="background-color:#2ec4b6; border-radius: 0 !important;">
                <h3 class="card-title" style="height:30px;">2025-2학기</h3>

                <div class="card-tools">
                </div>
              </div>
              <div class="card-body" style="width: 30%;">
                <div class="chart"><div class="chartjs-size-monitor"><div class="chartjs-size-monitor-expand"><div class=""></div></div><div class="chartjs-size-monitor-shrink"><div class=""></div></div></div>
                  <canvas id="areaChart" style="min-height: 250px; height: 350px; max-height: 350px; max-width: 30%; display: block; width: 400px;" width="413" height="312" class="chartjs-render-monitor"></canvas>
                </div>
              </div>
              <!-- /.card-body -->
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
</body>
