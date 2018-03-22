package bebidas.servlets;

import java.io.IOException;
import java.util.List;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bebidas.dao.VinhoDAO;
import bebidas.model.ItemPedido;
import bebidas.model.PedidoManager;
import bebidas.model.Vinho;


@SuppressWarnings("serial")
@WebServlet("/CriaPedido.do")
public class CriarPedidoServlet extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		int idCliente = Integer.parseInt(request.getParameter("idCliente"));
		
		String contadorStr = request.getParameter("contador");
		int qtdItemPedido = 0;
		if( contadorStr != null && !contadorStr.isEmpty() ) {
			qtdItemPedido = Integer.parseInt(request. getParameter("contador"));
		}
		
		List<ItemPedido> itensPedido = new ArrayList<ItemPedido>();
		for( int i=1; i <= qtdItemPedido; i++ ) {
			ItemPedido itemPedido = new ItemPedido();
			String idItemPedido = request.getParameter("id" + i);
			if( idItemPedido != null && !idItemPedido.isEmpty() ) {
				VinhoDAO vinhoDAO = new VinhoDAO();
				Vinho vinho = vinhoDAO.selecionarPorId(Integer.parseInt(idItemPedido));
				itemPedido.setVinho(vinho);
				itemPedido.setQtdVinho(Integer.parseInt(request.getParameter("qtd" + i)));
				double valorParcial = vinho.getPrecoVinho() * itemPedido.getQtdVinho();
				itemPedido.setValorParcial(valorParcial);
				
				itensPedido.add(itemPedido);
			}
		}

		// Encaminhar para a classe especialista
		String result = PedidoManager.criarPedido( idCliente, itensPedido );		
		request.setAttribute("mensagem", result);
		RequestDispatcher view = request.getRequestDispatcher("index.jsp");
		
		if( result.contains("Não foi possível cadastrar")) {	
			request.setAttribute("idCliente", idCliente);
			view = request.getRequestDispatcher("criarPedido.jsp");
		}
		
		view.forward(request, response);
	}
}
