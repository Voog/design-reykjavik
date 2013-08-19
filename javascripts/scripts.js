$(function() {
  $('.langmenu select').change(function() {
    window.location = $(this).children(':selected').val();
  });
  
  $('.langmenu-with-popup').each(function() {
    var $popup = $(this).find('.langmenu-popup');
    $(this).find('.langmenu-content').click(function() {
        $popup.show();
        $(document).bind('click', function(event) {
            if (!$.contains($popup.get(0), event.target)) {
                $popup.hide();
                $(this).unbind('click', arguments.callee);
            }
        });
        return false;
    });
  });
  
  $('.mobile-menu-toggler').click(function() {
    $('.mobile-menu-inner').toggle();
    return false;
  });
  
  $('a.news-older-show').click(function() { $(this).addClass('no-bg'); $('.news-older-hidden').show(); return false; }); 
  
  if ($('.form_error, .form_notice, .comment-errors').length > 0) {
    var top = $('.form_error, .form_notice, .comment-errors').eq(0).offset().top - 50;
    if (top < 0) { top = 0; }
    $('html, body').scrollTop(top);
  }
  
  $('.mobile-menu-arr').click(function(event) {
    $(event.target).closest('li').toggleClass('open');
  });
  
  
});