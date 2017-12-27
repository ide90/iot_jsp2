package com.test.iot.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;

public interface ClassService {

	ArrayList<HashMap<String, Object>> getUserList();

	HashMap<String, Object> getUser();

	int executeUpdate(int i, LinkedHashMap<String, Object> hm);

}
