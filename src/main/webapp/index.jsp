<%@ page import="org.example.playmysongs.util.Usuario" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    Usuario usuario = (Usuario) session.getAttribute("usuario");
    boolean ativo = (usuario != null);
%>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <title>Play My Songs</title>
    <link rel="stylesheet" href="./css/estilos.css">
</head>
<body>
    <nav>
        <div class="nav-logo"><img src="./imagens/png-clipart-spotify-computer-icons-music-transparency-logo-spotify-logo-grass-removebg-preview.png"  alt="Imagem logo Play My Songs"/></div>
        <div class="nav-login">
            <% if (ativo) { %>
            <div class="nav-usuario"><p><%= usuario.getNome() %></p>  <a href="logoff-servlet">Sair</a></div>
            <% } else { %>
            <form id="form-log" method="post" action="login-servlet">
                <input type="email" id="email" name="email" placeholder="email@email.com" />
                <input type="password" id="senha" name="senha" placeholder="senha" />
                <button onclick="Login()">Entrar</button>
            </form>
            <% } %>
        </div>
    </nav>
    <article class="container">
    <h1>Play My Songs</h1>
    <h4><a href="#">Você pode enviar suas músicas aqui!</a></h4>

    <section class="sec-musicas">
        <div class="buscar-musicas">
            <input type="text" name="termo" id="termo" placeholder="Informe a música, cantor ou estilo">
            <button class="btn-busca">Pesquisar</button>
        </div>

        <div class="lista-musicas">
            <ul>
                <li class="item-lista" >
                    <audio controls >
                    <source src="" type = "audio/mpeg" >
                    </audio >
                    <h5> Nome_da_musica.mp3 </h5 >
                </li>
                <li class="item-lista" >
                    <audio controls >
                        <source src="" type = "audio/mpeg" >
                    </audio >
                    <h5> Nome_da_musica.mp3 </h5 >
                </li>
            </ul>
        </div>
    </section>
</article>
</body>
</html>
