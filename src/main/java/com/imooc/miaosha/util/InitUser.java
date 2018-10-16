package com.imooc.miaosha.util;

import java.io.File;
import java.io.RandomAccessFile;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.imooc.miaosha.domain.MiaoshaUser;

public class InitUser {

	private static void createUser(int count) throws Exception {
		List<MiaoshaUser> users = new ArrayList<MiaoshaUser>(count);
		// 生成用户
		for (int i = 0; i < count; i++) {
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

		// 插入数据库
		Connection conn = DBUtil.getConn();
		String sql = "insert into miaosha_user(login_count, nickname, register_date, salt, password, id)values(?,?,?,?,?,?)";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		for (int i = 0; i < users.size(); i++) {
			MiaoshaUser user = users.get(i);
			pstmt.setInt(1, user.getLoginCount());
			pstmt.setString(2, user.getNickname());
			pstmt.setTimestamp(3, new Timestamp(user.getRegisterDate().getTime()));
			pstmt.setString(4, user.getSalt());
			pstmt.setString(5, user.getPassword());
			pstmt.setLong(6, user.getId());
			pstmt.addBatch();

			String row = user.getId() + "," + user.getPassword();
			raf.seek(raf.length());
			raf.write(row.getBytes());
			raf.write("\r\n".getBytes());
		}
		pstmt.executeBatch();
		pstmt.close();
		conn.close();

		System.out.println("finished insert to db");
	}

	public static void main(String[] args) throws Exception {
		int user_count=1000000;
		int good_count=10000;
		int miaosha_good_count = 100;
		
        for (String s: args) {
            System.out.println(s);
        }
        
		createUser(1000000);
	}
}
