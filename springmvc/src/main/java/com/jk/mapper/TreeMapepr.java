/** 
 * <pre>项目名称:maven-bootstrap 
 * 文件名称:TreeMapepr.java 
 * 包名:com.jk.mapper.tree 
 * 创建日期:2018年10月10日下午7:04:58 
 * Copyright (c) 2018, yuxy123@gmail.com All Rights Reserved.</pre> 
 */  
package com.jk.mapper;

import java.util.List;

import com.jk.model.Tree;
import org.apache.ibatis.annotations.Select;

/** 
 * <pre>项目名称：maven-bootstrap    
 * 类名称：TreeMapepr    
 * 类描述：    
 * 创建人：李亚光 cht_java@126.com    
 * 创建时间：2018年10月10日 下午7:04:58    
 * 修改人：李亚光 cht_java@126.com  
 * 修改时间：2018年10月10日 下午7:04:58    
 * 修改备注：       
 * @version </pre>    
 */

public interface TreeMapepr {

	/** <pre>queryTree(这里用一句话描述这个方法的作用)   
	 * 创建人：李亚光 cht_java@126.com     
	 * 创建时间：2018年10月10日 下午7:06:34    
	 * 修改人：李亚光 cht_java@126.com      
	 * 修改时间：2018年10月10日 下午7:06:34    
	 * 修改备注： 
	 * @param pid
	 * @return</pre>    
	 */
	@Select("select * from t_tree where pid=#{pid}")
	List<Tree> queryTree(String pid);

}
