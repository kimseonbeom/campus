package com.camp_us.service;

import java.sql.SQLException;
import java.util.List;

import com.camp_us.command.PageMakerPro;
import com.camp_us.dto.ProjectListVO;

public interface RoadMapService {
	List<ProjectListVO> projectlist(PageMakerPro pageMaker,String mem_id) throws SQLException;
}
