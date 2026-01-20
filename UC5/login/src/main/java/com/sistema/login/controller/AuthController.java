package com.sistema.login.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.sistema.login.model.Usuario;
import com.sistema.login.service.UsuarioService;


@Controller
public class AuthController {
    @Autowired
    private UsuarioService service;


    @GetMapping("/login")
    public String login() { return "login"; }


    @GetMapping("/cadastro")
    public String cadastro(Model model) {
        model.addAttribute("usuario", new Usuario());
        return "cadastro";
    }


    @PostMapping("/cadastro")
    public String salvarCadastro(Usuario usuario) {
        service.salvar(usuario);
        return "redirect:/login";
    }


    @GetMapping("/home")
    public String home() { return "home"; }
}

