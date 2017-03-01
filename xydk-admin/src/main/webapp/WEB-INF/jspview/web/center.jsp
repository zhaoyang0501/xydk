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
   <div class="page-group">
    
    <div id="page-nav-bar" class="page ">
      <%@include file="./head.jsp" %>
	
	  
	  
	  <div class="content">
      
        <div class="card facebook-card" style="margin: 0px">
		    <div class="card-content" >
		    	<div style=" padding:20px;  border-bottom-color: #e7eaec; border-bottom-style: solid;    border-bottom-width: 1px;">
							<div style="    margin-left: auto; margin-right: auto;  box-sizing: border-box;  width: 55px;  height: 55px;">
								<img style="height: 55px;width: 55px;" src="http://p3.pstatp.com/thumb/12391/1243072150">
							</div>			
							
							<div style="font-size: 18px;margin-top:10px; text-align: center;" >
							      欢迎您：${sessionScope.user.username }（${sessionScope.user.email}）
							      <span class="icon-vip"></span>
							 </div>	
							
							<div style="font-size: 16px;margin-top:10px; text-align: center;" >
							     个性签名：该怎么忘记放弃？该怎么不爱不念？该怎么不痛不哭？你却不能告诉我我 该怎么做…
							     
							 </div>				
				</div>
		    </div>
		    
		    <div class="card-footer no-border">
		      <a href="#" class="link">发言：10次</a>
		      <a href="#" class="link">连续登陆：10天</a>
		      <a href="#" class="link">积分：100分</a>
		    </div>
  </div>
       
		  <div class="list-block">
			    <ul>
			      
			       <li class="item-content item-link" onclick="fun_goto('/web/replay')" >
			        <div class="item-media"><i class="icon icon-f7"></i></div>
			        <div class="item-inner">
			          <div class="item-title">意见反馈</div>
			        </div>
			      </li>
			      
			        <li class="item-content item-link"  >
			        <div class="item-media"><i class="icon icon-f7"></i></div>
			        <div class="item-inner">
			          <div class="item-title">我的评论</div>
			        </div>
			      </li>
			      
			       <li class="item-content item-link"  >
			        <div class="item-media"><i class="icon icon-f7"></i></div>
			        <div class="item-inner">
			          <div class="item-title">关于我们</div>
			        </div>
			      </li>
			      
			       <li class="item-content item-link" onclick="fun_goto('/web/password')" >
			        <div class="item-media"><i class="icon icon-f7"></i></div>
			        <div class="item-inner">
			          <div class="item-title">修改密码</div>
			        </div>
			      </li>
			      
			        <li class="item-content item-link" onclick="fun_goto('/web/updateuser')" >
			        <div class="item-media"><i class="icon icon-f7"></i></div>
			        <div class="item-inner">
			          <div class="item-title">个人资料</div>
			        </div>
			      </li>
			      
			      
			      <li class="item-content item-link" onclick="fun_goto('/web/loginout')" >
			        <div class="item-media"><i class="icon icon-f7"></i></div>
			        <div class="item-inner">
			          <div class="item-title">注销</div>
			        </div>
			      </li>
			    </ul>
			  </div>
		</div><!--end content -->

</div>
</div>
<script type='text/javascript' src='//g.alicdn.com/sj/lib/zepto/zepto.min.js' charset='utf-8'></script>
<script type='text/javascript' src='//g.alicdn.com/msui/sm/0.6.2/js/sm.min.js' charset='utf-8'></script>
<script type='text/javascript' src='//g.alicdn.com/msui/sm/0.6.2/js/sm-extend.min.js' charset='utf-8'></script>
   <script>
   function fun_goto(gotourl){
   	 location.href = gotourl;
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