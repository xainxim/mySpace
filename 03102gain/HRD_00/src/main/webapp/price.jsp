<%@page import="java.text.DecimalFormat"%>
<%@page import="DTO.PriceDTO"%>
<%@page import="java.util.ArrayList"%>
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
	ArrayList<PriceDTO> lists = dao.getPrice();
%>

<jsp:include page="header.jsp"></jsp:include>
	<section>
		<h2>회원매출조회</h2>
		<table border="1">
			<tr>
				<th>회원번호</th>
				<th>회원성명</th>
				<th>고객등급</th>
				<th>매출</th>
			</tr>
			
				<%
					for(PriceDTO list : lists) {
						String grade = "";
						
						switch(list.getGrade()) {
						case "A" : grade = "VIP"; break;
						case "B" : grade = "일반"; break;
						case "C" : grade = "직원"; break;
						}
						
						DecimalFormat formater = new DecimalFormat("###,###");
				%>
					<tr>
						<td><%=list.getCustno() %></td>
						<td><%=list.getCustname() %></td>
						<td><%=grade %></td>
						<td><%=formater.format(list.getPrice()) %></td>
					</tr>
				<%
					}
				%>
		</table>
	</section>
	
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>