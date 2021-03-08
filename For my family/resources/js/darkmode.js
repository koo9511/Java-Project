function isDarkMode() {
    return Cookies.get('darkmode');
    }

function darkModeSwitch(status) {
    Cookies.set('darkmode', +status);
    document.querySelector('#dark-mode-sheet').setAttribute('media', status? 'screen' : 'not screen');
    if(status == true) {
        document.getElementById('modechange').val() == 'Dark Mode';
        document.getElementById('modechange').background
    }else {
        document.getElementById('modechange').val() == 'Light Mode';
    }
}

document.addEventListener('DOMContentLoaded', function () {
    const isDm = isDarkMode();
    if (isDm != null) darkModeSwitch(+isDm);
});