package bebidas.state;

import java.util.Date;

import bebidas.dao.ItemPedidoDAO;
import bebidas.dao.PedidoDAO;
import bebidas.dao.VinhoDAO;
import bebidas.model.Pedido;
import bebidas.model.Vinho;

public class PedidoAberto implements State {

	Pedido pedido;	
	
	public PedidoAberto(Pedido pedido) {
		super();
		this.pedido = pedido;
	}

	public String abrir() {
		return("ERRO: o pedido já está aberto.");		
	}

	public String encerrar() {
		
		//Verificar se pode fechar o pedido (estoque suficiente)		
		//Pedido pedido = pedido.getVinho();
		//int qtdFinal = vinho.getQtdEstoque()-pedido.getQtdVinho();
		//if( qtdFinal < 0 ) {
		//	return "ERRO: Não foi possível encerrar o pedido: Estoque insuficiente!";
		//}
		pedido.setEstadoAtual(pedido.getPedidoEncerrado());
		pedido.setEstadoPedido("Entregue");
		pedido.setDtEncerramento(new Date());
		return("Pedido entregue com sucesso.");
	}
	
	public String cancelar() {
		pedido.setEstadoAtual(pedido.getPedidoCancelado());
		pedido.setEstadoPedido("Cancelado");
		pedido.setDtEncerramento(new Date());
		return("Pedido cancelado com sucesso.");
	}
}