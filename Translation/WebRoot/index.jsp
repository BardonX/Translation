<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>Java 开发多国语言互译系统</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	 <!-- 
      margin:外边距   上左右下  margin:100px auto 0   auto是相等      margin: 20px 0 ;上下  左右 
      padding:内边距---不设置有默认值
      -->
	<meta charset="utf-8"/>
	     <style>
	          *{margin:0;padding=0;}
	          body{background:url(img/bg.jpg)no-repeat;}
	          /* S head*/
	          #head{width; 100%; height: 60px; background:rgba(0,0,0,.2); text-align:
	          center; line-height: 60px; color:#FF0099; font-size:24px;}
	          /* E head*/
	          
	          /* S content*/
	          #content{width: 624px; height:363px; margin:100px auto 0}/*border:1px solid red;*/
	          #text{width: 624px; height: 38px; padding: 20px; border: 4px solid rgba(141,139,136,.4);
	          outline: none; font-size: 18px; color: #555; background: rgba(0,0,0,.2);}/*border: 4px solid rgba(141,139,136,.4);*/
	          .center{width: 100%; height: 40px; margin: 20px 0;}/*//border:1px solid red; 用于调整位置*/
	          select{width: 180px; height: 40px; font-size: 18px; padding-left: 20px; margin-left: 20px }
	          .center img{margin:0 0 -10px 20px;}
	          #btn{width: 120px; height: 40px; background: #7dcce4; display: inline-block;
	           text-align:center; line-height: 40px; text-decoration: none; color: #fff; 
	           margin-left: 20px;}
	          #result{width: 576px; height: 149px; border:4px solid rgba(141,139,136,.4); padding: 20px; position: 
	           relative}/*background: red;*/
	          .audio{width: 19px; height: 17px; background: url(img/sound-1.png);position: absolute;bottom: 10px; left:10px;
	           cursor: pointer;}
	          .audio:hover{background: url(img/sound-2.png);}
	          /* E content*/
	     </style>
  </head>
  
  <body>
  <!-- 
      margin:外边距   padding:内边距
   -->
   <!-- S head -->
   <div id="head"> Java 开发多国语言互译系统</div>
   <!-- E head -->
   
   
   <!-- S content --> 
   <div id="content">
     <input id="text" />
     <div class="center">
         <select name="from" id="from">
             <option value="auto">智能识别</option>
	             <option value="zh">中文</option>
	             <option value="wyw">文言文</option>
	             <option value="yue">粤语</option>
	             <option value="en">英语</option>
	             <option value="ru">俄语</option>
	             <option value="de">德语</option>
	             <option value="jp">日语</option>
	             <option value="kor">韩语</option>
	             <option value="fra">法语</option>
	             <option value="th">泰语</option>
	             <option value="ara">阿拉伯语</option>
	             <option value="pt">葡萄牙语</option>
         </select>
         <img alt="右箭头" src="img/sign_in.png">
         <select name="to" id="to">
	             <option value="zh">中文</option>
	             <option value="wyw">文言文</option>
	             <option value="yue">粤语</option>
	             <option value="en">英语</option>
	             <option value="ru">俄语</option>
	             <option value="de">德语</option>
	             <option value="jp">日语</option>
	             <option value="kor">韩语</option>
	             <option value="fra">法语</option>
	             <option value="th">泰语</option>
	             <option value="ara">阿拉伯语</option>
	             <option value="pt">葡萄牙语</option>
         </select>
           <a href="javascript:query();" id="btn" onclick="query()">翻译</a>
     </div>
     <div id="result">
              <div class="audio"></div>
     </div>
   </div>
   <!-- E content -->
   <script type="text/javascript" src="js/jquery-3.1.1.min.js"></script>
   <script type="text/javascript">
       //alert(1);
       function query(){
    	   var text = $("#text").val();
    	   var from = $("#from").val();
    	   var to = $("#to").val();
    	   $.ajax({
    		   type:"post",
    		   url:"query",
    		   data:{"query":text,
    			     "from": from,
    			     "to": to},
    		   success:function(data){
    			  var StringJson = $.parseJSON(data);
    			  var content =(StringJson.trans_result)[0].dst;
    			  //音频标签
    			  $("#result").html(content+"<div class='audio'></div>");
    			  str = content.replace(/\s+/g,"_");
    			  if(to=="wyw"){
    				  to="zh";
    			  }else if(to=="yue"){
    				  to="cte";
    			  }
    			  //音频标签
    			  $(".audio").click(function(){
    				  var obj1 =$('<audio src=http://fanyi.baidu.com/gettts?lan='+to+'&text='+str+'&spd=5&source=web autoplay></audio>');
    				  //地址有误
    				  //var obj = $('<audio src=http://fanyi.baidu.com/gettts?lan='+to+'&text='+str+'&spd=5&source=web autoplay></audio>');
    				  $("audio").remove();
    				  $("body").append(obj1);
    			  });
    		   }
    	   });
       }
       $(document).keydown(function(event){
    	   //回车事件
    	   if(event.keyCode==13){
    		   query();
    	   }
       });
   </script>
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
  </body>
</html>
