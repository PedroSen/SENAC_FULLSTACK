const matriz = [[1,2,3], [4,5,6], [7,8,9]];

let soma = 0;
for (let i = 0; i < matriz.length; i++) {
    for (let j = 0; j < matriz.length; j++) {
        soma += matriz[i][j];
    }
}

console.log(`Soma dos Valores: ${soma}`);