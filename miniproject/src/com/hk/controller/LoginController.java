package com.hk.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.hk.daos.LoginDao;
import com.hk.dtos.LoginDto;

@WebServlet("/LoginController.do")
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		
		HttpSession session = request.getSession();
		
		String command = request.getParameter("command");
		
		LoginDao dao = new LoginDao();
		
		if(command.equals("regist")){
			response.sendRedirect("regist.jsp");
		}else if(command.equals("insertuser")){	
			String id = request.getParameter("tid");
			String name = request.getParameter("tname");
			String password = request.getParameter("tpassword");
			String address = request.getParameter("taddress");
			String phone = request.getParameter("tphone");
			String email = request.getParameter("temail");
			
			boolean isS = dao.insertUser(new LoginDto(id,password,name,address,phone,email,null,null));
			
			if(isS){
				jsForward("index.jsp", "회원가입을 축하합니다.!!!", response);
			}else{
				request.setAttribute("msg", "회원가입 실패");
				dispatch("error.jsp", request, response);
			}
		}else if(command.equals("login")){
			
			String id = request.getParameter("tid");
			String password = request.getParameter("tpassword");
			
			LoginDto ldto = dao.getLogin(id, password);
			if(ldto == null || ldto.getTid()==null){
				request.setAttribute("msg", "아이디나 패스워드를 확인하세요");
				dispatch("error.jsp", request, response);
			}else{
				if(ldto.getTenabled().equals("N")){
					request.setAttribute("msg", "탈퇴한 회원입니다");
					dispatch("error.jsp", request, response);
				}else{
					session.setAttribute("ldto", ldto); //세션삽입
//					session.setMaxInactiveInterval(10*60);//10분간 요청이 없으면 세션을 삭제
					if(ldto.getTrole().toUpperCase().equals("ADMIN")){
						response.sendRedirect("admin_main.jsp");
					}else if(ldto.getTrole().toUpperCase().equals("USER")){
						response.sendRedirect("user_main.jsp");
					}else if(ldto.getTrole().toUpperCase().equals("MANAGER")){
						response.sendRedirect("user_main.jsp");
					}
				}
			}
		}else if(command.equals("logout")){
			session.invalidate(); //세션지우기
			response.sendRedirect("index.jsp");
		}else if(command.equals("idChk")){
			String id = request.getParameter("tid");
			LoginDto dto = dao.idChk(id);
			request.setAttribute("dto", dto);
			dispatch("idchkform.jsp", request, response);
		}else if(command.equals("alluserstatus")){
			List<LoginDto> list = dao.getAllUserStatus();
			request.setAttribute("list", list);
			dispatch("userlist_status.jsp", request, response);
		}else if(command.equals("alluserlist")){
			List<LoginDto> list = dao.getAllUserList();
			request.setAttribute("list", list);
			dispatch("userlist.jsp", request, response);
		}else if(command.equals("roleForm")){
			System.out.println("sadsa");
			String id = request.getParameter("tid");
			LoginDto dto = dao.getUser(id); //등급을 변경하려는 회원의 정보를 구함
			request.setAttribute("dto", dto);
			dispatch("authfrom.jsp", request, response);
		}else if(command.equals("authchange")){
			String id = request.getParameter("tid");
			String role = request.getParameter("trole");
			boolean isS = dao.updateUserRole(id, role);
			if(isS){
				jsForward("LoginController.do?command=alluserlist","회원등급을 수정했습니다.",response);
			}else{
				request.setAttribute("msg", "회원등급 변경실패");
				dispatch("error.jsp", request, response);
			}
		}else if(command.equals("userinfo")){
			String id = request.getParameter("tid");
			LoginDto dto = dao.userinfo(id);
			request.setAttribute("dto", dto);
			dispatch("user_info.jsp", request, response);
		}else if(command.equals("userUpdate")){
			String id = request.getParameter("tid");
			LoginDto dto = dao.userinfo(id);
			request.setAttribute("dto", dto);
			dispatch("userupdate.jsp", request, response);
		}else if(command.equals("update")){
			String id = request.getParameter("tid");
			String name = request.getParameter("tname");
			String address = request.getParameter("taddress");
			String phone = request.getParameter("tphone");
			String email = request.getParameter("temail");
			boolean isS = dao.userUpdate(new LoginDto(id,name,address,phone,email));
			if(isS){
				jsForward("LoginController.do?command=userinfo&tid="+id,"회원정보을 수정했습니다.",response);
			}else{
				request.setAttribute("msg", "회원정보 수정실패");
				dispatch("error.jsp", request, response);
			}
		}else if(command.equals("withdraw")){
			String id = request.getParameter("tid");
			boolean isS = dao.withdraw(id);
			if(isS){
				jsForward("LoginController.do?command=logout","탈퇴하였습니다.",response);
			}else{
				request.setAttribute("msg", "회원 탈퇴실패");
				dispatch("error.jsp", request, response);
			}
		}
	}
	
	public void jsForward(String url, String msg, HttpServletResponse response) throws IOException {
		PrintWriter pw = response.getWriter();
		String str = "<script type='text/javascript'>"
				+"alert('"+msg+"');"
				+"location.href = '"+url+"';"
				+"</script>";
		pw.print(str);
	}
	
	//jsp에서 사용되던 forward(url) 구현
	public void dispatch(String url, HttpServletRequest request, 
			HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher dispatch = request.getRequestDispatcher(url);
		dispatch.forward(request, response);
	}

}
