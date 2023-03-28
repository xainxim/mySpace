<%@page import="dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<%
	MemberDAO dao = new MemberDAO();
	int NextCustNo = dao.getMaxNum();
%>
<section>
<form action="/memberInsert" method="get" name="frm">
	<h3>홈쇼핑 회원 등록</h3>
	<table border=1>
		<tr>
			<td>회원번호(자동발생)</td>
			<td><input type="number" value="<%=NextCustNo%>" name="custno" readonly></td>
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
			<td>통신사</td>
			<td>
			<input type="radio" name="address" value="SK">SK
			<input type="radio" name="address" value="KT">KT
			<input type="radio" name="address" value="LG">LG
			</td>
		</tr>
		<tr>
			<td>가입일자</td>
			<td><input type="date" name="joindate"></td>
		</tr>
		<tr>
			<td>고객등급[A:VIP,B:일반,C:직원]</td>
			<td><input type="text" name="grade"></td>
		</tr>
		<tr>
			<td>도시코드</td>
			<td><input type="text" name="city"></td>
		</tr>
		<tr>
			<td></td>
			<td><input type="button" value="등록" onclick="checkForm()">
			<a href="./memberSelect"><input type="button" value="조회"></a>
			</td>
		</tr>
	</table>
</form>
</section>
<script>
	function checkForm() {
		if(document.frm.custname.value==""){
			alert("회원 성명이 입력되지 않았습니다.");
			document.frm.custname.focus()
			return;
		}
		if(document.frm.phone.value==""){
			alert("전화번호가 입력되지 않았습니다.");
			document.frm.phone.focus()
			return;
		}
		if(document.frm.address.value==""){
			alert("통신사가 입력되지 않았습니다.");
			document.frm.address.focus()
			return;
		}
		if(document.frm.joindate.value==""){
			alert("가입일자가 입력되지 않았습니다.");
			document.frm.joindate.focus()
			return;
		}
		if(document.frm.grade.value==""){
			alert("등급이 입력되지 않았습니다.");
			document.frm.grade.focus()
			return;
		}
		if(document.frm.city.value==""){
			alert("도시코드가 입력되지 않았습니다.");
			document.frm.city.focus()
			return;
		}
		alert("회원가입이 완료되었습니다.");
		document.frm.submit();
	}
</script>

<%@ include file="../footer.jsp" %>