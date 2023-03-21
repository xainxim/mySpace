<%@page import="vo.MemberVO"%>
<%@page import="dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>

<%
	int custno = Integer.parseInt(request.getParameter("custno"));
	MemberDAO dao = new MemberDAO();
	MemberVO vo = dao.getMemberSelect(custno);
%>
<section>

<h3>회원정보 수정</h3>
<form action="/memberUpdate" method="get">
	<table>
		<tr>
			<td>회원번호</td>
			<td><input type="number" value="<%=vo.getCustno()%>" name="custno" readonly></td>
		</tr>
		<tr>
			<td>회원성명</td>
			<td><input type="text" value="<%=vo.getCustname()%>" name="custname"></td>
		</tr>
		<tr>
			<td>회원전화</td>
			<td><input type="text" value="<%=vo.getPhone()%>" name="phone"></td>
		</tr>
		<tr>
			<td>통신사</td>
			<td><input type="text" value="<%=vo.getAddress()%>" name="addr"></td>
		</tr>
		<tr>
			<td>가입일자</td>
			<td><input type="text" value="<%=vo.getJoindate()%>" name="joindate"></td>
		</tr>
		<tr>
			<td>고객등급</td>
			<td><input type="text" value="<%=vo.getGrade()%>" name="grade"></td>
		</tr>
		<tr>
			<td>도시코드</td>
			<td><input type="text" value="<%=vo.getCity()%>" name="city"></td>
		</tr>
		<tr>
			<td><input type="submit" value="수정">
			<a href="./memberSelect"><input type="button" value="조회"></a>
			</td>
		</tr>
	</table>
</form>



</section>

<%@ include file="../footer.jsp" %>