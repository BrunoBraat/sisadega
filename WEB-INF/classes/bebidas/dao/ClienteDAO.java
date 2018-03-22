package bebidas.dao;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Query;

import bebidas.model.Cliente;

public class ClienteDAO extends CommonsDAO {

	public boolean apagar(int identificador) {
		EntityManagerFactory factory = HibernateUtil.getEntityManagerFactory();
		EntityManager manager = factory.createEntityManager();
		Cliente resultado = manager.find(Cliente.class, identificador);
		try {
			manager.getTransaction().begin();
			manager.remove( resultado );
			manager.getTransaction().commit();
		} catch( Exception e ){
			e.printStackTrace();
			return false;
		}
		manager.close();	
		return true;
	}
	
	@SuppressWarnings("unchecked")
	public List<Cliente> selecionarTodos() {
		List<Cliente> resultado = new ArrayList<Cliente>();
		EntityManagerFactory factory = HibernateUtil.getEntityManagerFactory();
		EntityManager manager = factory.createEntityManager();		
	    Query query = manager.createQuery("from Cliente v order by idCliente");
	    resultado = query.getResultList();
	    manager.close();
		return resultado;
	}
	
	public Cliente selecionarPorId(int idCliente) {
		EntityManagerFactory factory = HibernateUtil.getEntityManagerFactory();
		EntityManager manager = factory.createEntityManager();
		Query query = manager.createQuery("select v from Cliente v where v.idCliente = :idCliente");
		query.setParameter("idCliente", idCliente);
		if( query.getResultList() != null && !query.getResultList().isEmpty()  ) {
			Cliente resultado = (Cliente)query.getResultList().get(0);
			manager.close();
			return resultado;
		} 
		manager.close();
		return null;
	}
	
	public Cliente selecionarPorNome( String nomeCliente ) {
		EntityManagerFactory factory = HibernateUtil.getEntityManagerFactory();
		EntityManager manager = factory.createEntityManager();
		Query query = manager.createQuery("select v from Cliente v where v.nomeCliente = :nomeCliente order by idCliente");
		query.setParameter("nomeCliente", nomeCliente);
		if( query.getResultList() != null && !query.getResultList().isEmpty()  ) {
			Cliente resultado = (Cliente)query.getResultList().get(0);
			manager.close();
			return resultado;
		} 
		manager.close();
		return null;
	}

}
