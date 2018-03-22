package bebidas.servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bebidas.model.LoginManager;
import bebidas.model.Usuario;

@SuppressWarnings("serial")
@WebServlet("/Login.do")
public class LoginServlet extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String nomeUsuario = request.getParameter("nomeUsuario");
        String senha = request.getParameter("senha");
        
        if (LoginManager.validar(nomeUsuario, senha) != null) {
        	Usuario usuario = LoginManager.validar(nomeUsuario, senha);
	        HttpSession session = request.getSession();
	        session.setAttribute("nomeUsuario", nomeUsuario);
	        session.setAttribute("nomeCompleto", usuario.getNomeCompleto());
	        session.setAttribute("acesso", usuario.getAcesso());
	        RequestDispatcher view = request.getRequestDispatcher("/index.jsp");
	        view.forward(request, response);
        } else {
        	request.setAttribute("erro", "Usuário ou senha inválida.");
        	RequestDispatcher view = request.getRequestDispatcher("/login.jsp");
        	view.forward(request, response);
        }
        
    }

}
