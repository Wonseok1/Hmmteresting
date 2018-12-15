package edu.iot.common.service;

import java.util.List;
import java.util.Map;

import edu.iot.common.model.Avata;
import edu.iot.common.model.Member;
import edu.iot.common.model.Search;

public interface MemberService {
	Member login(String userId, String password) throws Exception;

	void join(Member member) throws Exception;

	String idcheck(String userId) throws Exception;

	Map<String, Object> getPage(int page) throws Exception;

	Member findById(String userId) throws Exception;

	void delete(String userId) throws Exception;

	int update(Member member, Member sMember) throws Exception;

	int changePassword(Member member, String oldPassword, String newPassword) throws Exception;

	int updateByAdmin(Member member) throws Exception;

	List<Member> search(Search search) throws Exception;

	byte[] getAvata(String userId) throws Exception;

	void insertAvata(Avata avata) throws Exception;

	void updateAvata(Avata avata) throws Exception;

	void deleteAvata(String userId) throws Exception;
}
