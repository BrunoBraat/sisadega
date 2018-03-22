<%@include file="_import.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<%@include file="_header.jsp"%>
	<script type="text/javascript">
    $(document).ready(function(){
    	var count = 0;
        $(".add-row").click(function(){
        	count++;
        	document.getElementById("contador").value= +count;
            var idVinhoTabela = $("#idVinho").val();
            var nomeVinho = $("#idVinho option:selected").text().split("-", 1);
            var corVinho = $("#idVinho option:selected").text().split("-", 2).pop();
            var qtdVinhoTabela = $("#qtdVinho").val();
            var markup = "<tr><td style='vertical-align:middle'><input type='hidden' name='id" + count + "' value='" + idVinhoTabela + "'><strong>" + idVinhoTabela + "</strong></td><td style='vertical-align:middle'>" + nomeVinho + "</td><td style='vertical-align:middle'>" + corVinho + "</td><td style='vertical-align:middle'><input type='number' name='qtd" + count + "' min='1' class='form-control' value=" + qtdVinhoTabela + " required'/></td><td style='vertical-align:middle'><input class='btn btn-danger' type='button' value='Excluir item' onclick='deleteRow(this)'></td></tr>";
            $("table tbody").append(markup);
            
            document.getElementById('id' ).value = "";
	        document.getElementById('nomeVinho').value = "";
	        document.getElementById('corVinho').value = "";
	        document.getElementById('qtd').value = "";
        });
    });
        // remover um item
        function deleteRow(r) {
		    var i = r.parentNode.parentNode.rowIndex;
		    document.getElementById("itensPedido").deleteRow(i);
		}
       
	</script>
</head>
<body>
	<%@include file="_cabecalho.jsp"%>

	<% if (session.getAttribute("nomeUsuario") != null) {

		// TODO: Caso tenha ocorrido erro na criação do pedido, recuperar os valores para que o formulário já venha preenchido
	
		List<Vinho> vinhos = VinhoManager.consultarTodosVinhos();
		List<Cliente> clientes = ClienteManager.consultarTodosClientes();
	
		if( vinhos == null || vinhos.isEmpty() ) {
	%>	
		<div class="container"> 
			<div class="alert alert-danger">		
				<strong>Não há vinhos cadastrados.</strong>
			</div>
		</div>	
	<%
		} else if( clientes == null || clientes.isEmpty() ) {
	%>	
		<div class="container"> 
			<div class="alert alert-danger">		
				<strong>Não há clientes cadastrados.</strong>
			</div>
		</div>	
	<%
		} else {
	%>

	<!--  CONTAINER DE MENSAGENS -->
	<%@include file="_containerMensagens.jsp"%>

		
	 <!-- CADASTRO DE NOVO PEDIDO -->
	<div class="container" style="display:table">
	
		<!-- Botões -->	
		<!-- <br>
		<a href="consultarPedidoPorEstado.jsp" class="btn btn-default">Consultar pedidos</a>
		<br><br><br>-->
		<legend>Novo Pedido</legend>
		<form action="CriaPedido.do" method="post">
		<div width="100%">
		<div style="float:left;position:absolut;width:38%">
			<fieldset>
					<div class="form-group" style="margin:0px 20px 0px 0px">	
		        		<label for="idCliente">Cliente</label>					
						<select class="form-control" id="idCliente" name="idCliente" required autofocus></p>
							<% 
								for( Cliente cliente : clientes ) { 
							%>
								<option value="<%=cliente.getIdCliente()%>"><%=cliente.getNomeCliente()%></option>
							<% 
								} 
							%>
			  			</select><br>						
					</div>
					
					<div class="form-group" style="margin:0px 20px 0px 0px">
		        		<label for="idVinho">Vinho</label>		
						<select class="form-control" id="idVinho" name="idVinho" required>
							<% 
								for( Vinho vinho : vinhos ) { 
							%>
								<option value="<%=vinho.getIdVinho()%>"><%=vinho.getNomeVinho()%> - <%=vinho.getCorVinho()%></option>
							<% 
								} 
							%>
			  			</select><br>			  				
					</div>

					<div class="form-group" style="width:35%;margin:0px 20px 0px 0px">
						<label for="qtdVinho">Quantidade</label>		
						<input type="number" min="1" class="form-control" id="qtdVinho" name="qtdVinho" value="1" required"/>
					</div><br>		
			</fieldset>
			<input type="button" id="addItem" class="add-row btn btn-outline-danger" value="Adicionar item">
		</div>
		<!-- <hr style="height:265px;width:1px;border-left:1px solid lightgrey;float:left;position:relative;margin:10px"> -->
		<div class="row" style="width:60%;float:right;position:relative">
	        <div class="panel panel-default filterable">
	            <div class="panel-heading">
	                <h3 class="panel-title">Pedido</h3>
	                <div class="pull-right">
	                    <button class="btn btn-default btn-xs btn-filter"><span class="glyphicon glyphicon-filter"></span> Filtro</button>
	                </div>
	            </div>
	            <table id="itensPedido" class="table">
	                <thead>
	                    <tr class="filters">
	                        <th width="8%"><input type="text" class="form-control" placeholder="Id" disabled></th>
	                        <th width="30%"><input type="text" class="form-control" placeholder="Vinho" disabled></th>
	                        <th width="15%"><input type="text" class="form-control" placeholder="Tipo" disabled></th>
	                        <th width="15%" align="right"><input type="text" class="form-control" placeholder="Quantidade" disabled></th>
	                        <th width="5%"></th>
                        </tr>
	                </thead>
				      <tr></tr>
	            </table>
	        </div>
	        <input type="hidden" name="contador" id="contador"/>
	       	<button type="submit" class="btn btn-outline-danger">Finalizar pedido</button><br>
		</div>
		</form>
	</div>
	</div>
	<!-- fim .container da pagina -->
	<%
		}
		
	} else {
	   	RequestDispatcher view = request.getRequestDispatcher("/login.jsp");
	    view.forward(request, response);	
	} %>

	<div style="position:absolut;bottom:0"><%@include file="_footer.jsp" %></div>
</body>
</html>
