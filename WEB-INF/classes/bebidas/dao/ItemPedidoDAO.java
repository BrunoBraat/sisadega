package bebidas.dao;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Query;

import bebidas.model.ItemPedido;
import bebidas.model.Pedido;

public class ItemPedidoDAO extends CommonsDAO {

	public boolean apagar(int identificador) {
		EntityManagerFactory factory = HibernateUtil.getEntityManagerFactory();
		EntityManager manager = factory.createEntityManager();
		Pedido resultado = manager.find(Pedido.class, identificador);
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
	public List<ItemPedido> selecionarTodos() {
		List<ItemPedido> resultado = new ArrayList<ItemPedido>();
		EntityManagerFactory factory = HibernateUtil.getEntityManagerFactory();
		EntityManager manager = factory.createEntityManager();		
	    Query query = manager.createQuery("from ItemPedido p order by idItemPedido");
	    resultado = query.getResultList();
	    manager.close();
		return resultado;
	}

	
	public ItemPedido selecionarPorId(int idItemPedido) {
		EntityManagerFactory factory = HibernateUtil.getEntityManagerFactory();
		EntityManager manager = factory.createEntityManager();
		Query query = manager.createQuery("select p from ItemPedido p where p.idItemPedido = :idItemPedido");
		query.setParameter("idItemPedido", idItemPedido);
		if( query.getResultList() != null && !query.getResultList().isEmpty()  ) {
			ItemPedido resultado = (ItemPedido)query.getResultList().get(0);
			manager.close();
			return resultado;
		} 
		manager.close();
		return null;
	}
	
	public List<ItemPedido> selecionarPorPedido(Pedido pedido) {
		EntityManagerFactory factory = HibernateUtil.getEntityManagerFactory();
		EntityManager manager = factory.createEntityManager();
		Query query = manager.createQuery("select p from ItemPedido p where p.pedido = :pedido");
		query.setParameter("pedido", pedido);
		if( query.getResultList() != null && !query.getResultList().isEmpty()  ) {
			List<ItemPedido> resultado = query.getResultList();
			manager.close();
			return resultado;
		} 
		manager.close();
		return null;
	}
	
}