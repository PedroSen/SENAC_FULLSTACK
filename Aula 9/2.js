const prompt = require("prompt-sync")();
let vetor = [10,20,30,40,50]

console.log('vetor atual: ', vetor);

const pos = Number(prompt("Qual posição deseja alterar(0-4)? "));
const valor = Number(prompt("Digite o novo valor: "));

if (pos < 0 || pos > 4){
    console.log("Posição Inválida");
} else {
    vetor[pos] = valor;
    console.log("Novo vetor: ", vetor);
}