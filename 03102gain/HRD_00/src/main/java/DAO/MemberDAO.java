package DAO;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import DTO.MemberDTO;
import DTO.PriceDTO;
import Util.JDBCUtil;

public class MemberDAO {
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	final String INSERT_MEMBER = "INSERT INTO member_tbl_02 values(?,?,?,?,?,?,?)";
	final String FIND_MAX_CUSTNO = "SELECT max(custno) FROM member_tbl_02";
	final String SELECT_MEMBER_ALL = "SELECT * FROM member_tbl_02";
	final String SELECT_MEMBER = "SELECT * FROM member_tbl_02 WHERE custno = ?";
	final String UPDATE_MEMBER = "UPDATE member_tbl_02 SET custname=?, phone=?, address=?, grade=?, city=? where custno=?";
	final String SELECT_PRICE = "SELECT member.custno, member.custname, member.grade, sum(money.price) price "
			+ "FROM member_tbl_02 member, money_tbl_02 money "
			+ "WHERE member.custno = money.custno "
			+ "GROUP BY member.custno, member.custname, member.grade "
			+ "ORDER BY sum(money.price) desc";
	
	
	
	
	public int maxCustno() {
		int max = 0;
		try {
			con = JDBCUtil.getConnection();
			pstmt = con.prepareStatement(FIND_MAX_CUSTNO);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				max = rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return max;
	}
	
	
	
	public int register(MemberDTO dto) {
		int cnt = 0;
		try {
			con = JDBCUtil.getConnection();
			pstmt = con.prepareStatement(INSERT_MEMBER);
			pstmt.setInt(1, dto.getCustno());
			pstmt.setString(2, dto.getCustname());
			pstmt.setString(3, dto.getPhone());
			pstmt.setString(4, dto.getAddress());
			pstmt.setDate(5, dto.getJoindate());
			pstmt.setString(6, dto.getGrade());
			pstmt.setString(7, dto.getCity());
			
			cnt = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return cnt;
	}
	
	
	public ArrayList<MemberDTO> selectMembers() {
		ArrayList<MemberDTO> list = new ArrayList<>();
		
		// getConnection
		try {
			con = JDBCUtil.getConnection();
			// SELECT Query
			pstmt = con.prepareStatement(SELECT_MEMBER_ALL);
			// pstmt
			// rs
			rs = pstmt.executeQuery();
			// rs.next
			while(rs.next()) {
				// rs get
				int custno = rs.getInt("custno");
				String custname = rs.getString("custname");
				String phone = rs.getString("phone");
				String address = rs.getString("address");
				Date joindate = rs.getDate("joindate");
				String grade = rs.getString("grade");
				String city = rs.getString("city");
				// ArrayList add DTO type
				MemberDTO dto = new MemberDTO(custno, custname, phone, address, joindate, grade, city);
				list.add(dto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		// return arraylist
		return list;
	}
	
	
	public MemberDTO selectMember(int custno) {
		MemberDTO dto = null;
		try {
			con = JDBCUtil.getConnection();
			pstmt = con.prepareStatement(SELECT_MEMBER);
			pstmt.setInt(1, custno);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				String custname = rs.getString("custname");
				String phone = rs.getString("phone");
				String address = rs.getString("address");
				Date joindate = rs.getDate("joindate");
				String grade = rs.getString("grade");
				String city = rs.getString("city");
				
				dto = new MemberDTO(custno, custname, phone, address, joindate, grade, city); 
				return dto;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}
	
	
	public int update(MemberDTO dto) {
		int cnt = 0;
		try {
			con = JDBCUtil.getConnection();
			pstmt = con.prepareStatement(UPDATE_MEMBER);
			pstmt.setString(1, dto.getCustname());
			pstmt.setString(2, dto.getPhone());
			pstmt.setString(3, dto.getAddress());
			pstmt.setString(4, dto.getGrade());
			pstmt.setString(5, dto.getCity());
			pstmt.setInt(6, dto.getCustno());
			cnt = pstmt.executeUpdate();
			return cnt;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return cnt;
	}
	
	
	public ArrayList<PriceDTO> getPrice() {
		ArrayList<PriceDTO> lists = new ArrayList<>();
		try {
			con = JDBCUtil.getConnection();
			pstmt = con.prepareStatement(SELECT_PRICE);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				int custno = rs.getInt("custno");
				String custname = rs.getString("custname");
				String grade = rs.getString("grade");
				int price = rs.getInt("price");
				
				PriceDTO dto = new PriceDTO(custno, custname, grade, price);
				lists.add(dto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return lists;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
