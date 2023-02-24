package boardProject;

import java.time.LocalDate;
import java.util.ArrayList;

public class BoardDAO {
	private static ArrayList<Board> list;
	private static int num = 3;

	private BoardDAO() {
		list = new ArrayList<Board>();
		setSampleData();
	}

	private static BoardDAO instance = new BoardDAO();

	public static BoardDAO getInstance() {
		return instance;
	}

	public ArrayList<Board> getList() {
		return list;
	}

	void setSampleData() {
		addBoard(1, "작성자1", "2022-02-01", "제목1", "내용1");
		addBoard(2, "작성자2", "2022-02-02", "제목2", "내용2");
		addBoard(3, "작성자3", "2022-02-03", "제목3", "내용3");
	}

	public void addBoard(int no, String writer, String date, String subject, String contents) {
		Board b = new Board(no, writer, date, subject, contents);
		list.add(b);
	}

	public void removeBoard(int idx) {
		list.remove(idx);
	}

	public int getNextNum() {
		return ++num;
	}

	public String getToday() {
		return LocalDate.now().toString();
	}

	public void addDummy() {
		String today = getToday();
		for (int i = 0; i < 10; i++) {
			num = getNextNum();
			addBoard(num, "작성자" + num, today, "제목" + num, "내용" + num);
		}
	}

	public void deleteAllBoard() {
		list.clear();
	}

	public void setBoard(int idx, int no, String writer, String date, String subject, String contents) {
		Board b = new Board(no, writer, date, subject, contents);
		list.set(idx, b);
	}
}
