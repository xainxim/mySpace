package dao;

import java.lang.reflect.Array;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import common.JDBCUtil;
import vo.MemberVO;
import vo.PriceVO;

public class MemberDAO {
	public ArrayList<MemberVO> memberSelect(){
		ArrayList<MemberVO> list = new ArrayList<MemberVO>();
		
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		conn = JDBCUtil.getConnection();
		String sql = "select custno, custname, phone, address, joindate, \r\n"
				+ "decode(grade, 'A', 'VIP', 'B', '일반', 'C', '직원') grade,\r\n"
				+ "decode(city, '01', '서울', '10', '인천', '20', '성남', '30', '대전', '40', '광주', '60', '부산') city\r\n"
				+ "from member_tbl_02 order by custno";
		try {
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			
			while(rs.next()) {
				MemberVO vo = new MemberVO();
				vo.setCustno(rs.getInt("custno"));
				vo.setCustname(rs.getString("custname"));
				vo.setPhone(rs.getString("phone"));
				vo.setAddress(rs.getString("address"));
				vo.setJoindate(rs.getDate("joindate"));
				vo.setGrade(rs.getString("grade"));
				vo.setCity(rs.getString("city"));
				list.add(vo);
			}
		} catch (SQLException e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally {
			JDBCUtil.close(conn, ps, rs);
		}
		
		
		return list;
	}
	
	public int getMaxNo() {
		int nextCustNo = 0;
		
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		conn = JDBCUtil.getConnection();
		String sql = "select max(custno)+1 nextCustNo from member_tbl_02";
		
		try {
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			while(rs.next()) {
				nextCustNo = rs.getInt("nextCustNo");
			}
			
		}catch (SQLException e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally {
			JDBCUtil.close(conn, ps, rs);
		}
		
		return nextCustNo;
	}
	
	public int memberInsert(MemberVO vo) {
		int result = 0;
		
		Connection conn = null;
		PreparedStatement ps = null;
		
		conn = JDBCUtil.getConnection();
		String sql = "insert into member_tbl_02 values(?,?,?,?,?,?,?)";
		try {
			ps = conn.prepareStatement(sql);
			ps.setInt(1, vo.getCustno());
			ps.setString(2, vo.getCustname());
			ps.setString(3, vo.getPhone());
			ps.setString(4, vo.getAddress());
			ps.setDate(5, vo.getJoindate());
			ps.setString(6, vo.getGrade());
			ps.setString(7, vo.getCity());
			result = ps.executeUpdate();
			
		} catch (SQLException e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally {
			JDBCUtil.close(conn, ps);
		}
		
		return result;
	}
	
	
	public MemberVO getMemberSelect(int custno) {
		MemberVO vo = new MemberVO();
		
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		conn = JDBCUtil.getConnection();
		String sql = "select custno, custname, phone, address, TO_CHAR(joindate, 'YYYY-MM-DD') as joindate, grade, city  from member_tbl_02 where custno="+custno;
		
		try {
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			
			while(rs.next()) {
				vo.setCustno(rs.getInt("custno"));
				vo.setCustname(rs.getString("custname"));
				vo.setPhone(rs.getString("phone"));
				vo.setAddress(rs.getString("address"));
				vo.setJoindate(rs.getDate("joindate"));
				vo.setGrade(rs.getString("grade"));
				vo.setCity(rs.getString("city"));
			}
		}catch (SQLException e) {
			// TODO: handle exception
			System.out.println("----------선택한 회원조회중 오류---------------");
			e.printStackTrace();
		}finally {
			JDBCUtil.close(conn, ps, rs);
		}
		
		return vo;
	}
	
	public int memberUpdate(MemberVO vo) {
		int result = 0;
		
		Connection conn = null;
		PreparedStatement ps = null;
		
		conn = JDBCUtil.getConnection();
		String sql = "update member_tbl_02 set custname=?, phone=?, address=?, joindate=?, grade=?, city=? where custno=?";
		
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, vo.getCustname());
			ps.setString(2, vo.getPhone());
			ps.setString(3, vo.getAddress());
			ps.setDate(4, vo.getJoindate());
			ps.setString(5, vo.getGrade());
			ps.setString(6, vo.getCity());
			ps.setInt(7, vo.getCustno());
			
			result = ps.executeUpdate();
			
		}catch (SQLException e) {
			// TODO: handle exception
			System.out.println("----------------수정 dao 오류 -----------------");
			e.printStackTrace();
		}finally {
			JDBCUtil.close(conn, ps);
		}
		return result;

	}
	
	public ArrayList<PriceVO> priceSelect(){
		ArrayList<PriceVO> list = new ArrayList<PriceVO>();
		
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		conn = JDBCUtil.getConnection();
		
		String sql = "select member.custno, member.custname, decode(member.grade,'A', 'VIP', 'B', '직원', 'C', '일반') grade, sum(money.price) price\r\n"
				+ "from MEMBER_TBL_02 member, MONEY_TBL_02 money\r\n"
				+ "where member.custno = money.custno\r\n"
				+ "group by member.custno, member.custname, member.grade\r\n"
				+ "order by sum(money.price) desc";
		try {
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			
			while(rs.next()) {
				PriceVO vo = new PriceVO();
				vo.setCustno(rs.getInt("custno"));
				vo.setCustname(rs.getString("custname"));
				vo.setGrade(rs.getString("grade"));
				vo.setPrice(rs.getInt("price"));
				
				list.add(vo);
				
			}
		}catch (SQLException e) {
			// TODO: handle exception
			System.out.println("-----------priceSelect dao 오류-------------");
			e.printStackTrace();
		}
		return list;
	}
	
	
	
	
	
	
	
	
	
}
