package pratice;

class Solution {
	public long solution(String numbers) {
		return Long.parseLong(numbers.replace("one", "1").replace("two", "2").replace("three", "3").replace("four", "4").replace("five", "5").replace("six", "6").replace("seven", "7").replace("eight", "8").replace("nine", "9").replace("zero", "0"));
	}
}

public class pratice {

	public static void main(String[] args) {
		String str1="onetwothreefourfivesixseveneightnine";
		String str2="onefourzerosixseven";
		Solution s = new Solution();
		
		System.out.println(s.solution(str1));
		System.out.println(s.solution(str2));
	}

}
