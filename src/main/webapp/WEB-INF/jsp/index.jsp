
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<link rel="stylesheet" type="text/css"
	href="webjars/bootstrap/3.3.7/css/bootstrap.min.css" />

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.4.0/css/font-awesome.min.css">
<link rel="stylesheet" href="/css/froala_editor.min.css">
<link rel="stylesheet" href="/css/froala_style.min.css">
<link rel="stylesheet" href="/css/plugins/code_view.min.css">
<link rel="stylesheet" href="/css/plugins/colors.min.css">
<link rel="stylesheet" href="/css/plugins/emoticons.min.css">
<link rel="stylesheet" href="/css/plugins/image.min.css">
<link rel="stylesheet" href="/css/plugins/line_breaker.min.css">
<link rel="stylesheet" href="/css/plugins/table.min.css">
<link rel="stylesheet" href="/css/plugins/char_counter.min.css">
<link rel="stylesheet" href="/css/plugins/video.min.css">
<link rel="stylesheet" href="/css/plugins/fullscreen.min.css">
<link rel="stylesheet" href="/css/plugins/quick_insert.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/codemirror/5.3.0/codemirror.min.css">
<link rel="stylesheet" href="/css/admin.css">
<!-- Bootstrap -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">

</head>
<body>
	<!-- /.container -->
	<div id="wrapper" style="padding: 10px">
		<h1>
			<center>UPLOAD</center>
		</h1>
		<div class="container">
			<form:form action="insert" enctype="multipart/form-data"
				modelAttribute="content" role="form">
				<div class="form-group">
					<label for="tittle">Title</label>
					<form:input path="tittle" cssClass="form-control" />
				</div>
				<div id="editor">
					<label for="content">Content</label>
					<form:textarea id="edit" rows="5" name="cont"
						cssClass="form-control" cols="" path="cont" />
				</div>
				</br>
				<div class="form-group col-md-4">
					<label for="name">File</label> <input id="file" type="file"
						name="file">
				</div>
				<div class="form-group">
					<label for="url"></label>
					<form:input path="url" disabled="true" cssClass="form-control" />
				</div>

				<center>
					<button class="btn btn-success btn-lg" data-action="insert">Upload</button>
			</form:form>
			${message}

			<h1 class="text-center">List Upload</h1>
			<table class="table table-default">
				<tr>
					<th>Id</th>
					<th>Title</th>
					<th>Content</th>
					<th>Url</th>
					<th></th>
				</tr>
				<c:forEach var="c" items="${contents}">
					<tr class="nn-record">
						<td>${c.id}</td>
						<td>${c.tittle}</td>
						<td>${c.cont}</td>
						<td>${c.url}</td>
						<%-- <td><a href="/${c.id}">Chi tiết</a></td> --%>
					</tr>
				</c:forEach>
			</table>

		</div>
	</div>


	<script type="text/javascript"
		src="https://cdnjs.cloudflare.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
	<script type="text/javascript"
		src="https://cdnjs.cloudflare.com/ajax/libs/codemirror/5.3.0/codemirror.min.js"></script>
	<script type="text/javascript"
		src="https://cdnjs.cloudflare.com/ajax/libs/codemirror/5.3.0/mode/xml/xml.min.js"></script>
	<script type="text/javascript" src="/js/froala_editor.min.js"></script>
	<script type="text/javascript" src="/js/plugins/align.min.js"></script>
	<script type="text/javascript" src="/js/plugins/char_counter.min.js"></script>
	<script type="text/javascript" src="/js/plugins/code_beautifier.min.js"></script>
	<script type="text/javascript" src="/js/plugins/code_view.min.js"></script>
	<script type="text/javascript" src="/js/plugins/colors.min.js"></script>
	<script type="text/javascript" src="/js/plugins/emoticons.min.js"></script>
	<script type="text/javascript" src="/js/plugins/entities.min.js"></script>
	<script type="text/javascript" src="/js/plugins/font_size.min.js"></script>
	<script type="text/javascript" src="/js/plugins/font_family.min.js"></script>
	<script type="text/javascript" src="/js/plugins/fullscreen.min.js"></script>
	<script type="text/javascript" src="/js/plugins/image.min.js"></script>
	<script type="text/javascript" src="/js/plugins/line_breaker.min.js"></script>
	<script type="text/javascript" src="/js/plugins/inline_style.min.js"></script>
	<script type="text/javascript" src="/js/plugins/link.min.js"></script>
	<script type="text/javascript" src="/js/plugins/lists.min.js"></script>
	<script type="text/javascript"
		src="/js/plugins/paragraph_format.min.js"></script>
	<script type="text/javascript" src="/js/plugins/paragraph_style.min.js"></script>
	<script type="text/javascript" src="/js/plugins/quick_insert.min.js"></script>
	<script type="text/javascript" src="/js/plugins/quote.min.js"></script>
	<script type="text/javascript" src="/js/plugins/table.min.js"></script>
	<script type="text/javascript" src="/js/plugins/save.min.js"></script>
	<script type="text/javascript" src="/js/plugins/url.min.js"></script>
	<script type="text/javascript" src="/js/plugins/video.min.js"></script>
	<script type="text/javascript" src="/js/languages/vi.js"></script>
	<script>
		$(function() {
			$('#edit').froalaEditor({
				language : 'vi',
				imageInsertButtons : [ 'imageByURL' ],
				videoInsertButtons : [ 'videoByURL', 'videoEmbed' ],
				imageUpload : false,
				pasteImage : false,
				height : 200

			});

			$("button[data-action]").click(function() {
				action = $(this).attr("data-action");
				this.form.action = "/" + action;
			});
		});
	</script>
	<script src="<c:url value="ckeditor/ckeditor.js" />"></script>
<script type="text/javascript" language="javascript">
   CKEDITOR.replace('edit', {width: '1139px',height: '200px'});
</script>
	<script src="static/js/jquery-1.11.1.min.js"></script>    
    <script src="static/js/bootstrap.min.js"></script>
</body>

</html>
