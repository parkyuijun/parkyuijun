<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%request.setCharacterEncoding("utf-8"); %>
<%response.setContentType("text/html; charset=UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://fonts.googleapis.com/css?family=Gugi&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Hi+Melody&display=swap" rel="stylesheet">
<style type="text/css">
	.member{
		font-family: 'Hi Melody', cursive;
	  font-size: 40px;
	  color: black;
	}
	
	*{
	  margin: 0;
	  padding: 0;
	  text-decoration: none;
	  font-family: montserrat;
	  box-sizing: border-box;
	}
	
	body{
	  min-height: 100vh;
	  background-image: linear-gradient(120deg,#3498db,#8e44ad);
	}
	
	.login-form{
	  width: 360px;
	  background: white;
	  height: 400px;
	  padding: 80px 40px;
	  border-radius: 10px;
	  position: absolute;
	  left: 50%;
	  top: 50%;
	  transform: translate(-50%,-50%);
	}
	
	.login-form h1{
	  text-align: center;
	  margin-bottom: -10px;
	}
	
	.txtb{
	  border-bottom: 2px solid #adadad;
	  position: relative;
	  margin: 30px 0;
	}
	
	.txtb input{
	  font-size: 15px;
	  color: #333;
	  border: none;
	  width: 100%;
	  outline: none;
	  background: none;
	  padding: 0 5px;
	  height: 40px;
	}
	
	.txtb span::before{
	  content: attr(data-placeholder);
	  position: absolute;
	  top: 50%;
	  left: 5px;
	  color: #adadad;
	  transform: translateY(-50%);
	  z-index: -1;
	  transition: .5s;
	}
	
	.txtb span::after{
	  content: '';
	  position: absolute;
	  width: 0%;
	  height: 2px;
	  background: linear-gradient(120deg,#3498db,#8e44ad);
	  transition: .5s;
	}
	
	.focus + span::before{
	  top: -5px;
	}
	.focus + span::after{
	  width: 100%;
	}
	
	.logbtn{
	  display: block;
	  width: 100%;
	  height: 50px;
	  border: none;
	  background: linear-gradient(120deg,#3498db,#8e44ad,#3498db);
	  background-size: 200%;
	  color: #fff;
	  outline: none;
	  cursor: pointer;
	  transition: .5s;
	  font-family: 'Hi Melody', cursive;
	  font-size: 20px;
	}
	.logbtn2{
	  display: block;
	  width: 100px;
	  height: 50px;
	  border: none;
	  background: linear-gradient(120deg,#3498db,#8e44ad,#3498db);
	  background-size: 200%;
	  color: #fff;
	  outline: none;
	  cursor: pointer;
	  transition: .5s;
	}
	
	.logbtn:hover{
	  background-position: right;
	}
	
	.bottom-text{
	  margin-top: 60px;
	  text-align: center;
	  font-size: 13px;
	}
	
	.sign{
	font-family: 'Hi Melody', cursive;
	  font-size: 15px;
		color: black;
		background: white;
		padding: 5px 10px;
	  border-radius: 5px;
	}
	.sign:hover{
		color:red;
	}
</style>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js" charset="utf-8"></script>
<script type="text/javascript">
	function regist(){
		location.href="LoginController.do?command=regist";
	}	
</script>
<title></title>

</head>
<body>
<form action="LoginController.do" method="post" class="login-form">
<input type="hidden" name="command" value="login" />
<h1 class="member">중&nbsp;&nbsp;고&nbsp;&nbsp;나&nbsp;&nbsp;라</h1>
<!--   <div id="wrap"> -->
<!--    <div class="form"> -->
<!--     <div class="form2"> -->
<!--      <div class="form3"> -->
<!--       <label for="user">아이디</label><input type="text" name="tid"> -->
<!--       <div class="clear"></div> -->
<!--       <label for="user">비밀번호</label><input type="password" name="tpassword"> -->
<!--      </div> -->
<!--     <input type="submit" value="로그인하기"> -->
<!--      <div class="clear"></div> -->
<!--      <div class="form4"> -->
<!--       <div class="clear"></div> -->
<!--       <label><input type="button" value="회원가입" onclick="regist()" ></label> -->
<!--      </div> -->
<!--     </div> -->
<!--    </div> -->
<!--   </div> -->
  
  
  
  <div class="txtb">
          <input type="text" name="tid">
          <span data-placeholder="Username"></span>
        </div>

        <div class="txtb">
          <input type="password" name="tpassword">
          <span data-placeholder="Password"></span>
        </div>

        <input type="submit" class="logbtn" value="로그인하기">
				<br>
        <div class="bottom-text">
<!--         	<input type="button" class="logbtn2" value="회원가입" onclick="regist()" > -->
        	<a href="#" onclick="regist()" class="sign">회원가입</a>
        </div>
  
  
 </form>
<script type="text/javascript">
      $(".txtb input").on("focus",function(){
        $(this).addClass("focus");
      });

      $(".txtb input").on("blur",function(){
        if($(this).val() == "")
        $(this).removeClass("focus");
      });

</script>
</body>
</html>