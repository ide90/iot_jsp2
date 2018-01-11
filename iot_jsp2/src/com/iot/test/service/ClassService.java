package com.iot.test.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.iot.test.vo.ClassInfo;

public interface ClassService {
	
	List<ClassInfo> getClassList();
	public String deleteClass(HttpServletRequest req);
	public String updateClass(HttpServletRequest req);
	public String insertClass(HttpServletRequest req);

}
