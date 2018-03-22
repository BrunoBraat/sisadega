<style>

.topnav {
  overflow: hidden;
  background-color: darkred;
}

.menu a {
  float: left;
  display: block;
  color: #f2f2f2;
  text-align: center;
  padding: 18px 16px;
  text-decoration: none;
  font-size: 14px;
  font-family: Arial;
}

.menu a:hover {
  background-color: #ddd;
  color: black;
}

.menu a:active {
    background-color: #ddd;
}
.logout {
	background-color: darkred;
	border: none;
	color: white;
	hover-color: gray;
}
.logout:hover {
	background-color: darkred;
	border: none;
	color: gray;
}

</style>
	
	<div class="topnav"> 
		<a href="index.jsp">
			<img style="float:left;margin: 5px 10px 5px 85px" src="images/logo-adega.jpg"  height="45" border="0"/>
  		</a>
  		<div class="menu">
	  		<a href="index.jsp">Início</a>
	  		<a href="sobre.jsp">Sobre</a>
	 		<a href="sobre.jsp">Ajuda</a>
	 		<a href="sobre.jsp">Contato</a>
	 	</div>
	 	<% if (session.getAttribute("nomeUsuario") != null) { 
	 	String nome = (String)session.getAttribute("nomeCompleto");
	 	String acesso = (String)session.getAttribute("acesso");%>
 		<div class="logout" style="float:right;margin: 17px 85px 0 0">
	 		<p style="float:left;color:white"><strong><%=acesso%></strong> | <%=nome%> | </p> 
	 			<form style="float:right" action="LogoutServlet.do" method="post">
	 				<input class="logout" type="submit" href="login.jsp" value="Sair">
	 			</form>
		</div>
		<% } %>
	</div><br>
	