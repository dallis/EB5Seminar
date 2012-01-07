var redactor = {
  focus: true,
  path: '/redactor/',
  image_upload: '/dashboard/asset_photos',
  file_upload:  '/dashboard/assets',
  pathCss: '../stylesheets/',
  css: ['e.css'],
  lang: 'en'
};

$(function() {
  $(".date_picker").datepicker({
    showOn: "both",
    buttonImage: "/images/calendar_3.png",
    buttonImageOnly: true,
    dateFormat: "yy-mm-dd"
  });
  $(".flash").delay(5000).slideUp("fast").live("click", function() {$(this).slideUp("fast")});
});

var map;
var markers = {};
var infowindow;
var geocoder;
var history_markers = [];

function init_show_on_map(arr) {
  var latlng = new google.maps.LatLng(arr[0], arr[1]);
  var myOptions = {
    zoom: 13,
    center: latlng,
    mapTypeId: google.maps.MapTypeId.ROADMAP
  };
  map = new google.maps.Map(document.getElementById("map_canvas"), myOptions);
  var marker = new google.maps.Marker({
    position: latlng, 
    map: map,
    title: arr[3]
  });
};