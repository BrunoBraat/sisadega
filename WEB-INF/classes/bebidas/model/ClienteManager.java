package bebidas.model;

import java.util.List;

import bebidas.dao.ClienteDAO;

public class ClienteManager {

	public static String cadastrarCliente( String nomeCliente, String telCliente, String endCliente ) {
		ClienteDAO dao = new ClienteDAO();

		// Verifica se todos os campos est�o preenchidos
		if( nomeCliente == null ) { 
			String mensagem = "N�o foi poss�vel cadastrar o cliente: Preencha o campo obrigat�rio.";
			return mensagem;
		}

		// Verifica se j� existe vinho com este nome
		Cliente existente = dao.selecionarPorNome(nomeCliente);
		if( existente != null ) {
			String mensagem = "N�o foi poss�vel cadastrar o cliente: J� existe outro cliente com este nome.";
			return mensagem;
		}

		Cliente novo = new Cliente();
		novo.setNomeCliente(nomeCliente);
		novo.setTelCliente(telCliente);
		novo.setEndCliente(endCliente);
		
		try {
			dao.inserir(novo);
			String mensagem = "Cliente " + novo.getNomeCliente() + " inserido com sucesso.";
			return mensagem;
		} catch( Exception e ) {
			e.printStackTrace();
			String mensagem = "N�o foi poss�vel cadastrar esse cliente";
			return mensagem;
		}
	}
	
	public static String editarCliente( int idCliente, String nomeCliente, String telCliente, String endCliente ) {
		ClienteDAO dao = new ClienteDAO();

		// Verifica se todos os campos est�o preenchidos
		if( nomeCliente == null ) { 
			String mensagem = "N�o foi poss�vel editar o cliente: Preencha todos os campos obrigat�rios.";
			return mensagem;
		}

		/*//Verifica se j� existe cliente com este nome
		if( existente != null && existente.getIdCliente() != idCliente ) {
			String mensagem = "N�o foi poss�vel editar o vinho: J� existe outro vinho com este nome.";
			return mensagem;
		}*/

		Cliente existente = dao.selecionarPorNome(nomeCliente);
		
		// Recupera o cliente a editar
		existente = (Cliente)dao.selecionarPorId(idCliente);
		existente.setNomeCliente(nomeCliente);
		existente.setTelCliente(telCliente);
		existente.setEndCliente(endCliente);
		
		try {
			dao.atualizar(existente);
			String mensagem = "Cliente " + existente.getNomeCliente() + " atualizado com sucesso.";
			return mensagem;
		} catch( Exception e ) {
			e.printStackTrace();
			String mensagem = "N�o foi poss�vel editar o cliente";
			return mensagem;
		}
	}
	
	public static String apagarCliente( int idCliente ) {
		ClienteDAO dao = new ClienteDAO();
		
		try {
			dao.apagar(idCliente);
			String mensagem = "Cliente apagado com sucesso";
			return mensagem;
		} catch( Exception e ) {
			e.printStackTrace();
			String mensagem = "N�o foi poss�vel apagar o cliente";
			return mensagem;
		}
	}


	public static List<Cliente> consultarTodosClientes() {
		
		ClienteDAO dao = new ClienteDAO();
		List<Cliente> lista = dao.selecionarTodos();
		return lista;
	}

	public static Cliente consultarClientePorId( int idCliente ) {
		ClienteDAO dao = new ClienteDAO();
		Cliente cliente = dao.selecionarPorId(idCliente);
		return cliente;
	}
	
}