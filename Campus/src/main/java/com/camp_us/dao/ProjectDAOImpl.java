package com.camp_us.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.camp_us.dto.ProjectVO;

public class ProjectDAOImpl implements ProjectDAO{
	private SqlSession session;

    public ProjectDAOImpl(SqlSession session) {
        this.session = session;
    }

    @Override
    public List<ProjectVO> selectProjectListByStuId(String stuId) throws SQLException {
        return session.selectList("Project-Mapper.selectProjectListByStuId", stuId);
    }

    @Override
    public int selectOngoingProjectCountByStuId(String stuId) throws SQLException {
        return session.selectOne("Project-Mapper.selectOngoingProjectCountByStuId", stuId);
    }

    @Override
    public ProjectVO selectProjectById(String projectId) throws SQLException {
        return session.selectOne("Project-Mapper.selectProjectById", projectId);
    }

    @Override
    public void insertProject(ProjectVO project) throws SQLException {
        session.insert("Project-Mapper.insertProject", project);
    }

    @Override
    public void updateProject(ProjectVO project) throws SQLException {
        session.update("Project-Mapper.updateProject", project);
    }

    @Override
    public void deleteProject(String projectId) throws SQLException {
        session.delete("Project-Mapper.deleteProject", projectId);
    }
}
