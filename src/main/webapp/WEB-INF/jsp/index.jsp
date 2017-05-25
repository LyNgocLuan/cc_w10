
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

<style>
	#small{
		width: 100;
	}
	.summary {
	  display: table-cell;
	  /*l&f*/
	  /* one line */
	  overflow: hidden;
	  /* make text overflow */
	  text-overflow: ellipsis;
	  /* truncate texT with ... */
	}
	/*td div {
	  overflow: hidden;
	  text-overflow: ellipsis;
	  white-space: inherit;
	}*/
    .table1{
    margin-left:100;
    margin-right:100; 
    }
    
</style>
</head>
<body>

	<div role="navigation">
		<div class="navbar navbar-inverse">
			<a href="/" class="navbar-brand">Content Manager</a>
			<div class="navbar-collapse collapse">
				<ul class="nav navbar-nav">
					<li><a href="/${content.id }">All Posts</a></li>
				</ul>
			</div>
		</div>
	</div>
	<c:choose>
	<c:when test="${mode == 'MODE_CONTENTS' }">
	
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
					<form:input path="tittle" cssClass="form-control" id="small" />
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
				
		</div>
	</div>
	</c:when> 
		<c:when test="${mode == 'MODE_NEWS' }">
			<div id="wrapper">
				<div class="content">
				<table border="0px" style="margin-bottom: 100">
					<tr>
						<th width="380px"></th>
						<th></th>
					</tr>
					<c:forEach var="c" items="${contents}"><!-- day nay  -->						
						<tr class="nn-record">
							<td></td>
							<td></td>
							<td width="300"><h1>${c.tittle}</h1></td>
							<td></td>						
							<td></td>
						</tr>
						<tr class="nn-record">
							<td></td>
							<td></td>
							<td width="300">${c.cont}</td>
							<td></td>						
							<td></td>
						</tr>
						<tr class="nn-record">
							<td></td>
							<td></td>
							<td width="600"><img src="${c.url}" width="550" height="400"></td>
							<td></td>						
							<td></td>
						</tr>
						<tr>
							<td></td>
							<td></td>
							<td width="600" style="text-align: center">For full image click <a href="${c.url }">here</a></td>
							<td></td>						
							<td></td>
						</tr>
						<tr>
							<td></td>
							<td></td>
							<td width="600" style="text-align: center">----------------------------------------------------------</td>
							<td></td>						
							<td></td>
						</tr>
					</c:forEach>
					<tr>
						<th width="380px"></th>
						<th></th>
					</tr>
				</table>
				</div>
			</div>
		</c:when>
	</c:choose>
	
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
