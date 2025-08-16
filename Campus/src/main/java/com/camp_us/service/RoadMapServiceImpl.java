package com.camp_us.service;

import java.io.File;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.camp_us.command.PageMakerPro;
import com.camp_us.command.PageMakerRM;
import com.camp_us.dao.AttachDAO;
import com.camp_us.dao.RoadMapDAO;
import com.camp_us.dto.AttachVO;
import com.camp_us.dto.ProjectListVO;
import com.camp_us.dto.RoadMapVO;

public class RoadMapServiceImpl implements RoadMapService{
	
    private RoadMapDAO roadMapDAO;
    private String summernotePath;
    private AttachDAO attachDAO;
    
    
    @Autowired
    public RoadMapServiceImpl(RoadMapDAO roadMapDAO, String summernotePath, AttachDAO attachDAO) {
        this.roadMapDAO = roadMapDAO;
        this.summernotePath = summernotePath;
        this.attachDAO = attachDAO;
    }
	@Override
	public List<ProjectListVO> projectlist(PageMakerPro pageMaker,String mem_id) throws SQLException {
		List<ProjectListVO> projectlist = roadMapDAO.selectsearchProjectListstu(pageMaker, mem_id);
		
		int totalCount = roadMapDAO.selectsearchProjectListCountstu(pageMaker, mem_id);
		pageMaker.setTotalCount(totalCount);	
		
		return projectlist;
	}
	@Override
	public List<RoadMapVO> roadmaplist(PageMakerRM pageMaker, String project_id) throws SQLException {
		List<RoadMapVO> roadmaplist = roadMapDAO.selectRoadMapByProject_id(pageMaker, project_id);

		int totalCount = roadMapDAO.selectRoadMapByProject_idCount(pageMaker, project_id);
		pageMaker.setTotalCount(totalCount);	
		
		return roadmaplist;
	}
	@Override
	public void regist(RoadMapVO roadMap) throws SQLException {

		String rm_id = roadMapDAO.selectRoadMapSeqNext();
		
		roadMap.setRm_id(rm_id);
		
		roadMapDAO.insertRoadMap(roadMap);
		List<AttachVO> attachList = roadMap.getAttachList();
		if(attachList!=null) for(AttachVO attach : attachList) {
			attach.setRm_id(rm_id);
			attach.setAttacher(roadMap.getWriter());
			attachDAO.insertAttach(attach);
		}
		
	}
	@Override
	public void remove(String rm_id) throws SQLException {
		
		RoadMapVO roadMap = roadMapDAO.selectRoadMapByRm_id(rm_id);
		
		File dir = new File(summernotePath);
		File[] files = dir.listFiles();
		if(files!=null) for(File file : files) {
			if(roadMap.getRm_content().contains(file.getName())) {
				file.delete();
			}
		}
		
	}
	@Override
	public RoadMapVO detail(String rm_id) throws SQLException {
		return roadMapDAO.selectRoadMapByRm_id(rm_id);
	}
	@Override
	public List<String> evalStatus(String rm_id) throws SQLException {
		return roadMapDAO.selectEvalStatusByRMid(rm_id);
	}

}
