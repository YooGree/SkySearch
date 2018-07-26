<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<!doctype html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7" lang=""> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8" lang=""> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9" lang=""> <![endif]-->
<!--[if gt IE 8]><!-->
<html class="no-js" lang="">
<!--<![endif]-->
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>Sufee Admin - HTML5 Admin Template</title>
<meta name="description" content="Sufee Admin - HTML5 Admin Template">
<meta name="viewport" content="width=device-width, initial-scale=1">

</head>
<script type="text/javascript"
	src="<c:url value='/resources/assets/js/lib/chart-js/Chart.bundle.js'/>"></script>
<script>
	
</script>
<body>
      <div class="breadcrumbs">
            <div class="col-sm-4">
                <div class="page-header float-left">
                    <div class="page-title">
                        <h1>Dashboard</h1>
                    </div>
                </div>
            </div>
            <div class="col-sm-8">
                <div class="page-header float-right">
                    <div class="page-title">
                        <ol class="breadcrumb text-right">
                            <li class="active">Dashboard</li>
                        </ol>
                    </div>
                </div>
            </div>
        </div>
        
           <div class="row">
           </div>

            <div class="col-xl-12">
                <div class="card">
                <div class="card-header"><%--별점/ 평점/ 가입자수 버튼  --%>
               				<strong class="card-title" >manageChart</strong>
							<input type="submit"
								class="btn btn-primary" value='도시별 조회 수'
								onclick="selecta('view');hide_periodButton(true);"
								style="float: right;">
               				<button type="button" class="btn btn-secondary mb-1"
								data-toggle="modal" data-target="#mediumModal" onclick="selecta('star');hide_periodButton(false);"
								style="float: right;">도시별 평균 별점</button>
               				<input type="submit"
								class="btn btn-primary" value='가입자 수'
								onclick="selecta('month');show_periodButton();"
								style="float: right;">
						</div>
                    <div class="card-body">
                        <div class="row">
                            <div class="col-sm-4">
                                <h4 class="card-title mb-0" id="chartTitle">가입자 수</h4>
                            </div>
                            <br>
                            <%--차트 day/ month/ year 선택 버튼  --%>
                            <div class="col-sm-8 hidden-sm-down" id="afafaf">
                                <div class="btn-toolbar float-right" role="toolbar" aria-label="Toolbar with button groups">
                                    <div class="btn-group mr-3" data-toggle="buttons" aria-label="First group">
                                        <label class="btn btn-outline-secondary"  onclick="selecta('day')">
                                            <input type="radio" name="options" id="option1"> Day
                                        </label>
                                        <label class="btn btn-outline-secondary active" onclick="selecta('month')">
                                            <input type="radio" name="options" id="option2" checked > Month
                                        </label>
                                        <label class="btn btn-outline-secondary" onclick="selecta('year')">
                                            <input type="radio" name="options" id="option3" > Year
                                        </label>
                                    </div>
                                </div>
                            </div><!--/.col-->


                        </div><!--/.row-->
                        <div class="col-sm-12" >
                        <div class="chart-wrapper mt-12" ><%--chart 만들어지는곳  --%>
                            <canvas id="trafficChart" style="height:200px; width:400px" height="200" width="400"></canvas>
                        </div>
                        </div>

                    </div>
                    
                     
                    
                </div>

                
                <%-- 문의사항 리스트 불러오기 --%>
                 <div class="col-sm-12">

				      <table class="table table-striped table-bordered table-hover"
				         id="bootstrap-data-table">
				         <thead>
				            <tr>
				               <th>NAME</th>
				               <th>PHONE</th>
				               <th>EMAIL</th>
				               <th>ENABLE</th>
				               <th>DISABLE</th>
				            </tr>
				         </thead>
				         <tbody>
				            <c:forEach items="${resultList}" var="resultData" varStatus="loop">
				               <tr class="${(loop.index+1)%2 == 2 ? 'odd gradeX' : 'even gradeC'}">
				                  <td>${resultData.NAME}</td>
				                  <td>${resultData.PHONE}</td>
				                  <td><a
				                     href="<c:url value="/manage/contact/read?CONTACTUS_SEQ=${resultData.CONTACTUS_SEQ}" />">${resultData.EMAIL}</a></td>
				                  <td>${resultData.ENABLE}</td>
				                  <td><a
				                     href="<c:url value="/manage/contact/disable?CONTACTUS_SEQ=${resultData.CONTACTUS_SEQ}" />">disable</a></td>
				               </tr>
				            </c:forEach>
				         </tbody>
				      </table>
				   </div>
            </div>


    
    <%-- chart js set --%>
    <script>
    var chartData = {};
    var labelSet =[0];
    var dataSet = [0];
    var totalmember =[0];
    var destoryCnt = false;
    var ctx;
    var max=0;
    
    const brandSuccess = '#4dbd74'
    const brandInfo = '#63c2de'
    const brandDanger = '#f86c6b'

    function convertHex (hex, opacity) { // hex to rgb
      hex = hex.replace('#', '')
      const r = parseInt(hex.substring(0, 2), 16)
      const g = parseInt(hex.substring(2, 4), 16)
      const b = parseInt(hex.substring(4, 6), 16)

      const result = 'rgba(' + r + ',' + g + ',' + b + ',' + opacity / 100 + ')'
      return result
    }

 	function hide_periodButton(a){// day month year 버튼 숨김
 		$("#afafaf").hide();
 		if(a){
 			$("#chartTitle").text("도시별 조회 수");
 		}else{
 			$("#chartTitle").text("도시별 별점  평균");
 		}
 		
 	}
 	function show_periodButton(){ // day month year 버튼 보이게
 		$("#afafaf").show();
 		$("#option2").click();
 		$("#chartTitle").text("가입자수 ");
 	}
    
    function respondCanvas(data) { //처음 차트 생성
    	ctx = new Chart(document.getElementById("trafficChart").getContext("2d"),data);
    }
    $(document).ready(function() {// 화면 시작시 데이터 ajax로 가져와서 dataset 생성
        GetChartData("<c:url value='/ws/memberChartM' />");
    });
    
    function addData(ctx, data, datasetIndex, labelSet) {// 각 버튼클릭시 차트 데이터를 받아 업데이트
    	if(datasetIndex !=5){
    	   ctx.data.datasets[datasetIndex].data = data.data.datasets[datasetIndex].data;
    	   ctx.data.datasets[datasetIndex+1].data = data.data.datasets[datasetIndex+1].data;
    	   ctx.options.scales.yAxes[0].ticks.max=totalmember[1]+40;
    	}else{
    		ctx.data.datasets[0].data = data.data.datasets[0].data;
    		ctx.data.datasets[1].data = null;
    		ctx.options.scales.yAxes[0].ticks.max = max+5;
    	}
    	   ctx.data.labels = labelSet;
    	   ctx.update();
    	}
    function selecta(period){// 각각의 버튼마다 차트 데이터를 따로 가져옴
    	if(period=='day'){
    		 GetChartData("<c:url value='/ws/memberChartD' />");
    	}else if(period=='month'){
    		 GetChartData("<c:url value='/ws/memberChartM' />");
    	}else if(period=='year'){
    		 GetChartData("<c:url value='/ws/memberChartY' />");
    	}else if(period=='view'){
    		GetCiChartData("<c:url value='/ws/memberChartV' />");
    	}else if(period=='star'){
    		GetCiChartData("<c:url value='/ws/memberChartS' />");
    	}
    }
    
    var GetCiChartData = function (url,params) { // 별점 평점 차트 데이터 셋 생성
        $.ajax({
            url : url,
            type: 'POST',
            data : params,
            success: function(data) {
            	 labelSet =[];
            	 dataSet = [];
            	 totalmember =[0];
	           	 if ("${resultMap}" != "") {//index 첫화면 멤버
	                    $.each(
	                       data,
	                       function(i, item) {
	                     	   labelSet.push(item.CITY_NAME);
	                           dataSet.push(item.CITY_VIEWS);
	                       });
	                 }
	           	 max= 0;
	           	 for(var i = 0; i < dataSet.length; i++){
	           		 if(dataSet[i]>max)max=dataSet[i]; 
	           	 }
	           	chartData = {
            	        type: 'bar',
            	        data: {
            	            labels: labelSet,
            	            datasets: [
            	            {
            	              label: '',
            	              backgroundColor: convertHex(brandInfo, 10),
            	              borderColor: brandInfo,
            	              pointHoverBackgroundColor: '#fff',
            	              borderWidth: 2,
            	              data: dataSet	
            	          }
            	          ]
            	        },
            	        options: {
            	           /*  maintainAspectRatio: true,
            	            legend: {
            	                display: false
            	            }, */
            	            responsive: true,
            	            scales: {
            	                xAxes: [{
            	                  gridLines: {
            	                    drawOnChartArea: false
            	                  }
            	                }],
            	                yAxes: [ {
            	                      ticks: {
            	                        beginAtZero: true,
            	                        maxTicksLimit: 5,
            	                        stepSize: Math.ceil(250 / 5),
            	                        max: max+5
            	                      },
            	                      gridLines: {
            	                        display: true
            	                      }
            	                } ]
            	            }
            	        }
            	    };
            	addData(ctx, chartData, 5, labelSet);
            	
            },
             error : function(xhr, status, exception) {
                alert("Failure \n (" + status + ")");
                return false;
             }
        });
    };
    
    
    var GetChartData = function (url,params) {// 가입자수 차트 데이터 셋 생성
        $.ajax({
            url : url,
            type: 'POST',
            data : params,
            success: function(data) {
            	 labelSet =[];
            	 dataSet = [];
            	 totalmember =[0];
	           	 if ("${resultMap}" != "") {//index 첫화면 멤버
	                    $.each(
	                       data,
	                       function(i, item) {
	                    	   if(item.ym != undefined){
	                     	   labelSet.push(item.ym);
	                           dataSet.push(item.counts);
	                    	   }else{
	                    		   totalmember.push(item.countT);
	                    	   }
	                       });
	                 }
	           	 for(var i = 0; i< labelSet.length; i++){
	           		totalmember[i]=totalmember[1];
	           	 }
	           	 
	           	chartData = {
            	        type: 'line',
            	        data: {
            	            labels: labelSet,
            	            datasets: [
            	            {
            	              label: '',
            	              backgroundColor: convertHex(brandInfo, 10),
            	              borderColor: brandInfo,
            	              pointHoverBackgroundColor: '#fff',
            	              borderWidth: 2,
            	              data: dataSet	
            	          },
            	          {
            	              label: '총 가입자수',
            	              backgroundColor: 'transparent',
            	              borderColor: brandDanger,
            	              pointHoverBackgroundColor: '#fff',
            	              borderWidth: 1,
            	              borderDash: [8, 5],
            	              data: totalmember 
            	          } 
            	          ]
            	        },
            	        options: {
            	            maintainAspectRatio: true,
            	            legend: {
            	                display: false
            	            },
            	            responsive: true,
            	            scales: {
            	                xAxes: [{
            	                  gridLines: {
            	                    drawOnChartArea: false
            	                  }
            	                }],
            	                yAxes: [ {
            	                      ticks: {
            	                        beginAtZero: true,
            	                        maxTicksLimit: 5,
            	                        stepSize: Math.ceil(250 / 5),
            	                        max: totalmember[1]+40
            	                      },
            	                      gridLines: {
            	                        display: true
            	                      }
            	                } ]
            	            }
            	        }
            	    };
            	if(!destoryCnt){
	               respondCanvas(chartData);
	               destoryCnt=true;
            	}else if(destoryCnt){
            		addData(ctx, chartData, 0, labelSet);
            	}
            },
             error : function(xhr, status, exception) {
                alert("Failure \n (" + status + ")");
                return false;
             }
        });
    };

        


    </script>
</body>
</html>
