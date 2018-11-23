function valregistration() {
    
    valor = document.getElementById("txtUser").value;
    if (valor == null || valor.length < 4 || /^\s+$/.test(valor)) {
        alert("The user must have a minimum of 4 characters.");
        return false;
    }
    valor = document.getElementById("txtPassword").value;
    if (valor == null || valor.length < 5 || /^\s+$/.test(valor)) {
        alert("The password must have a minimum of 5 characters.");
        return false;
    }
    valor = document.getElementById("txtName").value;
    if (valor == null || valor.length == 0 || /^\s+$/.test(valor)) {
        alert("The full name can not be empty.");
        return false;
    }
    valor = document.getElementById("txtEmail").value;
    if (!(/^[^@\s]+@[^@\s]+\.[^@\s]+$/.test(valor))) {
        alert("Invalid email address.");
        return false;
    }
    valor = document.getElementById("txtCity").value;
    if (valor == null || valor.length == 0 || /^\s+$/.test(valor)) {
        alert("The city can not be empty.");
        return false;
    }
    indice = document.getElementById("cboRelation").selectedIndex;
    if (indice == null || indice == 0) {
        alert("A type of relation must be selected.");
        return false;
    }
    valor = document.getElementById("txtBirth").value;
    if (!(/^\d{4}\-(0?[1-9]|1[012])\-(0?[1-9]|[12][0-9]|3[01])$/.test(valor))) {
        alert("Enter a date with the format yyyy-mm-dd.");
        return false;
    }
    indice = document.getElementById("cboSex").selectedIndex;
    if (indice == null || indice == 0) {
        alert("Select your sex.");
        return false;
    }
    indice = document.getElementById("cboLooking").selectedIndex;
    if (indice == null || indice == 0) {
        alert("Select the sex of the couple you are looking.");
        return false;
    }

    return true;
}