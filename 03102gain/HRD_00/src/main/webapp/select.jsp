<%@page import="DTO.MemberDTO"%>
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
	ArrayList<MemberDTO> lists = dao.selectMembers();

%>
<jsp:include page="header.jsp"></jsp:include>
	<section>
		<h2>회원목록조회/수정</h2>
		
		<table border="1">
			<tr>
				<th>회원번호</th>
				<th>회원성명</th>
				<th>전화번호</th>
				<th>통신사</th>
				<th>가입일자</th>
				<th>고객등급</th>
				<th>거주지역</th>
			</tr>
			<%
				for(MemberDTO list : lists) {
					String grade = "";
					String city = "";
					
					switch(list.getGrade()) {
						case "A" : grade = "VIP"; break;
						case "B" : grade = "일반"; break;
						case "C" : grade = "직원"; break;
					}
					
					switch(list.getCity()) {
					case "01" : city = "서울"; break;
					case "10" : city = "인천"; break;
					case "20" : city = "성남"; break;
					case "30" : city = "대전"; break;
					case "40" : city = "광주"; break;
					case "60" : city = "부산"; break;
					}
				
			%>

					<tr>
						<td><a href="update.jsp?custno=<%=list.getCustno()%>"><%=list.getCustno() %></a></td>
						<td><%=list.getCustname() %></td>
						<td><%=list.getPhone() %></td>
						<td><%=list.getAddress() %></td>
						<td><%=list.getJoindate() %></td>
						<td><%=grade %></td>
						<td><%=city %></td>
					</tr>
					
			<%
				}
			%>

		</table>
	</section>

<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>