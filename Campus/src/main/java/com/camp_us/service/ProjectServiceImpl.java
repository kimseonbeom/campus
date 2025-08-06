package com.camp_us.service;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.camp_us.command.PageMaker;
import com.camp_us.dao.ProjectDAO;
import com.camp_us.dto.MemberVO;
import com.camp_us.dto.ProjectListVO;
import com.camp_us.dto.ProjectVO;
import com.camp_us.dto.TeamMemberVO;
import com.camp_us.dto.TeamVO;

@Service
public class ProjectServiceImpl implements ProjectService {

    private ProjectDAO projectDAO;

    @Autowired
    public ProjectServiceImpl(ProjectDAO projectDAO) {
        this.projectDAO = projectDAO;
    }

    @Override
    public List<ProjectVO> selectProjectList(String mem_id) throws SQLException {
        return projectDAO.selectProjectList(mem_id);
    }

    @Override
    public List<MemberVO> selectTeamMemberList() throws SQLException {
        return projectDAO.selectTeamMemberList();
    }

    @Override
    public List<MemberVO> selectProfessorList() throws SQLException {
        return projectDAO.selectProfessorList();
    }

    @Override
    public MemberVO selectMemberListById(String mem_id) throws SQLException {
        return projectDAO.selectMemberListById(mem_id);
    }

    @Override
    public void insertTeamMemberList(TeamMemberVO teamMember) throws SQLException {
        projectDAO.insertTeamMemberList(teamMember);
    }

    @Override
    public void insertProject(ProjectVO project) throws SQLException {
        projectDAO.insertProject(project);
    }

    @Override
    public void insertTeamLeader(TeamVO team) throws SQLException {
        projectDAO.insertTeamLeader(team);
    }

    @Override
    public String selectProjectSeqNext() throws SQLException {
        return projectDAO.selectProjectSeqNext();
    }

    @Override
    public String selectTeamSeqNext() throws SQLException {
        return projectDAO.selectTeamSeqNext();
    }

	@Override
	public List<ProjectListVO> searchProjectList(PageMaker pageMaker, String mem_id) throws SQLException {
		List<ProjectListVO> projectlist = projectDAO.selectsearchProjectList(pageMaker, mem_id);
		
		int totalCount = projectDAO.selectsearchProjectListCount(pageMaker, mem_id);
		pageMaker.setTotalCount(totalCount);
		return projectlist;
	}

	@Override
	public List<ProjectListVO> searchProjectListpro(PageMaker pageMaker, String mem_id) throws SQLException {
List<ProjectListVO> projectlist = projectDAO.selectsearchProjectList(pageMaker, mem_id);
		
		int totalCount = projectDAO.selectsearchProjectListCount(pageMaker, mem_id);
		pageMaker.setTotalCount(totalCount);
		return projectlist;
	}
}