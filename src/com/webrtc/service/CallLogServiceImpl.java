package com.webrtc.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.webrtc.dao.CallLogDao;
import com.webrtc.model.Calllog;

@Service("callLogService")
@Transactional(propagation = Propagation.SUPPORTS, readOnly = true)
public class CallLogServiceImpl implements CallLogService {

	@Autowired
	private CallLogDao callLogDao;

	@Transactional(propagation = Propagation.REQUIRED, readOnly = false)

	public void addCall(Calllog calllog) {
		callLogDao.addCall(calllog);
		
	}


	public Calllog getCall(int callid) {
		return callLogDao.getCall(callid);
	}

	public List<Calllog> listCalls() {
		return callLogDao.listCalls();
	}
}