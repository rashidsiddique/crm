$(document).ready(function(){
  $('.product_recurring_type').hide();
  $('.product_recurring_no_of_payments').hide();  
    $('#product_recurring').change(function(){
        if(this.checked){
          $('.product_recurring_type').show('slow');
          $('.product_recurring_no_of_payments').show('slow');
        }
        else{
          $('.product_recurring_type').hide('slow');
          $('.product_recurring_no_of_payments').hide('slow');
        }  
    });

  $('.product_trial_price').hide();
  $('.product_trial_days').hide();  
    $('#product_trial').change(function(){
        if(this.checked){
          $('.product_trial_price').show('slow');
          $('.product_trial_days').show('slow');
        }
        else{
          $('.product_trial_price').hide('slow');
          $('.product_trial_days').hide('slow');
        }  
    });

});