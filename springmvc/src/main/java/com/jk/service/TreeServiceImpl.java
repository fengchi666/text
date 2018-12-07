/** 
 * <pre>项目名称:maven-bootstrap 
 * 文件名称:TreeServiceImpl.java 
 * 包名:com.jk.service.tree.impl 
 * 创建日期:2018年10月10日下午7:03:58 
 * Copyright (c) 2018, yuxy123@gmail.com All Rights Reserved.</pre> 
 */  
package com.jk.service;

import com.jk.mapper.TreeMapepr;
import com.jk.model.Tree;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/** 
 * <pre>项目名称：maven-bootstrap    
 * 类名称：TreeServiceImpl    
 * 类描述：    
 * 创建人：李亚光 cht_java@126.com    
 * 创建时间：2018年10月10日 下午7:03:58    
 * 修改人：李亚光 cht_java@126.com  
 * 修改时间：2018年10月10日 下午7:03:58    
 * 修改备注：       
 * @version </pre>    
 */
@Service
public class TreeServiceImpl implements TreeService {

	@Autowired
	private TreeMapepr treeMapper;
	
	
	public List<Tree> queryTree() {
		String pid="0";
		return getChild(pid);
	}
	private List<Tree> getChild(String pid) {
		List<Tree>lists = treeMapper.queryTree(pid);
		for (Tree menuTree : lists) {
			String id=menuTree.getId();
			menuTree.setNodes(getChild(id));
		}
		return lists;
	}

}
