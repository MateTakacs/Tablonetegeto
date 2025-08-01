/**
 * 
 * Kezdő képernyő második részénél scroll animation.
 * Görgetéskor figyeli a windowheight értékét.
 * 
 * Ha az elem mérete nagyobb mint a windowheight fele akkor megcseréli a divhez tartozó osztályt.
 * 
 * 
 */


function reveal() {
    var reveals = document.querySelectorAll(".reveal");
  
    for (var i = 0; i < reveals.length; i++) {
      var windowHeight = window.innerHeight;
      var elementTop = reveals[i].getBoundingClientRect().top;
      var elementVisible = 150;
  
      if (elementTop < windowHeight - elementVisible) {
        reveals[i].classList.add("active");
      } else {
        reveals[i].classList.remove("active");
      }
    }
  }
  
  window.addEventListener("scroll", reveal);