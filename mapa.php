<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
    "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xmlns:v="urn:schemas-microsoft-com:vml">
  <head>
	<?php
		$zoom = $HTTP_GET_VARS['zoom'];
		$x = $HTTP_GET_VARS['x'];
		$y = $HTTP_GET_VARS['y'];
	?> 
    <meta http-equiv="content-type" content="text/html; charset=utf-8"/>
    <title>Google Maps JavaScript API Example: Map Info Window</title>
    <script src="http://maps.google.com/maps?file=api&amp;v=2&amp;key=ABQIAAAAmZgtzdLBGHJ1d9lamdJnWRRAcirMwY74AIoLlumIoF7A126zdRRYZw8FItpIUy7ZfxQxzGscRNhFCQ"
            type="text/javascript"></script>
    <script type="text/javascript">

    function initialize() {
      if (GBrowserIsCompatible()) {
        var map = new GMap2(document.getElementById("map_canvas"));
        map.setCenter(new GLatLng(<? echo $x?>,<? echo $y?>), <? echo $zoom ?> );
      }
    }

    </script>
  </head>

  <body onload="initialize()" onunload="GUnload()">
    <div id="map_canvas" style="width: 320px; height: 416px"></div>
  </body>
</html>



