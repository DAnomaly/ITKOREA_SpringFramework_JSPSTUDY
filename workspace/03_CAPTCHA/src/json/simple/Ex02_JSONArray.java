package json.simple;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

public class Ex02_JSONArray {

	public static void main(String[] args) {
		
		String jsonStr = "[" + 
				"{\"name\":\"브레드\",\"age\":50}," + 
				"{\"name\":\"위트\",\"age\":30}" + 
				"]";
		
		// JSONArray는 List 인터페이스를 구현한다.
		// 따라서, 같은 인터페이스를 구현한 ArrayList 클래스와 사용법이 같다.
		
		JSONParser parser = new JSONParser();
		JSONArray arr = null;
		try {
			arr = (JSONArray)parser.parse(jsonStr);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		
		// list의 각 요소는 get() 메소드로 추출한다.
		for (int i = 0; i < arr.size(); i++) {
			JSONObject obj = (JSONObject)arr.get(i);
			System.out.println("idx[" + i + "]이름: " + obj.get("name"));
			System.out.println("idx[" + i + "]나이: " + obj.get("age"));
		}
	}
	
}
