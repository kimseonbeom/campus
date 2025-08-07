package com.camp_us.dao;

import java.sql.SQLException;
import java.util.List;

import com.camp_us.command.PageMaker;
import com.camp_us.dto.MemberVO;
import com.camp_us.dto.ProjectListVO;
import com.camp_us.dto.ProjectVO;
import com.camp_us.dto.TeamMemberVO;
import com.camp_us.dto.TeamVO;

public interface ProjectDAO {
    List<ProjectListVO>selectsearchProjectList(PageMaker pageMaker, String mem_id) throws SQLException;
	
    int selectsearchProjectListCount(PageMaker pageMaker, String mem_id);
	
    List<ProjectListVO>selectsearchProjectListpro(PageMaker pageMaker, String mem_id) throws SQLException;
	
    int selectsearchProjectListCountpro(PageMaker pageMaker, String mem_id);
    
    List<String>selectTeamMembers(String project_id)throws SQLException;
    
    List<ProjectListVO>selectTeamleader(String project_id)throws SQLException;
    
    List<String> selectTeamProfessor(String project_id)throws SQLException;
    
    List<ProjectVO>selectProjectList(String mem_id) throws SQLException;
    // 팀 선택 학생 리스트 조회
    List<MemberVO> selectTeamMemberList() throws SQLException;
    // 담당 교수 선택 조회
    List<MemberVO> selectProfessorList() throws SQLException;
    
    MemberVO selectMemberListById(String mem_id) throws SQLException;
    
    void insertTeamMemberList(TeamMemberVO teamMember) throws SQLException;
    
    void insertProject(ProjectVO project) throws SQLException;
    
    void insertTeamLeader(TeamVO team) throws SQLException;
    
    String selectProjectSeqNext() throws SQLException;
    
    String selectTeamSeqNext() throws SQLException;
}