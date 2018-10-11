package com.example.spring05.controller.board;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.example.spring05.model.board.dto.BoardDTO;
import com.example.spring05.service.board.BoardService;
import com.example.spring05.service.board.Pager;

@Controller //controller bean
@RequestMapping("board/*") //공통적인 url pattern
public class BoardController {
	
	@Inject
	BoardService boardService;
	
	@RequestMapping("adminList.do") //세부적인 url pattern
	//defaultValue="1" : 파라미터가 없을때 1로 셋팅해줌
	public ModelAndView adminList(
			@RequestParam(defaultValue="name") String search_option,
			@RequestParam(defaultValue="") String keyword,
			@RequestParam(defaultValue="1") int curPage) throws Exception{
		//레코드 갯수 계산
		int count=boardService.countArticle(search_option,keyword);//F4
		//요청
		
		//페이지 관련 설정
		Pager pager=new Pager(count, curPage);
		int start=pager.getPageBegin();
		int end=pager.getPageEnd();
		
		List<BoardDTO> list
		=boardService.listAll(search_option,keyword,start,end); //게시물 목록
		ModelAndView mav=new ModelAndView();
		HashMap<String,Object> map=new HashMap<>();
		map.put("list", list); //map에 자료 저장
		map.put("count", count);
		map.put("pager", pager);//페이지 네비게이션을 위한 변수
		map.put("search_option", search_option);
		map.put("keyword",keyword);
		mav.setViewName("board/admin_list"); //포워딩할 뷰의 이름
		mav.addObject("map", map); //ModelAndView에 map을 저장
		return mav; //board/list.jsp로 이동
	}//list()
	
	@RequestMapping("list.do") //세부적인 url pattern
	//defaultValue="1" : 파라미터가 없을때 1로 셋팅해줌
	public ModelAndView list(
			@RequestParam(defaultValue="name") String search_option,
			@RequestParam(defaultValue="") String keyword,
			@RequestParam(defaultValue="1") int curPage) throws Exception{
		//레코드 갯수 계산
		int count=boardService.countArticle(search_option,keyword);//F4
		//페이지 관련 설정
		Pager pager=new Pager(count, curPage);
		int start=pager.getPageBegin();
		int end=pager.getPageEnd();
		
		List<BoardDTO> list
		=boardService.listAll(search_option,keyword,start,end); //게시물 목록
		ModelAndView mav=new ModelAndView();
		HashMap<String,Object> map=new HashMap<>();
		map.put("list", list); //map에 자료 저장
		map.put("count", count);
		map.put("pager", pager);//페이지 네비게이션을 위한 변수
		map.put("search_option", search_option);
		map.put("keyword",keyword);
		mav.setViewName("board/list"); //포워딩할 뷰의 이름
		mav.addObject("map", map); //ModelAndView에 map을 저장
		return mav; //board/list.jsp로 이동
	}//list()
	
	@RequestMapping("write.do")
	public String write() {
		//글쓰기 폼 페이지로 이동
		return "board/write";
	}//write()
	
	// write.jsp에서 입력한 내용들이 BoardDTO에 저장됨	
	@RequestMapping("insert.do")
	public String insert(@ModelAttribute BoardDTO dto
			, HttpSession session)
					throws Exception {
		// 이름이 없기때문에 대신 세션에서 사용자아이디를 가져옴
		String writer=(String)session.getAttribute("userid");
		dto.setWriter(writer); 
		//레코드 저장
		boardService.create(dto);//F4
		//게시물 목록으로 이동
		return "redirect:/board/list.do";
	}//insert()
	
	@RequestMapping("view.do")
	public ModelAndView view(int bno, HttpSession session)
		throws Exception {
		//조회수 증가 처리
		boardService.increaseViewcnt(bno, session); 
		ModelAndView mav=new ModelAndView();
		mav.setViewName("board/view"); //포워딩할 뷰의 이름
		mav.addObject("dto", boardService.read(bno)); //자료 저장
		return mav; //  views/board/view.jsp로 넘어가서 출력됨
	} 

	//첨부파일 목록을 리턴
	//ArrayList를 json 배열로 변환하여 리턴
	@RequestMapping("getAttach/{bno}")
	@ResponseBody // view가 아닌 List<String>데이터 자체를 리턴 
	public List<String> getAttach(@PathVariable int bno){
		return boardService.getAttach(bno); //F4
	}//getAttach()	

	//게시물 내용 수정	
	@RequestMapping("update.do")
	public String update(BoardDTO dto) throws Exception {
		System.out.println("dto:"+dto);
		if(dto != null) {
			boardService.update(dto); //레코드 수정 (F4)
		}
		// 수정 완료 후 목록으로 이동
		//return "redirect:/board/list.do";
		// 상세 화면으로 되돌아감
		return "redirect:/board/view.do?bno="+dto.getBno();
	}//update()
	
	@RequestMapping("delete.do")
	public String delete(int bno) throws Exception {
		boardService.delete(bno); //삭제 처리,F4
		return "redirect:/board/list.do"; //목록으로 이동
	}//delete()
	
	@RequestMapping("boardDelete/{bno}")
	public String boardDelete(@PathVariable int bno,BoardDTO dto) throws Exception {
		dto.setBno(bno);
		boardService.boardDelete(dto); //삭제 처리,F4
		
		return "redirect:/board/adminList.do"; //목록으로 이동
	}//delete()
	
	@RequestMapping("adminReq.do")
	public ModelAndView adminReq(ModelAndView mav) {
		List<BoardDTO> list=boardService.adminReq();
		mav.setViewName("board/adminReq"); //포워딩할 뷰의 이름
		mav.addObject("list", list); //자료 저장
		
		return mav;
	}

	@RequestMapping("permit/{bno}")
	public String permit(@PathVariable int bno,BoardDTO dto) throws Exception {
		dto.setBno(bno);
		boardService.permit(dto); //삭제 처리,F4
		return "redirect:/board/adminReq.do"; //목록으로 이동
	}//delete()
	
	
}//end class
