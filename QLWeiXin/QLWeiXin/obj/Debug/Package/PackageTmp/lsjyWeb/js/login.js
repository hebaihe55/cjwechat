function onlyNumber() {
    if (event.keyCode == 13) {
        return true;
    }
    if (event.keyCode < 48 || event.keyCode > 57) {
        event.keyCode = 0;
        event.returnValue = false;
    }
    event.returnValue = true;
}