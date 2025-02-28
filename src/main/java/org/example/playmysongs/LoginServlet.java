package org.example.playmysongs;

import java.io.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import org.example.playmysongs.util.Usuario;

@WebServlet(name = "loginServlet", value = "/login-servlet")
public class LoginServlet extends HttpServlet {
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String email = request.getParameter("email");
        String senha = request.getParameter("senha");

        if (email != null && senha != null) {

            if (email.contains(senha)) {
                Usuario user = new Usuario(email);
                // guardar as informações do usuário na sessão
                HttpSession httpSession = request.getSession();
                httpSession.setAttribute("usuario", user);
                return;
            }
        }

        return;
    }
}