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
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.camp_us.command.PageMaker;
import com.camp_us.command.ProjectRegistCommand;
import com.camp_us.dto.MemberVO;
import com.camp_us.dto.ProjectListVO;
import com.camp_us.dto.ProjectVO;
import com.camp_us.dto.TeamMemberVO;
import com.camp_us.dto.TeamVO;
import com.camp_us.service.ProjectService;

@Controller
@RequestMapping("/project")
public class ProjectController {

    private ProjectService projectService;

    @Autowired
    public ProjectController(ProjectService projectService) {
        this.projectService = projectService;
    }

    @GetMapping("/list/stu")
    public String listStudent(HttpSession session, Model model,@RequestParam(value = "samester", required = false) String samester,
    		@ModelAttribute PageMaker pageMaker) throws Exception {
    	String url="/project/list";
        MemberVO member = (MemberVO) session.getAttribute("loginUser");
        if (member == null) {
            throw new IllegalStateException("로그인 정보가 없습니다.");
        }
        model.addAttribute("member",member);
        String mem_id = member.getMem_id();
        pageMaker.setSearchType("multi");
        pageMaker.setKeyword(samester);
        
        List<ProjectListVO> projectList = projectService.searchProjectList(pageMaker, mem_id);

        
        Map<String, List<String>> projectTeamMembersMap = new HashMap<>();
        for (ProjectListVO project : projectList) {
            String project_id = project.getProject_id();
            List<String> members = projectService.selectTeamMembers(project_id);
            projectTeamMembersMap.put(project_id, members);
        }

        model.addAttribute("selectedSamester", samester); 
        model.addAttribute("projectList", projectList);
        model.addAttribute("projectTeamMembersMap", projectTeamMembersMap);
        System.out.println("project_stdate: " + pageMaker.getProject_stdate());
        System.out.println("project_endate: " + pageMaker.getProject_endate());
        model.addAttribute("project_stdate",pageMaker.getProject_stdate());
        model.addAttribute("project_endate",pageMaker.getProject_endate());
      
        return url;
    }
    @GetMapping("/list/pro")
    public String listPro(HttpSession session, Model model,@ModelAttribute PageMaker pageMaker) throws Exception {
    	String url = "/project/list";
    	
        MemberVO member = (MemberVO) session.getAttribute("loginUser");
        if (member == null) {
            throw new IllegalStateException("로그인 정보가 없습니다.");
        }
        model.addAttribute("member",member);
        String mem_id = member.getMem_id();
        List<ProjectListVO> projectListpro = projectService.searchProjectListpro(pageMaker, mem_id);

        
        Map<String, List<String>> projectTeamMembersMap = new HashMap<>();
        Map<String, List<String>> projectProfessorMap = new HashMap<>();

        for (ProjectListVO project : projectListpro) {
            String project_id = project.getProject_id();
            List<String> professor = projectService.selectTeamProfessor(project_id);
            projectProfessorMap.put(project_id, professor);
        }

        model.addAttribute("projectListpro", projectListpro);
        model.addAttribute("projectTeamMembersMap", projectTeamMembersMap);
        model.addAttribute("projectProfessorMap",projectProfessorMap);
        
        return url;
    }

    @GetMapping("/detail")
    public void detail(@RequestParam("project_id") String project_id, Model model) throws Exception {
        // 추후 구현 필요: projectService.selectProjectById(project_id)
        model.addAttribute("project_id", project_id);
    }

    // ✅ 프로젝트 등록 폼 (교수/학생 리스트 조회)
    @GetMapping("/regist")
    public void registForm(Model model) throws Exception {
    	System.out.println("[ProjectController] registForm() 호출됨");
    	List<MemberVO> professorList = projectService.selectProfessorList();
        List<MemberVO> studentList = projectService.selectTeamMemberList();
        model.addAttribute("professorList", professorList);
        model.addAttribute("studentList", studentList);
    }

    // ✅ 프로젝트 등록 처리
    @PostMapping("/regist")
    public String registPost(ProjectRegistCommand command) throws Exception {
    	String url = "/project/regist_success";
        // 1) 시퀀스 조회
        String project_id = projectService.selectProjectSeqNext();
        String team_id = projectService.selectTeamSeqNext();

        // 2) 커맨드를 DTO로 변환
        ProjectVO project = command.toProjectVO(project_id, team_id);
        TeamVO team = command.toTeamVO(team_id);
        List<TeamMemberVO> memberList = command.toTeamMemberVOList(team_id);

        // 3) DB insert (순차적으로 처리)
        projectService.insertTeamLeader(team);
        projectService.insertProject(project);
        
        for (TeamMemberVO tm : memberList) {
            projectService.insertTeamMemberList(tm);
        }

        return url;
    }
}
