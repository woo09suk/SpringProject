package com.example.spring05.service.board;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.spring05.model.board.dao.BoardDAO;
import com.example.spring05.model.board.dto.BoardDTO;

@Service //service bean
public class BoardServiceImpl implements BoardService {

	@Inject
	BoardDAO boardDao;

	@Override
	public void deleteFile(String fullName) {
		boardDao.deleteFile(fullName);//F4
	}

	@Override
	public List<String> getAttach(int bno) {
		return boardDao.getAttach(bno);
	}

	//1. 글쓰기 - 게시물 번호 생성
	//2. 첨부파일 등록 - 게시물 번호 사용
	@Transactional
	@Override
	public void create(BoardDTO dto) throws Exception {
		//board 테이블에 레코드 추가
		boardDao.create(dto); 
		//attach 테이블에 레코드 추가
		String[] files=dto.getFiles(); //첨부파일 이름 배열
		if(files==null) return;  //첨부파일이 없으면 skip
		for(String name : files) {
			boardDao.addAttach(name);//attach 테이블에 insert, F4
		}
	}

	@Override
	public BoardDTO read(int bno) throws Exception {
		return boardDao.read(bno);
	}

	@Transactional //트랜잭션 처리 method
	@Override
	public void update(BoardDTO dto) throws Exception {
		boardDao.update(dto); //board 테이블 수정, F4
		//별도로 만들었던 파일처리 attach 테이블도 수정해줘야함,같이 수정처리함.
		//따라서 board 와 attach를 transaction 처리를 해줘야함.
    //service는 transaction으로 묶기에 좀 더 유리하다.
		String[] files=dto.getFiles();
		if(files==null) return;
		for(String name : files) {
			System.out.println("첨부파일 이름:"+name);
			boardDao.updateAttach(name, dto.getBno());//F4
		}
	}


	@Transactional
	@Override
	public void delete(int bno) throws Exception {
		//reply 레코드 삭제
		//attach 레코드 삭제
		//첨부파일 삭제
		//board 레코드 삭제
		boardDao.delete(bno); 
	}

	@Override
	public List<BoardDTO> listAll(String search_option, String keyword, int start, int end) throws Exception {
		return boardDao.listAll(search_option,keyword,start,end);
	}

	//조회수 증가 처리
	@Override
	public void increaseViewcnt(int bno, HttpSession session)
			throws Exception {
		long update_time=0;
		if(session.getAttribute("update_time_"+bno)!=null) {
			//최근에 조회수를 올린 시간
			update_time=
					(long)session.getAttribute("update_time_"+bno);
		}
		long current_time=System.currentTimeMillis();
		//일정 시간(5초)이 경과한 후 조회수 증가 처리
		if(current_time - update_time > 5*1000) {//24*60*60*1000(하루)
			boardDao.increateViewcnt(bno);
			//조회수를 올린 시간 저장
			session.setAttribute("update_time_"+bno, current_time);

		}
	}

	@Override
	public int countArticle(String search_option, String keyword) throws Exception {
		return boardDao.countArticle(search_option,keyword);//F4
	}

	@Override
	public void boardDelete(BoardDTO dto) {
		boardDao.boardDelete(dto);//F4
		
	}

	@Override
	public List<BoardDTO> adminReq() {
		return boardDao.adminReq();//F4
	}

	@Override
	public void permit(BoardDTO dto){
		boardDao.permit(dto); 
	}

}
