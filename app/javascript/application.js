import "@hotwired/turbo-rails"
import "controllers"
import jquery from 'jquery'
import 'bootstrap'

window.jQuery = jquery
window.$ = jquery
import toastr from "toastr";


$(document).ready(function() {
  $(".flash-message").addClass("show");
  
  setTimeout(function() {
    $(".flash-message").removeClass("show");
  }, 3000);
  
  $(".flash-message .close").click(function() {
    $(".flash-message").removeClass("show");
  });
  const contactField = document.getElementById('contact-field');

  contactField.addEventListener('input', () => {
    let value = contactField.value;
    value = value.replace(/[^0-9]/g, ''); // remove all non-numeric characters
    value = value.replace(/(\d{4})(\d{1,})/, '$1-$2'); // add a dash after the first four digits
    contactField.value = value;
  });
  
});
document.addEventListener("DOMContentLoaded", () => {
  const toastrContainer = document.getElementById("toastr-container");

  if (toastrContainer) {
    const notice = toastrContainer.dataset.notice;
    const alert = toastrContainer.dataset.alert;

    if (notice) {
      toastr.success(notice);
    }

    if (alert) {
      toastr.error(alert);
    }
  }
});
