$(document).on('turbolinks:load', function() {
  $(".selectburden").change(function(){
    var selectburden_val = $(".selectburden").val();
    if (selectburden_val == "exhibitor_burden") {
        $('.main__section__inner__form__group__subCategory__hidden').css('display', 'block');
        $('.main__section__inner__form__group__subCategory__attention__hidden').css('display', 'block');
        $('.selectmethod-1').css('display', 'block');
        $('#hidden').css('display', 'block');
    }else if (selectburden_val == "purchaser_burden") {
        $('.main__section__inner__form__group__subCategory__hidden').css('display', 'block');
        $('.main__section__inner__form__group__subCategory__attention__hidden').css('display', 'block');
        $('.selectmethod-1').css('display', 'block');
        $('#hidden').css('display', 'block');
    }else {
        $('.main__section__inner__form__group__subCategory__hidden').css('display', 'none');
        $('.main__section__inner__form__group__subCategory__attention__hidden').css('display', 'none');
        $('.selectmethod-1').css('display', 'none');
        $('#hidden').css('display', 'block');
    }
  });
});
