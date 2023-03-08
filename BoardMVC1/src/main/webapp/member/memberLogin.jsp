<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../board/header.jsp"%>
<script
	src='https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js'></script>
<script type="text/javascript">
	function checkLogin(){
		if ($("#id").val() == '') {
			alert("아이디를 입력하세요.");
			$("#id").focus();
			$("#id").css("border", "2px solid red");
			return;
		}
		if ($("#pw").val() == '') {
			alert("비밀번호를 입력하세요.");
			$("#pw").focus();
			$("#pw").css("border", "2px solid red");
			return;
		}

		let id = $("#id").val();
		let pw = $("#pw").val();
		$.ajax({
			url : "${ctx}/memberLogin.do",
			type : "POST",
			data : {
				"id" : id,
				"pw" : pw
			},
			success : getResult,
			error : function() {
				alert("error");
			}
		})
	}
	
	function getResult(data){
		if(data=="valid"){
			alert(${log});
			location.href = '${ctx}/board/main.jsp'
		}else if(data=="notValid"){
			alert("id 혹은 pw를 확인하세요");
			history.back();
		}
	}	
	
	
	
	</script>
<div id="page-content-wrapper">
	<div class="container-fluid">
		<header>
			<h1 style="color: #007bff;">로그인</h1>
		</header>
		<div class="main" style="width: 30%; height: 15%">
			<table>
				<tr>
					<td>아이디</td>
					<td><input type="text" id="id" name="id" autofocus required /></td>
				</tr>
				<tr>
					<td>패스워드</td>
					<td><input type="password" id="pw" name="pw" /></td>
				</tr>
			</table>
			<nav aria-label="Page navigation example">
				<ul class="pagination buttonBox">
					<li class="page-item"><input type="button"
						class="page-link login" onclick="checkLogin()" value="로그인" /></li>
					<li class="page-item"><input type="button"
						class="page-link join" value="회원가입" /></li>
				</ul>
			</nav>
		</div>
	</div>
</div>
<!-- /#page-content-wrapper -->
</div>
<!-- /#wrapper -->
<!-- Bootstrap core JavaScript -->
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
	
	$(".join").click(function(e){
		 location.href = '${ctx}/memberInsert.do';
	})
	

	
</script>
</body>
</html>
