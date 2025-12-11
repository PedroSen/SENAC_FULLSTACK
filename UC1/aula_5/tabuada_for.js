function calcular(){
    var numero = parseInt(document.getElementById("numero").value);
    var tabuada = "";
    for(i=0; i<=10; ++i){
        tabuada += "<br>" + numero + " X " + i + " = " + numero * i;
    }
    document.getElementById("resposta").innerHTML = tabuada;
}