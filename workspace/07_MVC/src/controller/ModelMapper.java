package controller;

import model.CircleCommand;
import model.RectangleCommand;
import model.ShapeCommand;
import model.TriangleCommand;

class ModelMapper {
	
	// 한 번에 하나의 Model만 반환할 수 있도록 Singleton 처리
	private static ModelMapper mapper = new ModelMapper();
	private ModelMapper() {}
	public static ModelMapper getInstance() {
		if (mapper == null)
			mapper = new ModelMapper();
		return mapper;
	}
	
	
	// Model을 반환시키는 getModel() 메소드
	ShapeCommand getModel(String mapping) {
		ShapeCommand command = null;

		switch (mapping) {
		case "rectangle.do":
			command = new RectangleCommand();
			break;
		case "triangle.do":
			command = new TriangleCommand();
			break;
		case "circle.do":
			command = new CircleCommand();
			break;
		}
		
		return command;
	}
	
}
