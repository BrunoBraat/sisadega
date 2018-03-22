package bd.utils;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class BDClientes {
	
	/* Cria uma nova tabela de clientes, apagando tudo que existir na base */
	
	public static void initDB() {
		try {
			String sql = "DROP TABLE IF EXISTS Cliente";	
			Connection con = new ConnectionFactory().getConnection();
			PreparedStatement stmt = con.prepareStatement(sql);
			stmt.execute();
			stmt.close();
			con.close();
			
			System.out.println("***** Tabelas criadas com sucesso");

		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	
}
