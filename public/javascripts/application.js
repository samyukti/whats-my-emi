var displayEMI = function(data) {
  console.log(data);
  $('.results').removeClass('bg-success').removeClass('bg-danger');
  if (isNumber(data.payment)) { $('.results').addClass('bg-success'); }
  else { $('.results').addClass('bg-danger'); }
  $('.results').text(data.payment);
};

var getEMI = function (event) {
  url = $('form#form_emi').data('action')
  principal = $('input#principal').val();
  rate = $('input#rate').val();
  term = $('input#term').val();
  query = '?p=' + principal + '&r=' + rate + '&t=' + term
  $.ajax(url+query)
   .done(displayEMI);
  event.preventDefault();
};

var handleSubmit = function () {
  $('#get_emi').click(getEMI);
};

var isNumber = function (n) {
  return !isNaN(parseFloat(n)) && isFinite(n);
}

// main
handleSubmit();
