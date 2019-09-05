package com.hk.daos;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.hk.config.SqlMapConfig;
import com.hk.dtos.LoginDto;

public class LoginDao extends SqlMapConfig {

	
	public LoginDao() {
		super();
	}
	
	private String nameSpace = "com.hk.login.";
	
	//사용자 기능
	//1. 회원가입
	public boolean insertUser(LoginDto dto) {
		int count = 0;
		
		SqlSession sqlSession = null;
		
		try {
			sqlSession = getSqlSessionFactory().openSession(true);
			count = sqlSession.insert(nameSpace+"insertUser",dto);
		} catch (Exception e) {
			
			e.printStackTrace();
		}
		return count>0 ? true: false;
	}
	
	//2. 로그인 --> id와 password를 입력받아서 두개의 값을 만족하는 조건을 확인해서 결과가 있으면 로그인 실행
	
	public LoginDto getLogin(String tid, String tpassword) {
		LoginDto dto = new LoginDto();
		LoginDto ldto = new LoginDto(tid,tpassword);
		
		SqlSession sqlSession = null;
		
		try {
			sqlSession = getSqlSessionFactory().openSession(true);
			dto = sqlSession.selectOne(nameSpace+"getLogin", ldto);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
		
		return dto;
	}
	
	public LoginDto userinfo(String tid) {
		LoginDto dto = new LoginDto();
		
		SqlSession sqlSession = null;
		
		try {
			sqlSession = getSqlSessionFactory().openSession(true);
			dto = sqlSession.selectOne(nameSpace+"userinfo", tid);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
		
		return dto;
	}
	
	//4. 정보 수정 (address,phone,email 수정)
		public boolean userUpdate(LoginDto dto) {
			int count = 0;
			
			SqlSession sqlSession = null;
			
			try {
				sqlSession = getSqlSessionFactory().openSession(true);
				count = sqlSession.update(nameSpace+"userUpdate", dto);
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				sqlSession.close();
			}
			
			return count>0 ? true : false;
		}
		
		//5. 회원 탈퇴 (enabled를 'N'으로 수정 ---> getLogin():로그인시 쿼리 수정해야 됨)
		public boolean withdraw(String tid) {
			int count = 0;
			
			SqlSession sqlSession = null;
			
			try {
				sqlSession = getSqlSessionFactory().openSession(true);
				count = sqlSession.update(nameSpace+"withdraw", tid);
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				sqlSession.close();
			}
			
			return count>0 ? true : false;
		}
		
		//6. 아이디 중복체크
		public LoginDto idChk(String tid) {
			LoginDto dto = new LoginDto();
			
			SqlSession sqlSession = null;
			
			try {
				sqlSession = getSqlSessionFactory().openSession(true);
				dto = sqlSession.selectOne(nameSpace+"idChk", tid);
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				sqlSession.close();
			}
			
			return dto;
		}
	
		//관리자 기능
		//1. 전체 회원 조회(탈퇴에 대한 상태여부까지)
		public List<LoginDto> getAllUserStatus(){
			List<LoginDto> list = new ArrayList<>();
			
			SqlSession sqlSession = null;
			
			try {
				sqlSession = getSqlSessionFactory().openSession(true);
				list = sqlSession.selectList(nameSpace+"getAllUserStatus");
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				sqlSession.close();
			}
			
			return list;
		}
		
		//2. 사용자 전체 조회(사용중인 회원에 대한 조회)
		public List<LoginDto> getAllUserList(){
			List<LoginDto> list = new ArrayList<>();
			
			SqlSession sqlSession = null;
			
			try {
				sqlSession = getSqlSessionFactory().openSession(true);
				list = sqlSession.selectList(nameSpace+"getAllUserList");
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				sqlSession.close();
			}
			
			return list;
		}
		
		//3. 사용자 상세 조회
		public LoginDto getUser(String tid){
			LoginDto dto = new LoginDto();
			
			SqlSession sqlSession = null;
			
			try {
				sqlSession = getSqlSessionFactory().openSession(true);
				dto = sqlSession.selectOne(nameSpace+"getUser",tid);
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				sqlSession.close();
			}
			
			return dto;
		}
		
		//4. 사용자 등급 변경
		public boolean updateUserRole(String tid, String trole) {
			int count = 0;
			
			LoginDto dto = new LoginDto(tid, trole, null);
			
			SqlSession sqlSession = null;
			
			try {
				sqlSession = getSqlSessionFactory().openSession(true);
				count = sqlSession.update(nameSpace+"updateUserRole",dto);
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				sqlSession.close();
			}
			
			return count>0 ? true : false;
		}
}
