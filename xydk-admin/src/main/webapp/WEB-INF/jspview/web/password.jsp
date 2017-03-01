<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
      <%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="f"%>
      <%@ taglib uri="http://java.sun.com/jsp/jstl/functions"  prefix="fn"%> 
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>我的生活</title>
    <meta name="viewport" content="initial-scale=1, maximum-scale=1">
    <link rel="shortcut icon" href="/favicon.ico">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">

    <link rel="stylesheet" href="//g.alicdn.com/msui/sm/0.6.2/css/sm.min.css">
    <link rel="stylesheet" href="//g.alicdn.com/msui/sm/0.6.2/css/sm-extend.min.css">
 	<style type="text/css">
 	body{
 	font-family: "Microsoft YaHei","WenQuanYi Micro Hei","Helvetica Neue",Arial,sans-serif;
 	}
		
	</style>
  </head>
  <body>
   <form action="/web/dopassword" method="post">
   <div class="page-group">
    
    <div id="page-nav-bar" class="page ">
  
	     <%@include file="./head.jsp" %>
	
	  
	  <div class="content">
	     <div class="list-block">
		      <ul>
		        <!-- Text inputs -->
		        <li>
		          <div class="item-content">
		            <div class="item-media"><i class="icon icon-form-name"></i></div>
		            <div class="item-inner">
		              <div class="item-title label">新密码</div>
		              <div class="item-input">
		                <input name='password2' type="password" placeholder="新密码">
		              </div>
		            </div>
		          </div>
		        </li>
		        <li>
		          <div class="item-content">
		            <div class="item-media"><i class="icon icon-form-password"></i></div>
		            <div class="item-inner">
		              <div class="item-title label">新密码确认</div>
		              <div class="item-input">
		                <input name='password1' type="password" placeholder="密码确认" class="">
		              </div>
		            </div>
		          </div>
		        </li>
		      </ul>
   		 </div>
   		 
	    <div class="content-block">
	      <p><a href="javascript:void(0)" onclick="fun_submit()" class="button button-fill button-success">确认修改</a></p>
	    </div>
	    
	  
	  
	  
	  </div><!--end content -->

</div>
</div>
</form>
<script type='text/javascript' src='//g.alicdn.com/sj/lib/zepto/zepto.min.js' charset='utf-8'></script>
<script type='text/javascript' src='//g.alicdn.com/msui/sm/0.6.2/js/sm.min.js' charset='utf-8'></script>
<script type='text/javascript' src='//g.alicdn.com/msui/sm/0.6.2/js/sm-extend.min.js' charset='utf-8'></script>
   <script>
   $(function() {
	  	 <c:if test="${tip!=null }">
		 	 $.toast("${tip}");
		  </c:if>
	  	});
   
   
   $(document).on("pageInit", function() {
	      $('.buttons-tab').fixedTab({offset:44});
	   });
     function fun_submit(){
    	 $("form").submit();
     }
    </script>
  </body>
</html>