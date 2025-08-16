package com.camp_us.controller;

import java.io.File;
import java.nio.file.Paths;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.Resource;
import org.springframework.core.io.UrlResource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.util.UriUtils;

import com.camp_us.command.PageMakerPro;
import com.camp_us.command.PageMakerRM;
import com.camp_us.command.RoadMapRegistCommand;
import com.camp_us.dao.AttachDAO;
import com.camp_us.dto.AttachVO;
import com.camp_us.dto.MemberVO;
import com.camp_us.dto.ProjectListVO;
import com.camp_us.dto.RoadMapVO;
import com.camp_us.service.ProjectService;
import com.camp_us.service.RoadMapService;
import com.josephoconnell.html.HTMLInputFilter;

@Controller
@RequestMapping("/roadmap")
public class RodeMapController {
	
	@Autowired
	private RoadMapService roadMapService;
	@Autowired
	private ProjectService projectService;
	@Autowired
	private AttachDAO attachDAO;
//	@Autowired
//    public RodeMapController(ProjectService projectService, RoadMapService roadMapService) {
//        this.projectService = projectService;
//        this.roadMapService = roadMapService;
//    }
//	
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
        model.addAttribute("project_stdate",pageMaker.getProject_stdate());
        model.addAttribute("project_endate",pageMaker.getProject_endate());
        model.addAttribute("project_name",pageMaker.getProject_name());
        return url;
    }
	@GetMapping("/list/stu")
	public String roadMapList(HttpSession session,@RequestParam(value = "rm_category", required = false) String rm_category,
	                          @ModelAttribute PageMakerRM pageMaker,
	                          Model model,
	                          String project_id) throws Exception {
	    String url = "/roadmap/stulist";
	    
	    List<RoadMapVO> roadMapList = roadMapService.roadmaplist(pageMaker, project_id);
	    List<ProjectListVO> projectList = projectService.selectProjectByProjectId(project_id);
	    
        model.addAttribute("rm_category", rm_category);
        model.addAttribute("rm_stdate",pageMaker.getRm_stdate());
        model.addAttribute("rm_endate",pageMaker.getRm_endate());
        model.addAttribute("rm_name",pageMaker.getRm_name());
	    model.addAttribute("pageMaker", pageMaker);
	    model.addAttribute("roadMapList", roadMapList);
	    model.addAttribute("project", projectList);

	    return url;
	}
	
	@GetMapping("/regist")
	public String registForm(HttpSession session, @RequestParam("project_id") String project_id,Model model)throws SQLException {
		String url="/roadmap/regist";
		MemberVO member = (MemberVO) session.getAttribute("loginUser");
        if (member == null) {
            throw new IllegalStateException("로그인 정보가 없습니다.");
        }
        model.addAttribute("member",member);
        String mem_id = member.getMem_id();
        
		List<ProjectListVO> projectList = projectService.selectProjectByProjectId(project_id);
        List<MemberVO> professorList = projectService.selectProfessorList();
        List<MemberVO> studentList = projectService.selectTeamMemberList();
        List<String>teammembers = projectService.selectTeamMembers(project_id);
        String teammembersStr = String.join(", ", teammembers);
        
   
        model.addAttribute("teammembers", teammembersStr);
        model.addAttribute("professorList", professorList);	
        model.addAttribute("studentList", studentList);
        model.addAttribute("projectList", projectList);
        
		return url;
	}
	@PostMapping(value = "/regist", produces = "text/plain;charset=utf-8")
	public ModelAndView regist(HttpSession session, RoadMapRegistCommand regCommand, ModelAndView mnv)throws Exception {
		String url = "/roadmap/regist_success";
		List<MultipartFile> uploadFiles  = regCommand.getUploadFile();
		String uploadPath = fileUploadPath;
		//DB 
		List<AttachVO> attaches = saveFileToAttaches(uploadFiles, uploadPath);
		System.out.println("uploadFiles = " + regCommand.getUploadFile());
		System.out.println("fileUploadPath = " + fileUploadPath);
				RoadMapVO roadMap = regCommand.toRoadMapVO();
				roadMap.setRm_name(HTMLInputFilter.htmlSpecialChars(roadMap.getRm_name()));
				roadMap.setAttachList(attaches);
				String project_id = roadMap.getProject_id();
				System.out.println("Upload path: " + fileUploadPath);
				roadMapService.regist(roadMap);
				mnv.addObject("project_id", project_id);
				mnv.setViewName(url);
				return mnv;
	}
	@GetMapping("/detail")
	public ModelAndView detail(String rm_id, HttpSession session, ModelAndView mnv)throws Exception {
		String url="/roadmap/detail";
		
		MemberVO member = (MemberVO)session.getAttribute("loginUser");
		String key = "roadMap:"+member.getMem_id()+rm_id;
		RoadMapVO roadMap = roadMapService.detail(rm_id);
		String project_id = roadMap.getProject_id();
		List<ProjectListVO> projectList = projectService.selectProjectByProjectId(project_id);
		mnv.addObject("projectList", projectList);
		mnv.addObject("roadMap",roadMap);		
		mnv.setViewName(url);
		return mnv;
	}
	@GetMapping("/evalution")
	public String evalution() {
		String url="/roadmap/evalution";
		return url;
	}
	@javax.annotation.Resource(name="roadMapSavedFilePath")
	private String fileUploadPath;

	private List<AttachVO> saveFileToAttaches(List<MultipartFile> multiFiles,
												String savePath )throws Exception{
		if (multiFiles == null) return null;
		
		//저장 -> attachVO -> attachList.add
		List<AttachVO> attachList = new ArrayList<AttachVO>();
		for (MultipartFile multi : multiFiles) {
			//파일명
			String uuid = UUID.randomUUID().toString().replace("-", "");
			String fileName = uuid+"$$"+multi.getOriginalFilename();
			
			//파일저장
			File target = new File(savePath, fileName);
			target.mkdirs();
			multi.transferTo(target);
			
			AttachVO attach = new AttachVO();
			attach.setUploadPath(savePath);
			attach.setFileName(fileName);
			attach.setFileType(fileName.substring(fileName.lastIndexOf('.') + 1).toUpperCase());

			//attchList 추가
			attachList.add(attach);
			
		}
		return attachList;
	}
	
	@GetMapping("/getFile")
	@ResponseBody
	public ResponseEntity<Resource> getFile(int ano) throws Exception {
						
		AttachVO attach  = attachDAO.selectAttachByAno(ano);
	    String filePath = attach.getUploadPath() + File.separator + attach.getFileName();
		
		
	    Resource resource = new UrlResource(Paths.get(filePath).toUri());
	    
	    return ResponseEntity.ok()
                .header(HttpHeaders.CONTENT_DISPOSITION,"attachment; filename=\"" + 
				UriUtils.encode(attach.getFileName().split("\\$\\$")[1], "UTF-8") + "\"")
                .body(resource);		
	}
}