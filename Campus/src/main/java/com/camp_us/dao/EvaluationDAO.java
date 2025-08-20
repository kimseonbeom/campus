package com.camp_us.dao;

import java.sql.SQLException;
import java.util.List;

import com.camp_us.command.PageMakerRM;
import com.camp_us.dto.EvaluationVO;



public interface EvaluationDAO {
	List<EvaluationVO> selectEvaluationList(String rm_id,PageMakerRM pageMaker) throws SQLException;
	int countEvaluation(String rm_id)throws SQLException;
	EvaluationVO selectEvaluationByEval_id(String eval_id);
	String selectEvaluationSeqNextValue()throws SQLException;
	
	void insertEvaluation(EvaluationVO evaluation)throws SQLException;
	void updateEvaluation(EvaluationVO evaluation)throws SQLException;
	void deleteEvaluation(String eval_id)throws SQLException;
}
