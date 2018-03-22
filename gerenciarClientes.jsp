<%@include file="_import.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<%@include file="_header.jsp"%>
</head>
<body>
	<%@include file="_cabecalho.jsp"%>
	
	<% if (session.getAttribute("nomeUsuario") != null) {	
		
		// Lista de clientes
		List<Cliente> clientes = ClienteManager.consultarTodosClientes();
		
		if( clientes == null || clientes.isEmpty() ) {
	%>	
		<div class="container"> 
			<div class="alert alert-danger">		
				<strong>Não há clientes cadastrados.</strong>
				<br></br><a href="cadastrarCliente.jsp" class="btn btn-default">Cadastrar Novo</a>
			</div>
		</div>		
	<%
		} else {
	%>
	
	<!--  CONTAINER DE MENSAGENS -->
	<%@include file="_containerMensagens.jsp"%>
	
	<!--  CONTAINER PRINCIPAL -->
	<div class="container">		
		<!-- Botões -->	
		<br>
		<a href="cadastrarCliente.jsp" class="btn btn-default">Cadastrar Novo</a>
		<br/><br/>
		
		<div class="row">
	        <div class="panel panel-default filterable">
	            <div class="panel-heading">
	                <h3 class="panel-title">Clientes</h3>
	                <div class="pull-right">
	                    <button class="btn btn-default btn-xs btn-filter"><span class="glyphicon glyphicon-filter"></span> Filtro</button>
	                </div>
	            </div>
	            <table class="table table-striped">
	                <thead>
	                    <tr class="filters">
	                        <th width="5%"></th>
	                        <th width="5%"><input type="text" class="form-control" placeholder="Id" disabled></th>
	                        <th><input type="text" class="form-control" placeholder="Nome" disabled></th>
	                        <th><input type="text" class="form-control" placeholder="Telefone" disabled></th>
	                        <th><input type="text" class="form-control" placeholder="Endereço" disabled></th>
                        </tr>
	                </thead>
	                <% for( Cliente cliente : clientes ) { %>
				      <tr>
				      	<td>
				      		<a href="editarCliente.jsp?idCliente=<%=cliente.getIdCliente()%>" data-toggle="popover" data-trigger="hover" data-content="Editar"><img src="images/icon_lapis.png" alt="Editar" title="Editar" style="width:16px;height:16px;border:0;"></img></a>
				      		<a href="confirmacao.jsp?idCliente=<%=cliente.getIdCliente()%>&nomeCliente=<%=cliente.getNomeCliente()%>&operacao=excluirCliente" data-toggle="popover" data-trigger="hover" data-content="Excluir"><img src="images/icon_delete.png" alt="Excluir" title="Excluir" style="width:16px;height:16px;border:0;"></img></a>
				      	</td>				      	
				      	<td><strong><%= cliente.getIdCliente()%></strong></td>
				      	<td><%= cliente.getNomeCliente()%></td>				      	
				      	<td><%= cliente.getTelCliente()%></td>
				      	<td><%= cliente.getEndCliente()%></td>
			          </tr>
				    <% } %>
	            </table>
	        </div>
    	</div>  

		
	</div>
	<!-- fim .container da pagina -->
	<%
		}
		
	} else {
	   	RequestDispatcher view = request.getRequestDispatcher("/login.jsp");
	    view.forward(request, response);	
	}%>
	
	<%@include file="_footer.jsp"%>
</body>
</html>
