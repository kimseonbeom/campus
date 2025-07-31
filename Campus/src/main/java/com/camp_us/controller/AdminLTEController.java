package com.camp_us.controller;


import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.camp_us.dto.MemberVO;
import com.camp_us.dto.StuLecVO;
import com.camp_us.service.MemberService;
import com.camp_us.service.StuLecService;

@Controller
@RequestMapping("")
public class AdminLTEController {
	@Autowired
	private StuLecService stuLecService;
	@Autowired
	private MemberService memberService;
	
	@GetMapping("/student")
	public void starter(Model model) throws SQLException {
		String stu_id = "2";  // mimi 학생 id 하드코딩
		String mem_id = "mimi";
        try {
            List<StuLecVO> lectureList = stuLecService.selectLectureListByStudentId(stu_id);
            model.addAttribute("lectureList", lectureList);
        } catch (SQLException e) {
            e.printStackTrace();
            model.addAttribute("errorMessage", "강의 목록 조회 중 오류가 발생했습니다.");
        }
            MemberVO memberVO = memberService.getMember(mem_id);
            model.addAttribute("member", memberVO);
	}
	
	@GetMapping("/mail")
	public ModelAndView mail(ModelAndView mnv) throws Exception {
		String url="/mail";
		mnv.setViewName(url);
		return mnv;
	}
	@GetMapping("/adminmenu")
		public void adminmenu() {}
	@GetMapping("/empmenu")
		public void empmenu() {}
	@GetMapping("/mypage")
	public ModelAndView mypage(ModelAndView mnv) throws Exception {
		String url="/mypage";
		mnv.setViewName(url);
		return mnv;
	}
}
