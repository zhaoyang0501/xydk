<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML>
<html>
<head>
<link href="${pageContext.request.contextPath}/css/plugins/webuploader/webuploader.css" rel="stylesheet">
<style type="text/css">
.tab-pane{
display: block !important;
opacity:0;
}
.tab-content .active{
opacity:1;
}
.thumbnail img{
height: 200px
}
.thumbnail .state,.thumbnail .info{
display: none;
}
</style>
</head>
<body >
    <div class="wrapper wrapper-content animated fadeInRight">
       <div class="row">
            <div class="col-sm-12">
                <div class="ibox ">
                 <div class="ibox-title">
                        <h5>新闻图片轮换设置 </h5>
                        <div class="ibox-tools">
                        </div>
                    </div>
                    
      		 	<div class="ibox-content">
						<div class="row">
						<div class='col-sm-12 ' style="padding-bottom: 20px">
						      <button onclick="fun_saveall()" class="btn btn-primary pull-right"  type="button"><i class="fa fa-save"></i>保存设置</button>
						                        
						</div>
							<div class='col-sm-6'>
							<div class="panel panel-default">
                                    <div class="panel-heading">
                                       		 第一个图片
                                    </div>
                                    <div class="panel-body">
                                    
										<form id='banner1' method="get" class="form-horizontal">
						                            <input type="hidden" name="id" value="${banner1.id}">
						                            
						                            <div class="form-group">
						                                <label class="col-sm-2 control-label">链接</label>
						
						                                <div class="col-sm-10">
						                                    <div class="input-group">
										                        <input value="${banner1.url}"  name='url' placeholder="输入标题检索..." type="text" class="form-control" id="url1">
										                        <div class="input-group-btn">
										                            <button type="button" class="btn btn-white dropdown-toggle" data-toggle="dropdown">
										                                <span class="caret"></span>
										                            </button>
										                            <ul class="dropdown-menu dropdown-menu-right" role="menu">
										                            </ul>
										                        </div>
										                    </div>
						                                </div>
						                                
						                            </div>
                            						
                            						<div class="hr-line-dashed"></div>
						                            
						                            <div class="form-group">
						                                <label class="col-sm-2 control-label">图片</label>
						                                <div class="col-sm-10">
						                                    <div  >
									                          <div class="container-fluid">
																  <div id="thelist1" class="row ">
																  <div class="file-item thumbnail">
											    		               <img src="${pageContext.request.contextPath}/${banner1.img}" >
											    		     	       <input type="hidden" name="img" value="${banner1.img}"/>
											    		            </div>
																  </div>
																</div>
															    	
															    	<div class="row">
															    		<div class="col-xs-12">
															    			<div id="picker1"><i class="fa fa-upload"></i>选择文件</div>
															    		</div>
															    	</div>
															</div>
						                                </div>
						                            </div>
						                            
                       							 </form>
                                    </div>
                                </div>
							</div>
							
							<div class='col-sm-6'>
							 <div class="panel panel-default">
                                    <div class="panel-heading">
                                       		 第二个图片
                                    </div>
                                    <div class="panel-body">
                                    <form id='banner2' method="get" class="form-horizontal">
						                            <input type="hidden" name="id" value="${banner2.id}">
						                            
						                            <div class="form-group">
						                                <label class="col-sm-2 control-label">链接</label>
						
						                                <div class="col-sm-10">
						                                    <div class="col-sm-10">
							                                    <div class="input-group">
											                        <input value="${banner2.url}"  name='url' placeholder="输入标题检索..." type="text" class="form-control" id="url2">
											                        <div class="input-group-btn">
											                            <button type="button" class="btn btn-white dropdown-toggle" data-toggle="dropdown">
											                                <span class="caret"></span>
											                            </button>
											                            <ul class="dropdown-menu dropdown-menu-right" role="menu">
											                            </ul>
											                        </div>
											                    </div>
						                                	</div>
						                                </div>
						                            </div>
                            						
                            						<div class="hr-line-dashed"></div>
						                            
						                            <div class="form-group">
						                                <label class="col-sm-2 control-label">图片</label>
						                                <div class="col-sm-10">
						                                    <div >
									                          <div class="container-fluid">
																  <div id="thelist2" class="row ">
																  <div class="file-item thumbnail">
											    		                     <img src="${pageContext.request.contextPath}/${banner2.img}" >
											    		     	 
											    		     	       <input type="hidden" name="img"  value="${banner2.img}"/>
											    		            </div>
																  </div>
																</div>
															    	
															    	<div class="row">
															    		<div class="col-xs-12">
															    			<div id="picker2"><i class="fa fa-upload"></i>选择文件</div>
															    		</div>
															    	</div>
															</div>
						                                </div>
						                            </div>
						                            
                       							 </form>
                                   		 </div>
                                </div>
							</div>
							
							<div class='col-sm-6'>
							<div class="panel panel-default">
                                    <div class="panel-heading">
                                       		 第三个图片
                                    </div>
                                    <div class="panel-body">
                                    
										<form id='banner3' method="get" class="form-horizontal">
						                            <input type="hidden" name="id" value="${banner3.id}">
						                            
						                            <div class="form-group">
						                                <label class="col-sm-2 control-label">链接</label>
						
						                                <div class="col-sm-10">
						                                   <div class="input-group">
										                        <input value="${banner3.url}"  name='url' placeholder="输入标题检索..." type="text" class="form-control" id="url3">
										                        <div class="input-group-btn">
										                            <button type="button" class="btn btn-white dropdown-toggle" data-toggle="dropdown">
										                                <span class="caret"></span>
										                            </button>
										                            <ul class="dropdown-menu dropdown-menu-right" role="menu">
										                            </ul>
										                        </div>
										                    </div>
						                                </div>
						                            </div>
                            						
                            						<div class="hr-line-dashed"></div>
						                            
						                            <div class="form-group">
						                                <label class="col-sm-2 control-label">图片</label>
						                                <div class="col-sm-10">
						                                    <div  >
									                          <div class="container-fluid">
																  <div id="thelist3" class="row ">
																  <div class="file-item thumbnail">
											    		               <img src="${pageContext.request.contextPath}/${banner3.img}" >
											    		     	       <input type="hidden" name="img"  value="${banner3.img}"/>
											    		            </div>
																  </div>
																</div>
															    	
															    	<div class="row">
															    		<div class="col-xs-12">
															    			<div id="picker3"><i class="fa fa-upload"></i>选择文件</div>
															    		</div>
															    	</div>
															</div>
						                                </div>
						                            </div>
						                            
                            						
                       							 </form>
                                    </div>
                                </div>
							</div>	
								
							<div class='col-sm-6'>
								<div class="panel panel-default">
                                    <div class="panel-heading">
                                       		 第四个图片
                                    </div>
                                    <div class="panel-body">
                                    
										<form id='banner4' method="get" class="form-horizontal">
						                            <input type="hidden" name="id" value="${banner4.id}">
						                            
						                            <div class="form-group">
						                                <label class="col-sm-2 control-label">链接</label>
						
						                                <div class="col-sm-10">
						                                
						                                 <div class="input-group">
										                        <input value="${banner4.url}"  name='url' placeholder="输入标题检索..." type="text" class="form-control" id="url4">
										                        <div class="input-group-btn">
										                            <button type="button" class="btn btn-white dropdown-toggle" data-toggle="dropdown">
										                                <span class="caret"></span>
										                            </button>
										                            <ul class="dropdown-menu dropdown-menu-right" role="menu">
										                            </ul>
										                        </div>
										                    </div>
						                                </div>
						                            </div>
                            						
                            						<div class="hr-line-dashed"></div>
						                            
						                            <div class="form-group">
						                                <label class="col-sm-2 control-label">图片</label>
						                                <div class="col-sm-10">
						                                    <div  >
									                          <div class="container-fluid">
																  <div id="thelist4" class="row ">
																  <div class="file-item thumbnail">
											    		               <img src="${pageContext.request.contextPath}/${banner4.img}" >
											    		     	       <input type="hidden" name="img"  value="${banner4.img}"/>
											    		            </div>
																  </div>
																</div>
															    	
															    	<div class="row">
															    		<div class="col-xs-12">
															    			<div id="picker4"><i class="fa fa-upload"></i>选择文件</div>
															    		</div>
															    	</div>
															</div>
						                                </div>
						                            </div>
						                            
						                            
                       							 </form>
                                    </div>
                                </div>
							</div>	
							</div>
							
						</div>
					</div>
                    
            </div>
        </div>
   </div>
   <script src="${pageContext.request.contextPath}/plugins/webuploader/webuploader.js "></script>
   <script>
   
   var form1_ = $("#banner1").validate({
		rules : {
			url : "url",
		},
		ignore : "",
		messages : {
			url : "链接格式不正确"
		}
	});
   
   var form2_ = $("#banner2").validate({
		rules : {
			url : "url",
		},
		ignore : "",
		messages : {
			url : "链接格式不正确"
		}
	});
   
   var form3_ = $("#banner3").validate({
		rules : {
			url : "url",
		},
		ignore : "",
		messages : {
			url : "链接格式不正确"
		}
	});
   
   var form4_ = $("#banner4").validate({
		rules : {
			url : "url",
		},
		ignore : "",
		messages : {
			url : "链接格式不正确"
		}
	});
   
   				function fun_saveall(){
   					if (!form1_.form()||!form2_.form()||!form4_.form()||!form3_.form())
   						return;
   					fun_submit("banner1");
   					fun_submit("banner2");
   					fun_submit("banner3");
   					fun_submit("banner4");
    		    	toastr.success('操作成功');
   				}
   
				function fun_submit(formid){
					$.ajax({
			    		   type: "POST",
			    		   url:  $.common.getContextPath() + "/news/banner/savebanner",
			    		   data: {
			    			   "id":$("#"+formid).find("input[name='id']").val(),
			    			   "url":$("#"+formid).find("input[name='url']").val(),
			    			   "img":$("#"+formid).find("input[name='img']").val()
			    		   },
			    		   success: function(msg){
			    		   }
			    		});
				}   
   
				$(document).ready(function() {
					var bsSuggest = $("#url1,#url2,#url3,#url4").bsSuggest({
		    	   		url: "${pageContext.request.contextPath}/news/banner/findNewsByTitle?title=",
		    	   		ignorecase: true,
		    	   		effectiveFields:["title","url"],
		    	   		effectiveFieldsAlias:{id: "新闻",title:"链接"},
		    	   		showHeader: true,
		    	   	 	indexKey: 1,      
		    	   		delayUntilKeyup: false
		    		}).on('onSetSelectValue', function (e, keyword) {
		    	        console.log('onSetSelectValue: ', keyword);
		    	    });
					
					var uploader4 =new  WebUploader.Uploader({
			    		auto:true,
			    		fileNumLimit :1,
			    	    server: '${pageContext.request.contextPath}/news/bannerupload/upload',
			    	    pick:{id : "#picker4",multiple: false} ,
			    	    resize: false
			    	});
			    	
			    	uploader4.on( 'fileQueued', function( file ) {
			    		 var $li = $(
			    		            '<div id="' + file.id + '" class="file-item thumbnail">' +
			    		                '<img>' +
			    		                '<div class="info">' + file.name + '</div>' +
			    		                '<p class="state">等待上传...</p>' +
			    		     	       ' <input type="hidden" name="img" value=""/>'+
			    		            '</div>'
			    		            ),
			    		        $img = $li.find('img');
			    		    $("#thelist4").append( $li );
			    		
			    		    uploader4.makeThumb( file, function( error, src ) {
			    		        if ( error ) {
			    		            $img.replaceWith('<span>不能预览</span>');
			    		            return;
			    		        }

			    		        $img.attr( 'src', src );
			    		    }, 190, 100 );
			    	});
			    	
			    	uploader4.on( 'uploadSuccess',  function(file, data){
			    		 $( '#'+file.id ).find('p.state').text('已上传');
			    		 $( '#'+file.id ).find("input").val(data.datas.filepath);
			    		 return false;
					});

			    	uploader4.on( 'uploadError', function( file ) {
			    	    $( '#'+file.id ).find('p.state').text('上传出错');
			    	});
			    	uploader4.on( 'beforeFileQueued', function( file ) {
			    		$("#thelist4").empty();
			    		uploader4.reset();
			    	});

			    	uploader4.on( 'uploadComplete', function( file ) {
			    	    $( '#'+file.id ).find('.progress').fadeOut();
			    	});
					
					
					var uploader3 =new  WebUploader.Uploader({
			    		auto:true,
			    		fileNumLimit :1,
			    	    server: '${pageContext.request.contextPath}/news/bannerupload/upload',
			    	    pick:{id : "#picker3",multiple: false} ,
			    	    resize: false
			    	});
			    	
			    	uploader3.on( 'fileQueued', function( file ) {
			    		 var $li = $(
			    		            '<div id="' + file.id + '" class="file-item thumbnail">' +
			    		                '<img>' +
			    		                '<div class="info">' + file.name + '</div>' +
			    		                '<p class="state">等待上传...</p>' +
			    		     	       ' <input type="hidden" name="img" value=""/>'+
			    		            '</div>'
			    		            ),
			    		        $img = $li.find('img');
			    		    $("#thelist3").append( $li );
			    		
			    		    uploader3.makeThumb( file, function( error, src ) {
			    		        if ( error ) {
			    		            $img.replaceWith('<span>不能预览</span>');
			    		            return;
			    		        }

			    		        $img.attr( 'src', src );
			    		    }, 190, 100 );
			    	});
			    	
			    	uploader3.on( 'uploadSuccess',  function(file, data){
			    		 $( '#'+file.id ).find('p.state').text('已上传');
			    		 $( '#'+file.id ).find("input").val(data.datas.filepath);
			    		 return false;
					});

			    	uploader3.on( 'uploadError', function( file ) {
			    	    $( '#'+file.id ).find('p.state').text('上传出错');
			    	});
			    	uploader3.on( 'beforeFileQueued', function( file ) {
			    		$("#thelist3").empty();
			    		uploader3.reset();
			    	});

			    	uploader3.on( 'uploadComplete', function( file ) {
			    	    $( '#'+file.id ).find('.progress').fadeOut();
			    	});
					/***第二个bannber    	***/
			    	var uploader2 =new  WebUploader.Uploader({
			    		auto:true,
			    		fileNumLimit :1,
			    	    server: '${pageContext.request.contextPath}/news/bannerupload/upload',
			    	    pick:{id : "#picker2",multiple: false} ,
			    	    resize: false
			    	});
			    	
			    	uploader2.on( 'fileQueued', function( file ) {
			    		 var $li = $(
			    		            '<div id="' + file.id + '" class="file-item thumbnail">' +
			    		                '<img>' +
			    		                '<div class="info">' + file.name + '</div>' +
			    		                '<p class="state">等待上传...</p>' +
			    		     	       ' <input type="hidden" name="img" value=""/>'+
			    		            '</div>'
			    		            ),
			    		        $img = $li.find('img');
			    		    $("#thelist2").append( $li );
			    		
			    		    uploader2.makeThumb( file, function( error, src ) {
			    		        if ( error ) {
			    		            $img.replaceWith('<span>不能预览</span>');
			    		            return;
			    		        }

			    		        $img.attr( 'src', src );
			    		    }, 190, 100 );
			    	});
			    	
			    	uploader2.on( 'uploadSuccess',  function(file, data){
			    		 $( '#'+file.id ).find('p.state').text('已上传');
			    		 $( '#'+file.id ).find("input").val(data.datas.filepath);
			    		 return false;
					});

			    	uploader2.on( 'uploadError', function( file ) {
			    	    $( '#'+file.id ).find('p.state').text('上传出错');
			    	});
			    	uploader2.on( 'beforeFileQueued', function( file ) {
			    		$("#thelist2").empty();
			    		uploader2.reset();
			    	});

			    	uploader2.on( 'uploadComplete', function( file ) {
			    	    $( '#'+file.id ).find('.progress').fadeOut();
			    	});
					
					var uploader1 =new  WebUploader.Uploader({
			    		auto:true,
			    		fileNumLimit :1,
			    	    server: '${pageContext.request.contextPath}/news/bannerupload/upload',
			    	    pick:{id : "#picker1",multiple: false} ,
			    	    resize: false
			    	});
			    	
			    	uploader1.on( 'fileQueued', function( file ) {
			    		 var $li = $(
			    		            '<div id="' + file.id + '" class="file-item thumbnail">' +
			    		                '<img>' +
			    		                '<div class="info">' + file.name + '</div>' +
			    		                '<p class="state">等待上传...</p>' +
			    		     	       ' <input type="hidden" name="img" value=""/>'+
			    		            '</div>'
			    		            ),
			    		        $img = $li.find('img');
			    		    $("#thelist1").append( $li );
			    		
			    		    uploader1.makeThumb( file, function( error, src ) {
			    		        if ( error ) {
			    		            $img.replaceWith('<span>不能预览</span>');
			    		            return;
			    		        }

			    		        $img.attr( 'src', src );
			    		    }, 190, 100 );
			    	});
			    	
			    	uploader1.on( 'uploadSuccess',  function(file, data){
			    		 $( '#'+file.id ).find('p.state').text('已上传');
			    		 $( '#'+file.id ).find("input").val(data.datas.filepath);
			    		 return false;
					});

			    	uploader1.on( 'uploadError', function( file ) {
			    	    $( '#'+file.id ).find('p.state').text('上传出错');
			    	});
			    	uploader1.on( 'beforeFileQueued', function( file ) {
			    		$("#thelist1").empty();
			    		uploader1.reset();
			    	});

			    	uploader1.on( 'uploadComplete', function( file ) {
			    	    $( '#'+file.id ).find('.progress').fadeOut();
			    	});
			    	
			    	
			      	$(".webuploader-pick").addClass("btn").addClass("btn-success").removeClass("webuploader-pick");


				});
			</script>
      <script src="${pageContext.request.contextPath}/js/plugins/suggest/bootstrap-suggest.min.js"></script>
</body>

</html>
