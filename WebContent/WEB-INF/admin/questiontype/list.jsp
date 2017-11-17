<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
<title>试题分类管理</title>

<jsp:include page="../common/bootstrap_css.jsp"></jsp:include>
<body>
	<div class="container-fluid">

		<!-- 导航 -->
		<div class="row">
			<ol class="breadcrumb">
				<li><a href="#">首页</a></li>
				<li class="active">试题分类列表</li>
			</ol>
		</div>


		<!-- 搜索框 -->
		<div class="row">

			<div class="col-lg-12">

				<div class="panel panel-default">

					<div class="panel-heading">操作</div>
					<div class="panel-body text-right">
						<form class="form-inline">
							<button type="button" class="btn btn-success" id="btnAdd">添加根节点</button>
						</form> 
					</div>
				</div>



			</div>
		</div>

		<!-- 表格 -->
		<div class="row">
			<div class="col-lg-12">

				    <table class="table table-bordered">
			              <tr>
			                <td width="6%">&nbsp;</td>
			                <td width="12%">编号</td>
			                <td width="50%">分类名称</td>
			                
			                <td width="12%">排序</td>
			                <td width="20%">操作</td>
			              </tr>
			              
			              <!--循环-->
			              <c:forEach items="${arrType }" var="one" varStatus="vs">
			               
			              <tr>
			                <td class="text-center" > 
			                   <div type="button" class="btn btn-default wisezone"   data-toggle="collapse" 
			                data-target="#collapseType${vs.index}" aria-expanded="false" aria-controls="collapseType${vs.index}">
			                      <i class="glyphicon glyphicon-plus  icon-plus"></i>
			                      
			                   </div>
			                 </td>
			                <td>${one.id }</td>
			                <td>${one.typeName }</td>
			               
			                <td>${one.sorts }</td>
			                <td>  
			                    <a class="btn btn-primary editType" data-id="${one.id }"  data-parentId="0"   >编辑</a> 
			                    <a class="btn  btn-success addChild"  data-parentid="${one.id }" >添加子分类</a> 
			                                                        
			                  </td>
			              </tr>
			               
			              <tr class="collapse" id="collapseType${vs.index}" >
			                <td>&nbsp;</td>
			                <td colspan="4">
			                 <!--子项--> 
				                <table class="table table-bordered">
				                   <!-- 循环遍历父节点下面的子节点 -->
				                   <c:forEach items="${one.childs }" var="two"> 
					                  <tr>
					                    <td width="12%">${two.id }</td>
					                    
					                    <td width="54%">${two.typeName }</td>
					                    <td width="13%">${two.sorts}</td>
					                    <td width="21%">
					                        <a class="btn btn-primary editType" data-id="${two.id }"  data-parentId="${one.id }" data-parentName="${one.typeName }" >编辑</a>  
					                     </td>
					                  </tr>
				                   </c:forEach>
				                </table>
			                </td>
			              
			              </tr>
			               
			              </c:forEach>
			              
			            </table>
				    
				   

			</div>
		</div>


	</div>



	<!-- 新增和修改的页面  bootstrap模态框来做的 -->
	<div id="formModel" class="modal fade" tabindex="-1" role="dialog"
		aria-labelledby="modalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">

				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="modalLabel">修改</h4>
				</div>

				<!-- 内容 -->
				<div class="modal-body">
					<div class="row">
						<div class="col-md-12">
							<form id="form" class="form-horizontal">
							   <div class="form-group">
									<label for="parentName" class="col-sm-2 control-label">所属分类</label>
									<div class="col-sm-10">
										<h3 id="parentName"></h3>
									</div>
								</div>
							
								<div class="form-group">
									<label for="typeName" class="col-sm-2 control-label">分类名称</label>
									<div class="col-sm-10">
										<input type="text" class="form-control" id="typeName"
											name="typeName" placeholder="分类名称">
									</div>
								</div>
								<div class="form-group">
									<label for="state" class="col-sm-2 control-label">排序</label>
									<div class="col-sm-10">
                                         <input type="number" class="form-control" id="sorts"
											name="sorts" placeholder="排序值越大排在越后面"> 
									</div>
								</div>

							
							</form>
						</div>
					</div>

					<!-- modal-body 内容结束 -->

				</div>

				<!-- 底部放按钮 -->
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="button" id="btnSave" class="btn btn-primary">保存</button>
				</div>

			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>
	<!-- /.modal -->










	<jsp:include page="../common/bootstrap_js.jsp"></jsp:include>
	 
	
	<script type="text/javascript">
	var parentId=0;  //父级节点的编号，节点为0，代表根节点
	var saveId=0;  //编辑
	
	$(function(){
		
		initTable();
		
		formValidator();
	    
		//新增根节点
		$("#btnAdd").click(function(){
			parentId=0;
			saveId=0; //新增
			$("#modalLabel").html("新增分类");
			$("#parentName").html("根节点");
			$("#typeName").val("");
			$("#sorts").val("99");
			
			 $('#formModel').modal(); //显示
		});
		
		//添加子节类
		$(".addChild").click(function(){
			parentId=$(this).attr("data-parentid");
			saveId=0;  //新增
			$("#modalLabel").html("新增分类");
			
			var parentName=$(this).parents("tr").find("td:eq(2)").html();
						
			$("#parentName").html(parentName);
			
			$("#typeName").val("");
			$("#sorts").val("99");
			
			 $('#formModel').modal(); //显示
		});
		
		
		//点编辑
		$(".editType").click(function(){
			//data-id="本身的id"  data-parentId="父节点的编号" data-parentName="你节点的名称"
			parentId=$(this).attr("data-parentId");
			saveId=$(this).attr("data-id");  //修改
			$("#modalLabel").html("修改分类");
			
			 
			 if(parentId=="0"){
				 $("#parentName").html("根节点");
				 $("#typeName").val($(this).parents("tr").find("td:eq(2)").html());
				 $("#sorts").val($(this).parents("tr").find("td:eq(3)").html());
			 }else{
				 $("#parentName").html(  $(this).attr("data-parentName") );
				 //子节点 
				 
				 $("#sorts").val($(this).parent().parent().find("td:eq(2)").html());
				 
				 $("#typeName").val($(this).parent().parent().find("td:eq(1)").html()  );
			 } 
			 
			 $('#formModel').modal(); //显示
			 
		});
		
		
		saveForm();
		  
		
	  });
	
	
	function initTable(){
		
		$("div.wisezone").click(function(){
			//等待1秒以后再执行
			   //true 隐藏(显示)/ false 展开了（隐藏）				  
			   var expends=$(this).attr("aria-expanded");
			   var i=$(this).find("i");
			    //<i class="glyphicon glyphicon-plus  icon-plus "></i>  +
				//<i class="glyphicon glyphicon-minus icon-minus"></i>  -  
			   if(expends=="true"){ 
				   //更改它的样式
				   i.removeClass("glyphicon-minus").removeClass("icon-minus"); //移除-
				   i.addClass("glyphicon-plus  icon-plus"); //变+
			   }else{
				    // -  变为 +
				   i.removeClass("glyphicon-plus").removeClass("icon-plus"); //移除+
				   i.addClass("glyphicon-minus icon-minus");  //变 -
			   }
			
			
			});
	 }
	
	 
	
	//验证修改和新增的验证
	function formValidator(){
	      //http://www.runoob.com/jquery/jquery-plugin-validate.html   这个网站找的
		 $("#form").validate({ 
				    rules: {
				    	typeName: "required",	       
				    	sorts: {
				              required: true,
				              digits:true   //必须是整数
					      } 
				 }
		  });
	}
	
	 
	//保存
	function saveForm(){
		$("#btnSave").click(function(){
			//验证数据是否正确 
			if( !$('#form').valid()){
				return ;
			}
			
			//把id=form表单的所有的元素转换提交字符串，序列化
			var formData=$("#form").serialize();
			//添加值
			formData=formData+"&id="+saveId+"&parentId="+parentId;
			
			//保存操作
			$.ajax({
				type:"POST",
				url:"${pageContext.request.contextPath}/admin/type/save.action",
				data:formData,
				dataType:"json",
				success:function(msg){					
					showTips(msg); //对话框方法					
				}
			});
			
		});
	}
	
	
	function showTips(rs){
		
		dialog({
			zIndex: 9999,
			title : rs.title,
			content : rs.message,
			okValue: '确定',
			ok: function () {
				//保存或者 新增成功了，才去刷新表格
				if(rs.success){
					//关闭模态框
					$('#formModel').modal('hide');
					//重新刷新该页面 
					window.location.reload(true); 
				} 
			}
		}).showModal();
		
	}
	</script>




</body>
</html>
