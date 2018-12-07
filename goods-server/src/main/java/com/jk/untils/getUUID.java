package com.jk.untils;

import java.util.UUID;
public class getUUID {

		/**
		 * 
		 * 方法: getUUid <br>
		 * 描述: 生成32位随机字符串(uuid) <br>
		 * 作者: Teacher song<br>
		 * 时间: 2017年7月14日 下午5:40:58
		 * @return
		 */
		public static String getUUid(){
			return UUID.randomUUID().toString().replaceAll("-", "");
		}

}
