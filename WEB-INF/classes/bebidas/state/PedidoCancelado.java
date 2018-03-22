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
		return("ERRO: N�o � poss�vel abrir um pedido cancelado");		
	}

	public String encerrar() {
		return ("ERRO: N�o � poss�vel cancelar um pedido cancelado");
	}

	public String cancelar() {
		return("ERRO: Pedido j� est� cancelado");
	}
}