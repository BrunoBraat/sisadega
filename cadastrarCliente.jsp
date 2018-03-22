<%@include file="_import.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<%@include file="_header.jsp"%>
</head>
<body>
	<%@include file="_cabecalho.jsp"%>
	
	<% if (session.getAttribute("nomeUsuario") != null) {

		/* Caso tenha ocorrido erro no cadastro, recuperar os valores preenchidos */
		
		String nomeCliente = (String)request.getAttribute("nomeCliente");	
		String telCliente = (String)request.getAttribute("telCliente");
		String endCliente = (String)request.getAttribute("endCliente");

	%>
	<!--  CONTAINER DE MENSAGENS -->
	<%@include file="_containerMensagens.jsp"%>

		
	 <!-- CADASTRO DE NOVO VINHO -->
	<div class="container">
	
		<!-- Botões -->
		<br>
		<a href="gerenciarClientes.jsp" class="btn btn-default">Consultar clientes</a>
		<br><br><br>
		
		<form action="CadastraNovoCliente.do" method="post">
			<fieldset>
				<legend>Novo cliente</legend>
				
				
					<div class="form-group" style="width:400px;float:left;margin:0px 20px 0px 0px">	
		        		<label for="nomeCliente">Nome</label>					
						<input type="text" class="form-control" id="nomeCliente" name="nomeCliente" maxlength="150" value="<%if(nomeCliente!=null){out.println(nomeCliente);}%>" required autofocus/>						
					</div>
					
					<div class="form-group" style="width:150px;float:left;margin:0px 20px 0px 0px">
						<label for="telCliente">Telefone</label>		
						<input type="text" class="form-control" id="celular" name="telCliente" value="<%=telCliente%>" required/>
					</div>	
					
					<div class="form-group" style="width:300px;float:left;margin:0px 20px 0px 0px">
						<label for="endCliente">Endereço</label>		
						<input type="text" class="form-control" id="endCliente" name="endCliente" value="<%if(endCliente!=null){out.println(endCliente);}%>" required/>
					</div>	
							
			</fieldset>
			<br>
			<button type="submit" class="btn btn-outline-danger">Cadastrar cliente</button>
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
