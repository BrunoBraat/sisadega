<%@include file="_import.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<%@include file="_header.jsp"%>
</head>
<body>
	<%@include file="_cabecalho.jsp"%>
	
	<% if (session.getAttribute("nomeUsuario") != null) {
		
		// cliente a editar
		String idclienteStr = request.getParameter("idCliente"); // se tiver vindo da lista de clientes
		if( idclienteStr == null ) { // se tiver vindo do servlet de edição
			idclienteStr = (String)request.getAttribute("idCliente");
		}
		
		Cliente clienteEdit = ClienteManager.consultarClientePorId(Integer.parseInt(idclienteStr));
			
		// Caso tenha ocorrido erro na edição, recuperar os valores preenchidos
		String nomeCliente = (String)request.getAttribute("nomeCliente");	
		String telCliente = (String)request.getAttribute("telCliente");
		String endCliente = (String)request.getAttribute("EndCliente");
	
	%>
	<!--  CONTAINER DE MENSAGENS -->
	<%@include file="_containerMensagens.jsp"%>

		
	 <!-- EDIÇÃO DE CLIENTE -->
	<div class="container">		
		<form action="EditaCliente.do" method="post">
			<fieldset>
				<legend>Edição de cliente</legend>
				<input type="hidden" name=idCliente value="<%=clienteEdit.getIdCliente()%>">

					<div class="form-group" style="width:400px;float:left;margin:0px 20px 0px 0px">	
		        		<label for="nomeCliente">Nome</label>					
						<input type="text" class="form-control" id="nomeCliente" name="nomeCliente" maxlength="150" required value="<%if(nomeCliente!=null){out.println(nomeCliente);}else{out.println(clienteEdit.getNomeCliente());}%>"/>						
					</div>
					
		        	<div class="form-group" style="width:250px;float:left;margin:0px 20px 0px 0px">	
		        		<label for="telCliente">Telefone</label>					
						<input type="text" class="form-control" id="celular" name="telCliente" maxlength="14" required value="<%if(telCliente!=null){out.println(telCliente);}else{out.println(clienteEdit.getTelCliente());}%>"/>						
					</div>
					
					<div class="form-group" style="width:300px;float:left;margin:0px 20px 0px 0px">
						<label for="endCliente">Endereço</label>		
						<input type="text" class="form-control" id="endCliente" name="endCliente" required value="<%if(endCliente!=null){out.println(endCliente);}else{out.println(clienteEdit.getEndCliente());}%>"/>
					</div>					
										
			</fieldset>
			<br> <button type="submit" class="btn btn-outline-danger">Editar cliente</button>
		</form>		
	</div>
	<!-- fim .container da pagina -->
	
	<% } else {
	   	RequestDispatcher view = request.getRequestDispatcher("/login.jsp");
	    view.forward(request, response);	
	} %>
	
	<%@include file="_footer.jsp"%>
</body>
</html>
