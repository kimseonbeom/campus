package com.camp_us.dao;

import java.sql.SQLException;
import java.util.List;

import com.camp_us.command.PageMaker;
import com.camp_us.command.PageMakerPro;
import com.camp_us.dto.ProjectListVO;

public interface RoadMapDAO {
	List<ProjectListVO>selectsearchProjectListstu(PageMakerPro pageMaker, String mem_id) throws SQLException;
	
	int selectsearchProjectListCountstu(PageMakerPro pageMaker, String mem_id);
}
