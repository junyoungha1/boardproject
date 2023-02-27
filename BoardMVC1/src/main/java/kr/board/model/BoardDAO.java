package kr.board.model;

import java.sql.*;
import java.time.LocalDate;
import java.util.ArrayList;

public class BoardDAO {

	private BoardDAO() {
	}

	private static BoardDAO instance = new BoardDAO();

	public static BoardDAO getInstance() {
		return instance;
	}

	private Connection conn;
	private PreparedStatement ps;
	private ResultSet rs;

	private void connect() {
		String URL = "jdbc:mysql://localhost:3306/testdb?charaterEncoding=UTF-8&serverTimezone=UTC";
		String user = "root";
		String password = "root";

		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection(URL, user, password);
			System.out.println("db연동 성공");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public int addBoard(Board b) {
		String SQL = "insert into board(writer, reg_date, subject, contents) values(?,?,?,?)";
		connect();
		int cnt = -1;
		try {
			ps = conn.prepareStatement(SQL);
			ps.setString(1, b.getWriter());
			ps.setString(2, b.getDate());
			ps.setString(3, b.getSubject());
			ps.setString(4, b.getContents());
			cnt = ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			dbClose();
		}
		return cnt;
	}

	public ArrayList<Board> boardList() {
		String SQL = "select * from board";
		connect();
		ArrayList<Board> list = new ArrayList<Board>();
		try {
			ps = conn.prepareStatement(SQL);
			rs = ps.executeQuery();
			while (rs.next()) {
				int no = rs.getInt("board_no");
				String writer = rs.getString("writer");
				String date = rs.getString("reg_date");
				String subject = rs.getString("subject");
				String contents = rs.getString("contents");
				Board b = new Board(no, writer, date, subject, contents);
				list.add(b);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			dbClose();
		}
		return list;
	}

	public int removeBoard(int board_no) {
		String SQL = "delete from board where board_no=?";
		connect();
		int cnt = -1;
		try {
			ps = conn.prepareStatement(SQL);
			ps.setInt(1, board_no);
			cnt = ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			dbClose();
		}
		return cnt;
	}

	public int removeAllBoard() {
		String SQL = "delete from board";
		connect();
		int cnt = -1;
		try {
			ps = conn.prepareStatement(SQL);
			cnt = ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			dbClose();
		}
		return cnt;
	}
	
	public Board getBoard(int no) {
		String SQL = "select * from board where board_no=?";
		Board b = new Board();
		connect();
		try {
			ps = conn.prepareStatement(SQL);
			ps.setInt(1, no);
			rs = ps.executeQuery();
			if(rs.next()) {
				String writer = rs.getString("writer");
				String date = rs.getString("reg_date").toString();
				String subject = rs.getString("subject");
				String contents = rs.getString("contents");
				b.setWriter(writer);
				b.setDate(date);
				b.setSubject(subject);
				b.setContents(contents);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			dbClose();
		}
		return b;
	}

	public int addDummy() {
		int maxNum = getMaxNum();
		String SQL = "insert into board(writer, reg_date, subject, contents) values(?,?,?,?)";
		connect();
		int cnt = -1;
		try {
			for (int i = 0; i < 10; i++) {
				ps = conn.prepareStatement(SQL);
				ps.setString(1, "작성자" + (maxNum + i));
				ps.setString(2, getToday().toString());
				ps.setString(3, "제목" + (maxNum + i));
				ps.setString(4, "내용" + (maxNum + i));
				cnt = ps.executeUpdate();
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			dbClose();
		}
		return cnt;
	}

	public int setBoard(String subject, String contents, int board_no) {
		String SQL = "update board set subject = ?, contents = ? where board_no = ?";
		connect();
		int cnt = -1;
		try {
			ps = conn.prepareStatement(SQL);
			ps.setString(1, subject);
			ps.setString(2, contents);
			ps.setInt(3, board_no);
			cnt = ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			dbClose();
		}
		return cnt;
	}

	int getMaxNum() {
		int max = 0;
		String SQL = "select max(board_no) from board";
		connect();
		try {
			ps = conn.prepareStatement(SQL);
			rs = ps.executeQuery();
			if (rs.next()) {
				max = rs.getInt("max(board_no)");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			dbClose();
		}
		return max + 1;
	}

	public LocalDate getToday() {
		return LocalDate.now();
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
