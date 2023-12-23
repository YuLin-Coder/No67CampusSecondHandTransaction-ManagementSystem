package com.daowen.service;

import org.springframework.stereotype.Service;

import com.daowen.entity.Lanmu;
import com.daowen.mapper.LanmuMapper;

@Service
public class LanmuTree extends RecursionTree<LanmuMapper> {

	public LanmuTree() {
	   setTextfieldname("title");
	}

	public void toNonLeaf(String id) {
		Lanmu m = (Lanmu) getMapper().load("where id=" + id);
		if (m != null) {
			m.setIsleaf(0);
			getMapper().update(m);
		}
	}

}
