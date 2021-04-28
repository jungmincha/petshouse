package com.pet.ex.service;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;

import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@AllArgsConstructor
public class VisitorDao {

	private String url = "jdbc:log4jdbc:oracle:thin:@DB202103171352_low?TNS_ADMIN=/wallet";
	private String uid = "ADMIN";
	private String upw = "Pethouse1234";

	public VisitorDao() {

		try {
			Class.forName("net.sf.log4jdbc.sql.jdbcapi.DriverSpy");
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
	}

	public void setCount() {
		log.info("VisitorService setCount()");

		Connection con = null;
		Statement stmt = null;

		try {
			con = DriverManager.getConnection(url, uid, upw);
			stmt = con.createStatement();
			stmt.executeUpdate("insert into visitor (visitor_id, vdate) values (visitor_seq.nextval,sysdate)"); // 해당
																												// 데이터를
																												// 갖고 옴

		} catch (Exception e) {
			e.printStackTrace();
		}

	}
}