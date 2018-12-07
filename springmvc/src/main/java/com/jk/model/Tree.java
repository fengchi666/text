/** 
 * <pre>项目名称:maven-bootstrap 
 * 文件名称:Tree.java 
 * 包名:com.jk.model.tree 
 * 创建日期:2018年10月10日下午6:55:10 
 * Copyright (c) 2018, yuxy123@gmail.com All Rights Reserved.</pre> 
 */  
package com.jk.model;

import java.util.List;


/** 
 * <pre>项目名称：maven-bootstrap    
 * 类名称：Tree    
 * 类描述：    
 * 创建人：李亚光 cht_java@126.com    
 * 创建时间：2018年10月10日 下午6:55:10    
 * 修改人：李亚光 cht_java@126.com  
 * 修改时间：2018年10月10日 下午6:55:10    
 * 修改备注：       
 * @version </pre>    
 */
public class Tree {

    private String id;

    private String text;

    private String url;

    private String pid;
    
    private List<Tree> nodes;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getText() {
		return text;
	}

	public void setText(String text) {
		this.text = text;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public String getPid() {
		return pid;
	}

	public void setPid(String pid) {
		this.pid = pid;
	}

	public List<Tree> getNodes() {
		return nodes;
	}

	public void setNodes(List<Tree> nodes) {
		this.nodes = nodes;
	}

	
    

}
