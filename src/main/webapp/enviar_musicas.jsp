<%@ page import="org.example.playmysongs.util.Usuario" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page errorPage="erros.jsp" %>
<%@ include file="acesso.jsp"%>

<%
  boolean ativo = (usuario != null);
%>

<html lang="pt-br">
<head>
  <script src="javascript/UploadController.js"></script>
  <meta charset="UTF-8">
  <title>Enviar Músicas</title>
  <link rel="stylesheet" href="./css/estilos.css">
</head>
<body>
  <nav>
    <div class="nav-logo">
      <img src="./imagens/png-clipart-spotify-computer-icons-music-transparency-logo-spotify-logo-grass-removebg-preview.png"  alt="Imagem logo Play My Songs"/>
      <a href="index.jsp">Inicio</a>
    </div>
    <div class="nav-login">
      <div class="nav-usuario"><p><%= usuario.getNome() %></p>  <a href="logoff-servlet">Sair</a></div>
    </div>
  </nav>

  <article class="container">
    <div class="form-musicas">
      <form method="POST" enctype="multipart/form-data" id="form-musicas" >
        <h1>Enviar Músicas</h1>
        <label for="musica">Escolha a música</label>
        <span>(o arquivo deve ser '.mp3':)</span>
        <input type="file" name="musica" id="musica" /> <br/>
      </form>
      <button onclick="EnviarMusica()">Enviar Música</button>
    </div>
  </article>
</body>
</html>
