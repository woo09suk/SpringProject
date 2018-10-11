package com.example.spring05.controller.members;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.example.spring05.model.member.dto.FriendListDTO;
import com.example.spring05.model.member.dto.MembersDTO;
import com.example.spring05.service.member.MembersService;

@Controller //컨트롤러 빈으로 등록
@RequestMapping("members/*") //공통적인 url 매핑
public class MembersController {
	//로깅을 위한 변수
	private static final Logger logger=
			LoggerFactory.getLogger(MembersController.class);
	/*@Inject
	MemberService memberService;*/
	
	@Inject
	MembersService membersService;
	
	
	@RequestMapping("login.do") //세부적인 url 매핑
	public String login() {
		return "home"; //login.jsp로 이동
	}//login()
	
	@RequestMapping("joint.do")
	public String joint() {
		return "members/join";
	}
	
	@RequestMapping("userid_check.do")
	public ModelAndView userid_check(
			MembersDTO dto) {
		int result=membersService.useridCheck(dto);
		ModelAndView mav=new ModelAndView();
		if(result != 0) {
			mav.addObject("message", "중복된 아이디가 있습니다.");
		}else{
			mav.addObject("message", "사용 가능한 아이디입니다.");
		}
		mav.setViewName("members/useridCheck");
		
		return mav;
	}
	
	@RequestMapping("login_check.do")
	public ModelAndView login_check(
			MembersDTO dto, HttpSession session) {
		//로그인 성공 true, 실패 false
		boolean result=membersService.loginCheck(dto, session);
		ModelAndView mav=new ModelAndView();
		if(result) { //로그인 성공
			mav.setViewName("main/main"); //뷰의 이름
		}else { //로그인 실패
			mav.setViewName("home");
			//뷰에 전달할 값
			mav.addObject("message", "error");
		}
		return mav;
	}//login_check()
	
	@RequestMapping("logout.do")
	public ModelAndView logout(
			HttpSession session, ModelAndView mav) {
		//세션 초기화
		membersService.logout(session);
		// login.jsp로 이동
		mav.setViewName("home");
		mav.addObject("message", "logout");
		return mav;
	}//logout()
	
	@RequestMapping("join.do")
	public String insertMembers(MembersDTO dto) {
		membersService.insertMembers(dto);
		
		return "home";
	}
	@RequestMapping("adminList.do")
	public ModelAndView adminList(HttpSession session) {
		String userid=(String)session.getAttribute("userid");
		ModelAndView mav=new ModelAndView();
		List<MembersDTO> list=membersService.adminList(userid);
		mav.addObject("list",list);
		mav.setViewName("members/admin_mmain");
		return mav;
	}
	
	@RequestMapping("listAll.do")
	public ModelAndView listAll(@RequestParam(defaultValue="") String keyword) throws Exception{
		ModelAndView mav=new ModelAndView();
		List<MembersDTO> list=membersService.listAll(keyword);
		mav.addObject("list", list);
		mav.setViewName("members/admin_mmain");
		return mav;
	}
	
	@RequestMapping("list.do")
	public ModelAndView list(HttpSession session){
		String users_id=(String)session.getAttribute("userid");
		ModelAndView mav=new ModelAndView();
		int count=membersService.countList(users_id);
		List<MembersDTO> list;
		if(count == 0) {
			list=membersService.list2(users_id);
		}else {
			list=membersService.list(users_id);
		}
		mav.addObject("list",list);
		mav.setViewName("members/mmain");
		return mav;
	}
	@RequestMapping("list_man.do")
	public ModelAndView list_man(HttpSession session){
		String users_id=(String)session.getAttribute("userid");
		ModelAndView mav=new ModelAndView();
		List<MembersDTO> list=membersService.list_man(users_id);
		mav.addObject("list",list);
		mav.setViewName("members/mmain");
		return mav;
	}
	@RequestMapping("list_woman.do")
	public ModelAndView list_woman(HttpSession session){
		String users_id=(String)session.getAttribute("userid");
		ModelAndView mav=new ModelAndView();
		List<MembersDTO> list=membersService.list_woman(users_id);
		mav.addObject("list",list);
		mav.setViewName("members/mmain");
		return mav;
	}
	@RequestMapping("detail/{userid}")
	public ModelAndView detail(@PathVariable String userid
			, ModelAndView mav) {
		//포워딩할 뷰의 이름
		mav.setViewName("/members/detail");
		//뷰에 전달할 데이터
		mav.addObject(
				"dto", membersService.detailMembers(userid));
		return mav;
	}//detail()
	
	@RequestMapping("friendDetail/{userid}")
	public ModelAndView friendDetail(@PathVariable String userid
			, ModelAndView mav) {
		//포워딩할 뷰의 이름
		mav.setViewName("/members/friendDetail");
		//뷰에 전달할 데이터
		mav.addObject(
				"dto", membersService.detailMembers(userid));
		return mav;
	}//detail()
	
	
	@RequestMapping("friendDelete.do")
	public String friendDelete(FriendListDTO dto) {
		System.out.println("번호번호"+dto.getUser_num());
		membersService.friendDelete(dto);


		return "main/main";
	}//detail()
	
	@RequestMapping("friend.do")
	public ModelAndView friend(HttpSession session) {
		String users_id=(String)session.getAttribute("userid");
		System.out.println("users_in="+users_id);
		ModelAndView mav=new ModelAndView();
		HashMap<String,Object> map=new HashMap<>();
		
		int count=membersService.friendCount(users_id);
		
		List<FriendListDTO> list=membersService.friendRequest(users_id);
		map.put("list", list);
		map.put("count", count);
		mav.addObject("map",map);
		mav.setViewName("members/friend");
		
		return mav;
	}
	
		@RequestMapping("friendInsert/{user_num}")
	public String frienInsert(@PathVariable int user_num,HttpSession session,FriendListDTO dto) {
		String userid=(String)session.getAttribute("userid");
		
		dto.setUsers_id(userid);
		dto.setUser_num(user_num);
		
		System.out.println("userid="+dto.getUsers_id());
		System.out.println("user_num="+dto.getUser_num());

		
		membersService.friendInsert(dto);
		
		
	return "redirect:/members/list.do";
	
}
		@RequestMapping("photo.do")
		public ModelAndView photo(
				HttpSession session, ModelAndView mav,MembersDTO dto) {
			String userid=(String)session.getAttribute("userid");
			mav.addObject(
					"dto", membersService.detailMembers(userid));
			mav.setViewName("members/photo");
			return mav;
		}
		
		@RequestMapping("updateMembers.do")
		public String updateMembers(MembersDTO dto,HttpSession session) {
			String filename="-";
			//새로운 첨부 파일이 있으면
			if(!dto.getFile1().isEmpty()) {
				//첨부 파일의 이름
				filename=dto.getFile1().getOriginalFilename();
				try {
					String path="D:\\work\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\spring05\\WEB-INF\\views\\images\\";
					//디렉토리가 존재하지 않으면 생성
					new File(path).mkdir();
					//임시 디렉토리에 저장된 첨부파일을 이동
					dto.getFile1().transferTo(new File(path+filename));
				} catch (Exception e) {
					e.printStackTrace();
				}
				dto.setImage(filename);
			}else {//새로운 첨부 파일이 없을 때
				//기존에 첨부한 파일 정보를 가져옴
				MembersDTO dto2
				=membersService.detailMembers(dto.getUserid());
				dto.setImage(dto2.getImage());
			}
			//상품정보 수정
			membersService.updateMembers(dto,session);
			return "redirect:/main/main.do";
		}
		
		@RequestMapping("delete/{user_num}")
		public String delete(@PathVariable int user_num,MembersDTO dto) {
			dto.setUser_num(user_num);
			membersService.delete(dto);
			
			return "redirect:/members/adminList.do";
		}//detail()
		
		@RequestMapping("popId.do")
		public String popId() {
			return "windows/popId";
		}
		@RequestMapping("popPw.do")
		public String popPw() {
			return "windows/popPw";
		}
		
		@RequestMapping("findId.do")
		public ModelAndView findId(MembersDTO dto,ModelAndView mav) {
			List<MembersDTO> list=membersService.findId(dto);
			int count=membersService.findIdCount(dto);
			Map<String,Object> map=new HashMap<>();
			map.put("list", list);
			map.put("count", count);
			mav.addObject("map",map);
			mav.setViewName("windows/findId");
			return mav;
		}
			@RequestMapping("findPw.do")
		public ModelAndView findPw(MembersDTO dto,ModelAndView mav) {
			List<MembersDTO> list=membersService.findPw(dto);
			int count=membersService.findPwCount(dto);
			Map<String,Object> map=new HashMap<>();
			map.put("list", list);
			map.put("count", count);
			mav.addObject("map",map);
			mav.setViewName("windows/findPw");
			return mav;
		}
		
}
