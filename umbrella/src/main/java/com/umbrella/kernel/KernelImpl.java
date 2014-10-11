package com.umbrella.kernel;

import com.alibaba.fastjson.JSONArray;
import com.google.inject.Inject;
import com.umbrella.session.Session;
import com.umbrella.session.SessionException;
import com.wolfram.jlink.KernelLink;
import com.wolfram.jlink.MathLinkException;

public class KernelImpl implements Kernel {
	
	@Inject
	private Session<KernelLink> session;
	
	@Inject private KernelConfig config;
	
	@Override
	public JSONArray evaluate(String expression) throws MathLinkException, SessionException {
		KernelLink kernelLink = session.get();
		expression = "TimeConstrained[" + expression + ", "+config.getTimeConstrained()+"]";
		kernelLink.putFunction("EnterTextPacket", 1);
		kernelLink.put(expression);
		kernelLink.endPacket();
		kernelLink.discardAnswer();
		return kernelLink.result();
	}
}
