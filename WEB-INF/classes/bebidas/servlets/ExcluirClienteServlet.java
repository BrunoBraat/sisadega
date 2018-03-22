package bebidas.servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bebidas.model.ClienteManager;

@SuppressWarnings("serial")
@WebServlet("/ExcluirCliente.do")
public class ExcluirClienteServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// Cliente a excluir
		int idCliente = Integer.parseInt(request.getParameter("idCliente"));
		String nomeCliente = request.getParameter("nomeCliente");
		
		// Encaminhar para a classe especialista
		String result = "";
		result = ClienteManager.apagarCliente(idCliente);
		result += nomeCliente;
		
		request.setAttribute("mensagem", result);
		RequestDispatcher view = request.getRequestDispatcher("gerenciarClientes.jsp");
		view.forward(request, response);
	}

}