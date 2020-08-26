function changeBackground(color) {
    document.body.style.background = color;
}

function remove(element) {
    element.parentElement.remove();
}
function criarElemento() {
    var name = document.getElementById("name");
    var message = document.getElementById("message");

    var newElement = `<div><text>${name.value}: ${message.value}</text><button class='btn2' onclick='remove(this)'>Excluir</button></div>`
    var newDiv = document.createElement('div');

    newDiv.innerHTML = newElement;
    var currentDiv = document.getElementById("div1");

    document.body.insertBefore(newDiv, currentDiv);
}
function abrir() {
    window.open('creditos.html', 'Créditos', 'STATUS=NO, TOOLBAR=NO, LOCATION=NO, DIRECTORIES=NO, RESISABLE=NO, SCROLLBARS=YES, TOP=10, LEFT=10, WIDTH=770, HEIGHT=400');
}
// window.addEventListener("load",function() { document.body.style.background = color; });