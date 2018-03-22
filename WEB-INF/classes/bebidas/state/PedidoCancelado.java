package bebidas.state;

import java.util.Date;

import bebidas.model.Pedido;
import bebidas.model.Vinho;

public class PedidoCancelado implements State {

	Pedido pedido;	
	
	public PedidoCancelado(Pedido pedido) {
		super();
		this.pedido = pedido;
	}
	
	public String abrir() {
		return("ERRO: Não é possível abrir um pedido cancelado");		
	}

	public String encerrar() {
		return ("ERRO: Não é possível cancelar um pedido cancelado");
	}

	public String cancelar() {
		return("ERRO: Pedido já está cancelado");
	}
}