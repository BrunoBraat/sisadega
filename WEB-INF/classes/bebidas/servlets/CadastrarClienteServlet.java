package bebidas.servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bebidas.model.ClienteManager;
import utils.Utils;


@SuppressWarnings({ "serial", "unused" })
@WebServlet("/CadastraNovoCliente.do")
public class CadastrarClienteServlet extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String nomeCliente = request.getParameter("nomeCliente").trim(); 		
		String telCliente = request.getParameter("telCliente").trim(); 	
		String endCliente = request.getParameter("endCliente").trim(); 			
	

		// Encaminhar para a classe especialista
		String result = ClienteManager.cadastrarCliente( nomeCliente, telCliente, endCliente );		
		request.setAttribute("mensagem", result);
		RequestDispatcher view = request.getRequestDispatcher("gerenciarClientes.jsp");
		
		if( result.contains("Não foi possível cadastrar")) {
			request.setAttribute("nomeCliente", nomeCliente);	
			request.setAttribute("telCliente", telCliente);	
			request.setAttribute("endCliente", endCliente);	
			view = request.getRequestDispatcher("cadastrarCliente.jsp");
		}		
		
		view.forward(request, response);
	}
}
