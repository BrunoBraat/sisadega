package bebidas.model;
import java.util.List;

import bebidas.dao.VinhoDAO;

public class VinhoManager {

	public static String cadastrarVinho( String nomeVinho, int anoVinho, String corVinho, double precoVinho, int qtdEstoque ) {
		VinhoDAO dao = new VinhoDAO();

		// Verifica se todos os campos est�o preenchidos
		if( nomeVinho == null || anoVinho <= 0 || corVinho == null || precoVinho < 0 || qtdEstoque < 0 ) { 
			String mensagem = "N�o foi poss�vel cadastrar o vinho: Preencha todos os campos obrigat�rios.";
			return mensagem;
		}

		// Verifica se j� existe vinho com este nome
		Vinho existente = dao.selecionarPorNome(nomeVinho);
		if( existente != null ) {
			String mensagem = "N�o foi poss�vel cadastrar o vinho: J� existe outro vinho com este nome.";
			return mensagem;
		}

		Vinho novo = new Vinho();
		novo.setNomeVinho(nomeVinho);
		novo.setAnoVinho(anoVinho);
		novo.setCorVinho(corVinho);
		novo.setPrecoVinho(precoVinho);
		novo.setQtdEstoque(qtdEstoque);
		
		try {
			dao.inserir(novo);
			String mensagem = "Vinho " + novo.getNomeVinho() + " inserido com sucesso.";
			return mensagem;
		} catch( Exception e ) {
			e.printStackTrace();
			String mensagem = "N�o foi poss�vel cadastrar o vinho";
			return mensagem;
		}
	}
	
	public static String editarVinho( int idVinho, String nomeVinho, int anoVinho, String corVinho, double precoVinho, int qtdEstoque ) {
		VinhoDAO dao = new VinhoDAO();

		// Verifica se todos os campos est�o preenchidos
		if( nomeVinho == null || anoVinho <= 0 || corVinho == null || precoVinho < 0 || qtdEstoque < 0 ) { 
			String mensagem = "N�o foi poss�vel editar o produto: Preencha todos os campos obrigat�rios.";
			return mensagem;
		}
		
		// Recupera o vinho a editar
		Vinho existente = (Vinho)dao.selecionarPorId(idVinho);
		existente.setNomeVinho(nomeVinho);
		existente.setAnoVinho(anoVinho);
		existente.setCorVinho(corVinho);
		existente.setPrecoVinho(precoVinho);
		existente.setQtdEstoque(qtdEstoque);
		
		try {
			dao.atualizar(existente);
			String mensagem = "Vinho " + existente.getNomeVinho() + " atualizado com sucesso.";
			return mensagem;
		} catch( Exception e ) {
			e.printStackTrace();
			String mensagem = "N�o foi poss�vel editar o vinho";
			return mensagem;
		}
	}
	
	public static String apagarVinho( int idVinho ) {
		VinhoDAO dao = new VinhoDAO();
		
		try {
			dao.apagar(idVinho);
			String mensagem = "Vinho apagado com sucesso: ";
			return mensagem;
		} catch( Exception e ) {
			e.printStackTrace();
			String mensagem = "N�o foi poss�vel apagar o vinho: ";
			return mensagem;
		}
	}


	public static List<Vinho> consultarTodosVinhos() {
		VinhoDAO dao = new VinhoDAO();
		List<Vinho> lista = dao.selecionarTodos();
		return lista;
	}

	public static Vinho consultarVinhoPorId( int idVinho ) {
		VinhoDAO dao = new VinhoDAO();
		Vinho vinho = dao.selecionarPorId(idVinho);
		return vinho;
	}
	
}
