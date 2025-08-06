package com.camp_us.controller;


import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.camp_us.dto.MemberVO;
import com.camp_us.dto.ProLecVO;
import com.camp_us.dto.StuLecVO;
import com.camp_us.service.LecClassService;
import com.camp_us.service.StuLecService;

@Controller
@RequestMapping("")
public class AdminLTEController {
	@Autowired
	private StuLecService stuLecService;
	@Autowired
	private LecClassService lecClassService;
	@GetMapping("/student")
	public void starter(HttpSession session, Model model) {
		MemberVO member = (MemberVO) session.getAttribute("loginUser");
        model.addAttribute("member", member);
		String member_id = member.getMem_id();
		System.out.println(member_id);// mimi 학생 id 하드코딩
		String auth = member.getMem_auth(); // 예: "ROLE_STUDENT,ROLE_PROFESSOR"

		if (auth != null) {
		    if (auth.contains("1")) {
		        try {
		            List<StuLecVO> stulectureList = stuLecService.selectLectureListByStudentId(member_id);
		            model.addAttribute("stulectureList", stulectureList);
		        } catch (SQLException e) {
		            e.printStackTrace();
		            model.addAttribute("stuLecError", "학생 강의 조회 중 오류 발생");
		        }
		    }

		    if (auth.contains("2")) {
		        try {
		            List<ProLecVO> prolectureList = lecClassService.selectLecClassByProfessorId(member_id);
		            model.addAttribute("prolectureList", prolectureList);
		        } catch (SQLException e) {
		            e.printStackTrace();
		            model.addAttribute("lecClassError", "교수 강의 조회 중 오류 발생");
		        }
		    }
		}
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