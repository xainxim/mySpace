<%@page import="java.text.DecimalFormat"%>
<%@page import="vo.PriceVO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<%
	ArrayList<PriceVO> priceList = (ArrayList<PriceVO>) request.getAttribute("priceList");
%>
<section>
	<h3>회원매출조회</h3>
	<table border=1>
		<tr>
			<td>회원번호</td>
			<td>회원성명</td>
			<td>고객등급</td>
			<td>매출</td>
		</tr>
<%
	if(priceList != null){
		for(PriceVO dat : priceList){
			
		DecimalFormat formater = new DecimalFormat("###,###");
		%>
		<tr>
			<td><%=dat.getCustno() %></td>
			<td><%=dat.getCustname() %></td>
			<td><%=dat.getGrade() %></td>
			<td><%=formater.format(dat.getPrice()) %></td>
		</tr>
<%
		}
	}
%>
	</table>
</section>
<%@ include file="../footer.jsp" %>