package kr.rentcar.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class CarReserveDAO {
	public CarReserveDAO() {
	}

	private static CarReserveDAO instance = new CarReserveDAO();

	public static CarReserveDAO getInstance() {
		return instance;
	}

	private Connection conn;
	private PreparedStatement ps;
	private ResultSet rs;

	private void connect() {
		String URL = "jdbc:mysql://localhost:3306/rentcardb?charaterEncoding=UTF-8&serverTimezone=UTC&useSSL=false";
		String user = "root";
		String password = "root";

		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection(URL, user, password);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public int reserveCarInsert(CarReserve c) {
		String SQL = "insert into carreserve(reserve_seq, no, id, qty, dday, rday, usein, usewifi, usenavi, useseat) values(?,?,?,?,?,?,?,?,?,?)";
		ArrayList<CarReserve> list = new ArrayList<CarReserve>();
		connect();
		int cnt = -1;
		try {
			ps = conn.prepareStatement(SQL);
			ps.setInt(1, c.getReserve_seq());
			ps.setInt(2, c.getNo());
			ps.setString(3, c.getId());
			ps.setInt(4, c.getQty());
			ps.setInt(5, c.getDday());
			ps.setString(6, c.getRday());
			ps.setInt(7, c.getUsein());
			ps.setInt(8, c.getUsewifi());
			ps.setInt(9, c.getUsenavi());
			ps.setInt(10, c.getUseseat());
			cnt = ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			dbClose();
		}
		return cnt;
	}

	public int chkOption(String option) {
		if (option == null) {
			return 0;
		} else {
			return 1;
		}
	}

	public ArrayList<RentCar> getInfoList(String id) {
		ArrayList<RentCar> infoList = new ArrayList<RentCar>();
		ArrayList<CarReserve> reserveList = CarReserveDAO.getInstance().getReserveList(id);
		for (CarReserve cr : reserveList) {
			infoList.add(RentCarDAO.getInstance().getOneCar(cr.getNo()));
		}
		return infoList;

	}

	public void reserveCarDelete(int reserve_seq) {
		String SQL = "delete from carreserve where reserve_seq = ? ";
		connect();
		try {
			ps = conn.prepareStatement(SQL);
			ps.setInt(1, reserve_seq);
			ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			dbClose();
		}
	}

	public ArrayList<CarReserve> getReserveList(String id) {
		String SQL = "select * from carreserve where id = ?";
		ArrayList<CarReserve> list = new ArrayList<CarReserve>();
		connect();
		try {
			ps = conn.prepareStatement(SQL);
			ps.setString(1, id);
			rs = ps.executeQuery();
			while (rs.next()) {
				int reserve_seq = rs.getInt("reserve_seq");
				int no = rs.getInt("no");
				int qty = rs.getInt("qty");
				int dday = rs.getInt("dday");
				String rday = rs.getString("rday");
				int usein = rs.getInt("usein");
				int usewifi = rs.getInt("usewifi");
				int usenavi = rs.getInt("usenavi");
				int useseat = rs.getInt("useseat");
				CarReserve cr = new CarReserve(reserve_seq, no, id, qty, dday, rday, usein, usewifi, usenavi, useseat);
				list.add(cr);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			dbClose();
		}
		return list;
	}

	void dbClose() {
		try {
			if (rs != null)
				rs.close();
			if (ps != null)
				ps.close();
			if (conn != null)
				conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
