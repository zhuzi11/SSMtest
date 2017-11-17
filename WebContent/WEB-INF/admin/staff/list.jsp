<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>

<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
<title>员工管理</title>

<jsp:include page="../common/bootstrap_css.jsp"></jsp:include>

 


<body>
	<div class="container-fluid">

		<!-- 导航 -->
		<div class="row">
			<ol class="breadcrumb">
				<li><a href="#">首页</a></li>
				<li class="active">员工列表</li>
			</ol>
		</div>


		<!-- 搜索框 -->
		<div class="row">

			<div class="col-lg-12">

				<div class="panel panel-default">

					<div class="panel-heading">查询条件</div>
					<div class="panel-body text-right">
						<form class="form-inline">
						
						    <div class="form-group">
								<label for="staffName">员工名称</label> 
								<input type="text" id="staffName" name="staffName"	class="form-control" />								 
							</div>
							
							   
							 <div class="form-group">
								<label for="staffName">选择部门</label> 
								<input type="text" id="chooseDeptName" name="chooseDeptName" readonly="readonly"	class="form-control" />	
								<input type="hidden" id="chooseDeptId" name="deptId"	  />								 
							</div>
							 
							 <!--  
						    <div class="form-group">
								<label for="state">所属部门</label>  
								
								<select id="deptId" name="deptId"	class="form-control">
									<option value="0" selected>全部</option>
									 
									 <c:forEach items="${ arrDept}" var="p">
									     <option value="${p.deptId }" >${p.deptName }</option>
									 </c:forEach>
								</select>
							</div>
							 -->
							
							<div class="form-group">
								<label for="state">状态</label> 
								<select id="state" name="state"	class="form-control">
									<option value="-1" selected>全部</option>
									<option value="1">启用</option>
									<option value="0">禁用</option>
								</select>
							</div>

							<button type="button" class="btn btn-primary" id="btnSearch">搜索</button>

							<button type="button" class="btn btn-success" id="btnAdd">新增</button>

							<button type="button" class="btn btn-info" id="btnEdit">修改</button>
							
							<button type="button" class="btn btn-info" id="btnLock">锁定</button>
							
							<button type="button" class="btn btn-info" id="btnUnlock">解锁</button>
						</form>


					</div>
				</div>



			</div>
		</div>

		<!-- 表格 -->
		<div class="row">


			<div class="col-lg-12">

				<table id="tb"></table> 

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
									<label for="staffName" class="col-sm-2 control-label">员工名称</label>
									<div class="col-sm-10">
										<input type="text" class="form-control" id="editStaffName"
											name="staffName" placeholder="员工名称" >
									</div>
								</div>
								
								<div class="form-group">
									<label for="loginName" class="col-sm-2 control-label">登录名称</label>
									<div class="col-sm-10">
										<input type="text" class="form-control" id="editLoginName"
											name="loginName" placeholder="登录名称" >
									</div>
								</div>
							
								<div class="form-group">
									<label for="deptName" class="col-sm-2 control-label">所属部门</label>
									<div class="col-sm-10">
										<select class="form-control" id="editDeptId" name="deptId">
										    <!-- 读取数据库中所有的部门信息，填充 -->
											 <c:forEach items="${ arrDept}" var="p">
											     <option value="${p.deptId }" >${p.deptName }</option>
											 </c:forEach>
										</select>
										 
									</div>
								</div>
								<div class="form-group">
									<label for="editState" class="col-sm-2 control-label">状态</label>
									<div class="col-sm-10">

										<select class="form-control" id="editState" name="state">
											<option value="1">启用</option>
											<option value="0">禁用</option>
										</select>
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
	<jsp:include page="../common/bootstrap_tablejs.jsp"></jsp:include>
	
	 
	
	
	<script type="text/javascript">
	    var saveId=0;  //保存的主键
	    
	    //部门点击事件
	    function loadDeptClick(){
	    	
	    	$("#chooseDeptName").click(function(){
	    		
	    		var dlg=dialog({ 
	    			title:"选择数据",
	    			content: 'load......', 
	    			button: [
								{
									value: '选择',
									callback: function () { 
										 return chooseData();
									} 
								},
								{
									value: '清空',
									callback: function () {
										 //清空选择
					    				  $("#chooseDeptName").val("");
					    				  $("#chooseDeptId").val("");
									}
								},
								 
								{
									value: '关闭',
									autofocus: true
								}
					 ]
	    		 
	    		}) ;
	    		
	    		//关闭dialog.get('dialog_10002124').close().remove();
	    		
	    		//ajax加载页面
	    		$.ajax({
	    			type:"GET",
	    			url:"${pageContext.request.contextPath}/admin/dept/choose.action",
	    			dataType:"html",
	    			success:function(data){
	    				dlg.content(data);
	    				dlg.width(450);
	    				dlg.height(400);
	    				dlg.showModal();
	    			}
	    		});
	    		 
	    	});
	    }
	    
	    
	
		$(function() {
             
			//验证值是否正确的方法
			formValidator();
			
			
			loadDeptClick();
			
			//加载表格
			initTable();

			//点击查询 
			$("#btnSearch").click(function() {
				//刷新
				$('#tb').bootstrapTable('refresh');
			});

			//对btnEdit 修改点击事件
			$("#btnEdit").click(function() {
                  showEdit(); 
			});
			
			//新增
			$("#btnAdd").click(function(){
				//先清空原始的数据
				$("#editStaffName").val("");
				$("#editLoginName").val("");			
				$("#editState").val(1);
				saveId=0;  //新增的编号
				$("#modalLabel").html("新增");
				
				//http://v3.bootcss.com/javascript/#modals
				$('#formModel').modal();
			});
			
			//点击保存
			$("#btnSave").click(function(){ 
				saveForm();
			});

		});

		//初始化表格
		function initTable() {
			$('#tb').bootstrapTable(
							{
								url : '${pageContext.request.contextPath}/admin/staff/api/data.action',
								pagination : true, //开启分页
								pageList : [ 5, 10, 15, 20, 30, 50 ],
								pageSize : 5, //默认大小 
								paginationPreText : "上一页",
								paginationNextText : "下一页",
								sortStable : true, //排序
								singleSelect : false, //禁止多选
								clickToSelect : true, //点击选中checkbox/radio
								checkboxHeader : true,
								sidePagination : "server",//分页发生在服务器端				   
								method : "post", //以post提交 
								contentType : "application/x-www-form-urlencoded", //post提交必须改
								sortName : "staffId", //默认以这个排序
								queryParams : function(params) { //自定义条件				    	 

									params["state"] = $("#state").val();
                                    params["staffName"]=$("#staffName").val();
                                    //下拉列表
                                    //params["deptId"]=$("#deptId").val();
                                    
                                    //开窗
                                    params["deptId"]=$("#chooseDeptId").val();
                                    
									return params;
								},
								columns : [ {
									checkbox : true, //复选框 
									align : 'center',
									valign : 'middle'

								}, {
									field : 'staffId',
									title : '员工编号',
									sortable : true

								}, {
									field : 'staffName',
									title : '员工名称',
									sortable : true
								}, {
									field : 'loginName',
									title : '登录名称',
									sortable : true
								},{
									field : 's.deptId',
									title : '部门名称',
									formatter:deptNameFormat,
									sortable : true
								}, {
									field : 's.state',
									title : '状态',
									formatter : stateFormat
								}, ]
							});
		}

		//格式化状态
		function stateFormat(value, row) {
			return row.state == 1 ? "正常" : "<span style='color:red;'>锁定</span>";
		}
		
		//格式化对象中的对象
		function deptNameFormat(value,row){
			return  row.dept.deptName;
		}
		
		
		//选择数据
		function chooseData(){
			
			var arr = $('#tbChoose').bootstrapTable('getSelections');
			
			if (arr.length != 1) {
				//提示  http://aui.github.io/artDialog/doc/index.html#module
				dialog({
					title : '提示',
					content : '请选择要修改的一笔数据',
					zIndex:8888 
				}).showModal();
                return false;
                
			} else {
				//显示bootstrap 模态框
				//修改的数据
				var json=arr[0]; 
			    $("#chooseDeptName").val(json.deptId+"-"+json.deptName);
				$("#chooseDeptId").val(json.deptId);
			    return true;
			}
			
		}
		
		
		
		//验证修改和新增的验证
		function formValidator(){
		      //http://www.runoob.com/jquery/jquery-plugin-validate.html   这个网站找的
			 $("#form").validate({
			        onkeyup:false,  //键盘按下不要去验证
					    rules: {
					    	staffName: "required",	       
					    	loginName: {
					              required: true,
								    remote: {
							                      url: "${pageContext.request.contextPath}/admin/staff/check/loginname.action",     //后台处理程序
							                      type: "post",               //数据发送方式
							                      dataType: "json",           //接受数据格式   
							                      data: {                     //要传递的数据
							                            loginName: function() {
							                                   return $("#editLoginName").val();
							                           },
							                           staffId:function(){
							                        	      return saveId;
							                           } 
							                      }
							                 }
						      },  
					       messages: {
					    	   staffName: "请输入员工名称",	    
					    	   loginName:{
					              required: "请输入登录名",
					              remote: "该登录名已被使用"
					          }
					     } 
					 }
			  });
		}
		
		//显示修改js
		function showEdit(){
			//得到选中数据  http://issues.wenzhixin.net.cn/bootstrap-table/#methods/getSelections.html
			var arr = $('#tb').bootstrapTable('getSelections');
			
			if (arr.length != 1) {
				//提示  http://aui.github.io/artDialog/doc/index.html#module
				dialog({
					title : '提示',
					content : '请选择要修改的一笔数据'
				}).showModal();

			} else {
				//显示bootstrap 模态框
				//修改的数据
				var json=arr[0];
				//这个应该要提一个方法
				$("#editStaffName").val(json.staffName);
				$("#editLoginName").val(json.loginName);			
			    $("#editState").val(json.state);				
				$("#editDeptId").val(json.deptId);				 
			 			   
				saveId=json.staffId;  //修改的编号
				
				$("#modalLabel").html("编辑");
				
				//http://v3.bootcss.com/javascript/#modals
				$('#formModel').modal();
			}
			
		}
		
		//新增或者修改保存
		function saveForm(){ 
			
			//判断验证是否成功 
			//触发验证事件 	
			if( !$('#form').valid()){
				return ;
			}
			
			 
			//  /admin/dept/api/save.action
			//序列化 form的值为字符串，格式为：  name=值&name=值&name=值
			//http://jquery.cuishifeng.cn/serialize.html
			var jsonValue=$("#form").serialize();
			//添加主键
			jsonValue=jsonValue+"&staffId="+saveId;
			
			console.log(jsonValue);
			
			//http://jquery.cuishifeng.cn/jQuery.Ajax.html
			$.ajax({
				type:"POST",
				url:"${pageContext.request.contextPath}/admin/staff/api/save.action",
				data:jsonValue,  //要提交的数据
				dataType:"json",
				success:function(rs){
					//ajax判断
					
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
								
								//http://issues.wenzhixin.net.cn/bootstrap-table/#methods/refresh.html
								$('#tb').bootstrapTable('refresh');
								
							} 
						}
					}).showModal();
					 
				}
				
			});
			
		}
		
	</script>




</body>
</html>
