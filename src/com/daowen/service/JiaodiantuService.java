package com.daowen.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Service;

import com.daowen.entity.Jiaodiantu;
import com.daowen.mapper.JiaodiantuMapper;
import com.daowen.ssm.simplecrud.SimpleBizservice;

@Service("jiaodiantuService")
@Scope("prototype")
public class JiaodiantuService extends SimpleBizservice<JiaodiantuMapper> {

	
}
