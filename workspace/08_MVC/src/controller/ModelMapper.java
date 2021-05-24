package controller;

import model.HomeService;
import model.InquiryService;

class ModelMapper {
	
	private static ModelMapper mapper = new ModelMapper();
	private ModelMapper() {}
	static ModelMapper getInstance() {
		if(mapper == null)
			mapper = new ModelMapper();
		return mapper;
	}
	
	HomeService getService(String mapping) {

		HomeService service = null;
		switch (mapping) {
		case "inquiry.do":
			service = new InquiryService();
			break;
		}

		return service;
	}
	
}
