package json.simple;

import java.util.HashMap;
import java.util.Map;

import org.json.simple.JSONObject;

public class Ex03_toJSONString {
	
	public static void main(String[] args) {
		
		/*
		JSONObject obj = new JSONObject();
		
		obj.put("name", "브레드");
		obj.put("age",50);
		*/
		
		Map<String, Object> map = new HashMap<>();
		map.put("name", "브레드");
		map.put("age",50);

		JSONObject obj = new JSONObject(map);
		
		String requestData = obj.toJSONString();
		
		System.out.println(requestData);
		
		
	}
	
}
