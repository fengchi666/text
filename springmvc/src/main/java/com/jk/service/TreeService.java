/** 
 * <pre>项目名称:maven-bootstrap 
 * 文件名称:TreeService.java 
 * 包名:com.jk.service.tree 
 * 创建日期:2018年10月10日下午7:02:52 
 * Copyright (c) 2018, yuxy123@gmail.com All Rights Reserved.</pre> 
 */  
package com.jk.service;

import java.util.List;

import com.jk.model.Tree;

/** 
 * <pre>项目名称：maven-bootstrap    
 * 类名称：TreeService    
 * 类描述：    
 * 创建人：李亚光 cht_java@126.com    
 * 创建时间：2018年10月10日 下午7:02:52    
 * 修改人：李亚光 cht_java@126.com  
 * 修改时间：2018年10月10日 下午7:02:52    
 * 修改备注：       
 * @version </pre>    
 */
public interface TreeService {

	/** <pre>queryTree(这里用一句话描述这个方法的作用)   
	 * 创建人：李亚光 cht_java@126.com     
	 * 创建时间：2018年10月10日 下午7:03:35    
	 * 修改人：李亚光 cht_java@126.com      
	 * 修改时间：2018年10月10日 下午7:03:35    
	 * 修改备注： 
	 * @return</pre>    
	 */
	List<Tree> queryTree();

}
