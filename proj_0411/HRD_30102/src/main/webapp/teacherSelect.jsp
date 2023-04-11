<%@page import="java.text.DecimalFormat"%>
<%@page import="vo.TeacherVO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<%
	ArrayList<TeacherVO> teacherList = (ArrayList<TeacherVO>) request.getAttribute("teacherList");
%>
<section>
	<h2>강사 정보 조회</h2>
	<table border=1>
		<tr>
			<td>강사코드</td>
			<td>강의명</td>
			<td>강사명</td>
			<td>수강료</td>
			<td>강사자격획득일</td>
		</tr>
<%
if(teacherList != null){
	for(TeacherVO dat : teacherList){
		
		DecimalFormat formater = new DecimalFormat("###,###");
		
		String date = dat.getTeach_regist_date();
		String y = date.substring(0, 4);
		String m = date.substring(4, 6);
		String d = date.substring(6, 8);
		
		String lastDate = y+"년"+m+"월"+d+"일";
%>
	<tr>
		<td><%=dat.getTeacher_code() %></td>
		<td><%=dat.getClass_name() %></td>
		<td><%=dat.getTeacher_name() %></td>
		<td><%=formater.format(dat.getClass_price()) %></td>
		<td><%=lastDate %></td>
	</tr>
<%
	}
}
%>
		<tr>
		</tr>
	</table>
</section>
<%@ include file="../footer.jsp" %>