<%@ page import="org.example.playmysongs.util.Usuario" %>
<%@ page import="java.io.File" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Arrays" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page errorPage="erros.jsp" %>
<%
    Usuario usuario = (Usuario) session.getAttribute("usuario");
    boolean ativo = (usuario != null);
%>

<%!
    File pastaweb;
    List<File> listMusicas;
%>

<%
    listMusicas = new ArrayList<>();
    pastaweb = new File(request.getServletContext().getRealPath("")+"/musicas");
    if (pastaweb.exists() && pastaweb.isDirectory()) {
        File[] arquivos = pastaweb.listFiles();
        if (arquivos != null) {
            for (File file : arquivos) {
                if (file.isFile()) {
                    listMusicas.add(file);
                }
            }
        } else {
            out.println("Erro: `listFiles()` retornou null.");
        }
    } else {
        out.println("Erro: Diretório não encontrado ou não é um diretório válido.");
    }


%>

<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <title>Play My Songs</title>
    <link rel="stylesheet" href="./css/estilos.css">
</head>
<body>
    <nav>
        <div class="nav-logo">
            <img src="./imagens/png-clipart-spotify-computer-icons-music-transparency-logo-spotify-logo-grass-removebg-preview.png"  alt="Imagem logo Play My Songs"/>
        </div>
        <div class="nav-login">
            <% if (ativo) { %>
                <div class="nav-usuario"><p><%= usuario.getNome() %></p>  <a href="logoff-servlet">Sair</a></div>
            <% } else { %>
                <form id="form-log" method="post" action="login-servlet">
                    <input type="email" id="email" name="email" placeholder="email@email.com" />
                    <input type="password" id="senha" name="senha" placeholder="senha" />
                    <button type="submit">Entrar</button>
                </form>
            <% } %>
        </div>
    </nav>
    <article class="container">
    <h1>Play My Songs</h1>
    <h4><a href="enviar_musicas.jsp">Você pode enviar suas músicas aqui!</a></h4>

    <section class="sec-musicas">
        <div class="buscar-musicas">
            <input type="text" name="filter" id="filter" placeholder="Informe a música, cantor ou estilo">
            <button class="btn-busca">Pesquisar</button>
        </div>

        <div class="lista-musicas" id="lista-musicas">
            <%
                if (listMusicas != null && !listMusicas.isEmpty()) {
                    for(File file : listMusicas) {
                        if (file.isFile()) {
                            String nome = file.getName();
                            String dir = "./musicas/" + nome; %>
                            <ul>
                                <li class="item-lista">
                                    <audio controls>
                                        <source src="<%=dir%>" type="audio/mp3">
                                    </audio>
                                    <h5><%=nome%></h5>
                                </li>
                            </ul>
                    <% } }
                } else { %>
                    <p>Não há músicas cadastradas!</p>
                <% }%>
        </div>
    </section>
</article>

    <script>
        document.addEventListener("DOMContentLoaded", function () {
            const searchInput = document.getElementById("filter");
            const searchButton = document.querySelector(".btn-busca");
            const musicItems = document.querySelectorAll(".item-lista");

            function searchMusic() {
                const filter = searchInput.value.toLowerCase();

                musicItems.forEach(item => {
                    // Agora pega corretamente o nome da música dentro do <h5>
                    const musicName = item.querySelector("h5").textContent.toLowerCase();

                    if (musicName.includes(filter)) {
                        item.style.display = "";
                    } else {
                        item.style.display = "none";
                    }
                });
            }
            searchButton.addEventListener("click", searchMusic);
        });
    </script>

</body>
</html>

