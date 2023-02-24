package memberLogin;

import java.util.ArrayList;

public class UserDAO {
	private UserDAO() {

	}

	private static ArrayList<User> instance = new ArrayList<User>();

	public static ArrayList<User> getInstance() {
		return instance;
	}

	public static void addUser(String id, String pw, String name, String gender) {
		User u = new User(id, pw, name, gender);
		instance.add(u);
	}

	public static void deleteUser(String id) {

	}

	public static int getUserIdx(String id) {
		return -1;
	}

}
