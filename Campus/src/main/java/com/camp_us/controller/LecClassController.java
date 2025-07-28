package com.camp_us.controller;

import java.sql.SQLException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.camp_us.dto.LecClassVO;
import com.camp_us.service.LecClassService;

@RestController // JSON 응답용
@RequestMapping("/lecture")
public class LecClassController {

    private final LecClassService lecClassService;

    @Autowired
    public LecClassController(LecClassService lecClassService) {
        this.lecClassService = lecClassService;
    }

    @GetMapping("/changeMajor")
    public LecClassVO getLectureInfo(@RequestParam("lec_id") String lec_id) throws SQLException {
        return lecClassService.getLecClassById(lec_id);
    }
}