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
		.news_item{
			
			background-image: url("") !important;
		}
		.item-text{
		padding-top: 20px;
		}
		
		.item-text span{
		margin-right: 20px;
		}
	</style>
  </head>
  <body>
  
   <div class="page-group">
    
    <div id="page-nav-bar" class="page ">
  
	    <%@include file="./head.jsp" %>
	
	  
	  
	  <div class="content">
		<div class="list-block media-list">
      <ul>
      <c:forEach items="${followers }" var="bean">
	       <li>
	          <a href="${pageContext.request.contextPath}/web/userprofile/${bean.follower.id}" class="item-link item-content">
	            <div class="item-media"><img src="http://wenda.ghostchina.com/static/common/avatar-mid-img.png" width="90"></div>
	            <div class="item-inner news_item">
	              <div class="">
	                <div class="item-title">${bean.follower.username }</div>
	              </div>
	              
	              <div class="item-text"> <span><f:formatDate  pattern="yyyy/MM/dd" value="${bean.createDate }"/>关注</span> </div>
	            </div>
	          </a>
	        </li>
	        
	         
      </c:forEach>
        
      	</ul>
    	</div>
	  
	  
	  </div>

	</div>
    <script type='text/javascript' src='//g.alicdn.com/sj/lib/zepto/zepto.min.js' charset='utf-8'></script>
    <script type='text/javascript' src='//g.alicdn.com/msui/sm/0.6.2/js/sm.min.js' charset='utf-8'></script>
    <script type='text/javascript' src='//g.alicdn.com/msui/sm/0.6.2/js/sm-extend.min.js' charset='utf-8'></script>
   <script>
   $(document).on("pageInit", function() {
	      $('.buttons-tab').fixedTab({offset:44});
	   });
     function fun_submit(){
    	 $("form").submit();
     }
    </script>
  </body>
</html>