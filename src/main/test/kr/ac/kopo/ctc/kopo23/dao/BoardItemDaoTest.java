package kr.ac.kopo.ctc.kopo23.dao;

import static org.junit.jupiter.api.Assertions.assertEquals;

import java.util.List;

import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import kr.ac.kopo.ctc.kopo23.domain.BoardItem;

class BoardItemDaoTest {
	public BoardItemDao boardItemDao = new BoardItemDaoImpl();
	private BoardItem boardItem1;

//	@Test
//	void create(){
//		//boardItemDao.deleteAll();
//		BoardItem boardItem = new BoardItem();
//		boardItem.setId(5);
//		boardItem.setTitle("공지사항5");
//		boardItem=boardItemDao.create(boardItem);
//		assertEquals(boardItem.getId(), 5);
//		assertEquals(boardItem.getTitle(), "공지사항5");
//
//	}

//	@Test
//	void selectOne() {
//		BoardItem boardItem = boardItemDao.selectOne(2);
//		assertEquals(boardItem.getId(), 2);
//		assertEquals(boardItem.getTitle(), "공지사항");
//
//	}
//	@Test
//	void update(){
//		BoardItem boardItem = new BoardItem();
//		boardItem.setId(2);
//		boardItem.setTitle("공지사항3");
//		boardItem = boardItemDao.update(boardItem);
//		assertEquals(boardItem.getId(), 3);
//		assertEquals(boardItem.getTitle(), "공지사항3");
//	}
	
//	@Test
//	void delete(){
//		BoardItem boardItem = new BoardItem();
//		int id=2;
//		boardItem = boardItemDao.delete(id);
//		assertEquals(id, 2);
//		assertEquals(boardItem.getTitle(), null);
//	}
	
//	@Test
//	void selectAll() {
//		List<BoardItem> boardItems = boardItemDao.selectAll(1,20);
//		assertEquals(boardItems.get(0).getId(), 3);
//		assertEquals(boardItems.get(1).getId(), 2);
//	}
//	
	@Test
	void count() {
		int count = boardItemDao.count();
		
		assertEquals(count,4);
	}


}