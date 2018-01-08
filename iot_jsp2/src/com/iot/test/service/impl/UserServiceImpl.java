package com.iot.test.service.impl;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.iot.test.dao.UserDAO;
import com.iot.test.dao.impl.UserDAOImpl;
import com.iot.test.service.UserService;
import com.iot.test.vo.UserClass;

public class UserServiceImpl implements UserService{
	private Gson gs = new Gson();
	private UserDAO ud = new UserDAOImpl();

	@Override
	public HashMap<String,Object> login(HttpServletRequest req) {
		
		UserClass uc = gs.fromJson(req.getParameter("param"), UserClass.class);
		HashMap<String,Object> hm = new HashMap<String,Object>();
		hm.put("msg", "오 로그인 성공하셨네요 ~");
		hm.put("login", "ok");
		
		UserClass checkUc=ud.selectUser(uc.getUiId());
		if(checkUc!=null) {
			if(!checkUc.getUiPwd().equals(uc.getUiPwd())) {
				hm.put("msg", "비밀번호 확인하세요");
				hm.put("login", "no");
			}else {
				HttpSession hs=req.getSession();
				hs.setAttribute("user", checkUc);
				
			}
		}else {
			 hm.put("msg", "아이디를 확인하세요");
			 hm.put("login", "no");
		}
		return hm;
	}

	@Override
	public void logout(HttpServletRequest req) {
		HttpSession hs = req.getSession();
		hs.invalidate();//세션값을 모조리 소멸시킴 
	}
	public void signin(HttpServletRequest req) {
		String json = req.getParameter("param");
		UserClass uc = gs.fromJson(json,UserClass.class);
		int result = ud.insertUser(uc);
		HashMap<String,String> rm = new HashMap<String, String>();
		rm.put("result", "no");
		rm.put("msg", "실패했어 이유는 모르겠다");
		if(result==1) {
			rm.put("result","ok");
			rm.put("msg", "성공했어, 잘했다~~");
		}
		req.setAttribute("resStr",gs.toJson(rm));
		
	}

	@Override
	public ArrayList<UserClass> getUserList() {
		return ud.selectUserList();
	}

	@Override
	public String deleteUser(HttpServletRequest req) {
		int uiNo = Integer.parseInt(req.getParameter("uiNo"));
		UserClass uc = new UserClass();
		uc.setUiNo(uiNo);
		int result = ud.deleteUser(uc);		
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
	public String updateUser(HttpServletRequest req) {
		String param = req.getParameter("param");
		UserClass uc = gs.fromJson(param, UserClass.class);
		int result = ud.updateUser(uc);		
		HashMap<String,String> rm = new HashMap<String, String>();
		rm.put("result", "no");
		rm.put("msg", "수정이 실패하였습니다.");
		if(result==1) {
			rm.put("result", "ok");
			rm.put("msg", "수정 성공!!");
		}
		return gs.toJson(rm);
	}
	
	
}
