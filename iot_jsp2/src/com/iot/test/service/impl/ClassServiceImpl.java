package com.iot.test.service.impl;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.google.gson.Gson;
import com.iot.test.dao.ClassDAO;
import com.iot.test.dao.impl.ClassDAOImpl;
import com.iot.test.service.ClassService;
import com.iot.test.vo.ClassInfo;
import com.iot.test.vo.UserClass;

public class ClassServiceImpl implements ClassService{
	private ClassDAO cdao = new ClassDAOImpl();
	
	private Gson gs = new Gson();


	@Override
	public List<ClassInfo> getClassList() {
		return cdao.selectClassList();
	}


	@Override
	public String deleteClass(HttpServletRequest req) {
		int ciNo = Integer.parseInt(req.getParameter("ciNo"));
		ClassInfo cu = new ClassInfo();
		cu.setCiNo(ciNo);
		int result = cdao.deleteClass(cu);		
		HashMap<String,String> rm = new HashMap<String, String>();
		rm.put("result", "no");
		rm.put("msg", "삭제가 실패하였습니다.");
		if(result==1) {
			rm.put("result", "ok");
			rm.put("msg", "삭제 성공!!");
		}
		return gs.toJson(rm);	
		}


	@Override
	public String updateClass(HttpServletRequest req) {
		String param = req.getParameter("param");
		ClassInfo cu = gs.fromJson(param, ClassInfo.class);
		int result = cdao.updateClass(cu);		
		HashMap<String,String> rm = new HashMap<String, String>();
		rm.put("result", "no");
		rm.put("msg", "수정이 실패하였습니다.");
		if(result==1) {
			rm.put("result", "ok");
			rm.put("msg", "수정 성공!!");
		}
		return gs.toJson(rm);
	}


	@Override
	public String insertClass(HttpServletRequest req) {
		String param = req.getParameter("param");
		System.out.println(param);
		ClassInfo cu = gs.fromJson(param, ClassInfo.class);
		
		int result = cdao.insertClass(cu);		
		HashMap<String,String> rm = new HashMap<String, String>();
		rm.put("result", "no");
		rm.put("msg", "삽입이 실패하였습니다.");
		if(result==1) {
			rm.put("result", "ok");
			rm.put("msg", "삽입 성공!!");
		}
		return gs.toJson(rm);
	}

}
