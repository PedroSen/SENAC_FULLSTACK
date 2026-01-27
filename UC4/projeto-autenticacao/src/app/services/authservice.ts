import { Injectable, signal } from '@angular/core';
import { Usuario } from '../models/usuario';
import { Router } from '@angular/router';
import { LoginRequest } from '../models/login';
import { RegistroRequest } from '../models/registo';

@Injectable({
  providedIn: 'root',
})
export class Authservice {
  private usuarios = signal<Usuario[]>([
    {
      id: 1,
      nome: 'Administrador',
      email: 'admin@email.com',
      senha: 'admin123',
      dataCadastro: new Date('2024-01-01')
    }
  ]);

  private usuarioAutenticado = signal<Usuario | null>(null);

  constructor(private router: Router) {
    this.carregarSessao();
  }

  // Signals públicos
  readonly usuarioAtual = this.usuarioAutenticado.asReadonly();
  readonly estaAutenticado = () => this.usuarioAutenticado() !== null;

  // Métodos de autenticação
  login(credenciais: LoginRequest): boolean {
    const usuario = this.usuarios().find(u => 
      u.email === credenciais.email && u.senha === credenciais.senha
    );

    if (usuario) {
      this.usuarioAutenticado.set(usuario);
      this.salvarSessao(usuario);
      return true;
    }
    return false;
  }

  registrar(dados: RegistroRequest): boolean {
    if (dados.senha !== dados.confirmarSenha) {
      return false;
    }

    if (this.usuarios().some(u => u.email === dados.email)) {
      return false;
    }

    const novoUsuario: Usuario = {
      id: this.gerarId(),
      nome: dados.nome,
      email: dados.email,
      senha: dados.senha,
      dataCadastro: new Date()
    };

    this.usuarios.update(usuarios => [...usuarios, novoUsuario]);
    return true;
  }

  logout(): void {
    this.usuarioAutenticado.set(null);
    this.removerSessao();
    this.router.navigate(['/login']);
  }

  alterarSenha(senhaAtual: string, novaSenha: string): boolean {
    const usuario = this.usuarioAutenticado();
    if (!usuario || usuario.senha !== senhaAtual) {
      return false;
    }

    this.usuarioAutenticado.update(user => 
      user ? { ...user, senha: novaSenha } : null
    );
    
    this.usuarios.update(usuarios =>
      usuarios.map(u => 
        u.id === usuario.id ? { ...u, senha: novaSenha } : u
      )
    );

    this.salvarSessao(this.usuarioAutenticado()!);
    return true;
  }

  // Sessão
  private salvarSessao(usuario: Usuario): void {
    localStorage.setItem('usuario', JSON.stringify({
      id: usuario.id,
      email: usuario.email,
      nome: usuario.nome
    }));
  }

  private carregarSessao(): void {
    const dados = localStorage.getItem('usuario');
    if (dados) {
      const usuario = JSON.parse(dados);
      const usuarioCompleto = this.usuarios().find(u => u.id === usuario.id);
      if (usuarioCompleto) {
        this.usuarioAutenticado.set(usuarioCompleto);
      }
    }
  }

  private removerSessao(): void {
    localStorage.removeItem('usuario');
  }

  private gerarId(): number {
    const ids = this.usuarios().map(u => u.id);
    return ids.length > 0 ? Math.max(...ids) + 1 : 1;
  }
}
