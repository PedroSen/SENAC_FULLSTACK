import { TestBed } from '@angular/core/testing';

import { BancoDeDadosServices } from './banco-de-dados.services';

describe('BancoDeDadosServices', () => {
  let service: BancoDeDadosServices;

  beforeEach(() => {
    TestBed.configureTestingModule({});
    service = TestBed.inject(BancoDeDadosServices);
  });

  it('should be created', () => {
    expect(service).toBeTruthy();
  });
});
