<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}" />
<link rel="style.css">
<script>

$(document).ready(function() {
		
	if("${sidebar}" == "donation"){
		getList(1);
	}else if("${sidebar}" == "attention"){
		getList(1);
	}else if("${sidebar}" == "articlelist"){
		getList(1);
	}else if("${sidebar}" == "parcel"){
		getList(1);
	}else if("${sidebar}" == "volunteer"){
		getList(1);
	}else{
		getList1(1);
	}
	$("#searchBtn").click(function() {
		
		getList1(1);
		//$(".mvform").attr("action","${root}/sidebar/"+$(this).attr("value")+".animal").submit();
		
	});
	$(".w3-bar-item").click(function() {
		$(".acode").attr("value",$(this).attr("value"));
		$(".mvform").attr("action","${root}/sidebar/"+$(this).attr("value")+".animal").submit();
		
	});
	
	
	
	
	
	$(".movepage").click(function() {
		moveBoard('${bcode}', $(this).attr("mv-page-no"), '${key}', '${word}', 'list');
		getList($(this).attr("mv-page-no"));
	});
	
	$(".page-item").click(function() {
		if("${sidebar}" == "side"){
			getList1(1);
		}else{
			getList(1);
		}
		
	});
});

function getList(pg) {
	$.ajax({
		type : "POST",
		url : "${root}/sidebar/attention.animal",
		dataType : "json",
		data : {"sidebar": "sidebar","pg":pg},
		success : function(data) {
			if("${sidebar}" == "donation"){
				makedonationList(data);
			}else if("${sidebar}" == "attention"){
				makeattentionList(data);
			}else if("${sidebar}" == "articlelist"){
				makearticleList(data);
			}else if("${sidebar}" == "parcel"){
				makeparcelList(data);
			}else if("${sidebar}" == "volunteer"){
				makevolunteerList(data);
			}
			
			
		},
		error : function(e) {
			
		}
	});
}
function getList1(pg) {

	$.ajax({
		type : "POST",
		url : "${root}/sidebar/attention.animal",
		dataType : "json",
		data : {"sidebar":"side","pg":$(this).attr("pg")},
		success : function(data) {
			if("${sidebar}" == "donation"){
				makedonationList(data);
			}else if("${sidebar}" == "attention"){
				makeattentionList(data);
			}else if("${sidebar}" == "articlelist"){
				makearticleList(data);
			}else if("${sidebar}" == "parcel"){
				makeparcelList(data);
			}else if("${sidebar}" == "volunteer"){
				makevolunteerList(data);
			}
		},
		error : function(e) {
			
		}
	});
}


function makedonationList(data){
	var view=$(".container-fluid");
	var members = data.members;
	//alert(member.length);	//회원수 출력 :120
	var viewlist="";

	for(var i=0;i<members.length ;i++){
		if(i%2==0){

			viewlist += "<div class='container'>";
			viewlist += "<div class='row'>";
			viewlist +=	"<div class='col-md-5 info-big'>";
			viewlist +=	"<h2>"+members[i].centername +"</h2>";
			viewlist +=	"<div class='dntContent'>";		
			viewlist +=	"<p><b> 목표 후원 금액 </b> : "+ members[i].cdonationfee + "</p>";		
			viewlist +=	"<hr>";		
			viewlist +=	"<p style='text-align: center;'>";		
			viewlist +=	 members[i].cdonationpurpose;	
			viewlist +=  "</p>";
			viewlist +=		"<hr>";
			viewlist +=			"</div>";
			viewlist +=			"<p><strong>현재 모금액</strong></p>";
			viewlist +=			"<div class='progress'>";
			viewlist +=			"<div class='progress-bar progress-bar-striped progress-bar-animated' style='width:"+members[i].gatheringfee/members[i].cdonationfee*100 +"%'>"+members[i].gatheringfee +"</div>";	
			viewlist +=			"</div>";
			viewlist +=	"</div>";
			viewlist +=	"<div class='col-sm-2'></div>";
			viewlist +=	"<div class='col-md-5'>";
			viewlist +=	"<img class='view-img' src='https://images.unsplash.com/photo-1538318514451-db4272ee0fc8?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=9645b44503489a0d6832693f91e1d48b&auto=format&fit=crop&w=1350&q=80'>";	
			viewlist +=	"</div>";
			viewlist += "</div>";
			viewlist +="</div>";
			viewlist +="<br>";	
			viewlist +="<hr>";	
			viewlist +="<br>";
		}else{
			viewlist += "<div class='container'>";
			viewlist += "<div class='row'>";
			viewlist +=	"<div class='col-md-5'>";
			viewlist +=	"<img class='view-img' src='https://images.unsplash.com/photo-1538318514451-db4272ee0fc8?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=9645b44503489a0d6832693f91e1d48b&auto=format&fit=crop&w=1350&q=80'>";	
			viewlist +=	"</div>";
			viewlist += "<div class='col-sm-2'></div>";
			viewlist +=	"<div class='col-md-5 info-big'>";
			viewlist +=	"<h2>"+members[i].centername +"</h2>";
			viewlist +=	"<div class='dntContent'>";		
			viewlist +=	"<p><b> 목표 후원 금액 </b> : "+ members[i].cdonationfee + "</p>";		
			viewlist +=	"<hr>";		
			viewlist +=	"<p style='text-align: center;'>";		
			viewlist +=	 members[i].cdonationpurpose;	
			viewlist +=  "</p>";
			viewlist +=		"<hr>";
			viewlist +=			"</div>";
			viewlist +=			"<p><strong>현재 모금액</strong></p>";
			viewlist +=			"<div class='progress'>";
			viewlist +=			"<div class='progress-bar progress-bar-striped progress-bar-animated' style='width:"+members[i].gatheringfee/members[i].cdonationfee*100 +"%'>"+members[i].gatheringfee +"</div>";	
			viewlist +=			"</div>";
			viewlist +=	"</div>";
			viewlist +=	"</div>";			
			viewlist += "</div>";
			viewlist +="</div>";
			viewlist +="<br>";	
			viewlist +="<hr>";	
			viewlist +="<br>";
			 
		}
		
      

	}
	
	view.append(viewlist);
}


function makeattentionList(data){
	$("#main").empty();
	var view=$("#main");
	var members = data.members;
	//alert(member.length);	//회원수 출력 :120
	var viewlist="";
	
	for(var i=0;i<members.length ;i++){
		viewlist +="<table>";	
		viewlist +="</table>";
		viewlist +="</div>";
		viewlist += "<div class='col-lg-4 col-sm-6' style='padding: 10px; padding-left: 0px;' >";
		viewlist += "<div class='card h-100'>";
		viewlist +=  "<a href='#'><img class='card-img-top' src='https://images.unsplash.com/photo-1532762471988-c0d67cc3f771?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=3d173da6e6d69a0d8a77fbc3707088c9&auto=format&fit=crop&w=1114&q=80'></a>";
		viewlist +=  "<div class='card-body'>";
		viewlist +=   "<h4 class='card-title'>"; 
		viewlist +=      "<a href='#'>"+members[i].subject+"</a>";
		viewlist +=   "</h4>";
		viewlist +=    "<p class='card-text'>	 <b>품종 :</b> "+members[i].kind+"</p>";
		viewlist +=    "<p class='card-text'>	 <b>나이 :</b> "+members[i].age+"	</p>";
		viewlist +=    "<p class='card-text'>	 <b>체중 :</b> "+members[i].weight+"	</p>";
		viewlist +=    "<p class='card-text'>	 <b>위치 :</b> "+members[i].location+"	</p>";
		viewlist +=  "</div>";
		viewlist += "</div>";
      

	}
	
	view.append(viewlist);
}
function makearticleList(data) {
	$("#listview").empty();
	var view=$("#listview");
	var members=data.members;//{"members" : [{}, {}, {} ...]}
	for(var i=0;i<members.length;i++) {
		var tr = $("<tr></tr>").						
						append($("<td></td>").text(members[i].email)).
					   append($("<td></td>").text(members[i].seq)).
					   append($("<td></td>").text(members[i].subject)).
					   append($("<td></td>").text(members[i].boardtype)).
					   append($("<td></td>").text(members[i].joindate)).
					   append($("<td></td>").text(members[i].hit));
		
		
		$("#listview").append(tr);
	}
}
function makeparcelList(data){
	var view=$("#main");
	var members = data.members;
	//alert(member.length);	//회원수 출력 :120
	var viewlist="";
// 	$("#main").empty();
// 	var members = data.members;
	for(var i=0;i<members.length ;i++){
		viewlist +="<table>";	
		viewlist +="</table>";
		viewlist +="</div>";
		viewlist += "<div class='col-lg-4 col-sm-6' style='padding: 10px; padding-left: 0px;' >";
		viewlist += "<div class='card h-100'>";
		viewlist +=  "<a href='#'><img class='card-img-top' src='https://images.unsplash.com/photo-1532762471988-c0d67cc3f771?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=3d173da6e6d69a0d8a77fbc3707088c9&auto=format&fit=crop&w=1114&q=80'></a>";
		viewlist +=  "<div class='card-body'>";
		viewlist +=   "<h4 class='card-title'>"; 
		viewlist +=      "<a href='#'>"+members[i].subject+"</a>";
		viewlist +=   "</h4>";
		viewlist +=    "<p class='card-text'>	 <b>품종 :</b> "+members[i].kind+"</p>";
		viewlist +=    "<p class='card-text'>	 <b>나이 :</b> "+members[i].age+"	</p>";
		viewlist +=    "<p class='card-text'>	 <b>체중 :</b> "+members[i].weight+"	</p>";
		viewlist +=    "<p class='card-text'>	 <b>위치 :</b> "+members[i].location+"	</p>";
		viewlist +=  "</div>";
		viewlist += "</div>";
      

	}
	
	view.append(viewlist);
}
function makevolunteerList(data){
	var view=$(".container-fluid");
	var members = data.members;
	//alert(member.length);	//회원수 출력 :120
	var viewlist="";

	for(var i=0;i<members.length ;i++){
		if(i%2==0){

			viewlist += "<div class='container'>";
			viewlist += "<div class='row'>";
			viewlist +=	"<div class='col-md-5 info-big'>";
			viewlist +=	"<h2>"+members[i].centername +"</h2>";
			viewlist +=	"<div class='dntContent'>";		
			viewlist +=	"<p>"+ members[i].subject + "</p>";		
			viewlist +=	"<hr>";		
			viewlist +=	"<p>봉사종류 :";		
			viewlist +=	 members[i].volunteerkind;	
			viewlist +=  "</p>";
			viewlist +=		"<hr>";
			viewlist +=	"<p>";		
			viewlist +=	 members[i].volunteerdate;	
			viewlist +=  "</p>";
			viewlist +=		"<hr>";
			viewlist +=	"<p>";		
			viewlist +=	 members[i].centerlocation;	
			viewlist +=  "</p>";
			viewlist +=		"<hr>";
			viewlist +=	"<p'>";		
			viewlist +=	 members[i].tel;	
			viewlist +=  "</p>";
			viewlist +=			"</div>";
			viewlist +=			"</div>";
			viewlist +=			"<p></p>";
			viewlist +=	"<div class='col-sm-2'></div>";
			viewlist +=	"<div class='col-md-5'>";
			viewlist +=	"<img class='view-img' src='https://images.unsplash.com/photo-1538318514451-db4272ee0fc8?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=9645b44503489a0d6832693f91e1d48b&auto=format&fit=crop&w=1350&q=80'>";	
			viewlist +=	"</div>";
			viewlist += "</div>";
			viewlist +="</div>";
			viewlist +="<br>";	
			viewlist +="<hr>";	
			viewlist +="<br>";
		}else{
			viewlist += "<div class='container'>";
			viewlist += "<div class='row'>";
			viewlist +=	"<div class='col-md-5'>";
			viewlist +=	"<img class='view-img' src='https://images.unsplash.com/photo-1538318514451-db4272ee0fc8?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=9645b44503489a0d6832693f91e1d48b&auto=format&fit=crop&w=1350&q=80'>";	
			viewlist +=	"</div>";
			
			
			viewlist +=	"<div class='col-sm-2'></div>";
			viewlist +=	"<div class='col-md-5 info-big'>";
			viewlist +=	"<h2>"+members[i].centername +"</h2>";
			viewlist +=	"<div class='dntContent'>";		
			viewlist +=	"<p>"+ members[i].subject + "</p>";		
			viewlist +=	"<hr>";		
			viewlist +=	"<p style='text-align: center;'>";		
			viewlist +=	 members[i].volunteerkind;	
			viewlist +=  "</p>";
			viewlist +=		"<hr>";
			viewlist +=	"<p>";		
			viewlist +=	 members[i].volunteerdate;	
			viewlist +=  "</p>";
			viewlist +=		"<hr>";
			viewlist +=	"<p>";		
			viewlist +=	 members[i].centerlocation;	
			viewlist +=  "</p>";
			viewlist +=		"<hr>";
			viewlist +=	"<p>";		
			viewlist +=	 members[i].tel;	
			viewlist +=  "</p>";
			viewlist +=			"</div>";
			viewlist +=			"</div>";
			viewlist +=			"<p></p>";
			viewlist += "</div>";
			viewlist +="</div>";
			viewlist +="<br>";	
			viewlist +="<hr>";	
			viewlist +="<br>";
			 
		}
		
      

	}
	
	view.append(viewlist);
}
</script>

<!-- Sidebar/menu -->
<nav class="w3-sidebar w3-collapse w3-white w3-animate-left" style=" background-color:#EEEEEE; z-index:3;width:300px;" id="mySidebar"><br>
  <div class="w3-container">
    <a href="#" onclick="w3_close()" class="w3-hide-large w3-right w3-jumbo w3-padding w3-hover-grey" title="close menu">
      <i class="fa fa-remove"></i>
    </a>
    <img src="../img/p1.jpg" style="width:45%;" class="w3-round"><br><br>
    <h4><b>kjhabc2002@naver.com</b></h4>
    <p class="w3-text-grey">Template by W3.CSS</p>
  </div>
  <div class="w3-bar-block">
    <a href="../mypage/myinfolist.jsp" onclick="w3_close()" class="w3-bar-item w3-button w3-padding w3-text-teal">내 정보보기</a> 
     <a value="attention" class="w3-bar-item" pg="1">관심동물보기</a> 
    <a value="articlelist" class="w3-bar-item">내가 쓴 글</a> 
    <a value="donation" class="w3-bar-item">후원내역</a>
    <a value="parcel" class="w3-bar-item">분양신청내역</a>
  </div>

</nav>
