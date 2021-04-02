<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<meta name="description" content="Fashi Template">
<meta name="keywords" content="Fashi, unica, creative, html">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>질문과 답변 글 작성 페이지</title>

<link
	href="https://fonts.googleapis.com/css?family=Muli:300,400,500,600,700,800,900&display=swap"
	rel="stylesheet">

<!-- Css Styles -->
<link rel="stylesheet" href="/resources/css/bootstrap.min.css"
	type="text/css">
<link rel="stylesheet" href="/resources/css/font-awesome.min.css"
	type="text/css">
<link rel="stylesheet" href="/resources/css/themify-icons.css"
	type="text/css">
<link rel="stylesheet" href="/resources/css/elegant-icons.css"
	type="text/css">
<link rel="stylesheet" href="/resources/css/owl.carousel.min.css"
	type="text/css">
<link rel="stylesheet" href="/resources/css/nice-select.css"
	type="text/css">
<link rel="stylesheet" href="/resources/css/jquery-ui.min.css"
	type="text/css">
<link rel="stylesheet" href="/resources/css/slicknav.min.css"
	type="text/css">
<link rel="stylesheet" href="/resources/css/style.css" type="text/css">


<!-- bootstrap css cdn -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	type="text/css" />

<!-- jquery cdn -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="/resources/ckeditor/ckeditor.js"></script>


</head>

<body>
	<!-- Header -->
	<%@ include file="/WEB-INF/views/include/header.jsp"%>

	<div class="container" style="width: 800px;">

		

		<form action="${pageContext.request.contextPath}/commu/qna"
			enctype="multipart/form-data" method="post">
			
			<input type="hidden" class="form-control" name="memberVO.member_id"
				value="<sec:authentication property='name'/>">
			<h2 style="margin-top: 30px;">질문하기</h2>
			
			
			<select name="categoryVO.category_id"
			style="vertical-align: middle; text-align-last: center">
			
			<option value="1">고양이</option>
			<option value="2">강아지</option>
			<option value="3">파충류</option>
			<option value="4">조류</option>
			<option value="5">어류</option>
			<option value="6">기타</option>
			</select>
	
    <input type="file" name="file" multiple="multiple"/>
   

			<input type="text" class="form-control" name="title" placeholder="제목"
				style="margin-top: 30px; margin-bottom: 20px;">
			<textarea id="editor4" name="content" placeholder="내용"
				style="width: 770px; height: 400px; margin-bottom: 20px;"></textarea>
			<!-- 		<input type="text" class="form-control" name="hashtag" placeholder="해시태그"> -->

			<div id='ui-widget'>
				<input type="text" class="hashtag" name="hashtag" maxlength="100"
					placeholder="태그 목록" id="text_task" />

			</div>
		

			<script>
				var hashtag = document.getElementById('hashtag').innerHTML;
				var splitedArray = content.split(' ');
				var linkedContent = '';
				for ( var word in splitedArray) {
					word = splitedArray[word];
					if (word.indexOf('#') == 0) {
						word = '<a href=\'링크\'>' + word + '</a>';
					}
					linkedContent += word + ' ';
				}
				document.getElementById('hashtag').innerHTML = linkedContent;
						
			</script>


			<button type="submit" class="btn btn-warning float-right"
				style="float: right; margin-top: 30px;"
				onclick="location.href='${pageContext.request.contextPath}/commu/qna'">질문
				등록</button>

			<!-- <script>
/* add Tag by click or press enter, comma, space */
var elements = document.getElementById('element');
var taskSubmit = document.getElementById('btn_add_task');
var taskBox = document.querySelector('#text_task');
var taskList = document.getElementById('list_tasks');

/* Prevent input other than Korean, English and numbers */
taskBox.addEventListener('keyup',  removeSpecial);
function removeSpecial (e) {
   e.target.value = e.target.value.replace(/[^ㄱ-힣a-zA-Z0-9+#]/gi,"");
}

/* Prevent duplicate tags */

/* click */
document.addEventListener('click', clickFunction, false);
function clickFunction(e) {
    var task = taskBox.value.trim();
    var newLI = document.createElement('li');
    var removeBtn = document.createElement('button');
    var element = newLI.appendChild(document.createTextNode(task));
    if (taskBox.value != "") {
        e.preventDefault();
        taskList.appendChild(newLI);
        taskList.appendChild(removeBtn);
        taskBox.value = '';
    }
}

/* keyup */
document.addEventListener('keyup', keyupFunction, false);
function keyupFunction(e) {
    var keyCode = e.keyCode;
    var task = taskBox.value.trim();
    var newLI = document.createElement('li');
    var removeBtn = document.createElement('button');
    var element = newLI.appendChild(document.createTextNode(task));
    if ((taskBox.value != "") && (keyCode === 188 || keyCode === 13 || keyCode === 32))  {
        e.preventDefault();
        taskList.appendChild(newLI);
        newLI.appendChild(removeBtn);
        taskBox.value = '';
        removeBtn.addEventListener('click', function() {
            removeBtn.parentNode.removeChild(removeBtn);
            newLI.parentNode.removeChild(newLI);
        });
    }
}

/* Autocomplete using jQuery*/
$(function() {
	var languages = [
		"ActionScript", "AppleScript", "Asp","BASIC", "C",
		"C++", "Clojure", "COBOL", "ColdFusion", "Erlang",
		"Fortran", "Groovy", "Haskell", "Java", "JavaScript",
		"Lisp", "Perl", "PHP", "Python", "Ruby",
		"Scala", "Scheme"
	];

	$( "#text_task" ).autocomplete({
        source: languages
	});
});

</script> -->
		</form>
	</div>

	<!-- Footer -->
	<div style="margin-top: 100px">
		<%@ include file="/WEB-INF/views/include/footer.jsp"%>
	</div>

	<!-- Js Plugins -->
	<script src="/resources/js/jquery-3.3.1.min.js"></script>
	<script src="/resources/js/bootstrap.min.js"></script>
	<script src="/resources/js/jquery-ui.min.js"></script>
	<script src="/resources/js/jquery.countdown.min.js"></script>
	<script src="/resources/js/jquery.nice-select.min.js"></script>
	<script src="/resources/js/jquery.zoom.min.js"></script>
	<script src="/resources/js/jquery.dd.min.js"></script>
	<script src="/resources/js/jquery.slicknav.js"></script>
	<script src="/resources/js/owl.carousel.min.js"></script>
	<script src="/resources/js/main.js"></script>

</body>
</html>
