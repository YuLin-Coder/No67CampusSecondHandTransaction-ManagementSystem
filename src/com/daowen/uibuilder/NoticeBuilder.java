package com.daowen.uibuilder;

import java.text.MessageFormat;
import java.util.Iterator;
import java.util.List;

import com.daowen.entity.Notice;
import com.daowen.service.NoticeService;
import com.daowen.util.BeansUtil;

public class NoticeBuilder {

	private NoticeService noticeSrv=null;
	public NoticeBuilder(){
		noticeSrv=BeansUtil.getBean("noticeService", NoticeService.class);
	}
	public  String build() {
		StringBuffer sb = new StringBuffer();
		List<Notice> list = noticeSrv.getTopEntity("", 10);
		sb.append("<ul>");
		sb.append("\r\n");
		for (Iterator<Notice> it = list.iterator(); it.hasNext();) {
			Notice n = it.next();
			sb.append(MessageFormat.format(
					"<li ><a href=''noticeinfo.jsp?id={0}''>{1}</a></li>",n.getId(), n.getTitle()));
			sb.append("\r\n");
		}
		sb.append("\r\n");
		sb.append("</ul>");
		return sb.toString();

	}
	
}
