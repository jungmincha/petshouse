<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
   content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<meta name="viewport"
   content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1">
<title>event</title>

<!-- bootstrap css cdn -->
<link rel="stylesheet"
   href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
   type="text/css" />
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
<!-- jquery cdn -->
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
</head>

<body>
   <!-- header -->
   <%@ include file="/WEB-INF/views/include/header.jsp"%>
 
 <div module="Attend_calendarPackage">
    <!--@css(/css/module/attend/calendarPackage.css)-->
    <div module="attend_calendarhead">
        <!--
            $login_page = /member/login.html
        -->
        <div class="inner">
            <p class="date">{$year}.{$month}</p>
            <p class="prev"><a href="{$prev_month}"><img src="http://img.echosting.cafe24.com/skin/base_ko_KR/calendar/btn_prev.gif" alt="이전 달" /></a></p>
            <p class="next"><a href="{$next_month}"><img src="http://img.echosting.cafe24.com/skin/base_ko_KR/calendar/btn_next.gif" alt="다음 달" /></a></p>
        </div>
    </div>
    <table module="attend_calendar" border="1" summary="">
        <!--
            $login_page = /member/login.html
        -->
        <caption>출석이벤트 달력</caption>
        <colgroup>
            <col style="width:15%;" />
            <col style="width:14%;" />
            <col style="width:14%;" />
            <col style="width:14%;" />
            <col style="width:14%;" />
            <col style="width:14%;" />
            <col style="width:15%;" />
        </colgroup>
        <thead>
            <tr>
                <th scope="col" class="sun"><span>SUN</span></th>
                <th scope="col"><span>MON</span></th>
                <th scope="col"><span>TUE</span></th>
                <th scope="col"><span>WED</span></th>
                <th scope="col"><span>THU</span></th>
                <th scope="col"><span>FRI</span></th>
                <th scope="col" class="sat"><span>SAT</span></th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td><p>{$sun}</p></td>
                <td><p>{$mon}</p></td>
                <td><p>{$the}</p></td>
                <td><p>{$wed}</p></td>
                <td><p>{$thu}</p></td>
                <td><p>{$fri}</p></td>
                <td><p>{$sat}</p></td>
            </tr>
            <tr>
                <td><p>{$sun}</p></td>
                <td><p>{$mon}</p></td>
                <td><p>{$the}</p></td>
                <td><p>{$wed}</p></td>
                <td><p>{$thu}</p></td>
                <td><p>{$fri}</p></td>
                <td><p>{$sat}</p></td>
            </tr>
        </tbody>
    </table>
    <div module="attend_button">
        <!--
            $login_page = /member/login.html
        -->
        <a href="#none" onclick="{$action_attend}"><img src="http://img.echosting.cafe24.com/skin/base_ko_KR/calendar/btn_attend.gif" alt="출석체크" /></a>
        <div class="{$attendSecurityLayer}" style="display:none; left:300px; top:700px; text-align:left;">
            <h3>스팸 출석체크 방지 문자 입력</h3>
            <div class="content">
                <fieldset>
                    <legend>보안문자 입력</legend>
                    <p class="form">
                        <img src="{$secure_img}" alt="보안문자" />
                        {$form.secure_text}
                    </p>
                    <p class="description"><img src="http://img.echosting.cafe24.com/skin/base_ko_KR/board/ico_warning.gif" alt="" /> 왼쪽의 문자를 공백없이 입력하세요.(대소문자구분)</p>
                </fieldset>
            </div>
            <div class="btnArea">
                <a href="#none"><img src="http://img.echosting.cafe24.com/skin/base_ko_KR/calendar/btn_security_ok.gif" alt="확인" onclick="{$action_capcha_do}"/></a>
                <a href="#none"><img src="http://img.echosting.cafe24.com/skin/base_ko_KR/calendar/btn_security_cancel.gif" alt="취소" onclick="{$action_capcha_undo}" /></a>
            </div>
            <div class="close"><a href="#none" onclick="$('.attendSecurityLayer').hide();"><img src="http://img.echosting.cafe24.com/skin/base_ko_KR/common/btn_close.png" alt="닫기" /></a></div>
        </div>
    </div>
</div>
 
 
   <!-- Footer -->
   <%@ include file="/WEB-INF/views/include/footer.jsp"%>

   <!-- Bootstrap core JavaScript -->
   <script src="/resources/store/vendor/jquery/jquery.min.js"></script>
   <script
      src="/resources/store/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
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

