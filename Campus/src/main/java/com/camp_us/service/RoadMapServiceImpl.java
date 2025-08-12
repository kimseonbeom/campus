package com.camp_us.service;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.camp_us.command.PageMakerPro;
import com.camp_us.dao.ProjectDAO;
import com.camp_us.dao.RoadMapDAO;
import com.camp_us.dto.ProjectListVO;

public class RoadMapServiceImpl implements RoadMapService{
	
    private RoadMapDAO roadMapDAO;

    @Autowired
    public RoadMapServiceImpl(RoadMapDAO roadMapDAO) {
        this.roadMapDAO = roadMapDAO;
    }
	@Override
	public List<ProjectListVO> projectlist(PageMakerPro pageMaker,String mem_id) throws SQLException {
		List<ProjectListVO> projectlist = roadMapDAO.selectsearchProjectListstu(pageMaker, mem_id);
		
		int totalCount = roadMapDAO.selectsearchProjectListCountstu(pageMaker, mem_id);
		pageMaker.setTotalCount(totalCount);	
		
		return projectlist;
	}

}
