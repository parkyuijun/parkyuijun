package com.hk.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.hk.daos.BoardDao;
import com.hk.dtos.BoardDto;

import com.hk.dtos.LoginDto;
import com.hk.utils.Paging;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;




@WebServlet("/BoardController.do")
public class BoardController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//인코딩처리
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
//		HttpSession session = request.getSession();
		
		String command=request.getParameter("command");
		BoardDao dao=new BoardDao();
		if(command==null||command.equals("")) { //업로드 요청 (multipart로 요청)
			System.out.println("들어왔다 !!!!");
			MultipartRequest multi=null;
			//파일저장경로
			//상대경로
//			String saveDirectory2=request.getSession().getServletContext().getRealPath("upload");
//			System.out.println("상대경로:"+saveDirectory2);
			String saveDirectory="C:/Users/HKEDU/git/parkyuijun/miniproject/WebContent/upload";
			
			//파일사이즈 설정(한번에 업로드할때 최대 사이즈)
			int maxPostSize=10*1024*1024;//10MB를 byte단위로 환산
			//파일업로드 실행
			multi=new MultipartRequest(request, saveDirectory, maxPostSize,"utf-8",
					  new DefaultFileRenamePolicy());
			
			String id=multi.getParameter("id");
			String title=multi.getParameter("title");
			String content=multi.getParameter("content");
			String fileup=multi.getParameter("fileup");
			System.out.println("글제목:"+fileup);
			
			//파일의 정보를 DB에 저장하는 작업
			
			//1.원본파일명 구함
			String origin_fname=multi.getOriginalFileName("fileup");
			
			//2.저장할 파일명 구함(UUID ----> 32자리 랜덤값을 구함)
			//32자리+".png"     name.png
			String stored_fname=createUUId()
					         +(origin_fname.substring(origin_fname.lastIndexOf(".")));
			
			//게시판테이블에 id,title,content,stored_name 을 추가해주는 코드 작성
			boolean isS=dao.insertBoard(new BoardDto(id,title,content,stored_fname));
			
			
			//3.파일의 사이즈 구하기: length(): long타입으로 반환(형변환이 필요)
//			int file_size=(int)multi.getFile("filename").length();
			
			//4.DB에 정보 저장하기
//			boolean isS=dao.insertFileInfo(
//					new FileDto(0,origin_fname,stored_fname,file_size,null,null));
			
			//getOriginFileName():원본파일명
			//getFilesystemName():실제로 저장된 파일명
			
			//policy객체는 중복되는 파일명을 재정의하는 기능 구현 --> aa.png 같은 파일명이면 aa1.png
			File oldFile=new File(saveDirectory+"/"+multi.getFilesystemName("fileup"));
			File newFile=new File(saveDirectory+"/"+stored_fname);
			oldFile.renameTo(newFile);//old----> new 로 파일명이 바뀜
			String myboard=(String)request.getSession().getAttribute("myboard");
			
			if(isS) {
				if(myboard==null) {
					response.sendRedirect("BoardController.do?command=boardlistpage");					
				}else {
					response.sendRedirect("BoardController.do?command=boardlistpage2");	
				}
			}else {
				request.setAttribute("msg", "글추가실패");
				dispatch("error.jsp", request, response);
			}
		}else if(command.equals("boardlistpage")) {
			//요청 페이지 번호 받기
			String pnum=request.getParameter("pnum");
			String Trole=(String)((LoginDto)request.getSession().getAttribute("ldto")).getTrole();
			request.getSession().removeAttribute("readcount");
			
			
			//myboard
			request.getSession().removeAttribute("myboard");
			
		
			
			//list: 요청페이지에 해당하는 글목록 가져오기
			
			//글목록을 요청할때 따로 pnum 파라미터를 전달하지 않아도 목록을 볼 수 있게 전에 담긴 pnum을 사용
			if(pnum==null) {
				pnum=(String)request.getSession().getAttribute("pnum");
			}else {
				request.getSession().setAttribute("pnum", pnum);
			}
			
			List<BoardDto> list=dao.getAllListPage(pnum);
			//페이지의 개수를 구하기
			int pcount=dao.getPcount();
			
			Map<String, Integer>map=Paging.pagingValue(pcount, pnum, 5);
			
			request.setAttribute("pmap", map);
			request.setAttribute("list", list);
			if(Trole.equals("ADMIN")) {
			dispatch("adminboardlist.jsp", request, response);
			}else {
			dispatch("boardlist.jsp", request, response);
			}
		}else if(command.equals("boardlist")) {
			//"readcount"값을 삭제한다. 
			request.getSession().removeAttribute("readcount");
			
			List<BoardDto> list=dao.getAllList();
			request.setAttribute("list", list);
//			request.getRequestDispatcher("boardlist.jsp").forward(request, response);
			dispatch("boardlist.jsp", request, response);
		}else if(command.equals("boarddetail")) {
			int seq=Integer.parseInt(request.getParameter("seq"));
			String id=(String)((LoginDto)request.getSession().getAttribute("ldto")).getTid();
			//세션에 "readcount"가 있는지 가져와 본다
			String rSeq=(String)request.getSession().getAttribute("readcount");
			
		
			
			if(rSeq==null) {
				//조회수 올리기
				dao.readCount(seq);
				//현재 조회된 글에 번호를 세션에 "readcount"라는 이름으로 담아두기
				request.getSession().setAttribute("readcount", seq+"");
			}
			
			
			BoardDto dto=dao.getBoard(seq, id);
			request.setAttribute("dto", dto);
			dispatch("boarddetail.jsp", request, response);
		}else if(command.equals("muldel")) {   //관리자 모두 삭제 가능
			String [] seqs=request.getParameterValues("chk");
			//myboard처리를 위한 값
			String myboard=(String)request.getSession().getAttribute("myboard");
			boolean isS=dao.mulDel(seqs);
			if(isS) {
				if(myboard==null) {
					response.sendRedirect("BoardController.do?command=boardlistpage");					
				}else {
					response.sendRedirect("BoardController.do?command=boardlistpage2");	
				}				
			}else {
				request.setAttribute("msg", "글여러개삭제실패");
				dispatch("error.jsp", request, response);
			}
		
		}else if(command.equals("insertForm")) {
			response.sendRedirect("insertboard.jsp");
//		}else if(command.equals("insertboard")) {
//			String id=request.getParameter("id");
//			String title=request.getParameter("title");
//			String content=request.getParameter("content");
//			String fileup=request.getParameter("fileup");
//			
//			//myboard처리를 위한 값
//			String myboard=(String)request.getSession().getAttribute("myboard");
//			
//			boolean isS=dao.insertBoard(new BoardDto(id,title,content,fileup));
//			if(isS) {
//				if(myboard==null) {
//					response.sendRedirect("BoardController.do?command=boardlistpage");					
//				}else {
//					response.sendRedirect("BoardController.do?command=boardlistpage2");	
//				}
//			}else {
//				request.setAttribute("msg", "글추가실패");
//				dispatch("error.jsp", request, response);
//			}
		}else if(command.equals("updateForm")) {
			int seq=Integer.parseInt(request.getParameter("seq"));
			String id=(String)((LoginDto)request.getSession().getAttribute("ldto")).getTid();
			BoardDto dto=dao.getBoard(seq,id);
			request.setAttribute("dto", dto);
			dispatch("updateboard.jsp", request, response);
		}else if(command.equals("updateboard")) {
			int seq=Integer.parseInt(request.getParameter("seq"));
			String title=request.getParameter("title");
			String content=request.getParameter("content");
			
			boolean isS=dao.updateBoard(new BoardDto(seq,title,content));
			if(isS) {
				response.sendRedirect("BoardController.do?command=boarddetail&seq="+seq);
			}else {
				request.setAttribute("msg", "글수정하기 실패");
				dispatch("error.jsp", request, response);
			}
		}else if(command.equals("replyboard")) {
			int seq=Integer.parseInt(request.getParameter("seq"));
			String id=request.getParameter("id");
			String title=request.getParameter("title");
			String content=request.getParameter("content");
			
			boolean isS=dao.replyBoard(new BoardDto(seq,id,title,content));
			if(isS) {
				response.sendRedirect("BoardController.do?command=boardlistpage");
			}else {
				request.setAttribute("msg", "답글달기실패");
				dispatch("error.jsp", request, response);
			}
		}else if(command.equals("boardlistpage2")) {
			//요청 페이지 번호 받기
			String pnum=request.getParameter("pnum");
			String id=(String)((LoginDto)request.getSession().getAttribute("ldto")).getTid();
			System.out.println("로그인된아이디:"+id);
			request.getSession().removeAttribute("readcount");
			//list: 요청페이지에 해당하는 글목록 가져오기
			
			//글목록을 요청할때 따로 pnum 파라미터를 전달하지 않아도 목록을 볼 수 있게 전에 담긴 pnum을 사용
			if(pnum==null) {
				pnum=(String)request.getSession().getAttribute("pnum");
			}else {
				request.getSession().setAttribute("pnum", pnum);
			}
			
			
			List<BoardDto> list=dao.getAllListPage2(pnum,id);
			//페이지의 개수를 구하기
			int pcount=dao.getMyPcount(id);
			
			Map<String, Integer>map=Paging.pagingValue(pcount, pnum, 5);
			
			request.setAttribute("pmap", map);
			request.setAttribute("list", list);
			//myboard처리
			request.getSession().setAttribute("myboard", "myboard");
			
			dispatch("allboardlist.jsp", request, response);
		}else if(command.equals("sellbuy")) {
			
			
			String myboard=(String)request.getSession().getAttribute("myboard");			
			int seq=Integer.parseInt(request.getParameter("seq"));
			System.out.println("젭말들어가");
			boolean isS=dao.updateSellbuy(seq);
			
			if(isS) {
				if(myboard==null) {
					response.sendRedirect("BoardController.do?command=boardlistpage");					
				}else {
					response.sendRedirect("BoardController.do?command=boardlistpage2");	
				}
			}else {
				request.setAttribute("msg", "에러 sellbuy버튼");
				dispatch("error.jsp", request, response);
			}
		}
	}//doPost()종료
	
	//RequestDispatcher객체를 구해서 forward()할 수 있도록 구현한 메서드
	//                        --> request scope에 담은 객체를 전달할때 이동하는 방식
	public void dispatch(String url, HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher(url).forward(request, response);
	}
	

	//랜던한 값 32자리 만드는 메서드
	public String createUUId() {
		return UUID.randomUUID().toString().replaceAll("-", "") ;//"1248d6s1-21548624-21456896-12442356"
				       									         //--> "-"제거하고 32자리 변경
	}
}







