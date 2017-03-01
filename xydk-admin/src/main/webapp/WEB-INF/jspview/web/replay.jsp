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
   <form action="/web/dologin" method="post">
   <div class="page-group">
    
    <div id="page-nav-bar" class="page ">
  
	    <%@include file="./head.jsp" %>
	
	  
	  
	  <div class="content native-scroll">
    <div class="list-block">
      <ul>
        <li>
          <div class="item-content">
            <div class="item-media"><i class="icon icon-form-email"></i></div>
            <div class="item-inner">
              <div class="item-title label">联系方式</div>
              <div class="item-input">
                <input type="email" placeholder="填写联系方式">
              </div>
            </div>
          </div>
        </li>
        
        <li class="align-top">
          <div class="item-content">
            <div class="item-media"><i class="icon icon-form-comment"></i></div>
            <div class="item-inner">
              <div class="item-title label">反馈内容</div>
              <div class="item-input">
                <textarea style="height: 340px;" placeholder="填写反馈内容"></textarea>
              </div>
            </div>
          </div>
        </li>
      </ul>
    </div>
    <div class="content-block">
      <div class="row">
        <div class="col-100"><a onclick="fun_submit()" class="button button-big button-fill button-success">提交反馈</a></div>
      </div>
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
    	 $.toast("感谢您的反馈，我们会认真处理！");
     }
    </script>
  </body>
</html>