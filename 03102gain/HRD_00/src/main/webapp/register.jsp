<%@page import="DAO.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
	MemberDAO dao = new MemberDAO();
	int max = dao.maxCustno() + 1;
	

%>


<jsp:include page="header.jsp"></jsp:include>

	<section>
		<h2>홈쇼핑 회원 등록</h2>
	
		<form action="registerProc.jsp" name="registerForm">
			<table border="1" >
				<tr>
					<td>회원번호(자동발생)</td>
					<td><input type="text" name="custno" value="<%=max%>" readonly="readonly"></td>
				</tr>
				
				<tr>
					<td>회원성명</td>
					<td><input type="text" name="custname"></td>
				</tr>
				
				<tr>
					<td>회원전화</td>
					<td><input type="text" name="phone"></td>
				</tr>
					
				<tr>
					<td>통신사[SK, KT, LG]</td>
					<td>
						<input type="radio" name="address" value="SK"> SK
						<input type="radio" name="address" value="KT"> KT
						<input type="radio" name="address" value="LG"> LG
					</td>
				</tr>
				
				<tr>
					<td>가입날자</td>
					<td><input type="date" name="joindate"></td>
				</tr>
				
				<tr>
					<td>고객등급[A:VIP, B:일반, C:직원]</td>
					<td>
						<select name="grade">
							<option value="A">A</option>
							<option value="B">B</option>
							<option value="C">C</option>
						</select>
					</td>
				</tr>
				
				<tr>
					<td>도시코드</td>
					<td><input type="text" name="city"></td>
				</tr>
				
				<tr>
					<td><input type="button" value="등록"></td>
					<td><a href="select.jsp">조회</a></td>
				</tr>
			</table>
		</form>
	</section>

<jsp:include page="footer.jsp"></jsp:include>

<script type="text/javascript">
	function check() {
		if(document.registerForm.custname.value=="") {
			alert("회원 성명이 입력되지 않았습니다")
			document.registerForm.custname.focus()
			return;
		}
		if(document.registerForm.phone.value=="") {
			alert("회원 전화가 입력되지 않았습니다")
			document.registerForm.phone.focus()
			return;
		}
		if(document.registerForm.address.value=="") {
			alert("회원 통신사가 입력되지 않았습니다")
			document.registerForm.address.focus()
			return;
		}
		if(document.registerForm.joindate.value=="") {
			alert("가입날짜가 입력되지 않았습니다")
			document.registerForm.joindate.focus()
			return;
		}
		if(document.registerForm.grade.value=="") {
			alert("고객등급이 입력되지 않았습니다")
			document.registerForm.grade.focus()
			return;
		}
		if(document.registerForm.city.value=="") {
			alert("도시코드가 입력되지 않았습니다")
			document.registerForm.city.focus()
			return;
		}
		
		document.registerForm.submit();
		
	}
	
	
	
	
	
	
	
	
	
	

</script>



</body>
</html>