package com.camp_us.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.camp_us.command.PageMakerPro;
import com.camp_us.dto.MemberVO;
import com.camp_us.dto.ProjectListVO;
import com.camp_us.service.ProjectService;
import com.camp_us.service.RoadMapService;

@Controller
@RequestMapping("/roadmap")
public class RodeMapController {
	
	
	private RoadMapService roadMapService;
	private ProjectService projectService;
	
	@Autowired
    public RodeMapController(ProjectService projectService, RoadMapService roadMapService) {
        this.projectService = projectService;
        this.roadMapService = roadMapService;
    }
	
	@GetMapping("/projectlist/stu")
	public String list(HttpSession session, Model model,@RequestParam(value = "samester", required = false) String samester,@RequestParam(value = "project_name", required = false) String project_name,
    		@ModelAttribute PageMakerPro pageMaker) throws Exception {
    	String url="/roadmap/projectlist";
        MemberVO member = (MemberVO) session.getAttribute("loginUser");
        if (member == null) {
            throw new IllegalStateException("로그인 정보가 없습니다.");
        }
        model.addAttribute("member",member);
        String mem_id = member.getMem_id();
        pageMaker.setKeyword(samester);
        pageMaker.setProject_name(project_name);
        List<ProjectListVO> projectList = roadMapService.projectlist(pageMaker, mem_id);

        
        Map<String, List<String>> projectTeamMembersMap = new HashMap<>();
        for (ProjectListVO project : projectList) {
            String project_id = project.getProject_id();
            List<String> members = projectService.selectTeamMembers(project_id);
            projectTeamMembersMap.put(project_id, members);
        }
        Map<String, List<String>> projectEditStatusMap = new HashMap<>();

        for (ProjectListVO project : projectList) {
            String project_id = project.getProject_id();
            if (project_id != null) {
                List<String> editStatusList = projectService.selectEditStatusByProjectid(project_id);
                // 예: 여러 개가 있으면 첫 번째만 쓰거나, 없으면 "수정 가능" 기본값 설정
                if (editStatusList != null && !editStatusList.isEmpty()) {
                    projectEditStatusMap.put(project_id, editStatusList);
                } else {
                    projectEditStatusMap.put(project_id, List.of("수정 가능"));
                }
            } else {
                projectEditStatusMap.put("unknown", List.of("수정 가능"));
            }
        }
        model.addAttribute("projectEditStatusMap", projectEditStatusMap);
        model.addAttribute("selectedSamester", samester); 
        model.addAttribute("projectList", projectList);
        model.addAttribute("projectTeamMembersMap", projectTeamMembersMap);
        System.out.println("project_stdate: " + pageMaker.getProject_stdate());
        System.out.println("project_endate: " + pageMaker.getProject_endate());
        System.out.println("pageMaker.project_name = " + pageMaker.getProject_name());
        model.addAttribute("project_stdate",pageMaker.getProject_stdate());
        model.addAttribute("project_endate",pageMaker.getProject_endate());
        model.addAttribute("project_name",pageMaker.getProject_name());
        return url;
    }
	@GetMapping("/list/stu")
	public String roadMapList() {
		String url="/roadmap/stulist";
	return url;
	}
	@GetMapping("/regist")
	public String regist() {
		String url="/roadmap/regist";
		return url;
	}
	@GetMapping("/detail")
	public String detail() {
		String url="/roadmap/detail";
		return url;
	}
	@GetMapping("/evalution")
	public String evalution() {
		String url="/roadmap/evalution";
		return url;
	}
}