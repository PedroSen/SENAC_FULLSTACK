import { inject } from '@angular/core'
import { CanActivateFn, Router } from '@angular/router';
import { Authservice } from '../services/authservice';

export const authGuard = () => {
  const authService = inject(Authservice);
  const router = inject(Router);

  if (authService.estaAutenticado()) {
    return true;
  }

  return router.parseUrl('/login');
};
