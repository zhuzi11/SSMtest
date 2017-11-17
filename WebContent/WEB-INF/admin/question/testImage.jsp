<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Kindeditor使用</title>

<jsp:include page="../common/bootstrap_css.jsp"></jsp:include>
 
<link href="${pageContext.request.contextPath }/resources/kindeditor/themes/default/default.css" rel="stylesheet">
 

</head>
<body>
  <h1>如何使用Kindeditor插件</h1>

 <p>
   <input type="text" id="url1" value="" /> 
    <input type="button" id="image1" value="选择图片" />（网络图片 + 本地上传）
  </p>
  
  <h1>Kindeditor富文 本框 结合textarea</h1>
   <p>
   
     <textarea name="answerA" class="form-control"  style="height:200px;visibility:hidden;">要输入的内容</textarea>
     
   </p>
 
 
 

</body>

<jsp:include page="../common/bootstrap_js.jsp"></jsp:include>
   <script src="${pageContext.request.contextPath }/resources/kindeditor/kindeditor-all-min.js"></script>
  <script src="${pageContext.request.contextPath }/resources/kindeditor/lang/zh-CN.js"></script>
  
  
  <script type="text/javascript">
  
    //初始化插件
	KindEditor.ready(function(K) {
		
		var editor = K.editor({
			uploadJson : '${pageContext.request.contextPath}/resources/kindeditor/jsp/upload_json.jsp',  //文件上传页面
            fileManagerJson : '${pageContext.request.contextPath}/resources/kindeditor/jsp/file_manager_json.jsp', //服务文件管理页面 
			allowFileManager : false  //显示 服务文件管理按钮 
		});
		
		
		//对image1选择图片 做点击事件
		K('#image1').click(function() {
			editor.loadPlugin('image', function() {
				editor.plugin.imageDialog({
					imageUrl : K('#url1').val(),  //图片初始化的值
					//当文件上传成功以后返回的结果
					clickFn : function(url, title, width, height, border, align) {
						K('#url1').val(url);
						editor.hideDialog();
					}
				});
			});
		});
		 
		
		//文本框
		 var answerA = K.create('textarea[name="answerA"]', {
			resizeType : 1,
			themeType : 'simple',  //简单风格
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
  
  
  
  
  
</html>