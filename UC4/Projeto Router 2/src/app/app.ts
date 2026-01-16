import { CommonModule } from '@angular/common';
import { Component, inject } from '@angular/core';
import { Router, RouterLink, RouterOutlet } from '@angular/router';

@Component({
  selector: 'app-root',
  standalone: true,
  imports: [RouterOutlet, CommonModule, RouterLink],
  templateUrl: './app.html',
  styleUrl: './app.css'
})
export class App {
  private router = inject(Router);

  // Variáveis de controle
  isCollapsed = false;
  isDropdownOpen = false;
  isLogoutModalOpen = false;
  isSidebarCollapsed = false;
  currentYear = new Date().getFullYear();

  // Método para navegação e fechar collapse
  navigateAndClose() {
    // Fecha o collapse do menu
    this.isCollapsed = false;

    // Em dispositivos móveis, fecha o sidebar também
    if (window.innerWidth < 768) {
      this.isSidebarCollapsed = false;
    }

    // A navegação acontece automaticamente pelo routerLink
  }

  // Método para alternar o collapse
  toggleCollapse(event: Event) {
    event.preventDefault();
    event.stopPropagation();
    this.isCollapsed = !this.isCollapsed;
  }

  // Método para alternar dropdown
  toggleDropdown(event: Event) {
    event.preventDefault();
    event.stopPropagation();
    this.isDropdownOpen = !this.isDropdownOpen;

    // Fecha outros elementos
    if (this.isDropdownOpen) {
      this.isCollapsed = false;
    }
  }

  // Método para alternar sidebar em dispositivos móveis
  toggleSidebar() {
    this.isSidebarCollapsed = !this.isSidebarCollapsed;
  }

  // Método para abrir modal de logout
  openLogoutModal(event: Event) {
    event.preventDefault();
    event.stopPropagation();
    this.isLogoutModalOpen = true;
    this.isDropdownOpen = false;
  }

  // Método para fechar modal de logout
  closeLogoutModal() {
    this.isLogoutModalOpen = false;
  }

  // Método para scroll to top
  scrollToTop(event: Event) {
    event.preventDefault();
    window.scrollTo({ top: 0, behavior: 'smooth' });
  }
}