package kr.member.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class MemberDAO {

	private MemberDAO() {
	}

	static private MemberDAO instance = new MemberDAO();

	static public MemberDAO getInstance() {
		return instance;
	}

	private Connection conn;
	private PreparedStatement ps;
	private ResultSet rs;

	public void connect() {
		String URL = "jdbc:mysql://localhost:3306/rentcardb?characterEncoding=UTF-8&serverTimezone=UTC&useSSL=false";
		String user = "root";
		String password = "root";
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection(URL, user, password);
			System.out.println("db 연동성공: " + conn);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public int memberInsert(Member m) {
		String SQL = "insert into member(id, pw1, email, tel, hobby, job, age, info) values(?,?,?,?,?,?,?,?)";
		connect();

		int cnt = -1;
		try {
			ps = conn.prepareStatement(SQL);
			ps.setString(1, m.getId());
			ps.setString(2, m.getPw());
			ps.setString(3, m.getEmail());
			ps.setString(4, m.getTel());
			ps.setString(5, m.getHobby());
			ps.setString(6, m.getJob());
			ps.setString(7, m.getAge());
			ps.setString(8, m.getInfo());

			cnt = ps.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			dbClose();
		}
		return cnt;
	}

	public ArrayList<Member> memberList() {
		String SQL = "select * from member";
		connect();
		ArrayList<Member> list = new ArrayList<Member>();
		try {
			ps = conn.prepareStatement(SQL);
			rs = ps.executeQuery();
			while (rs.next()) {
				String id = rs.getString("id");
				String pw = rs.getString("pw1");
				String email = rs.getString("email");
				String tel = rs.getString("tel");
				String hobby = rs.getString("hobby");
				String job = rs.getString("job");
				String age = rs.getString("age");
				String info = rs.getString("info");
				Member m = new Member(id, pw, email, tel, hobby, job, age, info);
				list.add(m);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			dbClose();
		}
		return list;
	}

	public boolean isValidId(String id) {
		String SQL = "select pw1 from member where id=?";
		connect();

		try {
			ps = conn.prepareStatement(SQL);
			ps.setString(1, id);
			rs = ps.executeQuery();
			return rs.next();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			dbClose();
		}
		return false;
	}

	public boolean checkLogin(String id, String pw) {
		String SQL = "select * from member where id=? and pw1=?";
		connect();
		try {
			ps = conn.prepareStatement(SQL);
			ps.setString(1, id);
			ps.setString(2, pw);
			rs = ps.executeQuery();
			return rs.next();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			dbClose();
		}
		return false;
	}

	public int getMemberNo(String id) {
		String SQL = "select num from member where id=?";
		connect();

		try {
			ps = conn.prepareStatement(SQL);
			ps.setString(1, id);
			rs = ps.executeQuery();
			if (rs.next()) {
				return rs.getInt("num");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			dbClose();
		}
		return -1;
	}

	public int memberDelete(String id) {
		String SQL = "delete from member where id=?";
		connect();
		int cnt = -1;
		try {
			ps = conn.prepareStatement(SQL);
			ps.setString(1, id);
			cnt = ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			dbClose();
		}
		return cnt;
	}

	public Member getMember(String id) {
		String SQL = "select * from member where id=?";
		connect();
		Member m = null;
		try {
			ps = conn.prepareStatement(SQL);
			ps.setString(1, id);
			rs = ps.executeQuery();
			if (rs.next()) {
				String pw = rs.getString("pw1");
				String email = rs.getString("email");
				String tel = rs.getString("tel");
				String hobby = rs.getString("hobby");
				String job = rs.getString("job");
				String age = rs.getString("age");
				String info = rs.getString("info");
				m = new Member(id, pw, email, tel, hobby, job, age, info);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			dbClose();
		}
		return m;
	}

	public int memberUpdate(Member m) {
		String SQL = "update member set pw1=?, email=?, tel=?, hobby=?, job=?, age=?, info=? where id=?";
		connect();
		int cnt = -1;
		try {
			ps = conn.prepareStatement(SQL);
			ps.setString(1, m.getPw());
			ps.setString(2, m.getEmail());
			ps.setString(3, m.getTel());
			ps.setString(4, m.getHobby());
			ps.setString(5, m.getJob());
			ps.setString(6, m.getAge());
			ps.setString(7, m.getInfo());
			cnt = ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			dbClose();
		}
		return cnt;
	}

	public void dbClose() {
		try {
			if (rs != null)
				rs.close();
			if (ps != null)
				ps.close();
			if (conn != null)
				conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
