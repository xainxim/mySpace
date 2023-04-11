package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import util.JDBCUtil;
import vo.TeacherVO;

public class TeacherDAO {
	Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	
	public ArrayList<TeacherVO> teacherSelect(){
		ArrayList<TeacherVO> list = new ArrayList<TeacherVO>();
		conn = JDBCUtil.getConnection();
		String sql = "select * from tbl_teacher_202201";
		try {
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			while(rs.next()) {
				TeacherVO vo = new TeacherVO();
				vo.setTeacher_code(rs.getString("teacher_code"));
				vo.setClass_name(rs.getString("class_name"));
				vo.setTeacher_name(rs.getString("teacher_name"));
				vo.setClass_price(rs.getInt("class_price"));
				vo.setTeach_regist_date(rs.getString("teach_regist_date"));
				list.add(vo);
			}
			
		} catch (SQLException e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return list;
	}

}
