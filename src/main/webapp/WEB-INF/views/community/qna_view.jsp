<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!-- 추가함 -->
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<meta charset="UTF-8">
<meta name="description" content="Fashi Template">
<meta name="keywords" content="Fashi, unica, creative, html">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>질문과 답변 글 조회</title>

<!-- bootstrap css cdn -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	type="text/css" />

<!-- jquery cdn -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

</head>

<body>

	<!-- Header -->
	<%@ include file="/WEB-INF/views/include/header.jsp"%>

	<div class="container" style="margin-bottom: 40px">
		<div class="head">
			<div style="margin-top: 45px; margin-bottom: 10px;">
				<a class="qna-subtitle" href="qna">질문과 답변</a>
			</div>
			<h3 class="qnatitle" style="font-weight: bold; margin-bottom: 10px;">${qna_view.title}</h3>
		</div>

		<div style="float: right">



			<button type="button" class="btn btn-warning"
				onclick="modify_event();">modify</button>

			<button type="button" onclick="button_event();">delete</button>
		</div>

		<script type="text/javascript">
			function button_event() {
				if (confirm("정말 삭제하시겠습니까?") == true) { //확인
					location.href = '${pageContext.request.contextPath}/commu/delete?board_id=${qna_view.board_id}'
				} else { //취소
					return;
				}
			}

			function modify_event() {
				if (confirm("수정하시겠습니까?") == true) { //확인
					location.href = '${pageContext.request.contextPath}/commu/modify_page?board_id=${qna_view.board_id}'
				} else { //취소
					return;
				}
			}
		</script>

		<table>
			<td>
				<div style="font-size: 20px;">${qna_view.memberVO.nickname}</div> <section
					style="margin-top:40px; margin-bottom:20px;">${qna_view.content}</section>
<script>
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
</script>

				<span style="color: gray">${qna_view.pdate}</span> <span
				style="color: gray">조회수 ${qna_view.hit}</span>
			</td>
		</table>
	</div>


	<!-- comment인데 아직 멀었음요 -->
	<%@ include file="/WEB-INF/views/include/comment.jsp"%>

	<div style="margin-top: 20px;">
		<!-- Footer -->
		<%@ include file="/WEB-INF/views/include/footer.jsp"%>
	</div>
</body>
</html>
