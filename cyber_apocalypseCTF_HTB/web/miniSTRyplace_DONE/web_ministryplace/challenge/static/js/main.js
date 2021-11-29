function initParallax() {
    var platform = navigator.platform.toLowerCase();
  
    if (platform.indexOf('ipad') == -1 && platform.indexOf('iphone') == -1) {
      window.addEventListener("scroll", function (event) {
        setLayerPositions();
      });
      setLayerPositions();
    }
  }
  
  function setLayerPositions() {
    var top = this.pageYOffset;
  
    var layers = document.getElementsByClassName("parallax");
    var layer, speed, yPos;
    for (var i = 0; i < layers.length; i++) {
      layer = layers[i];
      speed = layer.getAttribute('data-speed');
      //var offset = layer.getAttribute('data-offset') || 0;
      //console.log(offset);
      var yPos = -((top - layer.parentNode.offsetTop) * speed / 100);
      // layer.setAttribute('style', 'transform: translate3d(0px, ' + yPos + 'px, 0px)');
      layer.setAttribute('style', 'background-position-y: ' + yPos + 'px');
    }
  }
  
  initParallax();  