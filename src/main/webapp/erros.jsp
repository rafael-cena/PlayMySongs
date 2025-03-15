<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isErrorPage="true" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Erro</title>
    <link rel="stylesheet" href="./css/estilos.css">
</head>
<body>
    <article class="container">
        <nav>
            <div class="nav-logo">
                <img src="./imagens/png-clipart-spotify-computer-icons-music-transparency-logo-spotify-logo-grass-removebg-preview.png"  alt="Imagem logo Play My Songs"/>
                <a href="index.jsp">Inicio</a>
            </div>
        </nav>
        <section class="erro">
            <h1>404 | Erro</h1>
            <h3><%= exception.getMessage() %></h3>
        </section>
    </article>
</body>
</html>
