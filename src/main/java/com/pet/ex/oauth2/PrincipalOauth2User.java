package com.pet.ex.oauth2;

import java.sql.Timestamp;
import java.util.Collection;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.oauth2.core.user.OAuth2User;

import com.pet.ex.vo.CategoryVO;
import com.pet.ex.vo.LogintypeVO;
import com.pet.ex.vo.MemberVO;
import com.pet.ex.vo.RoleVO;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class PrincipalOauth2User implements OAuth2User {

	@Autowired
	MemberVO member;
	List<GrantedAuthority> grantedAuthorityList;

	@Override
	public Map<String, Object> getAttributes() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String toString() {
		// TODO Auto-generated method stub
		return member.getMember_id();
	}

	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {

		return grantedAuthorityList;
	}

	public String getMember_id() {
		return member.getMember_id();
	}

	public String getPassword() {
		return member.getPassword();
	}

	public String getName() {
		return member.getName();
	}

	public String getNickname() {
		return member.getNickname();
	}

	public int getTel() {
		return member.getTel();
	}

	public String getAddress() {
		return member.getAddress();
	}

	public String getCertify() {
		return member.getCertify();
	}

	public int getTrycount() {
		return member.getTrycount();
	}

	public int getEnable() {
		return member.getEnable();
	}

	public Timestamp getPdate() {
		return member.getPdate();
	}

	public RoleVO getRoleVO() {
		return member.getRoleVO();
	}

	public LogintypeVO getLogintypeVO() {
		return member.getLogintypeVO();
	}

	public CategoryVO getCategoryVO() {
		return member.getCategoryVO();
	}

	public String getUsername() {
		return member.getUsername();
	}

	public int getRnum() {
		return member.getRnum();
	}

	public String getConcern() {
		return member.getConcern();
	}
}
