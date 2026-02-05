import { TestBed } from '@angular/core/testing';

import { AlunoService } from './alunoservice';

describe('Aluno', () => {
  let service: AlunoService;

  beforeEach(() => {
    TestBed.configureTestingModule({});
    service = TestBed.inject(AlunoService);
  });

  it('should be created', () => {
    expect(service).toBeTruthy();
  });
});
