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


@SuppressWarnings("serial")
@WebServlet("/EditaCliente.do")
public class EditarClienteServlet extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int idCliente = Integer.parseInt(request.getParameter("idCliente"));
		
		String nomeCliente = request.getParameter("nomeCliente").trim(); // campo obrigatório		
		String telCliente = request.getParameter("telCliente").trim(); // campo obrigatório		
		String endCliente = request.getParameter("endCliente").trim(); // campo obrigatório		


		// Encaminhar para a classe especialista
		String result = ClienteManager.editarCliente(idCliente, nomeCliente, telCliente, endCliente );	
		request.setAttribute("mensagem", result);
		RequestDispatcher view = request.getRequestDispatcher("gerenciarClientes.jsp");
		
		if( result.contains("Não foi possível editar")) {
			request.setAttribute("idCliente", idCliente);
			request.setAttribute("nomeCliente", nomeCliente);
			request.setAttribute("telCliente", telCliente);
			request.setAttribute("endCliente", endCliente);	
			view = request.getRequestDispatcher("editarCliente.jsp");
		}		
		
		view.forward(request, response);
	}
}

