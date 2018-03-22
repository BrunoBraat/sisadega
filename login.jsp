<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<%@include file="_header.jsp"%>
<style>
.janela-login {
	width: 35%;
	margin: auto;
	border-radius: 12px;
	background-color: #F2F2F2;
	box-shadow: 0 4px 10px 0 rgba(0,0,0,0.2);
}	
.janela-login-titulo {
	background-color: lightgray;
	width: 100%;
	margin: 0;
	padding: 10px 25px;
	border-radius: 15px 15px 0 0;
}
.btn-outline-danger:hover {
	background-color: darkred;
	color: white;
}
</style>
</head>
<body>
	<%@include file="_cabecalho.jsp"%>
	
	<!--  CONTAINER DE MENSAGENS -->
	<%@include file="_containerMensagens.jsp"%>
	
	<div class="container">
			
		<br><br>
		<div class="janela-login">
		<div class="janela-login-titulo"><p style="font-size:16px;font-style:bold;margin:4px 0 4px 0">Entre para continuar</p></div>
			<div style="margin:25px">
			<form class="px-4 py-3" action="Login.do" method="post">
			  <div class="form-group">
			    <label for="nomeUsuario">Usuário</label>
			    <input type="text" class="form-control" id="nomeUsuario" name="nomeUsuario" placeholder="Usuário"/>
			  </div>
			  <div class="form-group">
			    <label for="senha">Senha</label>
			    <input type="password" class="form-control" id="senha" name="senha" placeholder="Senha"/>
			  </div>
			  <% if (request.getAttribute("erro") != null) { %>
			  <p style="color:red;font-style:italic"><%=request.getAttribute("erro") %></p>
			  <% } %>
			  <button type="submit" class="btn btn-outline-danger" style="margin:10px 0 20px 0">Entrar</button>
			</form>
			</div>
		 </div>
		 
	</div>
	<!-- fim .container da pagina -->
	<%@include file="_footer.jsp"%>
</body>
</html>