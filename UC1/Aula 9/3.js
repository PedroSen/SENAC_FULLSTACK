const prompt = require("prompt-sync")();
let estados = [];
for (let i = 0; i < 5; i++) {
    estados.push(prompt(`Digite o estado ${i+1}!`))
}