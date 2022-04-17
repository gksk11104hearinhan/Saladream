/**
 * 
 */


/* Demo purposes only 
$(".hover").mouseleave(
  function () {
    $(this).removeClass("hover");
  }
);*/




/*====================이미지 슬라이드=======================*/

var $owl = $('.loop');
  
$owl.owlCarousel({
    autoplay: true,
    autoplayHoverPause: true,
    autoplayTimeout: 3000,
    autoplaySpeed: 800,
    center: true,
    items: 1.4,
    stagePadding: 15,
    loop: true,
    margin: 15,
  animateOut: 'slide-up',
animateIn: 'slide-down',
});