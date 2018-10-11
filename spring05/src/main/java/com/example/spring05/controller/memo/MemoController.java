package com.example.spring05.controller.memo;


import java.util.List;


import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.example.spring05.model.memo.dto.MemoDTO;

import com.example.spring05.service.memo.MemoService;

@Controller
@RequestMapping("memo/*")
public class MemoController {
	
	@Inject
	MemoService memoService;
	

	@RequestMapping("adminList.do")
	public ModelAndView adminList(ModelAndView mav) {
		/*List<MemoDTO> list = memoService.list();*/
		List<MemoDTO> list=memoService.list();

		mav.setViewName("memo/admin_list");
		mav.addObject("list", list);
		return mav; 
	} //list()

	@RequestMapping("list.do")
	public ModelAndView list(ModelAndView mav) {
		/*List<MemoDTO> list = memoService.list();*/
		List<MemoDTO> list=memoService.list();

		mav.setViewName("memo/memo_list");
		mav.addObject("list", list);
		return mav; 
	} //list()
	
	@RequestMapping("insert.do")
	public String insert(@ModelAttribute MemoDTO dto, HttpSession session) {
		String userid = (String)session.getAttribute("userid");
		dto.setUserid(userid);
		memoService.insert(dto);
		return "redirect:/memo/list.do";
	} //insert()
	
	@RequestMapping("view/{idx}")
	public ModelAndView view(@PathVariable int idx, ModelAndView mav) {
		mav.setViewName("memo/view");
		mav.addObject("dto", memoService.memo_view(idx));
		return mav;
	} //view()
	
	@RequestMapping("update/{idx}")
	public String update(@PathVariable int idx, @ModelAttribute MemoDTO dto) {
		memoService.update(dto);
		return "redirect:/memo/list.do";
	} //update()
	
	@RequestMapping("delete/{idx}")
	public String delete(@PathVariable int idx) {
		memoService.delete(idx);
		return "redirect:/memo/list.do";
	}
	
	@RequestMapping("adminDelete/{idx}")
	public String daminDelete(@PathVariable int idx) {
		memoService.delete(idx);
		return "redirect:/memo/adminList.do";
	}
}