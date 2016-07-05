package cn.media.utils;

import java.util.UUID;

/**
 * 生成激活码
 * @author superme
 *
 */
public class UUIDUtils {
	public static String getUUID(){
		return UUID.randomUUID().toString().replace("-", "");
	}
}
