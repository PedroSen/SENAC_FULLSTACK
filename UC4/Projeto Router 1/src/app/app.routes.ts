import { Routes } from '@angular/router';
import { PainelPrincipal } from './painel-principal/painel-principal';
import { CadastroTarefas } from './cadastro-tarefas/cadastro-tarefas';
import { ConsultaTarefas } from './consulta-tarefas/consulta-tarefas';

export const routes: Routes = [
    { path: '', redirectTo: 'painel-principal', pathMatch: 'full' },
    { path: 'painel-principal', component: PainelPrincipal },
    { path: 'cadastro-tarefas', component: CadastroTarefas },
    { path: 'consulta-tarefas', component: ConsultaTarefas }
];
