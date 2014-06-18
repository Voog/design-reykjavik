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

    var initContentResizer = function() {
      if ($('body.front-page').length > 0) {
        $(window).load(resizeContentRight);
        $(window).on('resize', resizeContentRight);
      }
    };

    // Toggles the mobile search modal.
    $('.js-search-btn').click(function(event) {
      event.stopPropagation();
      $(this).toggleClass('open');
      $('.js-search').toggleClass('active');
    });

    // Prevents modal closing
    $('.js-modal').click(function(event) {
      event.stopPropagation();
    });

    // Adds/removes active class to search box if input is focused.
    var handleSearchFocus = function() {
      searchForm = $('.js-search-form');
      $('.js-search-input').focus(function() {
        searchForm.addClass('active');
      }).blur(function() {
        searchForm.removeClass('active');
      });
    };

    var initSearchCancel = function() {
      $('.search-clear').on('click', function(e) {
        $(e.target).closest('.search-form').removeClass('not-empty').find('.search-input').focus().val('');
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
      initContentResizer();
      wrapTables();
      handleSearchFocus();
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
      handleColorScheme: handleColorScheme
    });

    init();
  })(jQuery);
