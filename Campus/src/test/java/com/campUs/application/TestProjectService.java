package com.campUs.application;

import java.util.List;

import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

import com.camp_us.dto.ProjectVO;
import com.camp_us.service.ProjectService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {
    "classpath:com/camp_us/context/dataSource-context.xml",
    "classpath:com/camp_us/context/root-context.xml"
})
@Transactional
public class TestProjectService {

    @Autowired
    private ProjectService service;
    
    
    @Test
    public void testListByStudentId() throws Exception {
        String stuId = "student01";  // 실제 존재하는 학생 아이디로 변경하세요

        List<ProjectVO> projectList = service.listByStudentId(stuId);
        Assert.assertNotNull(projectList);
        Assert.assertTrue(projectList.size() >= 0);
    }

    @Test
    public void testCountOngoingByStudentId() throws Exception {
        String stuId = "student01";

        int count = service.countOngoingByStudentId(stuId);
        Assert.assertTrue(count >= 0);
    }

    @Test
    public void testDetail() throws Exception {
        String projectId = "PJ001"; // 실제 존재하는 프로젝트 아이디로 변경하세요

        ProjectVO project = service.detail(projectId);
        Assert.assertNotNull(project);
        Assert.assertEquals(projectId, project.getProject_id());
    }

    // 추가적으로 등록, 수정, 삭제 테스트도 작성할 수 있습니다.
}