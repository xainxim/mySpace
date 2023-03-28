<%@page import="DAO.MemberDAO"%>
<%@page import="DTO.MemberDTO"%>
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
		int custno = Integer.parseInt(request.getParameter("custno"));
		String custname = request.getParameter("custname");
		String phone = request.getParameter("phone");
		String address = request.getParameter("address");
		String grade = request.getParameter("grade");
		String city = request.getParameter("city");
		
		
		MemberDTO dto = new MemberDTO(custno, custname, phone, address, null, grade, city);
		MemberDAO dao = new MemberDAO();
		int cnt = dao.update(dto);
		if(cnt > 0) {
	%>
	<script type="text/javascript">
		alert('회원수정이 완료되었습니다')
		location.href="index.jsp";
	</script>
	<% } else { %>
	<script type="text/javascript">
		alert('회원수정이 실패하였습니다')
		history.go(-1);
	</script>	
	<%
		}
	%>
	
	
	
	
	
	
	
	

</body>
</html>