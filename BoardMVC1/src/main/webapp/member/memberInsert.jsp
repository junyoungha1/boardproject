<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../board/header.jsp"%>
<script type="text/javascript">
	let check = 0;
	function checkId() {
		if ($("#id").val() == '') {
			alert("아이디를 입력하세요.");
			$("#id").focus();
			$("#id").css("border", "2px solid red");
			return;
		}

		let id = $("#id").val();
		$.ajax({
			url : "${ctx}/validIdAjax.do",
			type : "POST",
			data : {
				"id" : id
			},
			success : getResult,
			error : function() {
				alert("error");
			}
		})
	}

	function getResult(data) {
		if (data == "valid") {
			alert("사용 가능한 id입니다.");
			$("#id").focus();
			$("#id").css("border", "2px solid green");
			$("#id").attr('readonly', true);
			check = 1;
		} else if (data == "notValid") {
			alert("이미 사용중인 id 입니다.");
			$("#id").focus();
			$("#id").css("border", "2px solid red");
			check = -1;
		}
	}
	function validCheck(form) {
		if (check <= 0) {
			alert('id 중복체크를 해야 합니다');
			return false;
		}

		if (!form.email.value.match(/[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$/)) {
			alert("이메일 형식이 다릅니다! ex)test@test.com");
			form.email.focus();
			form.email.css("border", "2px solid red");
			return false;
		}

		if (!form.tel.value.match(/010-\d{3,4}-\d{4}/)) {
			alert("전화번호 형식이 다릅니다! ex)010-1234-1234");
			form.phone.focus();
			form.phone.css("border", "2px solid red");
			return false;
		}
		alert("회원가입 완료");
		form.submit();

	}
	window.onload = function() {
		$("#id").keyup(function(e) {
			if (e.keyCode == '8') {
				check = 0;
			}
			$("#id").css("border", "");
		});
	}
</script>
<div id="page-content-wrapper">
	<div class="container-fluid">
		<header>
			<h1 style="color: #007bff;">회원가입</h1>
		</header>
		<div class="main" style="width: 40%; height: 50%">
			<form action="${ctx}/memberInsert.do" method="post">
				<table>
					<tr>
						<td>아이디</td>
						<td><input type="text" name="id" id="id" autofocus required /></td>
						<td><input type="button" value="중복확인" onclick="checkId()"
							class="page-link" /></td>
					</tr>
					<tr>
						<td>패스워드</td>
						<td><input type="password" name="pw" required /></td>
					</tr>
					<tr>
						<td>전화번호</td>
						<td><input type="text" name="tel" /></td>
					</tr>
					<tr>
						<td>이메일</td>
						<td><input type="text" name="email" /></td>
					</tr>
					<tr>

						<td>취미</td>
						<td><input type="text" name="hobby" /></td>
					</tr>
					<tr>
						<td>나이</td>
						<td><input type="text" name="age" /></td>
					</tr>
					<tr>
						<td>자기 소개</td>
						<td><textarea name="info"></textarea></td>
					</tr>
				</table>
				<nav aria-label="Page navigation example">
					<ul class="pagination buttonBox"
						style="display: flex; justify-content: center">
						<li class="page-item"><input type="button" class="page-link"
							value="가입하기" onclick="validCheck(form)" /></li>
						<li class="page-item"><input type="button"
							class="page-link cancel" value="취소" /></li>
					</ul>
				</nav>
			</form>
		</div>
	</div>
</div>
<script src="js/jquery.min.js"></script>
<script src="js/bootstrap.bundle.min.js"></script>
<script>
	$(function() {
		$("#menu-toggle").click(function(e) {
			e.preventDefault();
			$("#wrapper").toggleClass("toggled");
		});

		$(window).resize(function(e) {
			if ($(window).width() <= 768) {
				$("#wrapper").removeClass("toggled");
			} else {
				$("#wrapper").addClass("toggled");
			}
		});
	});
	$(".cancel").click(function() {
		location.href = '${ctx}/board/main.jsp';
	})
</script>
</body>
</html>