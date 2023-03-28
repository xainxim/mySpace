<%@page import="java.sql.Date"%>
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
	int custno = Integer.parseInt(request.getParameter("custno"));
	String custname = request.getParameter("custname");
	String phone = request.getParameter("phone");
	String address = request.getParameter("address");
	String joindate = request.getParameter("joindate"); 
	
	String grade = request.getParameter("grade");
	String city = request.getParameter("city");
	Date date = Date.valueOf(joindate);
	
	MemberDAO dao = new MemberDAO();
	MemberDTO dto = new MemberDTO(custno, custname, phone, address, date, grade, city);
	int cnt = dao.register(dto);
	
	if(cnt > 0) {
%>
	<script type="text/javascript">
		alert('회원 등록이 완료 되었습니다');
		location.href = "index.jsp";
	</script>
	
<%
	} else {
%>
	<script type="text/javascript">
		alert('회원 등록이 실패 하였습니다');
		history.go(-1);
	</script>
<%
	}
%>
	




















</body>
</html>