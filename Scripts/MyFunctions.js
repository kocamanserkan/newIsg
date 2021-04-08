function myFunction(msg, olay) {
    if (olay == "succsess") {
        var x = document.getElementById("snackbar");
        x.style.backgroundColor = "green"
        x.style.fontSize = "25px";
        x.innerHTML = msg;

        x.className = "show";
        setTimeout(function () { x.className = x.className.replace("show", ""); }, 3000);
        $("#snackbar").show()
    } else if (olay == "fail") {

        var x = document.getElementById("snackbar");
        x.style.backgroundColor = "red"
        x.innerHTML = msg;
        x.className = "show";
        setTimeout(function () { x.className = x.className.replace("show", ""); }, 3000);
        $("#snackbar").show()
    }
    else {
        x.innerHTML = msg;

        var x = document.getElementById("snackbar");
        x.innerHTML = msg
        x.style.fontSize = "25px";
        x.className = "show";
        setTimeout(function () { x.className = x.className.replace("show", ""); }, 3000);
        $("#snackbar").show()

    }
}