import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';

@Injectable({
  providedIn: 'root',
})
export class AlunoService {
  private apiUrl = '/api/aluno';

  constructor(private http: HttpClient) {}

  //O método abaixo retorna um "Observável", que é uma stream de dados atualizada constantemente. 
  //Nesse caso, o observável assume a forma de uma lista com elementos de qualquer tipo (any[]).
  //Essa lista é a lista com os dados de todos os alunos salvos no banco de dados, que são
  //obtidos com o método .get da biblioteca HttpClient, o qual recebe como argumento a URL do back-end (apiUrl)
  listar(): Observable<any[]> {               
    return this.http.get<any[]>(this.apiUrl);
  }

  //O método abaixo recebe uma variável aluno de qualquer tipo (aluno: any) e retorna essa mesma 
  //variável na forma de um observável, salvando-a no banco de dados, o que é feito pelo método .post
  //da biblioteca HttpClient, que recebe como argumentos a URL do back-end (apiUrl) e o objeto aluno que será salvo no banco.
  criar(aluno: any): Observable<any> {
    return this.http.post(this.apiUrl, aluno);
  }
}
