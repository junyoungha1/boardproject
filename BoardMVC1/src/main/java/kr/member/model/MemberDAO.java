package kr.member.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class MemberDAO {
	
	private MemberDAO() {}
	
	static private MemberDAO instance = new MemberDAO();
	static public MemberDAO getInstance() {
		return instance;
	}
		
	
private Connection conn;
private PreparedStatement ps;
private ResultSet rs;

public void connect() {
	   String URL="jdbc:mysql://localhost:3306/testdb?characterEncoding=UTF-8&serverTimezone=UTC&useSSL=false";
	   String user="root";
	   String password="root";
	  try {
		  Class.forName("com.mysql.cj.jdbc.Driver");		  
		  conn=DriverManager.getConnection(URL, user, password);
		  System.out.println("db 연동성공: " + conn );
	   } catch (Exception e) {
		  e.printStackTrace();
	  }		   
}   

public int memberInsert(Member m) { 
	  String SQL="insert into member(id, pass, name, age, email, phone) values(?,?,?,?,?,?)"; 
	  connect();

	  int cnt=-1;
	  try {
		ps=conn.prepareStatement(SQL); 
		ps.setString(1, m.getId());
		ps.setString(2, m.getPass());
		ps.setString(3, m.getName());
		ps.setInt(4, m.getAge());
		ps.setString(5, m.getEmail());
		ps.setString(6, m.getPhone());
		
		cnt=ps.executeUpdate(); 
		
	   }catch (Exception e) {
		e.printStackTrace();
	   }finally {
		   dbClose();
	  }
	  return cnt; 
}

public ArrayList<Member> memberList() {
	 String SQL="select * from member";
	 connect();
	 ArrayList<Member> list=new ArrayList<Member>();
	 try {
	   ps=conn.prepareStatement(SQL);
	   rs=ps.executeQuery(); 
	   while(rs.next()) {
		   int num=rs.getInt("num");
		   String id=rs.getString("id");
		   String pass=rs.getString("pass");
		   String name=rs.getString("name");		   
		   int age=rs.getInt("age");
		   String email=rs.getString("email");
		   String phone=rs.getString("phone");
		   Member m=new Member(num, id, pass, name, age, email, phone);
		   list.add(m);		   
	   }
	 } catch (Exception e) {
    e.printStackTrace();
	 }finally {
		dbClose();
	 }	 
	 return list;
}


public String checkMemberId(String id) {
	 String SQL="select pass from member where id=?";
	 connect();

	 try {
	   ps=conn.prepareStatement(SQL);
	   ps.setString(1, id);
		rs=ps.executeQuery();
		 if(rs.next()) {
			 return rs.getString("pass");
		 }
	 } catch (Exception e) {
		e.printStackTrace();
	 }finally {
		dbClose();
	}	   
	 return null;
}

public int getMemberNo(String id) {
	 String SQL="select num from member where id=?";
	 connect();

	 try {
	   ps=conn.prepareStatement(SQL);
	   ps.setString(1, id);
		rs=ps.executeQuery();
		 if(rs.next()) {
			 return rs.getInt("num");
		 }
	 } catch (Exception e) {
		e.printStackTrace();
	 }finally {
		dbClose();
	}	   
	 return -1;
}



public int memberDelete(String id) {
	 String SQL="delete from member where id=?";
	 connect();
	 int cnt=-1;
	 try {
	   ps=conn.prepareStatement(SQL);
	   ps.setString(1,id);
	   cnt=ps.executeUpdate();
	 } catch (Exception e) {
		e.printStackTrace();
	 }finally {
		dbClose();
	}	   
	 return cnt;
}


public Member getMember(int num) {
	   String SQL="select * from member where num=?";
	   connect();
	   Member m=null;
	   try {
		 ps=conn.prepareStatement(SQL);
		  ps.setInt(1,num);
		 rs=ps.executeQuery();
		 if(rs.next()) {

			   String id=rs.getString("id");
			   String pass=rs.getString("pass");
			   String name=rs.getString("name");		   
			   int age=rs.getInt("age");
			   String email=rs.getString("email");
			   String phone=rs.getString("phone");
			   m=new Member(num, id, pass, name, age, email, phone);
		 }
	   } catch (Exception e) {
		 e.printStackTrace();
	   }finally {
		  dbClose();
	   }	
	   return m;
}
public int memberUpdate(Member m) {
	   String SQL="update member set age=?, email=?, phone=? where num=?";
	   connect();
	   int cnt=-1;
	   try {
	   	ps=conn.prepareStatement(SQL);
	   	ps.setInt(1, m.getAge());
	   	ps.setString(2, m.getEmail());
	   	ps.setString(3, m.getPhone());
	   	ps.setInt(4, m.getNum());	   	
	   	cnt=ps.executeUpdate();	   	
	} catch (Exception e) {
		e.printStackTrace();
	}finally {
		dbClose();
	}	   
	   return cnt;
}

public void dbClose() {
	  try { 
	   if(rs!=null) rs.close();
	   if(ps!=null) ps.close();
	   if(conn!=null) conn.close();
	  }catch(Exception e) {
		  e.printStackTrace();
	  }
}   
}
