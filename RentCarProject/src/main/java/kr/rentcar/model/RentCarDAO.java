package kr.rentcar.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class RentCarDAO {
	public RentCarDAO() {
	}

	private static RentCarDAO instance = new RentCarDAO();

	public static RentCarDAO getInstance() {
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
			System.out.println("db연동 성공");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public ArrayList<RentCar> getCarList(){
		String SQL = "select * from rentcar";
		ArrayList<RentCar> list = new ArrayList<RentCar>();
		connect();
		try {
			ps = conn.prepareStatement(SQL);
			rs = ps.executeQuery();
			while(rs.next()) {
				int no = rs.getInt("no");
				String name = rs.getString("name");
				int category = rs.getInt("category");
				int price = rs.getInt("price");
				int usepeople = rs.getInt("usepeople");
				String company = rs.getString("company");
				String img = rs.getString("img");
				String info = rs.getString("info");
				RentCar r = new RentCar(no,name,category,price,usepeople,company,img,info);
				list.add(r);
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally {
			dbClose();
		}
		return list;
	}
	
	public ArrayList<RentCar> getCategoryList(int categoryNum){
		String SQL = "select * from rentcar where category = ?";
		ArrayList<RentCar> list = new ArrayList<RentCar>();
		connect();
		try {
			ps = conn.prepareStatement(SQL);
			ps.setInt(1, categoryNum);
			rs = ps.executeQuery();
			while(rs.next()) {
				int no = rs.getInt("no");
				String name = rs.getString("name");
				int category = rs.getInt("category");
				int price = rs.getInt("price");
				int usepeople = rs.getInt("usepeople");
				String company = rs.getString("company");
				String img = rs.getString("img");
				String info = rs.getString("info");
				RentCar r = new RentCar(no,name,category,price,usepeople,company,img,info);
				list.add(r);
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally {
			dbClose();
		}
		return list;
	}
	
	public ArrayList<RentCar> getNewestCars(){
		String SQL = "SELECT * FROM rentcar ORDER BY no DESC LIMIT 3;";
		ArrayList<RentCar> list = new ArrayList<RentCar>();
		connect();
		try {
			ps = conn.prepareStatement(SQL);
			rs = ps.executeQuery();
			while(rs.next()) {
				int no = rs.getInt("no");
				String name = rs.getString("name");
				int category = rs.getInt("category");
				int price = rs.getInt("price");
				int usepeople = rs.getInt("usepeople");
				String company = rs.getString("company");
				String img = rs.getString("img");
				String info = rs.getString("info");
				RentCar r = new RentCar(no,name,category,price,usepeople,company,img,info);
				list.add(r);
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally {
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
