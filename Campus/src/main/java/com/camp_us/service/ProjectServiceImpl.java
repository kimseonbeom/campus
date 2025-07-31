package com.camp_us.service;

import java.sql.SQLException;
import java.util.List;

import com.camp_us.dao.ProjectDAO;
import com.camp_us.dto.ProjectVO;

public class ProjectServiceImpl implements ProjectService{
    private final ProjectDAO projectDAO;

    public ProjectServiceImpl(ProjectDAO projectDAO) {
        this.projectDAO = projectDAO;
    }

    @Override
    public List<ProjectVO> listByStudentId(String stu_id) throws SQLException {
        return projectDAO.selectProjectListByStuId(stu_id);
    }

    @Override
    public int countOngoingByStudentId(String stu_id) throws SQLException {
        return projectDAO.selectOngoingProjectCountByStuId(stu_id);
    }

    @Override
    public ProjectVO detail(String project_id) throws SQLException {
        return projectDAO.selectProjectById(project_id);
    }

    @Override
    public void regist(ProjectVO project) throws SQLException {
        projectDAO.insertProject(project);
    }

    @Override
    public void modify(ProjectVO project) throws SQLException {
        projectDAO.updateProject(project);
    }

    @Override
    public void remove(String project_id) throws SQLException {
        projectDAO.deleteProject(project_id);
    }

}


