<%@include file="_import.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<%@include file="_header.jsp"%>
</head>
<body>
	<%@include file="_cabecalho.jsp"%>
	
	<% if (session.getAttribute("nomeUsuario") != null) {

		// Vinho a editar
		String idVinhoStr = request.getParameter("idVinho"); // se tiver vindo da lista de vinhos
		if( idVinhoStr == null ) { // se tiver vindo do servlet de edição
			idVinhoStr = (String)request.getAttribute("idVinho");
		}
		Vinho vinhoEd = VinhoManager.consultarVinhoPorId(Integer.parseInt(idVinhoStr));
			
		// Caso tenha ocorrido erro na edição, recuperar os valores preenchidos
		String nomeVinho = (String)request.getAttribute("nomeVinho");	
		String corVinho = (String)request.getAttribute("corVinho");
		Double precoVinho = (Double)request.getAttribute("precoVinho");
		Integer anoVinho = (Integer)request.getAttribute("anoVinho");
		Integer qtdEstoque = (Integer)request.getAttribute("qtdEstoque");		
	%>
	<!--  CONTAINER DE MENSAGENS -->
	<%@include file="_containerMensagens.jsp"%>

		
	 <!-- EDIÇÃO DE PRODUTO -->
	<div class="container">		
		<form action="EditaVinho.do" method="post">
			<fieldset>
				<legend>Edição de Vinho</legend>
				<input type="hidden" name=idVinho value="<%=vinhoEd.getIdVinho()%>">

					<div class="form-group" style="width:200px;float:left;margin:0px 20px 0px 0px">
		        		<label for="corVinho">Tipo</label>		
						<select class="form-control" id="corVinho" name="corVinho" required>
							<option value="Branco" <%if( (corVinho != null && corVinho.equals("Branco")) || (vinhoEd.getCorVinho().equals("Branco"))){%>selected="selected"<%}%>>Branco</option>
							<option value="Tinto" <%if( (corVinho != null && corVinho.equals("Tinto")) || (vinhoEd.getCorVinho().equals("Tinto"))){%>selected="selected"<%}%>>Tinto</option>
							<option value="Rose" <%if( (corVinho != null && corVinho.equals("Rose")) || (vinhoEd.getCorVinho().equals("Rose"))){%>selected="selected"<%}%>>Rose</option>
						</select>
					</div>
					
					<div class="form-group" style="width:400px;float:left;margin:0px 20px 0px 0px">	
		        		<label for="nomeVinho">Nome</label>					
						<input type="text" class="form-control" id="nomeVinho" name="nomeVinho" maxlength="150" required value="<%if(nomeVinho!=null){out.println(nomeVinho);}else{out.println(vinhoEd.getNomeVinho());}%>"/>						
					</div>
					
					<%
						Integer valorAnoVinho =  anoVinho;
						if( valorAnoVinho == null ) {
							valorAnoVinho = vinhoEd.getAnoVinho();
						}					
					%>
		        	<div class="form-group" style="width:100px;float:left;margin:0px 20px 0px 0px">	
		        		<label for="anoVinho">Ano</label>					
						<input type="number" min="1900" max="2017" class="form-control" id="anoVinho" name="anoVinho" maxlength="4" required value="<%=valorAnoVinho%>"/>						
					</div>
					
					<div class="form-group" style="width:100px;float:left;margin:0px 20px 0px 0px">
						<label for="precoVinho">Preço</label>		
						<input type="text" class="form-control" id="precoVinho" name="precoVinho" required 
						value="<%if(precoVinho!=null){out.println(Utils.strDoubleParaMoeda(precoVinho));}else{out.println(Utils.strDoubleParaMoeda(vinhoEd.getPrecoVinho()));}%>"/>
					</div>	
					
					<%
						Integer valorQtdEstoque =  qtdEstoque;
						if( valorQtdEstoque == null ) {
							valorQtdEstoque = vinhoEd.getQtdEstoque();
						}					
					%>
					<div class="form-group" style="width:200px;float:left;margin:0px 20px 0px 0px">
						<label for="qtdEstoque">Quantidade em Estoque</label>		
						<input type="number" class="form-control" min="0" id="qtdEstoque" name="qtdEstoque" required 
						value="<%=valorQtdEstoque%>"/>
					</div>					
										
			</fieldset>
			<br><button type="submit" class="btn btn-outline-danger">Editar vinho</button>
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
