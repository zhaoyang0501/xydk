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
		
		.icon-vip {
    display: inline-block;
    width: 14px;
    height: 14px;
    background: url(//s3b.pstatp.com/toutiao/resource/tt_search/static/image/user_verified_5fe0ab1.png) no-repeat center center;
    background-size: contain;
    vertical-align: middle;
}
	</style>
  </head>
  <body>
  
   <div class="page-group">
    
    <div id="page-nav-bar" class="page ">
  
	     <%@include file="./head.jsp" %>
	
	  
	  
	  <div class="content">
		<div style=" padding:20px;  border-bottom-color: #e7eaec; border-bottom-style: solid;    border-bottom-width: 1px;">
					<a href="javascript:void(0);"  onclick="fun_unfollower('${user.id }')"  class='button' style="float: right;">取消关注</a>
					<div style="    margin-left: auto; margin-right: auto;  box-sizing: border-box;  width: 55px;  height: 55px;">
						<img style="height: 55px;width: 55px;" src="http://p3.pstatp.com/thumb/12391/1243072150">
					</div>			
					
					<div style="font-size: 18px;margin-top:10px; text-align: center;" >
					${user.username }
					      <span class="icon-vip"></span>
					 </div>	
					
					<div style="font-size: 16px;margin-top:10px; text-align: center;" >
					     个性签名：该怎么忘记放弃？该怎么不爱不念？该怎么不痛不哭？你却不能告诉我我 该怎么做…
					     
					 </div>				
		</div>
	  
		<div class="buttons-tab  " offset=44 >
			      	<a href="#tab1" class="tab-link active button">评论留言</a>
			    	<a href="#tab2" class="tab-link  button">个人资料</a>
		 </div>
	    
	    <div class="tabs">
		      <div id="tab1" class="tab active">
					<div class="list-block media-list">
					      <ul>
						      <c:forEach items="${comments }" var="bean">
							       
							        <li>
							          <a href="${pageContext.request.contextPath}/newsdetail/${bean.news.id}" class="item-link item-content">
							            <div class="item-media"><img src="http://p1.pstatp.com/list/190x124/150c001460407bedf8b6" width="80"></div>
							            <div class="item-inner">
							              <div class="item-title-row">
							                <div class="item-title">${bean.news.title }</div>
							                <div class="item-after"> <f:formatDate  pattern="MM/dd" value="${bean.news.createDate }"/>留言</div>
							              </div>
							              <div class="item-text">内容：${bean.body }</div>
							            </div>
							          </a>
							        </li>
							       
							       
							      
        
						      </c:forEach>
				  			</ul>
		 			 </div>
		 	 </div>
	  </div>
	  
	  
	  
	  </div>

	</div>
    <script type='text/javascript' src='//g.alicdn.com/sj/lib/zepto/zepto.min.js' charset='utf-8'></script>
    <script type='text/javascript' src='//g.alicdn.com/msui/sm/0.6.2/js/sm.min.js' charset='utf-8'></script>
    <script type='text/javascript' src='//g.alicdn.com/msui/sm/0.6.2/js/sm-extend.min.js' charset='utf-8'></script>
   <script>
   function fun_unfollower(id){
	   $.ajax({
		   url: '/web/unfollower?id='+id,
		   dataType: 'json',
		   success: function(data){
			   $.toast("取消关注成功！");
		   }
		 })
   }
   
   $(document).on("pageInit", function() {
	      $('.buttons-tab').fixedTab({offset:44});
	   });
     function fun_submit(){
    	 $("form").submit();
     }
    </script>
  </body>
</html>