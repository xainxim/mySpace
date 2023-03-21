<%@page import="dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<%
	MemberDAO dao = new MemberDAO();
	int nextCustNo = dao.getMaxNo();
%>
<section>
<h3>회원등록</h3>
<form action="/memberInsert" method="get" name="frm" onsubmit="return checkForm()">
<table>
	<tr>
		<td>회원번호(자동발생)</td>
		 <td><input type="text" value="<%=nextCustNo%>" name="custno" readonly></td>
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
		<td><input type="text" name="addr"></td>
	</tr>
	<tr>
		<td>가입일자</td>
		<td><input type="text" name="joindate"></td>
	</tr>
	<tr>
		<td>고객등급[A:VIP B:일반 C:직원]</td>
		<td><input type="text" name="grade"></td>
	</tr>
	<tr>
		<td>도시코드</td>
		<td><input type="text" name="city"></td>
	</tr>
	<tr>
		<td><input type="submit" value="등록">
		<a href="./memberSelect"><input type="button" value="조회"></a>
		</td>
	</tr>
</table>
</form>
</section>


<script>
	function checkForm() {
		if(document.frm.custname.value.trim()==""){
			alert("회원 성명이 입력되지 않았습니다");
			document.frm.custname.focus();
			return false;
		}
		if(document.frm.phone.value.trim()==""){
			alert("회원 전화가 입력되지 않았습니다");
			document.frm.phone.focus();
			return false;
		}
		if(document.frm.addr.value.trim()==""){
			alert("회원 통신사가 입력되지 않았습니다");
			document.frm.addr.focus();
			return false;
		}
		if(document.frm.joindate.value.trim()==""){
			alert("회원 가입날짜가 입력되지 않았습니다");
			document.frm.joindate.focus();
			return false;
		}
		if(document.frm.grade.value.trim()==""){
			alert("회원 등급이 입력되지 않았습니다");
			document.frm.grade.focus();
			return false;
		}
		if(document.frm.city.value.trim()==""){
			alert("회원 도시코드가 입력되지 않았습니다");
			document.frm.city.focus();
			return false;
		}
		alert("회원 등록이 완료되었습니다");
		return true;
	}
</script>


<%@ include file="../footer.jsp" %>