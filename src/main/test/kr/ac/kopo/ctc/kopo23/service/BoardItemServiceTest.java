package kr.ac.kopo.ctc.kopo23.service;

import static org.junit.jupiter.api.Assertions.*;

import org.junit.jupiter.api.Test;

import kr.ac.kopo.ctc.kopo23.service.dto.Pagination;

class BoardItemServiceTest {
	
	private BoardItemService boardItemService = new BoardItemServiceImpl();
	
	@Test	
	void testGetPagination() {
		Pagination pagination = boardItemService.getPagination(1, 15, 50, 1025);
		
		assertEquals(pagination.getPp(),1);
		assertEquals(pagination.getP(),1);
		assertEquals(pagination.getN(),16);
		assertEquals(pagination.getNn(),21);
		assertEquals(pagination.getC(),1);
		assertEquals(pagination.getStart(),1);
		assertEquals(pagination.getEnd(),15);
	}
	
	@Test	
	void testGetPagination2() {
		Pagination pagination = boardItemService.getPagination(21, 15, 50, 1025);
		
		assertEquals(pagination.getPp(),1);
		assertEquals(pagination.getP(),1);
		assertEquals(pagination.getN(),16);
		assertEquals(pagination.getNn(),21);
		assertEquals(pagination.getC(),21);
		assertEquals(pagination.getStart(),16);
		assertEquals(pagination.getEnd(),21);
	}
	
	@Test	
	void testGetPagination3() {
		Pagination pagination = boardItemService.getPagination(10, 15, 50, 1025);
		
		assertEquals(pagination.getPp(),1);
		assertEquals(pagination.getP(),1);
		assertEquals(pagination.getN(),16);
		assertEquals(pagination.getNn(),21);
		assertEquals(pagination.getC(),10);
		assertEquals(pagination.getStart(),1);
		assertEquals(pagination.getEnd(),15);
	}
	
	@Test	
	void testGetPagination4() {
		Pagination pagination = boardItemService.getPagination(-100, 15, 50, 1025);
		
		assertEquals(pagination.getPp(),1);
		assertEquals(pagination.getP(),1);
		assertEquals(pagination.getN(),16);
		assertEquals(pagination.getNn(),21);
		assertEquals(pagination.getC(),1);
		assertEquals(pagination.getStart(),1);
		assertEquals(pagination.getEnd(),15);
	}
	
	@Test	
	void testGetPagination5() {
		Pagination pagination = boardItemService.getPagination(100, 15, 50, 1025);
		
		assertEquals(pagination.getPp(),1);
		assertEquals(pagination.getP(),1);
		assertEquals(pagination.getN(),16);
		assertEquals(pagination.getNn(),21);
		assertEquals(pagination.getC(),21);
		assertEquals(pagination.getStart(),16);
		assertEquals(pagination.getEnd(),21);
	}
	
	@Test	
	void testGetPagination6() {
		Pagination pagination = boardItemService.getPagination(1, 15, 50, 225);
		
		assertEquals(pagination.getPp(),1);
		assertEquals(pagination.getP(),1);
		assertEquals(pagination.getN(),1);
		assertEquals(pagination.getNn(),5);
		assertEquals(pagination.getC(),1);
		assertEquals(pagination.getStart(),1);
		assertEquals(pagination.getEnd(),5);
	}
	
	@Test	
	void testGetPagination7() {
		Pagination pagination = boardItemService.getPagination(5, 15, 50, 225);
		
		assertEquals(pagination.getPp(),1);
		assertEquals(pagination.getP(),1);
		assertEquals(pagination.getN(),1);
		assertEquals(pagination.getNn(),5);
		assertEquals(pagination.getC(),5);
		assertEquals(pagination.getStart(),1);
		assertEquals(pagination.getEnd(),5);
	}
	
	@Test	
	void testGetPagination8() {
		Pagination pagination = boardItemService.getPagination(3, 15, 50, 225);
		
		assertEquals(pagination.getPp(),1);
		assertEquals(pagination.getP(),1);
		assertEquals(pagination.getN(),1);
		assertEquals(pagination.getNn(),5);
		assertEquals(pagination.getC(),3);
		assertEquals(pagination.getStart(),1);
		assertEquals(pagination.getEnd(),5);
	}
	
	@Test	
	void testGetPagination9() {
		Pagination pagination = boardItemService.getPagination(-100, 15, 50, 225);
		
		assertEquals(pagination.getPp(),1);
		assertEquals(pagination.getP(),1);
		assertEquals(pagination.getN(),1);
		assertEquals(pagination.getNn(),5);
		assertEquals(pagination.getC(),1);
		assertEquals(pagination.getStart(),1);
		assertEquals(pagination.getEnd(),5);
	}
	
	@Test	
	void testGetPagination10() {
		Pagination pagination = boardItemService.getPagination(100, 15, 50, 225);
		
		assertEquals(pagination.getPp(),1);
		assertEquals(pagination.getP(),1);
		assertEquals(pagination.getN(),1);
		assertEquals(pagination.getNn(),5);
		assertEquals(pagination.getC(),5);
		assertEquals(pagination.getStart(),1);
		assertEquals(pagination.getEnd(),5);
	}
	
	@Test	
	void testGetPagination11() {
		Pagination pagination = boardItemService.getPagination(100, 15, 50, 2252);
		
		assertEquals(pagination.getPp(),1);
		assertEquals(pagination.getP(),31);
		assertEquals(pagination.getN(),46);
		assertEquals(pagination.getNn(),46);
		assertEquals(pagination.getC(),46);
		assertEquals(pagination.getStart(),46);
		assertEquals(pagination.getEnd(),46);
	}
}
