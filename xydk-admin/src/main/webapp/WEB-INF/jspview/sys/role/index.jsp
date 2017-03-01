<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML>
<html>
<head>
    <link href="${pageContext.request.contextPath}/css/plugins/jsTree/style.min.css" rel="stylesheet">
</head>
<body >
   <input id='deptid' type="hidden"/>
		                      
    <div class="wrapper wrapper-content animated fadeInRight">
       <div class="row">
            <div class="col-sm-12">
                <div class="ibox ">
                    <div class="ibox-title">
                        <h5>权限管理 </h5>
                    </div>
                    <div class="ibox-content">
                        <form role="form" class="form-inline">
                              <button class="btn btn-primary" type="button" id='_new'>新增</button>
                        </form>
                    </div>
                    
                    <div class="ibox-content ">
                     <div class="row">
          			  	<div class="col-sm-12">
           					<table ID='dt_table_view' class="table table-striped table-bordered table-hover ">
	                            <thead>
	                                <tr>
										<th>角色名称</th>
										<th>权限列表</th>
										<th>设置 </th>
									</tr>
	                            </thead>
	                       		 <tbody id='role_tbody'>
	                       		 
	                            </tbody>
                          </table>
          			 </div>
          			 </div>
                         
                    </div>
                    
                </div>
            </div>
        </div>
   </div>
   
   <div id='_form' style="display: none;">
       <div class="ibox-content">
 		 <div class="row">
                            <div class="col-sm-12 b-r">
		                           <form id='form' class="form-horizontal" action="" method="get">
		                           <input name='roleid' type="hidden"/>
		                           	<table class='table table-bordered'>
		                           		<thead>
		                           		<tr style="text-align: center;" ><td colspan="6" ><h3>角色名称<h3></h3></td></tr>
		                           		</thead>
		                           		<tbody>
		                           			<tr>
		                           				<td>角色名称</td>
		                           				<td> <input name='name' type="text" class="form-control"></td>
		                           			</tr>
		                           			
		                           			<tr>
		                           				
		                           			<tr>
		                           				<td>备注</td>
		                           				<td> <input name='remark' type="text" class="form-control"></td>
		                           			</tr>
		                           			
		                           			
		                           			<tr>
		                           				<td>权限列表</td>
		                           				<td>
													<div id="jstree_div">
	           										</div>
		                           				</td>
		                           			</tr>
		                           			
										
		                           		
		                           			<tr>
		                           				<td colspan="6"> 
		                           					 <div class="col-sm-4 col-sm-offset-2">
		                                  			  		<button class="btn btn-primary" type="button" onclick="submit_form()">提交</button>
		                               				 </div>
		                           				</td>
		                           			</tr>
		                           		</tbody>
		                           	</table>
		                           	</form>
                            </div>
                        </div>
                        </div>
   </div>
   <script>
   var tree;
   function init_roles_table(){
		$.ajax({
	 		   url:  $.common.getContextPath() + "/sys/role/roles",
	 		   success: function(msg){
	 			  $("#role_tbody").empty();
	 			   if(msg.code==1){
	 				   for(i=0;i<msg.datas.length;i++){
						  
	 					  var rights=msg.datas[i].rights;
						  var right="";
							  for(j=0;j<rights.length;j++){
								  right+="<span class='label label-primary '>"+rights[j].name+" </span>&nbsp; ";
							  }
						 
	 					   var tr=" <tr>"+
								"<td>"+msg.datas[i].name+"</td>"+
								"<td>"+right+"</td>"+
								"<td><a tager='_blank' href='javascript:void(0)' onclick='fun_update("+msg.datas[i].id+")'>编辑 </a> <a tager='_blank' href='javascript:void(0)' onclick='fun_delete("+msg.datas[i].id+")'>删除 </a></td>"+
							    "</tr>";
							  //  alert(tr);
							    $("#role_tbody").append(tr);
	 				   }
	 				  
	 			   }
	 			
	 		   }
	 	});
   }
   
   function fun_delete(id){
   	layer.confirm('确定删除当前角色？', {
   		  btn: ['确定','取消'] //按钮
   		}, function(){
   			$.ajax({
   		 		   url:  $.common.getContextPath() + "/sys/role/delete?id="+id,
   		 		   success: function(msg){
   		 		     if(msg.code==1){
   		 		    	 toastr.success('操作成功');
   		 		    	 init_roles_table();
   		 		     }else{
   		 		    	toastr.warning(msg.msg);
   		 		     }
   		 		     layer.closeAll() ;
   		 		   }
   		 	});
   		}, function(){
   			 layer.closeAll() ;
   		});
    }
   
   function init_right_tree(){
   	$.ajax({
	 		   url:  $.common.getContextPath() + "/sys/role/allright",
	 		   success: function(msg){
	 			  tree = $('#jstree_div').jstree({
	 				    "checkbox" : {
	 				      "keep_selected_style" : false
	 				    },
	 				    "plugins" : [ "checkbox" ],
	 			 		'core' : {
	 			 		  'data' : msg
	 			 		}}).on('changed.jstree', function (e, data) {
	 			 			console.info(data.node.id);
	 			 		  });
	 		   }
	 	});
   }
   
   
   function submit_form(){
	   $.ajax({
 		   url:  $.common.getContextPath() + "/sys/role/updaterights",
 		   data:{
 			  id:$("input[name='roleid']").val(),
 			  remark:$("input[name='remark']").val(),
 			  name:$("input[name='name']").val(),
 			  ids: tree.jstree("get_checked").toString()
 		   },
 		   success: function(msg){
 			  layer.closeAll() ;
 			  init_roles_table();
 			  if(msg.code==1){
 				 toastr.success('操作成功');
 			  }else{
 				 toastr.warning(msg.msg);
 			  }
 			 
 		   }
 	  });
   }
   function fun_update(id){
	   var ref = $('#jstree_div').jstree(true);
       var nodes = ref.get_checked();
       for(i=0;i<nodes.length;i++){
    	   ref.uncheck_node(i);
		 }
	   $.ajax({
 		   url:  $.common.getContextPath() + "/sys/role/get?id="+id,
 		   success: function(msg){
 			   
 			 
 			 if(msg.code==1){
 				   $("input[name='roleid']").val(msg.datas.id);
 				   $("input[name='remark']").val(msg.datas.remark);
 				   $("input[name='name']").val(msg.datas.name);
 				 for(i=0;i<msg.datas.rights.length;i++){
 					tree.jstree('select_node', msg.datas.rights[i].id);
 				 }
 			 }
 		   }
 	  });
	   layer.open({
			  type: 1,
			  skin: 'layui-layer-rim', 
			  content: $("#_form"),
			  area: "800px"
			});
    }
   $(document).ready(function(){
	     
       
 	  $("#_new").click(function(){
 		   var ref = $('#jstree_div').jstree(true);
 	       var nodes = ref.get_checked();
 	       for(i=0;i<nodes.length;i++){
 	    	   ref.uncheck_node(i);
 			 }
	      $("input[name='roleid']").val("");
		  $("input[name='remark']").val("");
		  $("input[name='name']").val("");
		   
     		layer.open({
     			  type: 1,
     			  skin: 'layui-layer-rim', //加上边框
     			  content: $("#_form"),
     			  area: "800px"
     			});
    });
 	  
   	init_right_tree();
   	init_roles_table();
   });
    </script>
    <script src="${pageContext.request.contextPath}/js/plugins/jsTree/jstree.min.js"></script>
    
</body>
 
</html>
