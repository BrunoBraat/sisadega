<%@include file="_import.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<%@include file="_header.jsp"%>
</head>
<body>
	<%@include file="_cabecalho.jsp"%>
	
	<%			
		// Lista de vinhos
		List<Pedido> pedidos = (List<Pedido>)request.getAttribute("listaPedidos");
		List<ItemPedido> itensPedidos = (List<ItemPedido>)request.getAttribute("listaItensPedidos");
		String estadoPedido = (String)request.getAttribute("estadoPedido");
		
		if( pedidos == null || pedidos.isEmpty() ) {
	%>	
		<div class="container"> 
			<div class="alert alert-danger">		
				<strong>Não há pedidos no estado <i><%=estadoPedido%></i>.</strong>
				<br></br><a href="consultarPedidoPorEstado.jsp" class="btn btn-default">Nova consulta</a>
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
		<a href="consultarPedidoPorEstado.jsp" class="btn btn-default">Nova consulta</a>
		<br><br/>
		
		<div class="row">
	        <div class="panel panel-default filterable">
	            <div class="panel-heading">
	                <h3 class="panel-title">Pedidos no estado <b><%=estadoPedido%></b></h3>
	                <div class="pull-right">
	                    <button class="btn btn-default btn-xs btn-filter"><span class="glyphicon glyphicon-filter"></span> Filtro</button>
	                </div>
	            </div>
	            <table class="table">
	                <thead>
	                    <tr class="filters">
	                    	<th><input type="text" class="form-control" placeholder="Id" disabled></th>
	                    	<th><input type="text" class="form-control" placeholder="Cliente" disabled></th>
	                        <th><input type="text" class="form-control" placeholder="Valor total" disabled></th>
	                        <th><input type="text" class="form-control" placeholder="Data do pedido" disabled></th>
	                        <th><input type="text" class="form-control" placeholder="Data final" disabled></th>
	                        <th></th>
	                    </tr>
	                </thead>
	                <% for( Pedido pedido : pedidos ) { %>
				      <tr>
				      	<td style="width:5%"><strong><%=pedido.getIdPedido() %></strong></td>
				    	<td style="width:30%;"><%=pedido.getCliente().getNomeCliente()%>
				    	
				    		<table style="font-family:arial,sans-serif;font-size:11px;color:#848484">
				    		<% for (ItemPedido itemPedido : itensPedidos) { 
				    			if (itemPedido.getPedido().getIdPedido() == pedido.getIdPedido()) { %>
				    			<tr><td style="width:150px"><%= itemPedido.getVinho().getNomeVinho() %></td>
				    			<td style="width:50px">x<%= itemPedido.getQtdVinho() %></td>
				    			<td><%= Utils.strDoubleParaMoeda(itemPedido.getValorParcial()) %></td></tr>
				    			<% }
				    		} %>
				    		</table>
				    	
				    	</td>
				      	<td style="width:15%"><%=Utils.strDoubleParaMoeda(pedido.getValorTotal())%></td>
				      	<td style="width:15%"><%=Utils.dateParaStr(pedido.getDtPedido())%></td>
				      	<td style="width:15%"><%=Utils.dateParaStr(pedido.getDtEncerramento())%></td>
				      	<td>
				      	<%
				      		if( pedido.getEstadoPedido().equals("Aberto") ) {
				      	%>
				      			<a href="EncerraPedido.do?idPedido=<%=pedido.getIdPedido()%>" class="btn btn-warning" style="margin:2px;">Entregue</a>
				      			<a href="CancelarPedido.do?idPedido=<%=pedido.getIdPedido()%>" class="btn btn-danger" style="margin:2px">Cancelar</a>
				      			
				      	<%
				      		} else if ( pedido.getEstadoPedido().equals("Entregue") ) {
				      			out.println("<i>Entregue</i>");
				      		} else if ( pedido.getEstadoPedido().equals("Cancelado") ) {
				      			out.println("<i>Cancelado</i>");
				      		}
				      	%></td>			  
				      </tr>
				    <% } %>
	            </table>
	        </div>
    	</div>  

		
	</div>
	<!-- fim .container da pagina -->
	<%
		}
	%>
	<%@include file="_footer.jsp"%>
</body>
</html>
