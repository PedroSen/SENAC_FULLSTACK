const prompt = require("prompt-sync")();

let num = [];

for (let i = 0; i < 10; i++){
    num.push(Number(prompt(`Digite o ${i+1}º número: `)));
}

const soma = num.reduce((a,b) => a+b, 0);
console.log("Soma = " + soma);