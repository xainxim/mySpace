<%@page import="vo.MemberVO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<%
	ArrayList<MemberVO> memberList = (ArrayList<MemberVO>) request.getAttribute("memberList");
%>
<section>
	<h3>회원목록조회/수정</h3>
	<table border=1>
		<tr>
			<td>회원번호</td>
			<td>회원성명</td>
			<td>전화번호</td>
			<td>통신사</td>
			<td>가입일자</td>
			<td>고객등급</td>
			<td>거주지역</td>
		</tr>
<%
	if(memberList != null){
		for(MemberVO dat : memberList){
%>

		<tr>
			<td><a href="./memberUpdate.jsp?custno=<%=dat.getCustno() %>"><%=dat.getCustno() %></a></td>
			<td><%=dat.getCustname() %></td>
			<td><%=dat.getPhone() %></td>
			<td><%=dat.getAddress() %></td>
			<td><%=dat.getJoindate() %></td>
			<td><%=dat.getGrade() %></td>
			<td><%=dat.getCity() %></td>
		</tr>
<%
		}
	}
%>
	</table>
</section>
<%@ include file="../footer.jsp" %>