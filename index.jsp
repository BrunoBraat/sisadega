
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<%@include file="_header.jsp"%>
</head>
<body>
	<%@include file="_cabecalho.jsp"%>
	
	<!--  CONTAINER DE MENSAGENS -->
	<%@include file="_containerMensagens.jsp"%>
	
	<div class="container">
		<br>
		<% if (session.getAttribute("nomeUsuario") != null) { %>
		<div class="panel panel-default">
		    <div class="panel-heading"><strong style="color: darkred">Administrador</strong></div>
		    <div class="panel-body">
	    		<a style="color: darkred" href="gerenciarVinhos.jsp" data-toggle="popover" data-trigger="hover" data-content="Permite o cadastro, consulta, edição e remoção de vinhos.">Gerenciar Vinhos</a>
	    	</div>
	    	<div class="panel-body">
	    		<a style="color: darkred" href="gerenciarClientes.jsp" data-toggle="popover" data-trigger="hover" data-content="Permite o cadastro, consulta, edição e remoção de clientes.">Gerenciar Clientes</a>
	    	</div>
	    </div>
	    
	    <div class="panel panel-default">
		    <div class="panel-heading"><strong style="color: darkred">Pedidos</strong></div>
	    	<div class="panel-body">
	    		<a style="color: darkred" href="criarPedido.jsp" data-toggle="popover" data-trigger="hover" data-content="Permite a criação e processamento de um pedido.">Criar pedido</a>
	    	</div>
	    	<div class="panel-body">
	    		<a style="color: darkred" href="consultarPedidoPorEstado.jsp" data-toggle="popover" data-trigger="hover" data-content="Exibe os pedidos por status.">Consultar pedidos por status</a>
	    	</div>
	    </div>
	    <% } else {
	    	RequestDispatcher view = request.getRequestDispatcher("/login.jsp");
	        view.forward(request, response);	
	    }%>  
	    
	    
	</div>
	<!-- fim .container da pagina -->
	<%@include file="_footer.jsp"%>
</body>
</html>
