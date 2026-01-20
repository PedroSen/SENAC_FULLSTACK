package com.sistema.login.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.sistema.login.model.Usuario;

public interface UsuarioRepository extends JpaRepository<Usuario, Long> {
    Usuario findByEmail(String email);
}