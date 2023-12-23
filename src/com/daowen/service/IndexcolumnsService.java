package com.daowen.service;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Service;

import com.daowen.mapper.IndexcolumnsMapper;
import com.daowen.ssm.simplecrud.SimpleBizservice;

@Service("indexcolumnsService")
@Scope("prototype")
public class IndexcolumnsService extends SimpleBizservice<IndexcolumnsMapper> {

	
}
