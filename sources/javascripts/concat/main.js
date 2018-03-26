;(function($) {

  // ===========================================================================
  // Binds site search functionality.
  // ===========================================================================
  var bindSiteSearch = function(searchForm, languageCode, noResultsString) {
    if (searchForm) {
      var search = new VoogSearch(searchForm, {
        // This defines the number of results per query.
        per_page: 10,
        // Language code for restricting the search to page language.
        lang: languageCode,
        // If given, an DOM element results are rendered inside that element
        resultsContainer: $('.js-voog-search-moda').get(0),
        // Defines if modal should close on sideclick.
        sideclick: true,
        // Mobile checkpoint.
        mobileModeWidth: 752,
        // Updates results on every keypress.
        updateOnKeypress: true,
        // String for feedback if no results are found.
        noResults: noResultsString
      });
    }
  };

  var editmode = function () {
    return $('html').hasClass('editmode');
  };

  // Remove comments if debouncing is used.
  // Function to limit the rate at which a function can fire.
  // var debounce = function(func, wait, immediate) {
  //   var timeout;
  //   return function() {
  //     var context = this, args = arguments;
  //     var later = function() {
  //       timeout = null;
  //       if (!immediate) func.apply(context, args);
  //     };
  //     var callNow = immediate && !timeout;
  //     clearTimeout(timeout);
  //     timeout = setTimeout(later, wait);
  //     if (callNow) func.apply(context, args);
  //   };
  // };

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

  $('a.news-older-show').click(function() { $(this).addClass('no-bg'); $('.news-older-hidden').show(); return false; });

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

  // SCROLLS TO THE COMMENT-FORM IF COMMENT SUBMIT FAILED (TO SHOW THE ERROR MESSAGES TO THE USER)
  var focusFormWithErrors = function() {
    $(document).ready(function() {
      if ($('.comment-form').hasClass('form_with_errors')) {
        $('html, body').scrollTop($('.comment-form').offset().top);
      } else if ($('form').find('.form_error, .form_notice').length > 0) {
        $('html, body').scrollTop($('.form_error, .form_notice').closest('form').offset().top);
      }
    });
  };

  // TODO: Remove if Edicy is going to wrap table with the container
  var wrapTables = function() {
    if (!editmode()) {
      $('.content-formatted table').wrap('<div class="table-container overthrow"></div>');
    }
  };

  // Initiates the functions when window is resized.
  var handleWindowResize = function() {
    // Add functions that should be trgiggered while resizing the window here.
    // Example:
    // $(window).resize(debounce(yourFunctionName, 3000));
  };

  var colorSum = function(bgColor, fgColor) {
    if (bgColor && fgColor) {
      if (typeof bgColor == 'string') {
        bgColor = bgColor.replace(/rgba?\(/,'').replace(/\)/,'').split(',');
        $.each(bgColor, function(n, x) {bgColor[n] = +x;});
      }
      if (typeof fgColor == 'string') {
        fgColor = fgColor.replace(/rgba?\(/,'').replace(/\)/,'').split(',');
        $.each(fgColor, function(n, x) {fgColor[n] = +x;});
      }
      if (typeof bgColor == 'object' && bgColor.hasOwnProperty('length')) {
        if (bgColor.length == 3) { bgColor.push(1.0); }
      }
      if (typeof fgColor == 'object' && fgColor.hasOwnProperty('length')) {
        if (fgColor.length == 3) { fgColor.push(1.0); }
      }
      var result = [0, 0, 0, 0];
      result[3] = 1 - (1 - fgColor[3]) * (1 - bgColor[3]);
      if (result[3] === 0) { result[3] = 1e-6; }
      result[0] = Math.min(fgColor[0] * fgColor[3] / result[3] + bgColor[0] * bgColor[3] * (1 - fgColor[3]) / result[3], 255);
      result[1] = Math.min(fgColor[1] * fgColor[3] / result[3] + bgColor[1] * bgColor[3] * (1 - fgColor[3]) / result[3], 255);
      result[2] = Math.min(fgColor[2] * fgColor[3] / result[3] + bgColor[2] * bgColor[3] * (1 - fgColor[3]) / result[3], 255);
      return $.map(result, function(e) { return Math.floor(e); });
    }
  };

  var getCombinedColor = function(bgColor, fgColor) {
    var sum = colorSum(bgColor || [255,255,255,1], fgColor || [255,255,255,1]);
    return sum;
  };

  var getCombinedLightness = function(bgColor, fgColor) {
    var combinedColor = getCombinedColor(bgColor, fgColor);
    var color = Math.round(((+combinedColor[0]) * 0.2126 + (+combinedColor[1]) * 0.7152 + (+combinedColor[2]) * 0.0722) / 2.55) / 100;
    return color;
  };

  var handleHeaderColorScheme = function(lightness) {
    if (typeof lightness != 'undefined') {
      if (lightness > 0.6) {
        $('.header-wrapper').addClass('light').removeClass('dark');
      } else {
        $('.header-wrapper').addClass('dark').removeClass('light');
      }
    }
  };

  var handleColorScheme = function(lightness) {
    if (typeof lightness != 'undefined') {
      if (lightness > 0.6) {
        $('body').addClass('light-background').removeClass('dark-background');
      } else {
        $('body').addClass('dark-background').removeClass('light-background');
      }
    }
  };

  getPhotoByWidth = function(sizes, targetWidth) {
    var photo = null,
        diff, prevDiff;

    for (var i = sizes.length; i--;) {
      diff = (sizes[i].width - targetWidth);
      if (
        (!sizes[i].thumbnail || sizes[i].thumbnail !== "medium") && (
          !photo ||
          (prevDiff < 0 && diff >= 0) ||
          ((prevDiff >= 0 && diff >=0 || prevDiff < 0 && diff < 0) && Math.abs(diff) < Math.abs(prevDiff))
        )
      ) {
        photo = sizes[i].url;
        prevDiff = diff;
      }
    }

    return photo;
  };

  getPhotoByHeight = function(sizes, targetHeight) {
    var photo = null,
        diff, prevDiff;

    for (var i = sizes.length; i--;) {
      diff = (sizes[i].height - targetHeight);
      if (
        (!sizes[i].thumbnail || sizes[i].thumbnail !== "medium") && (
          !photo ||
          (prevDiff < 0 && diff >= 0) ||
          ((prevDiff >= 0 && diff >=0 || prevDiff < 0 && diff < 0) && Math.abs(diff) < Math.abs(prevDiff))
        )
      ) {
        photo = sizes[i].url;
        prevDiff = diff;
      }
    }

    return photo;
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

  var bindFallbackHeaderLeftWidthCalculation = function() {
    var headerWidth = $('.js-header').width(),
        headerRight = $('.js-header-right'),
        headerRightWidth = headerRight.width();

    $('.js-header-left').css('min-width', headerWidth - headerRightWidth);
  };

    // Initiations
    var initBlogPage = function() {
      // ADD BLOG LISTING VIEW SPECIFIC FUNCTIONS HERE
    };

    var initArticlePage = function() {
      // ADD SINGLE POST VIEW SPECIFIC FUNCTIONS HERE
      focusFormWithErrors();
    };

    var initCommonPage = function() {
      // ADD COMMON PAGE SPECIFIC FUNCTIONS HERE
      focusFormWithErrors();
    };

    var initFrontPage = function() {
      $(window).on('load', function() {
        resizeContentRight();
        if (($('.content-body').children().length < 1) && ($('.content-body').text().trim().length === 0)) {
          $('.content-body').hide();
        }
      });
      $(window).on('resize', resizeContentRight);
      focusFormWithErrors();
    };

    var resizeTimeout;
    var resizeContentRight = function() {
      clearTimeout(resizeTimeout);
      resizeTimeout = setTimeout(function() {
        var height = parseInt($('.content-left .content-header').parent().css('height')),
            padding = parseFloat($('.content-right').css('padding-top'));
        height += parseInt($('.content-left .news').parent().css('height'));
        $('.content-right').css('min-height', height - 2 * padding);
        $('.frontpage-cover-image').removeClass('hidden');
        $('.frontpage-cover-color').removeClass('hidden');
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
        var form = $(e.target).closest('.search-form');
        form.removeClass('not-empty').find('.search-input').focus().val('');
        $(e.target).hide();
        $('.voog-search-modal').removeClass('search-results-active');
        form.find('.search-submit').show();
        form.find('input').blur();
      });
    };

    var addMobileMenuResizeListener = function() {
      $(window).on('resize', function() {
        if ($(window).innerWidth() > 752) {
          $('.mobile-menu-btn').removeClass('open');
          $('.mobile-menu-main').removeClass('expanded');
        }
      });
    };

    var bindCustomTexteditorStyles = function(buttonTranslation) {
      window.edy = window.edy || [];
      edy.push(['texteditorStyles', {name: buttonTranslation, tagname:'a', attribute: {'href': '#'}, classname: 'custom-btn', toggle: true}]);
    };

    var init = function() {
      // ADD SITE WIDE FUNCTIONS HERE
      handleLanguageSwitch();
      toggleMainMenu();
      handleColorScheme();
      handlePopoverMenuHide();
      handleWindowResize();
      initFrontPage();
      wrapTables();
      initSearchCancel();
      addMobileMenuResizeListener();

      if (!Modernizr.flexbox && editmode()) {
        bindFallbackHeaderLeftWidthCalculation();
      };
    };

    // ENABLES THE USAGE OF THE INITIATIONS OUTSIDE THIS FILE
    window.site = $.extend(window.site || {}, {
      initBlogPage: initBlogPage,
      initArticlePage: initArticlePage,
      initCommonPage: initCommonPage,
      initFrontPage: initFrontPage,
      handleColorScheme: handleColorScheme,
      getCombinedLightness: getCombinedLightness,
      handleHeaderColorScheme: handleHeaderColorScheme,
      getPhotoByWidth: getPhotoByWidth,
      getPhotoByHeight: getPhotoByHeight,
      bindCustomTexteditorStyles: bindCustomTexteditorStyles,
      bindSiteSearch: bindSiteSearch
    });

    init();
  })(jQuery);
