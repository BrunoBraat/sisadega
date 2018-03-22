package bebidas.servlets;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bebidas.dao.ItemPedidoDAO;
import bebidas.model.ItemPedido;
import bebidas.model.Pedido;
import bebidas.model.PedidoManager;


@SuppressWarnings("serial")
@WebServlet("/ConsultaPedidoPorEstado.do")
public class ConsultarPedidoPorStatusServlet extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String estadoPedido = request.getParameter("estadoPedido"); // campo obrigat�rio		
		
		// Encaminhar para a classe especialista
		List<Pedido> result = PedidoManager.consultarPedidoPorEstado(estadoPedido);		
		request.setAttribute("listaPedidos", result);
		request.setAttribute("estadoPedido", estadoPedido);
		
		// Recuperar itens dos pedidos
		ItemPedidoDAO itemPedidoDAO = new ItemPedidoDAO();
		List<ItemPedido> listaItensPedidos = new ArrayList<ItemPedido>();
		if (result != null) {
			for (Pedido pedido : result ) {
				listaItensPedidos.addAll(itemPedidoDAO.selecionarPorPedido(pedido));
			}
		}
		request.setAttribute("listaItensPedidos", listaItensPedidos);
		
		RequestDispatcher view = request.getRequestDispatcher("consultarPedidoPorEstadoResultado.jsp");
		
		view.forward(request, response);
	}
}
