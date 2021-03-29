package com.pet.ex.vo;

import java.util.ArrayList;
import java.util.Collection;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class MemberVO implements UserDetails {

	private static final long serialVersionUID = 3871975852210711044L;

	private String member_id;

	private String password;

	private String name;

	private String nickname;

	private int tel;

	private String address;

	private String certify;

	private int trycount;

	private int enable;

	// 외래키
	private RoleVO roleVO;

	private LogintypeVO logintypeVO;

	private CategoryVO categoryVO;

	// 시큐리티 용
	private String username;

	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		Collection<GrantedAuthority> collect = new ArrayList<GrantedAuthority>();
		collect.add(new GrantedAuthority() {

			private static final long serialVersionUID = -2344015148111339246L;

			@Override
			public String getAuthority() {

				return roleVO.getRolename();
			}
		});
		return collect;
	}

	@Override
	public boolean isAccountNonExpired() {
		// TODO Auto-generated method stub
		return true;
	}

	@Override
	public boolean isAccountNonLocked() {
		// TODO Auto-generated method stub
		return true;
	}

	@Override
	public boolean isCredentialsNonExpired() {
		// TODO Auto-generated method stub
		return true;
	}

	@Override
	public boolean isEnabled() {
		// TODO Auto-generated method stub
		return true;
	}

}
