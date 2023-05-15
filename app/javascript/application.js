import "@hotwired/turbo-rails"
import "controllers"
import jquery from 'jquery'
import 'bootstrap'
import "trix"
import "@rails/actiontext"


window.jQuery = jquery
window.$ = jquery


$(document).ready(function() {
  $(".flash-message").addClass("show");
  
  setTimeout(function() {
    $(".flash-message").removeClass("show");
  }, 3000);
  
  $(".flash-message .close").click(function() {
    $(".flash-message").removeClass("show");
  });
  const contactField = document.getElementById('contact-field');

  if (contactField) {
    contactField.addEventListener('input', () => {
      let value = contactField.value;
      value = value.replace(/[^0-9]/g, ''); // remove all non-numeric characters
      value = value.replace(/(\d{4})(\d{1,})/, '$1-$2'); // add a dash after the first four digits
      contactField.value = value;
    });
  }
  
});

