package json.simple;

import java.util.HashMap;
import java.util.Map;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

public class Ex04_toJSONString {
	
	public static void main(String[] args) {
		
		Map<String, Object> map1 = new HashMap<>();
		map1.put("name", "브레드");
		map1.put("age", 30);
		
		Map<String, Object> map2 = new HashMap<>();
		map2.put("name", "초코");
		map2.put("age", 20);

		JSONObject obj1 = new JSONObject(map1);
		JSONObject obj2 = new JSONObject(map2);
		
		JSONArray list = new JSONArray();
		list.add(obj1);
		list.add(obj2);
		
	}
	
}
