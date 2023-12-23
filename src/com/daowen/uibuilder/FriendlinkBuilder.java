package com.daowen.uibuilder;

import java.text.MessageFormat;
import java.util.Iterator;
import java.util.List;

import com.daowen.entity.Friendlink;
import com.daowen.service.FriendlinkService;
import com.daowen.util.BeansUtil;

public class FriendlinkBuilder {

	public FriendlinkBuilder(){
		this.flSrv=BeansUtil.getBean("friendlinkService", FriendlinkService.class);
	}
	
	public  String build() {
		StringBuffer sb = new StringBuffer();
		List<Friendlink> list =flSrv.getEntity("");
		for (Iterator<Friendlink> it = list.iterator(); it.hasNext();) {

			Friendlink fl = it.next();
			sb.append(MessageFormat.format("<a target=\"_blank\" href=\"{1}\">{0}</a>",
					fl.getTitle(), fl.getHref()));
			sb.append("\r\n");
		}
		return sb.toString();
	}
	
	private FriendlinkService flSrv=null;
}
