package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import util.JDBCUtil;
import vo.MemberVO;
import vo.PriceVO;

public class MemberDAO {
	Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	
	public ArrayList<MemberVO> memberSelect(){
		ArrayList<MemberVO> list = new ArrayList<MemberVO>();
		
		conn = JDBCUtil.getConnection();
		String sql = "select custno, custname, phone,address, joindate,  \r\n"
				+ "decode(grade,'A','VIP','B','일반','C','직원')grade,\r\n"
				+ "decode(city,'01','서울','10','인천','20','성남','30','대전','40','광주','60','부산')city \r\n"
				+ "from member_tbl_02 \r\n"
				+ "order by custno";
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
		}catch (SQLException e) {
			// TODO: handle exception
			e.printStackTrace();
			System.out.println("----------memberSelect dao 오류----------");
		}
		return list;
	}
	
	public int getMaxNum() {
		int NextCustNo = 0;
		
		conn = JDBCUtil.getConnection();
		String sql = "select max(custno)+1 NextCustNo from member_tbl_02";
		try {
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			while(rs.next()) {
				NextCustNo = rs.getInt("NextCustNo");
			}
		}catch (SQLException e) {
			// TODO: handle exception
			e.printStackTrace();
			System.out.println("----------getMaxNum dao 오류-----------");
		}
		return NextCustNo;
	}
	
	public int memberInsert(MemberVO vo) {
		int result = 0;
		
		conn = JDBCUtil.getConnection();
		String sql="insert into member_tbl_02 values(?,?,?,?,?,?,?)";
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
		}catch (SQLException e) {
			// TODO: handle exception
			e.printStackTrace();
			System.out.println("-------------memberInsert dao 오류-----------");
		}
		return result;
	}
	
	public MemberVO getMemberSelect(int custno) {
		MemberVO vo = new MemberVO();
		
		conn = JDBCUtil.getConnection();
		String sql = "select * from member_tbl_02 where custno="+custno;
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
			
		} catch (SQLException e) {
			// TODO: handle exception
		}
		return vo;	
	}
	
	public int memberUpdate(MemberVO vo) {
		int result = 0;
		
		conn = JDBCUtil.getConnection();
		String sql = "update member_tbl_02 set custname=?,phone=?,address=?,joindate=?,\r\n"
				+ "grade=?,city=? where custno=?";
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
			e.printStackTrace();
			System.out.println("------------memberUpdate dao 오류--------------");
		}
		return result;
	}
	
	public ArrayList<PriceVO> priceSelect(){
		ArrayList<PriceVO> list = new ArrayList<PriceVO>();
		
		conn = JDBCUtil.getConnection();
		String sql = "select member.custno, member.custname, \r\n"
				+ "decode(member.grade,'A','VIP','B','일반','C','직원')grade, sum(money.price)price \r\n"
				+ "from member_tbl_02 member, money_tbl_02 money \r\n"
				+ "where member.custno = money.custno \r\n"
				+ "group by member.custno, member.custname, member.grade \r\n"
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
			
		} catch (SQLException e) {
			// TODO: handle exception
			e.printStackTrace();
			System.out.println("----------priceSelect dao 오류----------");
		}
		return list;
	}
}
