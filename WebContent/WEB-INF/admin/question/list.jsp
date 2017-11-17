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
<title>试题管理</title>

<jsp:include page="../common/bootstrap_css.jsp"></jsp:include>
<link href="${pageContext.request.contextPath }/resources/kindeditor/themes/default/default.css" rel="stylesheet">
 
 <link href="${pageContext.request.contextPath }/resources/iCheck/skins/flat/green.css" rel="stylesheet">
 


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
								<label for="staffName">试题分类</label> 
								<select class="form-control" id="chooseParentId" name="chooseParentId">
								   <option value="0">所有分类</option>
								   <!-- 填充数据 -->
								   <c:forEach items="${allType }" var="one">
								      <option value="${one.id }">${one.typeName }</option>
								      
								      <c:forEach items="${one.childs }" var="two">
								         <option value="${two.id }">　　${two.typeName }</option> 
								      </c:forEach>
								      
								   </c:forEach>
								   
								</select>							 
							</div>
							
							   
							 <div class="form-group">
								<label for="staffName">难易程序</label> 
								<select class="form-control" id="chooseDifficult" name="chooseDifficult">
								    <option value="0">全部</option>
								    <option value="1">★</option>
								    <option value="2">★★</option>
								    <option value="3">★★★</option>
								    <option value="4">★★★★</option>
								    <option value="5">★★★★★</option>
								</select>							 							 
							</div>
							 
							 
							<div class="form-group">
								<label for="staffName">试题类型</label> 
								<select class="form-control" id="chooseQuestionType" name="chooseQuestionType">
								    <option value="0">所有类型</option>
								    <option value="1">单选</option>
								    <option value="2">多选</option>
								    <option value="3">判断</option>
								</select>							 							 
							</div>
							 

							<button type="button" class="btn btn-primary" id="btnSearch">搜索</button>

							<button type="button" class="btn btn-success" id="btnAdd">新增</button>

							<button type="button" class="btn btn-info" id="btnEdit">修改</button>
							 
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
		<div class="modal-dialog  modal-lg" role="document">
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
									<label for="deptName" class="col-sm-2 control-label">试题类型</label>
									<div class="col-sm-10">
										<select class="form-control" id="editQuestionType" name="questionType">
										     <option value="1">单选</option>
								             <option value="2">多选</option>
								             <option value="3">判断</option>											  
										</select>
										 
									</div>
								</div>
								
								<div class="form-group">
									<label for="editChildTypeId" class="col-sm-2 control-label">试题分类</label>
									<div class="col-sm-10">
										<select class="form-control" id="editChildTypeId" name="childTypeId">
										       <!-- 填充数据 -->
											   <c:forEach items="${allType }" var="one">
											   
											      <optgroup label="${one.typeName }">											      											        
													      <c:forEach items="${one.childs }" var="two">
													         <option value="${two.id }">${two.typeName }</option> 
													      </c:forEach> 
											      </optgroup>
											      
											   </c:forEach>									  
										</select>
										 
									</div>
								</div>
								
								<div class="form-group">
									<label for="editDifficult" class="col-sm-2 control-label">试题难度</label>
									<div class="col-sm-10">
										<select class="form-control" id="editDifficult" name="difficult">
										      <option value="1">★</option>
											  <option value="2">★★</option>
											  <option value="3">★★★</option>
											  <option value="4">★★★★</option>
											  <option value="5">★★★★★</option>										  
										</select>
										 
									</div>
								</div>
								
								
							
							  <div class="form-group">
									<label for="editQuestionName" class="col-sm-2 control-label">试题</label>
									<div class="col-sm-10">
										 <!-- 插件，富文件框 -->
										  <textarea name="questionName" id="editQuestionName" class="form-control"  style="height:250px;visibility:hidden;"></textarea>
									</div>
								</div>
								
								 <div class="form-group">
									<label for="deptName" class="col-sm-2 control-label">正确答案</label>
									<div class="col-sm-10" id="dynamicAnswer">
									   
										 
									</div>
								</div>
								 
							
								  <div class="form-group">
									<label for="choisea" class="col-sm-2 control-label">选项A</label>
									<div class="col-sm-10">
										 <!-- 插件，富文件框 -->
										  <textarea name="choisea" id="editChoisea" class="form-control"  style="height:100px;visibility:hidden;"></textarea>
								  	</div>
								  </div>
								 
								  <div class="form-group">
									<label for="choiseb" class="col-sm-2 control-label">选项B</label>
									<div class="col-sm-10">
										 <!-- 插件，富文件框 -->
										  <textarea name="choiseb" id="editChoiseb" class="form-control"  style="height:100px;visibility:hidden;"></textarea>
									</div>
							   	 </div>
								
								  <div class="form-group"  id="divChoisec">
									<label for="choisec" class="col-sm-2 control-label">选项C</label>
									<div class="col-sm-10">
										 <!-- 插件，富文件框 -->
										  <textarea name="choisec" id="editChoisec" class="form-control"  style="height:100px;visibility:hidden;"></textarea>
									</div>
							   	 </div>
							   	 
							   	  <div class="form-group"  id="divChoised">
									<label for="choisec" class="col-sm-2 control-label">选项D</label>
									<div class="col-sm-10">
										 <!-- 插件，富文件框 -->
										  <textarea name="choised" id="editChoised" class="form-control"  style="height:100px;visibility:hidden;"></textarea>
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
	
	<!-- 富文本框插件 -->
   <script src="${pageContext.request.contextPath }/resources/kindeditor/kindeditor-all-min.js"></script>
    <script src="${pageContext.request.contextPath }/resources/kindeditor/lang/zh-CN.js"></script>
	
	<!-- 引用icheck美化 单选框和复选框的js -->
	<script src="${pageContext.request.contextPath }/resources/iCheck/icheck.min.js"></script>
	
	<script type="text/javascript">
	    var saveId=0;  //保存的主键
	    var keQuestionName,keChoisea,keChoiseb,keChoisec,keChoised; //富文框的变量名
	    
	    $(function() {
	  //点击保存
		$("#btnSave").click(function(){
			//  /admin/dept/api/save.action
			//序列化 form的值为字符串，格式为：  name=值&name=值&name=值
			//http://jquery.cuishifeng.cn/serialize.html
			var jsonValue={"id":saveId};
			//添加主键
			jsonValue["choisea"]=keChoisea.html();
			jsonValue["choiseb"]=keChoiseb.html();
			jsonValue["choisec"]=keChoisec.html();
			jsonValue["choised"]=keChoised.html();
			jsonValue["questionName"]=keQuestionName.html();
			jsonValue["questionType"]=$("#editQuestionType").val();
			jsonValue["childTypeId"]=$("#editChildTypeId").val();
			jsonValue["difficult"]=$("#editDifficult").val();
			jsonValue["answer"]=$("#editAnswer").val();
			
			//http://jquery.cuishifeng.cn/jQuery.Ajax.html
			$.ajax({
				type:"POST",
				url:"${pageContext.request.contextPath}/admin/question/save.action",
				data:jsonValue,  //要提交的数据
				dataType:"json",
				success:function(rs){   //var rs={"success":true,message:"",title:""}
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
			
			
		});

	});
	    
		$(function() {
               
			//加载表格
			initTable();
			 

			//点击查询(ajax自动刷新)
			$("#btnSearch").click(function(){
				$('#tb').bootstrapTable('refresh');
			});
		   
			
			//点击添加
			$("#btnAdd").click(function(){				
				addQuestion();
			});
			
			//点击修改
			$("#btnEdit").click(function(){				
				editQuestion();
			});
			
			//美化 单选框和复选框 样式
			 $('input').iCheck({
				    checkboxClass: 'icheckbox_flat-green',
				    radioClass: 'iradio_flat-green'
		     });
			
			//默认是1单选
			 loadAnswer(1);
			
			//当试题类型发生变化了
			questionTypeChanged();
		});
	    
	    
		//当试题类型发生变化了
	    function questionTypeChanged(){ 
	    	$("#editQuestionType").change(function(){
	    		var value=$(this).val(); //得到选中的值 1 ,2 ,3
	    		loadAnswer(value);
	    	}); 
	    }
	    
		//加载答案选项
		function loadAnswer(value){
			//清空选项
    		$("#dynamicAnswer").empty();
    	
    		var str="";
    		
    		if(value==1){ //单选
    			str="<select class=\"form-control\" id=\"editAnswer\" name=\"editAnswer\">";
    			str+="<option value=\"A\">A</option>";
    			str+="<option value=\"B\">B</option>";
    			str+="<option value=\"C\">C</option>";
    			str+="<option value=\"D\">D</option>";									  
			    str+="</select>";
			    
			    $("#divChoisec").show();  //选项C显示
			    $("#divChoised").show();  //选项D显示
    			
    		}else if(value==2){ //多选
    			str="<div  class=\"form-inline\">";
    			str+=" <input type=\"checkbox\" class=\"form-control\" name=\"editAnswer\"  value=\"A\">A　";
    			str+=" <input type=\"checkbox\" class=\"form-control\" name=\"editAnswer\"  value=\"B\">B　";
    			str+=" <input type=\"checkbox\" class=\"form-control\" name=\"editAnswer\"  value=\"C\">C　";
    			str+=" <input type=\"checkbox\" class=\"form-control\" name=\"editAnswer\"  value=\"D\">D　";
    			str+="</div>";
    			
    			 $("#divChoisec").show();  //选项C显示
 			    $("#divChoised").show();  //选项D显示
    			
    		}else{ //判断 
    			str="<div  class=\"form-inline\"> ";
    			str+=" <input type=\"radio\" class=\"form-control\" name=\"editAnswer\"  value=\"1\">对　";
    			str+=" <input type=\"radio\" class=\"form-control\" name=\"editAnswer\"  value=\"0\">错　";
    			str+="</div>";
    			$("#divChoisec").hide();  //隐藏C显示
 			    $("#divChoised").hide();  //隐藏D显示
    		}
    		//追加选项
    		$("#dynamicAnswer").append(str);
    		
    		//再次美化
    		/*
    		 $('input').iCheck({
				    checkboxClass: 'icheckbox_flat-green',
				    radioClass: 'iradio_flat-green'
		     });
    		*/
		}
		
		
	    
	    //添加试题
	    function addQuestion(){
	    	$("#modalLabel").html("新增");			
		     //清空数据		     
		     keQuestionName.html('');
		     keChoisea.html('');
		     keChoiseb.html('');
		     keChoisec.html('');
		     keChoised.html('');
		     $("#editQuestionType").val(1); //类型，默认1		    
		     $("editDifficult").val(1);    //难度  1 
		     
		     saveId=0; //新增
		     
			$('#formModel').modal();
	    }
	    
	    //修改试题
	    function editQuestion(){
	   
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
				 
				saveId=json.id;  //修改的编号				
				 keQuestionName.html( json.questionName);
			     keChoisea.html(json.choisea);
			     keChoiseb.html(json.choiseb);
			     keChoisec.html(json.choisec);
			     keChoised.html(json.choised);
			     $("#editQuestionType").val(json.questionType); //类型，默认1	(javascript不会去触发change改变事件的)			     
			     //重新加载选项
			     loadAnswer(json.questionType);
			     
			     $("editDifficult").val(json.difficult);    //难度  1 
			     
			     $("#editChildTypeId").val(json.childTypeId);//试题子分类
			     
			     
			    	 
			    	 //答案
				     if(json.questionType==1){//单选
				    	 $("#editAnswer").val(json.answer);
				     }else if(json.questionType==2){ //多选  A,B,C
				    	 
				    	 var arr=json.answer.split(",");  //分割
				    	 
				         for(var i=0;i<arr.length;i++){
				        	 $("input[name='editAnswer'][value='"+arr[i]+"']").prop("checked",true);
				         } 
				    	 
				     }else if(json.questionType==3){ // 判断
				    	 // name=\"editAnswer\"  value=\"1\"
				    	 if(json.answer=="1"){ //正确 
				    		 $("input[name='editAnswer'][value='1']").prop("checked",true);
				    	 }else{
				    		 $("input[name='editAnswer'][value='0']").prop("checked",true);
				    	 }
				     }
			    	 
			     
			     
				
				$("#modalLabel").html("编辑");
				
				//http://v3.bootcss.com/javascript/#modals
				$('#formModel').modal();
			}
	    	
	    }
	    
	    

		//初始化表格
		function initTable() {
			$('#tb').bootstrapTable(
							{
								url : '${pageContext.request.contextPath}/admin/question/api/data.action',
								pagination : true, //开启分页
								pageList : [ 5, 10, 15, 20, 30, 50 ],
								pageSize : 20, //默认大小 
								paginationPreText : "上一页",
								paginationNextText : "下一页",
								sortStable : true, //排序
								singleSelect : false, //禁止多选
								clickToSelect : true, //点击选中checkbox/radio
								checkboxHeader : true,
								sidePagination : "server",//分页发生在服务器端				   
								method : "post", //以post提交 
								contentType : "application/x-www-form-urlencoded", //post提交必须改
								sortName : "id", //默认以这个排序
								queryParams : function(params) { //自定义条件				    	 
                                    params["questionTypeId"]=$("#chooseParentId").val();
                                    params["difficult"]=$("#chooseDifficult").val();
                                    params["questionType"]=$("#chooseQuestionType").val();
									return params;
								},
								columns : [ {
									checkbox : true, //复选框 
									align : 'center',
									valign : 'middle'

								}, {
									field : 'id',
									title : '编号',
									sortable : true

								}, {
									field : 'questionName',
									title : '试题' 
									 
								}, {
									field : 'parentTypeId',
									title : '主分类',
									sortable : true,
									formatter:parentFormat,
								},{
									field : 'childTypeId',
									title : '子分类',
									formatter:childFormat,
									sortable : true
								}, {
									field : 'questionType',
									title : '试题类型',
									formatter : questionTypeFormat,
									sortable : true
								}, {
									field : 'difficult',
									title : '难易程序',
									formatter : difficultFormat,
									sortable : true
								}, {
									field : 'answer',
									title : '答案' 
								} ]
							});
		}
    
		
		//主分类格式化
		function parentFormat(value,row){
			return row.parentQuestiontype.typeName;
		}
	 
		//子分类格式化
		function childFormat(value,row){
			return row.childQuestiontype.typeName;
		}
		
		//试题类型格式化
		function questionTypeFormat(value,row){
			if(value==1){
				return "单选";
			}else if(value==2){
				return "多选";
			}else if(value==3){
				return "判断";
			}
			return "其它";
		}
		
		//难易程序格式化
		function difficultFormat(value,row){
			
		   var str="";
		   for(var i=0;i<value;i++){
			   str+="★";
		   } 
			return str;
		}
		
		
		//kindeditor注册
		KindEditor.ready(function(K) {		
			 
			//问题
			  keQuestionName = K.create('textarea[name="questionName"]', {
				resizeType : 1,
				themeType : 'simple',  //简单风格
				width:"100%",
				allowPreviewEmoticons : true,
				allowImageUpload : true,   //显示文件上传页面
				uploadJson : '${pageContext.request.contextPath}/resources/kindeditor/jsp/upload_json.jsp',   //文件上传页面
					items : [
						'source', '|','fontname', 'fontsize', '|', 'forecolor', 'hilitecolor', 'bold', 'italic', 'underline',
						'removeformat', '|', 'justifyleft', 'justifycenter', 'justifyright', 'insertorderedlist',
						'insertunorderedlist','table', '|', 'emoticons', 'image', 'link']
			});
			
			
			//选项A
			  keChoisea = K.create('textarea[name="choisea"]', {
				resizeType : 1,
				themeType : 'simple',  //简单风格
				width:"100%",
				allowPreviewEmoticons : true,
				allowImageUpload : true,   //显示文件上传页面
				uploadJson : '${pageContext.request.contextPath}/resources/kindeditor/jsp/upload_json.jsp',   //文件上传页面
					items : [
						'source', '|','fontname', 'fontsize', '|', 'forecolor', 'hilitecolor', 'bold', 'italic', 'underline',
						'removeformat', '|', 'justifyleft', 'justifycenter', 'justifyright', 'insertorderedlist',
						'insertunorderedlist','table', '|', 'emoticons', 'image', 'link']
			});
			
			//选项B
			  keChoiseb = K.create('textarea[name="choiseb"]', {
				resizeType : 1,
				themeType : 'simple',  //简单风格
				width:"100%",
				allowPreviewEmoticons : true,
				allowImageUpload : true,   //显示文件上传页面
				uploadJson : '${pageContext.request.contextPath}/resources/kindeditor/jsp/upload_json.jsp',   //文件上传页面
					items : [
						'source', '|','fontname', 'fontsize', '|', 'forecolor', 'hilitecolor', 'bold', 'italic', 'underline',
						'removeformat', '|', 'justifyleft', 'justifycenter', 'justifyright', 'insertorderedlist',
						'insertunorderedlist','table', '|', 'emoticons', 'image', 'link']
			});
			
			//选项C
			 keChoisec = K.create('textarea[name="choisec"]', {
				resizeType : 1,
				themeType : 'simple',  //简单风格
				width:"100%",
				allowPreviewEmoticons : true,
				allowImageUpload : true,   //显示文件上传页面
				uploadJson : '${pageContext.request.contextPath}/resources/kindeditor/jsp/upload_json.jsp',   //文件上传页面
					items : [
						'source', '|','fontname', 'fontsize', '|', 'forecolor', 'hilitecolor', 'bold', 'italic', 'underline',
						'removeformat', '|', 'justifyleft', 'justifycenter', 'justifyright', 'insertorderedlist',
						'insertunorderedlist','table', '|', 'emoticons', 'image', 'link']
			});
			
			//选项D
			 keChoised = K.create('textarea[name="choised"]', {
				resizeType : 1,
				themeType : 'simple',  //简单风格
				width:"100%",
				allowPreviewEmoticons : true,
				allowImageUpload : true,   //显示文件上传页面
				uploadJson : '${pageContext.request.contextPath}/resources/kindeditor/jsp/upload_json.jsp',   //文件上传页面
					items : [
						'source', '|','fontname', 'fontsize', '|', 'forecolor', 'hilitecolor', 'bold', 'italic', 'underline',
						'removeformat', '|', 'justifyleft', 'justifycenter', 'justifyright', 'insertorderedlist',
						'insertunorderedlist','table', '|', 'emoticons', 'image', 'link']
			});
			
			
		});
		
		
	</script>




</body>
</html>
