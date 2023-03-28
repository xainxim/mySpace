<%@page import="DTO.MemberDTO"%>
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
	int custno =  Integer.parseInt(request.getParameter("custno"));
	MemberDAO dao = new MemberDAO();
	MemberDTO dto = dao.selectMember(custno);
%>


<jsp:include page="header.jsp"></jsp:include>

	<section>
		<h2>홈쇼핑 회원 등록</h2>
	
		<form action="updateProc.jsp" name="registerForm">
			<table border="1" >
				<tr>
					<td>회원번호(자동발생)</td>
					<td><input type="text" name="custno" value="<%=dto.getCustno() %>" readonly="readonly"></td>
				</tr>
				
				<tr>
					<td>회원성명</td>
					<td><input type="text" name="custname" value="<%=dto.getCustname() %>"></td>
				</tr>
				
				<tr>
					<td>회원전화</td>
					<td><input type="text" name="phone" value="<%=dto.getPhone() %>"></td>
				</tr>
					
				<tr>
					<td>통신사[SK, KT, LG]</td>
					<td>
						<%
							if(dto.getAddress().equals("SK")) {
						%>
						<input type="radio" name="address" value="SK" checked> SK
						<input type="radio" name="address" value="KT"> KT
						<input type="radio" name="address" value="LG"> LG
						<%
							} else if(dto.getAddress().equals("KT")) {
						%>
						<input type="radio" name="address" value="SK"> SK
						<input type="radio" name="address" value="KT" checked> KT
						<input type="radio" name="address" value="LG"> LG
						<%
							} else { 
						%>
						<input type="radio" name="address" value="SK"> SK
						<input type="radio" name="address" value="KT"> KT
						<input type="radio" name="address" value="LG" checked> LG
						<%
							}
						%>						
					</td>
				</tr>
				
				<tr>
					<td>가입날자</td>
					<td><input type="date" name="joindate" value="<%=dto.getJoindate()%>"></td>
				</tr>
				
				<tr>
					<td>고객등급[A:VIP, B:일반, C:직원]</td>
					<td>
						<select name="grade">
						<%
							if(dto.getGrade().equals("A")) {
						%>
							<option value="A" selected>A</option>
							<option value="B">B</option>
							<option value="C">C</option>
						<%
							} else if(dto.getGrade().equals("B")) {
						%>
							<option value="A">A</option>
							<option value="B" selected>B</option>
							<option value="C">C</option>
						<%
							} else {
						%>
							<option value="A">A</option>
							<option value="B">B</option>
							<option value="C" selected>C</option>
						<%
						}
						%>						
						</select>
					</td>
				</tr>
				
				<tr>
					<td>도시코드</td>
					<td><input type="text" name="city" value="<%=dto.getCity()%>"></td>
				</tr>
				
				<tr>
					<td><input type="submit" value="수정"></td>
					<td><a href="select.jsp">조회</a></td>
				</tr>
			</table>
		</form>
	</section>

<jsp:include page="footer.jsp"></jsp:include>



</body>
</html>