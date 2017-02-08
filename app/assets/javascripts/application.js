// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require jquery.mobile

$(function() {
  var xhrSetControl;

  $('.slider-control').on('slidestop', function(event, ui) { 
    event.preventDefault()

    setControl(this)
  })

  $('.select-control').on('change', function(event, ui) {
    event.preventDefault()

    setControl(this)
  })

  $('.button-control').on('click', function(event, ui) {
    event.preventDefault()

    setControl(this)
  })

  function setControl(self) {
    if (xhrSetControl) {
      xhrSetControl.abort()
    }

    var device_id = $('#device_id').val()
    var field = $(self).attr('id').replace('device_', '') // get the field name - like control_19
    var value = $(self).val()

    var data = { field: field, value: value }

    xhrSetControl = $.ajax({
      method: 'POST',
      url: '/api/v0/devices/' + device_id + '/set_control',
      data: data
    }).done(function() {
    }).fail(function(resp, textStatus, error) {
      alert(resp.responseJSON.error)
    })
  }
})

