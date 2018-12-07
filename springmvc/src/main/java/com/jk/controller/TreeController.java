/** 
 * <pre>项目名称:maven-bootstrap 
 * 文件名称:TreeController.java 
 * 包名:com.jk.controller.tree 
 * 创建日期:2018年10月10日下午6:56:56 
 * Copyright (c) 2018, yuxy123@gmail.com All Rights Reserved.</pre> 
 */  
package com.jk.controller;

import com.jk.model.Tree;
import com.jk.service.TreeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/** 
 * <pre>项目名称：maven-bootstrap    
 * 类名称：TreeController    
 * 类描述：    
 * 创建人：李亚光 cht_java@126.com    
 * 创建时间：2018年10月10日 下午6:56:56    
 * 修改人：李亚光 cht_java@126.com  
 * 修改时间：2018年10月10日 下午6:56:56    
 * 修改备注：       
 * @version </pre>    
 */
@Controller
@RequestMapping("/tree")
public class TreeController {

	@Autowired
	private TreeService treeService;
	
	@RequestMapping("/queryTree")
	@ResponseBody
	public List<Tree>queryTree(){
		List<Tree>list = treeService.queryTree();
		return list;
	}
}
