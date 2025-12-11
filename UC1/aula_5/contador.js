function calcular(){
    var num = parseFloat(document.getElementById("numero").value);
    var i = 0;
    var resp = "<br>"
    while(i <= 10){
        num = i;
        resp += num + "<br>"
        i++;
    }
    document.getElementById("resposta").innerHTML = resp
}