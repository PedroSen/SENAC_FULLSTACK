import { ComponentFixture, TestBed } from '@angular/core/testing';

import { CadastroAlunos } from './cadastro-alunos';

describe('CadastroAlunos', () => {
  let component: CadastroAlunos;
  let fixture: ComponentFixture<CadastroAlunos>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [CadastroAlunos]
    })
    .compileComponents();

    fixture = TestBed.createComponent(CadastroAlunos);
    component = fixture.componentInstance;
    await fixture.whenStable();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
