<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <title>후원신청</title> 
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">
  <link rel='stylesheet' href='http://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css'>
     <link rel="stylesheet" href="css/regStyle.css">
   
    <script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
    <script  src="js/reg.js"></script>
<style>
.button1 {
    background-color: white;
    color: black;
    border: 2px solid #555555;
}
.button {
    background-color: #008CBA; 
    border: none;
    color: white;
    padding: 16px 32px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 16px;
    margin: 4px 2px;
    -webkit-transition-duration: 0.4s;
    transition-duration: 0.4s;
    cursor: pointer;
    float:right;
}
h1:after{
  content: "";
        display: block;
        width: 60px;
        border-bottom: 2px solid #bcbcbc;
        margin:auto;
}
.form-control{
	margin:auto;
	width:80%;
}
</style>


</head>

<body>

  
<div class="container" id="dntModal">
  <form>    
   <div style="text-align:center;">
      <h1>자원봉사신청</h1></div>
     <div class="row">
      <div class="col-half">
     <h4>신청자 이름:</h4>
      <input type="text">
      </div> 
    </div>
    
    <div class="row">
      <div class="col-half">
     <h4>신청자 이메일 :</h4>
      <input type="text">
      </div> 
    </div>
    
    <div class="row">
      <div class="col-half">
     <h4>신청자 전화번호:</h4>
      <input type="text">
      </div> 
    </div>
    
    <div class="row">
     <div class="col-half">
     <h4>센터 이름 :</h4>
      <select class="form-control">
				    <option selected>희망이네 보호소</option>
				    <option>구로디지털단지 보호소</option>
				    <option>용인보호소</option>
				    <option>강릉보호소</option>
				  </select>
      </div>
      </div>
      <div class="row">
      <div class="col-half">
     <h4>봉사종류 :</h4>
      <select class="form-control">
				    <option selected>산책봉사</option>
				    <option>청소봉사</option>
				    <option>미용봉사</option>
				    <option>목욕봉사</option>
				  </select>
      </div>
      </div>
      
      <div class="row">
      <div class="col-half">
     <h4>봉사일시 :</h4>
     <div class="input-group">
     	<div class="col-third">
            <input type="text" placeholder="YYYY"/>
          </div>
          <div class="col-third">
            <input type="text" placeholder="MM"/>
          </div>
          <div class="col-third">
            <input type="text" placeholder="DD"/>
          </div>
          
        </div>
      </div>
      </div>
      
      <div class="row">
      <div class="col-half">
     <h4>신청목적 :</h4>
      <textarea rows="3" cols="50"></textarea>
      </div> 
    </div>
    <div class="row">     
    </div>
   <div class="row" style="margin-top:5%">
	<button class="button button1">신청하기</button> 
   </div>
     
  </form>
</div>


</body>

</html>
