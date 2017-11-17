package com.wisezone.util;

import java.security.MessageDigest;
import java.util.Random;

/**
 * 加密工具类(只能加密，不能解密)
 * 
 * @author Administrator
 *
 */
public class MD5Util {

	private static final String hexDigits[] = { "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "a", "b", "c", "d",
			"e", "f" };

	private static String byteArrayToHexString(byte b[]) {
		StringBuffer resultSb = new StringBuffer();
		for (int i = 0; i < b.length; i++)
			resultSb.append(byteToHexString(b[i]));

		return resultSb.toString();
	}

	private static String byteToHexString(byte b) {
		int n = b;
		if (n < 0)
			n += 256;
		int d1 = n / 16;
		int d2 = n % 16;
		return hexDigits[d1] + hexDigits[d2];
	}

	/**
	 * MD5加密工具类
	 * 
	 * @param origin
	 * @return
	 */
	public static String MD5Encode(String origin) {
		String resultString = null;
		try {
			resultString = new String(origin);
			MessageDigest md = MessageDigest.getInstance("MD5");

			resultString = byteArrayToHexString(md.digest(resultString.getBytes()));

		} catch (Exception exception) {
			exception.printStackTrace();
		}
		return resultString.toUpperCase();
	}

	/**
	 * MD5加盐
	 * 
	 * @param origin
	 *            原始密码
	 * @param salt
	 *            盐
	 * @return
	 */
	public static String MD5Encode(String origin, String salt) {
		String resultString = null;
		try {
			resultString = new String(origin + "_" + salt);
			MessageDigest md = MessageDigest.getInstance("MD5");

			resultString = byteArrayToHexString(md.digest(resultString.getBytes()));

		} catch (Exception exception) {
			exception.printStackTrace();
		}
		return resultString.toUpperCase();
	}

	/**
	 * 创建一个盐方法
	 * 
	 * @return
	 */
	public static String createSalte() {
		String hexDigits[] = { "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "a", "b", "c", "d", "e", "f", "g", "h",
				"i", "m", "n", "p", "q", "r", "s", "t", "v", "w", "x", "y" };

		StringBuffer str = new StringBuffer();
		Random rd = new Random();
		for (int i = 0; i < 5; i++) {
			int index = rd.nextInt(hexDigits.length); // 下标
			str.append(hexDigits[index]);
		}
		return str.toString();
	}

	public static void main(String[] args) {
		// System.out.println(MD5Encode("8888"));
		String salt=createSalte();
		System.out.println(salt);
		System.out.println(MD5Encode("wy111",salt));

	}

}
