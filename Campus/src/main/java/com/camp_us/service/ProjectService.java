package com.camp_us.service;

import java.sql.SQLException;
import java.util.List;

import com.camp_us.command.PageMaker;
import com.camp_us.dto.MemberVO;
import com.camp_us.dto.ProjectListVO;
import com.camp_us.dto.ProjectVO;
import com.camp_us.dto.TeamMemberVO;
import com.camp_us.dto.TeamVO;

public interface ProjectService {
	List<ProjectListVO> searchProjectList(PageMaker pagemaker, String mem_id) throws SQLException;
	
	List<ProjectListVO> searchProjectListpro(PageMaker pagemaker, String mem_id) throws SQLException;
	
    List<ProjectVO> selectProjectList(String mem_id) throws SQLException;

    List<MemberVO> selectTeamMemberList() throws SQLException;

    List<MemberVO> selectProfessorList() throws SQLException;
    
    List<String> selectTeamProfessor(String project_id)throws SQLException;
    
    List<String> selectTeamMembers(String project_id)throws SQLException;
    
    List<ProjectListVO> selectTeamLeader(String project_id)throws SQLException;

    MemberVO selectMemberListById(String mem_id) throws SQLException;

    void insertTeamMemberList(TeamMemberVO teamMember) throws SQLException;

    void insertProject(ProjectVO project) throws SQLException;

    void insertTeamLeader(TeamVO team) throws SQLException;

    String selectProjectSeqNext() throws SQLException;

    String selectTeamSeqNext() throws SQLException;
}