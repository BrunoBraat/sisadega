package bebidas.model;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import bebidas.dao.ClienteDAO;
import bebidas.dao.ItemPedidoDAO;
import bebidas.dao.PedidoDAO;
import bebidas.dao.VinhoDAO;

public class PedidoManager {

	public static String criarPedido(int idCliente, List<ItemPedido> itensPedido) {
		ClienteDAO clienteDAO = new ClienteDAO();
		PedidoDAO pedidoDAO = new PedidoDAO();
		
		Cliente cliente = clienteDAO.selecionarPorId(idCliente);
		
		// Verificar se há itens de pedido
		if (itensPedido.isEmpty() || itensPedido == null) {
			return "Não é possível abrir o pedido: É necessário ao menos um item.";
		}
		
		Pedido pedido = new Pedido();
		pedido.setCliente(cliente);
		pedido.setDtPedido(new Date());
		pedido.setEstadoPedido("Aberto");
		double valorTotal = 0;
		for (ItemPedido itemPedido : itensPedido) {
			valorTotal = valorTotal + itemPedido.getValorParcial();
		}
		pedido.setValorTotal(valorTotal);
		
		try {
			pedidoDAO.inserir(pedido);
			if(itensPedido != null) {
				for(ItemPedido itemPedido : itensPedido) {				
				ItemPedidoDAO itemPedidoDAO = new ItemPedidoDAO();
				itemPedido.setPedido(pedido);
				itemPedidoDAO.inserir(itemPedido);
				}
			}
			String mensagem = "Pedido cadastrado com sucesso.";
			return mensagem;
		} catch( Exception e ) {
			e.printStackTrace();
			String mensagem = "Não foi possível cadastrar o pedido.";
			return mensagem;
		}
		
	}
	
	public static String encerrarPedido(int idPedido) {
		PedidoDAO pedidoDAO = new PedidoDAO();
		ItemPedidoDAO itemPedidoDAO = new ItemPedidoDAO();
		VinhoDAO vinhoDAO = new VinhoDAO();
		
		Pedido pedido = pedidoDAO.selecionarPorId(idPedido);
		
		// Tenta fazer a transição de estados com o State
		String result = pedido.encerrarPedido();
		if( result.contains("ERRO:")) {
			return result;
		}
		
		// Verifica se há estoque suficiente
		List<ItemPedido> itensPedido = itemPedidoDAO.selecionarPorPedido(pedido);
		for (ItemPedido itemPedido : itensPedido) {
			Vinho vinho = itemPedido.getVinho();
			if (vinho.getQtdEstoque() < itemPedido.getQtdVinho()) {
				return "Não há estoque suficiente do vinho " + vinho.getNomeVinho();
			}
		}
		// Atualiza o estoque do vinho
		for (ItemPedido itemPedido : itensPedido) {
			Vinho vinho = itemPedido.getVinho();
			vinho.setQtdEstoque(vinho.getQtdEstoque() - itemPedido.getQtdVinho());
			vinhoDAO.atualizar(vinho);
		}
		
		// Atualiza o pedido no BD
		pedidoDAO.atualizar(pedido);
		
		return "Pedido entregue com sucesso!";
		
	}

	public static String cancelarPedido(int idPedido) {
		PedidoDAO pedidoDAO = new PedidoDAO();
		
		Pedido pedido = pedidoDAO.selecionarPorId(idPedido);
		
		// Tenta fazer a transição de estados com o State
		String result = pedido.cancelarPedido();
		if( result.contains("ERRO:")) {
			return result;
		}
		
		// Atualiza o pedido no BD
		pedidoDAO.atualizar(pedido);
				
		return "Pedido cancelado com sucesso.";
	}
	
	public static List<Pedido> consultarPedidoPorEstado(String estadoPedido) {
		PedidoDAO pedidoDAO = new PedidoDAO();
		List<Pedido> listaPedidos = new ArrayList<Pedido>();
		if( estadoPedido.equals("Todos")) {
			listaPedidos = pedidoDAO.selecionarTodos();
		} else {
			listaPedidos = pedidoDAO.selecionarPorEstado(estadoPedido);
		}
		return listaPedidos;
	}
}
