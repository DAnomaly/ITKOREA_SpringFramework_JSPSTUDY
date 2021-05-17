package json.simple;

import java.util.HashMap;
import java.util.Map;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

public class Ex01_JSONObject {

	public static void main(String[] args) {
		
		// Map 리뷰
		/*
		Map<String, Object> map = new HashMap<>();
		
		map.put("name", "브레드");
		map.put("age",50);
		System.out.println("이름: " + map.get("name"));
		System.out.println("나이: " + map.get("age"));
		*/
		
		// JSON 데이터
		// 네이버가 우리에게 전달해 준 JSON이라고 생각한다.
		String responseData = "{\"name\":\"브레드\",\"age\":50}";
		
		// json-simple-1.1.1.jar 라이브러리
		// 1. 구글에서 제공
		// 2. JSON 데이터를 Java의 Map 형식으로 변환
		// 3. Map 인터페이스를 구현한 JSONObject 클래스를 지원
		
		// String JSON데이터 -> JSONObject 단계 1
		// 구문 분석기를 준비한다.
		JSONParser parser = new JSONParser();
		
		// String JSON데이터 -> JSONObject 단계 2
		// 구문 분석한다.
		JSONObject obj = null;
		try {
			obj = (JSONObject)parser.parse(responseData);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		
		// JSONObject는 Map 인터페이스를 구현했다.
		// 따라서, 같은 인터페이스를 구현한 HashMap과 사용법이 같다.
		System.out.println("이름: " + obj.get("name"));
		System.out.println("나이: " + obj.get("age"));
		System.out.println(obj.toString());
		
	}
	
}
