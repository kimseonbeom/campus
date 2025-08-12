package com.camp_us.dao;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import com.camp_us.command.PageMakerPro;
import com.camp_us.dto.ProjectListVO;

public class RoadMapDAOImpl implements RoadMapDAO{
	
	private SqlSession session;

    public RoadMapDAOImpl(SqlSession session) {
        this.session = session;
    }
    
	@Override
	public List<ProjectListVO> selectsearchProjectListstu(PageMakerPro pageMaker, String mem_id) throws SQLException {
		int offset = pageMaker.getStartRow()-1;
		int limit = pageMaker.getPerPageNum();
		RowBounds bounds = new RowBounds(offset,limit);
		Map<String, Object> dataMap = new HashMap<String, Object>();
		dataMap.put("keyword", pageMaker.getKeyword());
		dataMap.put("searchType", pageMaker.getSearchType());
		dataMap.put("project_name",pageMaker.getProject_name());
		dataMap.put("mem_id", mem_id);
		dataMap.put("project_stdate", pageMaker.getProject_stdate());
		dataMap.put("project_endate", pageMaker.getProject_endate());
		List<ProjectListVO> projectList = session.selectList("RoadMap-Mapper.selectsearchProjectListstu",dataMap,bounds);
		
		return projectList;
	}

	@Override
	public int selectsearchProjectListCountstu(PageMakerPro pageMaker, String mem_id) {
		Map<String,Object> dataMap = new HashMap<String,Object>();
		dataMap.put("keyword", pageMaker.getKeyword());
		dataMap.put("searchType", pageMaker.getSearchType());
		dataMap.put("project_name",pageMaker.getProject_name());
		dataMap.put("project_stdate", pageMaker.getProject_stdate());
		dataMap.put("project_endate", pageMaker.getProject_endate());
		dataMap.put("mem_id", mem_id);
		
		int count = session.selectOne("RoadMap-Mapper.selectsearchProjectListCountstu",dataMap);
		return count;
	}
}
