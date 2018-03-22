package bebidas.state;

import java.util.Date;

import bebidas.model.Pedido;

public class PedidoEncerrado implements State {

	Pedido pedido;	
	
	public PedidoEncerrado(Pedido pedido) {
		super();
		this.pedido = pedido;
	}
	
	
	public String abrir() {
		return("ERRO: O pedido já foi encerrado.");		
	}

	public String encerrar() {
		return("ERRO: O pedido já foi encerrado.");		
	}
	
	public String cancelar() {
		return("ERRO: O pedido já foi cancelado.");
	}
}