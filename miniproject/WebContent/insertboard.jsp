<%@page import="com.hk.dtos.LoginDto"%>
<%@page import="com.hk.dtos.BoardDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%request.setCharacterEncoding("utf-8"); %>
<%response.setContentType("text/html; charset=UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
<style type="text/css">
 table.type03 {
       border-collapse: collapse;
       
       text-align: left;
       line-height: 1.5;
       border-top: 1px solid #ccc;
       border-left: 3px solid #138535;
     margin : 20px 10px;
     
   }
   table.type03 th {
       width: 147px;
       padding: 10px;
       font-weight: bold;
       vertical-align: top;
       color: #138535;
       border-right: 1px solid #ccc;
       border-bottom: 1px solid #ccc;
   
   }
   table.type03 td {
       width: 700px;
       padding: 10px;
       vertical-align: top;
       border-right: 1px solid #ccc;
       border-bottom: 1px solid #ccc;
   }
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript" src="SE2/js/service/HuskyEZCreator.js" charset="utf-8"></script>
<script type="text/javascript">
//    $(function(){
      
   
//       $("#savebutton").click(function(){
//           //id가 smarteditor인 textarea에 에디터에서 대입
//           editor_object.getById["ir1"].exec("UPDATE_CONTENTS_FIELD", []);
           
//           // 이부분에 에디터 validation 검증
           
//           //폼 submit
//           $("form").submit(); 
//       })
//       })
    //탐색메서드: eq(),find(),prev(), next(), children(),parent()
   $(function(){
//       $("form").submit(function() {
//          var bool=true;
//          //[input,input,textarea]
//          $(this).find(".inputval").each(function(i){
//             if($(this).val()==""){
//                    //input -> td    -> th  -> text
//                alert($(this).parent().prev().text()+"를 입력하세요");
//                $(this).focus();
//                bool=false;
//                return false;
//             }
//          });
//          return bool;
//       });
      $("form").submit(function(){
         var bool=true;
         //[input,input,textarea]
         var inputs=$(this).find("#elel").children().filter("[name]");
         var content = document.getElementById("content").value;
         
         inputs.each(function(){
            if($(this).val()==""){
               alert($(this).parent().prev().text()+"를 입력하세요");
               $(this).focus();
               bool=false;
               return false;      
            
            }else if( content == ""  || content == null || content == '&nbsp;' || content == '<br>' || content == '<br />' || content == '<p>&nbsp;</p>')  {
                  //스마트 에디터 공백값 막기
               alert("내용을 입력하세요.");
                  oEditors.getById["content"].exec("FOCUS"); //포커싱
                  bool=false;
               return false;
            }
         });
         return bool;
      });
      
       //사진 첨부 파일   
      var upload = document.getElementsByTagName('input')[2],
       holder = document.getElementById('holder'),
       state = document.getElementById('status');

   if (typeof window.FileReader === 'undefined') {
     state.className = 'fail';
   } else {
     state.className = 'success';
     
   }
   
   upload.onchange = function (e) {
     e.preventDefault();

     var file = upload.files[0],
         reader = new FileReader();
     reader.onload = function (event) {
       var img = new Image();
       img.src = event.target.result;
       // note: no onload required since we've got the dataurl...I think! :)
       if (img.width > 800) { // holder width
         img.width = 800;
       }
       holder.innerHTML = '';
       holder.appendChild(img);
     };
     reader.readAsDataURL(file);

     return false;
   };
 
      
   })
   

</script>
<style type="text/css">
/*    #holder{text-align: center;} */
   img{max-width: 100%}
   td{width: 680px;}
</style>
</head>
<body>
<h1>게시글 추가하기</h1>
<form action="BoardController.do" method="post" enctype="multipart/form-data" name="PageForm">
<input type="hidden" name="id" value="${sessionScope.ldto.tid}"/>
<table class="type03">
   
   <tr>
      <th>아이디</th>
      <td>${sessionScope.ldto.tid}</td>
   </tr>
   <tr>
      <th>제목</th>
      <td id="elel"><input type="text" name="title" class="inputval"/></td>
   </tr>
   <tr>
      <td colspan="2"><input type="file" name="fileup" id="status" /></td>
   </tr>
   <tr>
      <th>이미지</th>
      <td id="holder"></td>
   <tr>
   <!-- 상품이미지 추가해야함 !! -->
   <tr>
      <th>내용</th>
      <td><textarea name="content" id="content" rows="20" cols="100" ></textarea></td>
   </tr>
   <tr>
      <td colspan="2">
         <input type="button" id="savebutton" value="글등록"/>
         <%
            String myboard=(String)session.getAttribute("myboard");
            if(myboard==null){
               %>
               <% 
            }else{
               %>
               <input type="button" value="목록" onclick="location.href='BoardController.do?command=boardlistpage2'"/>
               <% 
            }
               %>
         
      </td>
   </tr>
</table>

</form>
<script type="text/javascript">

var oEditors = [];
   nhn.husky.EZCreator.createInIFrame({
    oAppRef: oEditors,
    elPlaceHolder: "content",
    sSkinURI: "SE2/SmartEditor2Skin.html",
    fCreator: "createSEditor2",
       htParams: { fOnBeforeUnload : function(){}}

   
//     htParams: {
//        bUseToolbar:true,
//        bUseVerticalResizer:true,
//        bUseModeChanger:true
//     }
   });   
   $("#savebutton").click(function(){
       //id가 smarteditor인 textarea에 에디터에서 대입
       oEditors.getById["content"].exec("UPDATE_CONTENTS_FIELD", []);
        
       // 이부분에 에디터 validation 검증
        
       //폼 submit
       $("form").submit(); 
   })

</script>
</body>
</html>