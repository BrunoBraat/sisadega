package bebidas.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

@Entity
@Table(name="ItemPedido")
public class ItemPedido {
	
	@Id
	@Column(name = "idItemPedido", nullable = false)
	@GenericGenerator(name="generator", strategy="increment")
    @GeneratedValue(generator="generator")
	private int idItemPedido;
	
	@JoinColumn(name = "idPedido", referencedColumnName = "idPedido", nullable = false)
	@ManyToOne(fetch = FetchType.EAGER)
	private Pedido pedido;
	
	@JoinColumn(name = "idVinho", referencedColumnName = "idVinho", nullable = false)
	@ManyToOne(fetch = FetchType.EAGER)
	private Vinho vinho;
	
	@Column(name = "qtdVinho")
	private int qtdVinho;
	
	@Column(name = "valorParcial")
	private double valorParcial;

	// MÉTODOS DE ACESSO
	
	public int getIdItemPedido() {
		return idItemPedido;
	}

	public void setIdItemPedido(int idItemPedido) {
		this.idItemPedido = idItemPedido;
	}

	public Pedido getPedido() {
		return pedido;
	}

	public void setPedido(Pedido pedido) {
		this.pedido = pedido;
	}

	public Vinho getVinho() {
		return vinho;
	}

	public void setVinho(Vinho vinho) {
		this.vinho = vinho;
	}

	public int getQtdVinho() {
		return qtdVinho;
	}

	public void setQtdVinho(int qtdVinho) {
		this.qtdVinho = qtdVinho;
	}

	public double getValorParcial() {
		return valorParcial;
	}

	public void setValorParcial(double valorParcial) {
		this.valorParcial = valorParcial;
	}

}