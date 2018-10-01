package cn.itcast.oa.service.impl;

import org.springframework.stereotype.Service;

import cn.itcast.oa.base.BaseDaoImpl;
import cn.itcast.oa.domain.User;
import cn.itcast.oa.service.UserService;

@Service
public class UserServiceImpl extends BaseDaoImpl<User> implements UserService {

	@Override
	public User getByLoginNameAndPassword(String loginName, String password) {
		return (User) getSession()
				.createQuery(//
						"FROM User u WHERE u.loginName=? AND u.password=?")//
				.setParameter(0, loginName)//
				// .setParameter(1, DigestUtils.md5Hex(password))// 要使用MD5的摘要
				.setParameter(1, password)// 要使用MD5的摘要
				.uniqueResult();
	}

}
