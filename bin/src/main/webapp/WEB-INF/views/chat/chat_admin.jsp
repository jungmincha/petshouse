<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<title>${username}님의 채팅방</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>

 <style>
	.chating .me{
		text-align: right;
		color:#B68421;
	}
	
	.chating .others{
		text-align: left;
		color:#5E7286;
	}
	
	#chating {
		height: 500px;
		overflow: scroll;
		
	}
	
	.inputTable{
	margin : 5px;
	}	 
	
</style>
 
<script type="text/javascript">
	var ws;
	
	function wsOpen(){
		//웹소켓 전송시 현재 방의 번호를 넘겨서 보낸다.
		ws = new WebSocket("ws://" + location.host + "/chatting/"+$("#username").val());
		wsEvt();
	}
		
	function wsEvt() {
		ws.onopen = function(data){
			//소켓이 열리면 동작
		}
		
		ws.onmessage = function(data) {
			//메시지를 받으면 동작
			var msg = data.data;
			if(msg != null && msg.trim() != ''){
				var d = JSON.parse(msg);
				if(d.type == "getId"){
					var si = d.sessionId != null ? d.sessionId : "";
					if(si != ''){
						$("#sessionId").val(si); 
					}
				}else if(d.type == "message"){
					if(d.sessionId == $("#sessionId").val()){
						$("#chating").append("<p class='me'> " + d.msg + ": 펫츠하우스</p>");	
					}else{
						$("#chating").append("<p class='others'>" + d.username + " :" + d.msg + "</p>");
					}
						
				}else{
					console.warn("unknown type!")
				}
			}
		}
	
		document.addEventListener("keypress", function(e){
			if(e.keyCode == 13){ //enter press
				send();
			}
		});
	}
	
	function send() {
		var option ={
			type: "message",
			sessionId : $("#sessionId").val(),
			username : "${username}",
			msg : $("#chatting").val()
		}
		ws.send(JSON.stringify(option))
		$('#chatting').val("");
	}
	
	$(document).ready(function() {
		wsOpen();
	})
</script>
</head>
<body>

	<!-- header -->

	

	<!-- Page Content -->
 
	<div id="container" class="container">
		<h5>${username}님의 채팅방</h5>
		<input type="hidden" id="sessionId" value="">
		<input type="hidden" id="username" value="${username}">
		
		<div id="chating" class="chating col-md-12">
		</div>
		<div id="yourMsg">
			<table class="inputTable col-md-12">
				<tr>
					<th>메시지</th>
					<th><input id="chatting" style="width:250px;" placeholder="보내실 메시지를 입력하세요."></th> 
					<th><button  onclick="send()" id="sendBtn">보내기</button></th>
				</tr>
			</table>
		</div>
	</div>
</body>
	
	
	
	<!-- Footer -->

	
	
</body>
</html>