package org.example.playmysongs;

import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import java.io.*;

@MultipartConfig(
        location="/",
        fileSizeThreshold=1024*1024,    // 1MB *
        maxFileSize=1024*1024*100,      // 100MB **
        maxRequestSize=1024*1024*10*10  // 100MB ***
)

@WebServlet(name = "uploadServlet", value = "/upload-servlet")
public class UploadServlet extends HttpServlet {
    public void doPost(HttpServletRequest request, HttpServletResponse response) {
        response.setContentType("text/html;charset=UTF-8");
        // lê a pasta de destino
        OutputStream out = null; InputStream filecontent = null;
        PrintWriter writer = null;
        try {
            writer = response.getWriter();
            Part filePart = request.getPart("musica");  // Lê o arquivo de upload
            String fileName = filePart.getSubmittedFileName();
            if (fileName.endsWith(".mp3")) {
                //criando a pasta
                File fpasta = new File(getServletContext().getRealPath("/")+"/musicas");
                fpasta.mkdir();
                out = new FileOutputStream(new File(fpasta.getAbsolutePath()+"/"+fileName));
                filecontent = filePart.getInputStream();
                int read = 0;
                byte[] bytes = new byte[1024];
                while ((read = filecontent.read(bytes)) != -1)
                {  out.write(bytes, 0, read); }
                writer.println(fileName + " enviado com sucesso!");
                out.close();  filecontent.close();  writer.close();
            }
            else {
                response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
                response.getWriter().write("Apenas arquivos .mp3 são permitidos.");
            }
        }
        catch (Exception fne) {
            writer.println("Erro ao receber o arquivo");
            writer.println("<br/> ERRO: " + fne.getMessage());
        }
    }
}
