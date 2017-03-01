<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML>
<html>
<head>
</head>
<body >
    <div class="wrapper wrapper-content animated fadeInRight">
       <div class="row">
            <div class="col-sm-12">
                <div class="ibox ">
                    <div class="ibox-title">
                        <h5>评论管理 </h5>
                        <div class="ibox-tools">
                        </div>
                    </div>
                    
                     <div class="ibox-content">
                        <form role="form" class="form-inline">
                            <div class="form-group">
                               <div class="input-group date">
                                <span class="input-group-addon"><i class="fa fa-calendar"></i></span>
                                <input name='start' type="text"  placeholder="起始日期" class="form-control" value="">
                              </div>
                            
                            <div class="input-group date">
                                <span class="input-group-addon"><i class="fa fa-calendar"></i></span>
                                <input name='end' placeholder="结束日期" type="text" class="form-control" value="">
                            </div>
                            </div>
                            <button class="btn btn-primary" type="button" id='_search'><i class="fa fa-search"></i>查询</button>
                        </form>
                    </div>
                    
                    <div class="ibox-content ">
                         <table ID='dt_table_view' class="table table-striped table-bordered table-hover ">
                            <thead>
                                <tr>
									
									<th>内容</th>
									<th>发布人</th>
									<th>新闻</th>
									<th>发表时间</th>
									<th>操作</th>
								</tr>
                            </thead>
                       		 <tbody>
                            </tbody>
                          </table>
                    </div>
                    
                </div>
            </div>
        </div>
   </div>
   
  
   <script>
    var table=null;
  
				$(".input-group.date").datepicker({
					todayBtn : "linked",
					keyboardNavigation : !1,
					forceParse : !1,
					calendarWeeks : !0,
					autoclose : !0
				})
				  function fun_view(url){
			    	layer.open({
			    		  type: 2,
			    		  title: '新闻详情',
			    		  shadeClose: true,
			    		  area: ['800px', '90%'],
			    		  content: url
			    		}); 
			    }
				
				function fun_delete(id) {
					layer.confirm('确定删除当前评论？', {
						btn : [ '确定', '取消' ]
					//按钮
					}, function() {
						$.ajax({
							url : $.common.getContextPath()
									+ "/news/comment/delete?id=" + id,
							success : function(msg) {
								if (msg.code == 1) {
									toastr.success('操作成功');
									table.draw();
								}
								layer.closeAll();
							}
						});
					}, function() {
						layer.closeAll();
					});
				}

				$(document)
						.ready(
								function() {
									$("#_new").click(function() {
										$("input[name='id']").val("");
										$("input[name='chinesename']").val("");
										$("radio[name='sex']").val("");
										$("input[name='username']").val("");
										$("input[name='tel']").val("");
										$("input[name='email']").val("");
										$("textarea[name='remark']").val("");
										layer.open({
											type : 1,
											skin : 'layui-layer-rim', //加上边框
											content : $("#_form"),
											area : "800px"
										});
									});
									table = $('#dt_table_view')
											.DataTable(
													{
														"dom" : "rt<'row'<'col-sm-5'i><'col-sm-7'p>>",
														"ajax" : {
															"url" : $.common
																	.getContextPath()
																	+ "/news/comment/listall",
															"type" : "POST",
															"dataSrc" : "datas"
														},
														"columns" : [
																{
																	"data" : "body"
																},
																{
																	"data" : "user.username"
																},
																{
																	"data" : "news"
																},
																{
																	"data" : "createDate",
																},
																{
																	"data" : "id",
																} ],
														"columnDefs" : [
														{
															"render" : function(data, type,row) {
															  	 return "<a  href='javascript:void(0)' onclick='fun_view(\"${pageContext.request.contextPath}/newsdetail/"+data.id+"\")' >"+data.title+" </a>";
														           
														
															},
															"targets" : 2
														},
														{
															"render" : function(data, type,row) {
																return "<a tager='_blank' href='javascript:void(0)' onclick='fun_delete("
																		+ data
																		+ ")'>删除 </a>";

															},
															"targets" : 4
														}

														],
														"initComplete" : function() {
															var api = this.api();
															$("#_search").on("click",function() {
																				api.draw();
															});
														}
													})
											.on('preXhr.dt',function(e, settings, data) {
														data.startDate = $("input[name='start']").val();
														data.endDate = $("input[name='end']").val();
														return true;
													})
											.on(
													'xhr.dt',
													function(e, settings, json,
															xhr) {
														$(
																".dataTables_processing")
																.hide();
													})
								});
			</script>
</body>

</html>
