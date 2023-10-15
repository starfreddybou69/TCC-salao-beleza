var slideIndex = 0;
showDivs(slideIndex);

function showDivs(n) {
    var i;
    var x = document.getElementsByClassName("slide");
    var dots = document.getElementsByClassName("btnRadio");
    if (n > x.length) {slideIndex = 0}
    if (n < 0) {slideIndex = x.length}
    for (i = 0; i < x.length; i++) {
      x[i].style.display = "none";  
    }
    for (i = 0; i < dots.length; i++) {
      dots[i].className = dots[i].className.replace(" btnPreenchido", " btnContorno");
    }
    x[slideIndex].style.display = "block";  
    dots[slideIndex].className += " btnPreenchido";
  }

  function currentDiv(n) {
    showDivs(slideIndex = n);
}


  