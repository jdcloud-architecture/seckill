package com.imooc.miaosha.util;

import java.io.File;
import java.io.RandomAccessFile;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.imooc.miaosha.domain.MiaoshaUser;

public class UserData {

	private static void createUser(int count) throws Exception {
		List<MiaoshaUser> users = new ArrayList<MiaoshaUser>(count);
		// 生成用户
		for (int i = 1; i < count + 1; i++) {
			MiaoshaUser user = new MiaoshaUser();
			user.setId(13000000000L + i);
			user.setLoginCount(1);
			user.setNickname("user" + i);
			user.setRegisterDate(new Date());
			user.setSalt("1a2b3c");
			user.setPassword(MD5Util.inputPassToDbPass("123456", user.getSalt()));
			users.add(user);
		}
		System.out.println("create user");

		File file = new File("tokens.txt");
		if (file.exists()) {
			file.delete();
		}
		RandomAccessFile raf = new RandomAccessFile(file, "rw");
		file.createNewFile();
		raf.seek(0);

		for (int i = 0; i < users.size(); i++) {
			MiaoshaUser user = users.get(i);

			String row = user.getId() + "," + user.getPassword();
			raf.seek(raf.length());
			raf.write(row.getBytes());
			raf.write("\r\n".getBytes());

		}

		raf.close();
	}

	public static void main(String[] args) throws Exception {

		createUser(100000);
	}
}
