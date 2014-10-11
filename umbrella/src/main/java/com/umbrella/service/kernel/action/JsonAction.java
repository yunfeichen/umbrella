package com.umbrella.service.kernel.action;

import io.netty.channel.ChannelHandlerContext;

import com.alibaba.fastjson.JSONObject;

public interface JsonAction{
	
	void act(ChannelHandlerContext ctx, final JSONObject json) throws Exception;
	
}
