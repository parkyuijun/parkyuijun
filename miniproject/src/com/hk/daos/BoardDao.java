package com.hk.daos;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.hk.config.SqlMapConfig;
import com.hk.dtos.BoardDto;
import com.hk.dtos.LoginDto;


public class BoardDao extends SqlMapConfig  {

	
	public BoardDao() {
		super();
	}	
	
	private String nameSpace = "com.hk.ansboard.";
	
	//글목록의 페이지 개수 구하기
		public int getPcount() {
			SqlSession sqlSession=null;
			int pcount=0;
			
			try {
				sqlSession=getSqlSessionFactory().openSession(true);
				pcount=sqlSession.selectOne(nameSpace+"pcount");
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				sqlSession.close();
			}
			return pcount;
		}
		//내글보기에 대한 페이지 개수
		public int getMyPcount(String id) {
			SqlSession sqlSession=null;
			int pcount=0;
			
			try {
				sqlSession=getSqlSessionFactory().openSession(true);
				pcount=sqlSession.selectOne(nameSpace+"mypcount",id);
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				sqlSession.close();
			}
			return pcount;
		}
		
		//글목록 조회(페이징처리): 파라미터가 필요(페이지번호)
		public List<BoardDto> getAllListPage(String pnum){
			List<BoardDto> list=new ArrayList<>();
			SqlSession sqlSession=null;
			Map<String, String> map=new HashMap<String, String>();
			map.put("pnum", pnum);
			try {
				SqlSessionFactory sqlSessionFactory=getSqlSessionFactory();
				sqlSession=sqlSessionFactory.openSession(true);//autocommit->true
				list=sqlSession.selectList(nameSpace+"boardlistpaging",map);//list[hkdto,hkdto...]
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				sqlSession.close();
			}
			return list;
		}
		
		//글목록 조회(페이징처리): 파라미터가 필요(페이지번호) 내가쓴글만 보기
		public List<BoardDto> getAllListPage2(String pnum, String tid){
			List<BoardDto> list=new ArrayList<>();
			SqlSession sqlSession=null;
			Map<String, String> map=new HashMap<String, String>();
			map.put("pnum", pnum);
			map.put("id", tid);
			try {
				SqlSessionFactory sqlSessionFactory=getSqlSessionFactory();
				sqlSession=sqlSessionFactory.openSession(true);//autocommit->true
				list=sqlSession.selectList(nameSpace+"boardlistpaging",map);//list[hkdto,hkdto...]
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				sqlSession.close();
			}
			return list;
		}
				
	//전체글보기(list를 반환)
		public List<BoardDto> getAllList(){
			List<BoardDto> list=new ArrayList<>();
			SqlSession sqlSession=null;
			try {
				sqlSession=getSqlSessionFactory().openSession(true);
				list=sqlSession.selectList(nameSpace+"boardlist");
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				sqlSession.close();
			}
			return list;
		}
	
		//새글추가(id,title,content값 전달받음)
		public boolean insertBoard(BoardDto dto) {
			int count=0;
			SqlSession sqlSession=null;
			try {
				//         <--SqlSessionFactory객체에서 sqlSession객체를 구함
				sqlSession=getSqlSessionFactory().openSession(true);
				count=sqlSession.insert(nameSpace+"insertboard", dto);
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				sqlSession.close();
			}
			return count>0?true:false;
		}
		//글상세보기(BoardDto반환)
		public BoardDto getBoard(int seq, String id){
			BoardDto dto=new BoardDto();
			SqlSession sqlSession=null;
			Map<String, Integer> map=new HashMap<>();
			Map<String, String> map2=new HashMap<>();
			map.put("seq", seq);
			map2.put("id", id);
			try {
				sqlSession=getSqlSessionFactory().openSession(true);
				dto=sqlSession.selectOne(nameSpace+"boardlist", map);
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				sqlSession.close();
			}
			return dto;
		}
		//글수정하기(seq,title,content값 전달받음)
		public boolean updateBoard(BoardDto dto) {
			int count=0;
			SqlSession sqlSession=null;
			try {
				sqlSession=getSqlSessionFactory().openSession(true);
				count=sqlSession.update(nameSpace+"updateboard", dto);
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				sqlSession.close();
			}
			return count>0?true:false;
		}
		//글삭제하기(seq,여러글/글하나 삭제기능 같이사용) 
		public boolean mulDel(String[] seqs) {

			int count=0;
			Map<String, String[]>map=new HashMap<>();
			map.put("seqs", seqs);
			
			SqlSession sqlSession=null;
			try {
				sqlSession=getSqlSessionFactory().openSession(true);
				count=sqlSession.update(nameSpace+"muldel", map);
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				sqlSession.close();
			}
			
			return count>0?true:false;
		}
		
		//조회수(seq)
		public boolean readCount(int seq) {
			int count=0;
			SqlSession sqlSession=null;
			try {
				sqlSession=getSqlSessionFactory().openSession(true);
				count=sqlSession.update(nameSpace+"readcount", seq);
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				sqlSession.close();
			}
			return count>0?true:false;
		}
		//답글달기(id,title,content,부모의 seq)
		public boolean replyBoard(BoardDto dto) {
			int count=0;
			SqlSession sqlSession=null;
			try {                                         //transaction처리
				sqlSession=getSqlSessionFactory().openSession(false);//autocommit=false
				sqlSession.update(nameSpace+"replyupdate", dto);//update작업
				count=sqlSession.insert(nameSpace+"replyinsert", dto);//insert작업
				sqlSession.commit();//transaction처리
			} catch (Exception e) {
				sqlSession.rollback();//transaction처리
				e.printStackTrace();
			}finally {
				sqlSession.close();
			}
			return count>0?true:false;
		}
		
		public BoardDto getContent(int seq) {
			BoardDto dto=new BoardDto();
			SqlSession sqlSession=null;
			try {
				sqlSession=getSqlSessionFactory().openSession(true);
				dto=sqlSession.selectOne(nameSpace+"contentAjax", seq);
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				sqlSession.close();
			}
			return dto;
		}
		
		public boolean updateSellbuy(int seq) {
			
			int count=0;
			SqlSession sqlSession=null;
			try {
				sqlSession=getSqlSessionFactory().openSession(true);
				count=sqlSession.update(nameSpace+"sellbuy", seq);
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				sqlSession.close();
			}
			return count>0?true:false;
		}
		
		
		
}
