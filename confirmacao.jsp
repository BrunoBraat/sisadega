
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<%@include file="_header.jsp"%>
</head>
<body>
	<%@include file="_cabecalho.jsp"%>	
	
	<!--  CONTAINER PRINCIPAL -->
	<div class="container">	 
		<div class="alert alert-warning">		
			<% 
				String operacao = request.getParameter("operacao"); 
				if( operacao.equals("excluirVinho")) { %>
					<strong>Esta operação é irreversível e apagará o produto da base de dados. Tem certeza que deseja prosseguir?</strong>			
					<br></br>	
					<a href="ExcluirVinho.do?idVinho=<%=request.getParameter("idVinho")%>&nomeVinho=<%=request.getParameter("nomeVinho")%>" class="btn btn-danger">Sim</a>
					<a href="gerenciarVinhos.jsp" class="btn btn-default">Não</a>			
			<%	} else if( operacao.equals("excluirCliente")) { %>
					<strong>Esta operação é irreversível e apagará o cliente da base de dados. Tem certeza que deseja prosseguir?</strong>			
					<br></br>	
					<a href="ExcluirCliente.do?idCliente=<%=request.getParameter("idCliente")%>&nomeCliente=<%=request.getParameter("nomeCliente")%>" class="btn btn-danger">Sim</a>
					<a href="gerenciarClientes.jsp" class="btn btn-default">Não</a>		
			<%	} %>
		</div>
	</div>
	<!-- fim .container da pagina -->
	<%@include file="_footer.jsp"%>
</body>
</html>
