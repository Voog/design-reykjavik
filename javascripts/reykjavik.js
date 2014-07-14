(function($)
{
    /**
     * Auto-growing textareas; technique ripped from Facebook
     *
     * http://github.com/jaz303/jquery-grab-bag/tree/master/javascripts/jquery.autogrow-textarea.js
     */
    $.fn.autogrow = function(options)
    {
        return this.filter('textarea').each(function()
        {
            var self         = this;
            var $self        = $(self);
            var minHeight    = $self.height();
            var noFlickerPad = $self.hasClass('autogrow-short') ? 0 : parseInt($self.css('lineHeight')) || 0;

            var shadow = $('<div></div>').css({
                position:    'absolute',
                top:         -10000,
                left:        -10000,
                width:       $self.width(),
                fontSize:    $self.css('fontSize'),
                fontFamily:  $self.css('fontFamily'),
                fontWeight:  $self.css('fontWeight'),
                lineHeight:  $self.css('lineHeight'),
                resize:      'none',
                'word-wrap': 'break-word'
            }).appendTo(document.body);

            var update = function(event)
            {
                var times = function(string, number)
                {
                    for (var i=0, r=''; i<number; i++) r += string;
                    return r;
                };

                var val = self.value.replace(/</g, '&lt;')
                                    .replace(/>/g, '&gt;')
                                    .replace(/&/g, '&amp;')
                                    .replace(/\n$/, '<br/>&nbsp;')
                                    .replace(/\n/g, '<br/>')
                                    .replace(/ {2,}/g, function(space){ return times('&nbsp;', space.length - 1) + ' ' });

                // Did enter get pressed?  Resize in this keydown event so that the flicker doesn't occur.
                if (event && event.data && event.data.event === 'keydown' && event.keyCode === 13) {
                    val += '<br />';
                }

                shadow.css('width', $self.width());
                shadow.html(val + (noFlickerPad === 0 ? '...' : '')); // Append '...' to resize pre-emptively.
                $self.height(Math.max(shadow.height() + noFlickerPad, minHeight));
            }

            $self.change(update).keyup(update).keydown({event:'keydown'},update);
            $(window).resize(update);

            update();
        });
    };
})(jQuery);


;(function($) {
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

  $('.mobile-menu-btn').click(function() {
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

  // SWITCHES THE SITE LANGUAGE TO THE SELECTED VALUE FROM THE LANGUAGE MENU
  var handleLanguageSwitch = function() {
    $('.menu-lang').find('.menu').change(function() {
      var language = $(this).find(':selected');
      window.location = language.val();
      $(this).prev().text(language.text());
    });
  };

  // SHOWS/HIDES THE POPOVER MAIN MENU (VISIBLE ON SMALLES SCREENS)
  var toggleMainMenu = function() {
    $('.mobile-menu-btn').click(function() {
      $(this).toggleClass('open');
      $('.mobile-menu-main').toggleClass('expanded');
    });
  };

  // HIDES THE POPOVER MAIN MENU IF CICKED ANYWHERE ELSE THAN THE MENU ITSELF (VISIBLE ON SMALLES SCREENS)
  var handlePopoverMenuHide = function() {
    $('html').click(function() {
      if ($('.mobile-lang-menu-popover').hasClass('expanded')) {
        $('.mobile-lang-menu-popover').removeClass('expanded');
      }
    });
  };

  // REDUCES OPACITY OF THE GALLERY IMAGES THAT ARE NOT UNDER THE CURSOR
  var handleGalleryHover = function() {
    $('.edys-gallery-item').mouseover(function() {
      $(this).siblings('.edys-gallery-item').find('.edys-gallery-image').addClass('inactive');
    });

    $('.edys-gallery-item').mouseout(function() {
      $(this).siblings('.edys-gallery-item').find('.edys-gallery-image').removeClass('inactive');
    });
  };

  // SCROLLS TO THE COMMENT-FORM IF COMMENT SUBMIT FAILED (TO SHOW THE ERROR MESSAGES TO THE USER)
  var focusCommentsWithErrors = function() {
    $(document).ready(function() {
      if ($('.comment-form').hasClass('form_with_errors') === true) {
        $('html, body').scrollTop($('.comment-form').offset().top);
      }
    });
  };

  // TODO: Remove if Edicy is going to wrap table with the container
  var wrapTables = function() {
    $('.content-formatted table').wrap('<div class="table-container overthrow"></div>');
  };

  // CHECK THE PRESENCE OF THE SCROLLBAR
  var checkScrollBar = function() {
    jQuery.fn.hasScrollBar = function(direction) {
      if (direction == 'vertical') {
        return this.get(0).scrollHeight > this.innerHeight();
      } else if (direction == 'horizontal') {
        return this.get(0).scrollWidth > this.innerWidth();
      }
      return false;
    }
  };

  // ADDS HORIZONTAL SCROLL TO TABLES THAT DON'T FIT INTO THE CONTENT AREA
  var handleTableHorizontalScrolling = function() {
    $.each($('.table-container'), function() {
      if ($(this).hasScrollBar('horizontal') === true) {
        $(this).addClass('horizontal-scroll');
      } else {
        $(this).removeClass('horizontal-scroll');
      }
    });
  };

  // INITIATES THE TABLE HORISONTAL SCROLL FUNCTION WHEN WINDOW IS RESIZED
  var handleWindowResize = function() {
    $(window).resize(function() {
      handleTableHorizontalScrolling();
    });
  };

  var handleColorScheme = function() {
    color = $('.global-background-color').css('background-color');

    if (color) {
      var getRGBA = function(colorStr) {
        if (!colorStr || typeof colorStr !== 'string') {
          return;
        }

        var arr = colorStr.match(/(\s*(\d+)\s*,\s*(\d+)\s*,\s*(\d+)\s*,?\s*([\d\.]+)?\s*)/);
        if (arr) {
          return {
            r: +arr[2],
            g: +arr[3],
            b: +arr[4],
            a: (arr[5]) ? +arr[5] : 1
          };
        }
      };

      var parsedColor = getRGBA(color),
      rgbLightness = (parsedColor.r * 0.2126 + parsedColor.g * 0.7152 + parsedColor.b * 0.0722) / 255;

      if (rgbLightness > 0.6) {
        $('body').addClass('light-background').removeClass('dark-background');
      } else {
        $('body').addClass('dark-background').removeClass('light-background');
      }
    }
  };

  $('html').on('click', '.voog-search-modal', function(e) {
    e.stopPropagation();
  });

  $('html').click(function() {
    if ($('.js-popover').hasClass('expanded')) {
      $('.js-popover').removeClass('expanded');
    }

    if ($('.js-modal-overlay').hasClass('active')) {
      $('.js-modal-overlay').removeClass('active');
    }
  });

    // Initiations
    var initBlogPage = function() {
      // ADD BLOG LISTING VIEW SPECIFIC FUNCTIONS HERE
    };

    var initArticlePage = function() {
      // ADD SINGLE POST VIEW SPECIFIC FUNCTIONS HERE
      focusCommentsWithErrors();
    };

    var initCommonPage = function() {
      // ADD COMMON PAGE SPECIFIC FUNCTIONS HERE
      handleFormFieldClick();
      focusCommentsWithErrors();
    };

    var initFrontPage = function() {
      $(window).load(function() {
        resizeContentRight();
        if (($('.content-body').children().length < 1) && ($('.content-body').text().trim().length == 0)) {
          $('.content-body').hide();
        }
      });
      $(window).on('resize', resizeContentRight);
    };

    var resizeTimeout;
    var resizeContentRight = function() {
      clearTimeout(resizeTimeout);
      resizeTimeout = setTimeout(function() {
        var height = parseInt($('.content-left .content-header').parent().css('height')),
            padding = parseFloat($('.content-right').css('padding'));
        height += parseInt($('.content-left .news').parent().css('height'));
        $('.content-right').css('min-height', height - 2 * padding);
      }, 200);
    };

    // Toggles the mobile search modal.
    $('.js-search-btn').click(function(event) {
      event.stopPropagation();
      $(this).toggleClass('open');
      $('.js-search').toggleClass('active');

      if ($('.js-modal-overlay').hasClass('active')) {
        $('.js-search-input').focus();
      }
    });

    // Prevents modal closing
    $('.js-modal-overlay').on('click', 'form', function(event) {
      event.stopPropagation();
    });

    var initSearchCancel = function() {
      $('.search-input').on('keyup', function(e) {
        $input = $(e.target);
        if (e.keyCode != 27 && $input.val()) {
          $input.parent().find('.search-submit').hide();
          $input.parent().find('.search-clear').show();
        }
      });
      $('.search-form').on('click', '.search-clear', function(e) {
        $(e.target).closest('.search-form').removeClass('not-empty').find('.search-input').focus().val('');
        $(e.target).hide();
        $('.voog-search-modal').remove();
        $(e.target).closest('.search-form').find('.search-submit').show();
      });
    };

    var init = function() {
      // ADD SITE WIDE FUNCTIONS HERE
      handleLanguageSwitch();
      toggleMainMenu();
      handleColorScheme();
      handlePopoverMenuHide();
      handleGalleryHover();
      handleWindowResize();
      initFrontPage();
      wrapTables();
      initSearchCancel();
      if ($('.table-container').length > 0) {
        checkScrollBar();
        handleTableHorizontalScrolling();
      }
    };

    // ENABLES THE USAGE OF THE INITIATIONS OUTSIDE THIS FILE
    window.site = $.extend(window.site || {}, {
      initBlogPage: initBlogPage,
      initArticlePage: initArticlePage,
      initCommonPage: initCommonPage,
      initFrontPage: initFrontPage,
      handleColorScheme: handleColorScheme
    });

    init();
  })(jQuery);