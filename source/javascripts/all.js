//= require_tree .
function initMap() {
  var uluru = { lat: 48.559537, lng: -4.680069 };
  var map = new google.maps.Map(document.getElementById('map'), {
    zoom: 13,
    center: uluru
  });
  var marker = new google.maps.Marker({
    position: uluru,
    map: map
  });
}

$(function () {

  var scrollLink = $('.scroll');

  // Smooth scrolling
  scrollLink.click(function (e) {
    e.preventDefault();
    $('body,html').animate({
      scrollTop: $(this.hash).offset().top
    }, 1000);
  });

  // Active link switching
  $(window).scroll(function () {
    var scrollbarLocation = $(this).scrollTop();

    scrollLink.each(function () {

      var sectionOffset = $(this.hash).offset().top - 20;

      if (sectionOffset <= scrollbarLocation) {
        $(this).parent().addClass('active');
        $(this).parent().siblings().removeClass('active');
      }
    })

  })

})

$(function () {
  var slider = $(".slider").flickity({
    imagesLoaded: true,
    percentPosition: false,
    prevNextButtons: false, //true = enable buttons
    initialIndex: 1,
    pageDots: false, //true = enable dots
    groupCells: 1,
    selectedAttraction: 0.2,
    friction: 0.8,
    draggable: true,
    autoPlay: true
  });

  //this enables clicking on slides
  slider.on(
    "staticClick.flickity",
    function (event, pointer, cellElement, cellIndex) {
      if (typeof cellIndex == "number") {
        slider.flickity("selectCell", cellIndex);
      }
    }
  );

  //this resizes the slides and centers the carousel because it tends to move a few pixels to the right if .resize() and .reposition() aren't used
  var flkty = slider.data("flickity");
  flkty.selectedElement.classList.add("is-custom-selected");
  flkty.resize();
  flkty.reposition();
  let time = 0;
  function reposition() {
    flkty.reposition();
    if (time++ < 10) {
      requestAnimationFrame(reposition);
    } else {
      $(".flickity-prev-next-button").css("pointer-events", "auto");
    }
  }
  requestAnimationFrame(reposition);

  //this expands the slides when in focus
  flkty.on("settle", () => {
    $(".slide").removeClass("is-custom-selected");
    $(".flickity-prev-next-button").css("pointer-events", "none");
    flkty.selectedElement.classList.add("is-custom-selected");

    let time = 0;
    function reposition() {
      flkty.reposition();
      if (time++ < 10) {
        requestAnimationFrame(reposition);
      } else {
        $(".flickity-prev-next-button").css("pointer-events", "auto");
      }
    }
    requestAnimationFrame(reposition);
  });

  //this reveals the carousel
  $(".carousel").addClass("animation-reveal");
  $(".carousel").css("opacity", "0");
  flkty.resize();
  flkty.reposition();
  setTimeout(() => {
    $(".carousel").removeClass("animation-reveal");
    $(".carousel").css("opacity", "1");
    flkty.resize();
    flkty.reposition();
    let time = 0;
    function reposition() {
      flkty.reposition();
      if (time++ < 10) {
        requestAnimationFrame(reposition);
      }
    }
    requestAnimationFrame(reposition);
  }, 1000);
});
