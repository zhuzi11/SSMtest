<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>



	<div class="container-fluid">
  
		<!-- 搜索框 -->
		  
		<!-- 表格 -->
		<div class="row">
 
			<div class="col-lg-12">

				<table id="tbChoose"></table>


			</div>
		</div> 
	</div>

   

	
	<script type="text/javascript">
	   
	
		$(function() {

			//加载表格
			initTable(); 
			 
		});

		//初始化表格
		function initTable() {
			$('#tbChoose')
					.bootstrapTable(
							{
								url : '${pageContext.request.contextPath}/admin/dept/api/data.action',
								pagination : true, //开启分页
								pageList : [ 5, 10 ],
								pageSize : 5, //默认大小 
								paginationPreText : "上一页",
								paginationNextText : "下一页",
								sortStable : true, //排序
								singleSelect : true, //禁止多选
								clickToSelect : true, //点击选中checkbox/radio
								checkboxHeader : true,
								sidePagination : "server",//分页发生在服务器端				   
								method : "post", //以post提交 
								contentType : "application/x-www-form-urlencoded", //post提交必须改
								sortName : "deptId", //默认以这个排序
								queryParams : function(params) { //自定义条件	 
									params["state"] = 1; 
									return params;
								},
								columns : [ {
									checkbox : true, //复选框 
									align : 'center',
									valign : 'middle'

								}, {
									field : 'deptId',
									title : '部门编号',
									sortable : true

								}, {
									field : 'deptName',
									title : '部门名称',
									sortable : true
								}, {
									field : 'state',
									title : '状态',
									formatter : stateFormat
								}, ]
							});
		}

		//格式化状态
		function stateFormat(value, row) {
			return value == 1 ? "正常" : "<span style='color:red;'>禁用</span>";
		}
	</script>




</body>
</html>
