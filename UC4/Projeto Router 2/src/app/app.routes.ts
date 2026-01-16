import { Routes } from '@angular/router'; 
import { PainelPrincipal } from './componentes/painel-principal/painel-principal'; 
import { CadastroAlunos } from './componentes/cadastro-alunos/cadastro-alunos'; 
import { ConsultaAlunos } from './componentes/consulta-alunos/consulta-alunos'; 

 

export const routes: Routes = [ 
    { path: '', redirectTo: 'painel-principal', pathMatch: 'full' }, 
    { path: 'painel-principal', component: PainelPrincipal }, 
    { path: 'cadastro-alunos', component: CadastroAlunos }, 
    { path: 'consulta-alunos', component: ConsultaAlunos } 
]; 