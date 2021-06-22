package test;

import static org.junit.jupiter.api.Assertions.*;

import java.util.List;

import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import dao.PersonDAO;
import dto.Person;

class PersonTest {
	
	@BeforeEach
	void setUp() throws Exception {

	}

	@AfterEach
	void tearDown() throws Exception {
		
	}

	@Test
	void testGetListPerson() {
		List<Person> list = PersonDAO.getInstance().getListPerson();
		assertNotNull(list);
		assertNotEquals(0, list.size(), "등록된 데이터가 존재하지 않는다");
	}

	@Test
	void testGetOnePerson() {
		Person person1 = PersonDAO.getInstance().getOnePerson("980112");
		assertNotNull(person1, "주민번호 980112을 가진 사람이 존재하지 않는다");
		Person person2 = PersonDAO.getInstance().getOnePerson("010101");
		assertNull(person2,"주민번호 010101을 가진 사람이 존재한다");
	}
}
