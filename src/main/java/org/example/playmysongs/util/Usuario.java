package org.example.playmysongs.util;

public class Usuario {
    private String nome;
    private boolean ativo;

    public Usuario(String nome) {
        this.nome = nome;
        this.ativo = true;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public boolean isAtivo() {
        return ativo;
    }

    public void setAtivo(boolean ativo) {
        this.ativo = ativo;
    }
}
