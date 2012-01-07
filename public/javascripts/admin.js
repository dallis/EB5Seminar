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
  $('.date_picker').datepicker({
    showOn: 'both',
    buttonImage: '/images/calendar_3.png',
    buttonImageOnly: true,
    dateFormat: "yy-mm-dd",
    numberOfMonths: 2
  });
  $('.single_date_picker').datepicker({
    showOn: 'both',
    buttonImage: '/images/calendar_3.png',
    buttonImageOnly: true,
    dateFormat: "yy-mm-dd",
    numberOfMonths: 1
  });
  $('.dob_picker').datepicker({
    showOn: 'both',
    buttonImage: '/images/calendar_3.png',
    buttonImageOnly: true,
    dateFormat: "d MM",
    numberOfMonths: 2
  });  
  $('.flash').delay(3000).slideUp('fast').live('click', function() {$(this).slideUp('fast')});
});

var DEFAULT_LAT = 38.370157;
var DEFAULT_LNG = -98.779297;

function init_locate_map(arr) {
  if (parseInt(arr[0]) == 0) {
    arr[0] = DEFAULT_LAT;
    arr[1] = DEFAULT_LNG;
  }
  var latlng = new google.maps.LatLng(arr[0], arr[1]);
  var myOptions = {
    zoom: 4,
    center: latlng,
    mapTypeId: google.maps.MapTypeId.ROADMAP
  };
  var map = new google.maps.Map(document.getElementById("map_canvas"), myOptions);
  var marker = new google.maps.Marker({
    position: latlng, 
    map: map,
    title: arr[3],
    draggable: true
  });
  google.maps.event.addListener(marker, 'dragend', function() {
    $("#lat").val(marker.getPosition().lat());
    $("#lng").val(marker.getPosition().lng());
    $("#accuracy").val(map.getZoom());
  });
};

var map;
var markers = {};
var infowindow;
var geocoder;
var history_markers = [];

function init_project_form() {
  $('#tabs').tabs(); 
  $("#tabs").bind('tabsselect', function(event, ui) {
    window.location.href=ui.tab;
  });
};