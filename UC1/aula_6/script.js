function contar(){
    let i = 0;
    while(i <= 10){
        document.writeln("i = " + i + "<br>");
        i++;
    }
}

function contar1(){
    for (let i = 0; i <= 10; i++) {
        document.writeln("i = " + i + "<br>");
    }
}

function contar2(){
    let i = 100;
    do{
        document.writeln("i = " + i + "<br>");
        i++;
    } while (i <= 10);
}

function pares(){
    i = 0;
    while(i <= 100){
        document.writeln("<br>" + i);
        i += 2;
    }
}

function vogal_ou_consoante(){
    let l = document.getElementById("letra").value;
    if (l == "a" || l == "e" || l == "i" || l == "o" || l == "u")
    {
        alert(l + " é uma vogal!");
    } else {
        alert(l + " é uma consoante!");
    }
}

function media_aluno(){
    let n1 = parseFloat(document.getElementById("nota1").value);
    let n2 = parseFloat(document.getElementById("nota2").value);
    let m = (n1 + n2)/2;
    document.getElementById("media").innerHTML = "Média: " + m;
    if (m == 10){
        document.getElementById("situacao").innerHTML = "Aprovado com Distinção";
    } else if (m >= 7){
        document.getElementById("situacao").innerHTML = "Aprovado";
    } else {
        document.getElementById("situacao").innerHTML = "Reprovado";
    }
}

function validar_senha(){
    let nome = document.getElementById("nome").value;
    let senha = document.getElementById("senha").value;
    while (senha == nome){
        alert("ERRO: a senha não pode ser igual ao nome de usuário. Digite outra senha.");
        nome = prompt("Digite o nome:");
        senha = prompt("Digite a senha:");
    }
    alert("Usuário e senha válidos!");
}

function validar_infos(){
    let nome = document.getElementById("nome").value;
    let idade = parseInt(document.getElementById("idade").value);
    let salario = parseFloat(document.getElementById("salario").value);
    let sexo = document.getElementById("sexo").value;
    let estado_civil = document.getElementById("estado_civil").value;
    while (nome.length <= 3){
        nome = prompt("ERRO: O nome deve ter mais do que 3 caracteres. Digite outro nome:");
    }
    while (idade < 0 || idade > 150){
        idade = parseInt(prompt("ERRO: Idade inválida. Digite uma idade válida:"));
    }
    while (salario < 0){
        salario = parseFloat(prompt("ERRO: Salário deve ser maior do que 0. Digite um valor válido:"));
    }
    while (sexo != 'f' && sexo != 'm'){
        sexo = prompt("ERRO: Sexo deve ser f ou m. Digite novamente:");
    }
    while (estado_civil != 's' && estado_civil != 'c' && estado_civil != 'v' && estado_civil != 'd'){
        estado_civil = prompt("ERRO: O estado civil deve ser s, c, v ou d. Digite novamente:");
    }
    alert("Dados registrados com sucesso!");
}

function taxa_de_crescimento(){
    let pop_a = 80000;
    let pop_b = 200000;
    let anos = 0;
    while (pop_a < pop_b){
        pop_a *= 0.03;
        pop_b *= 0.015;
        anos += 1;
    }
    document.getElementById("resposta").innerHTML = "A população de A será igual ou maior do que a população de B daqui a " + anos + ", quando chegar ao valor de " + pop_a + " habitantes.";
}