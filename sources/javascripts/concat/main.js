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
        resultsContainer: $('.js-voog-search-modal').get(0),
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

  // Function to limit the rate at which a function can fire.
  var debounce = function(func, wait, immediate) {
    var timeout;
    return function() {
      var context = this, args = arguments;
      var later = function() {
        timeout = null;
        if (!immediate) func.apply(context, args);
      };
      var callNow = immediate && !timeout;
      clearTimeout(timeout);
      timeout = setTimeout(later, wait);
      if (callNow) func.apply(context, args);
    };
  };

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

    // ===========================================================================
    // Sets functions that will be initiated on items list layouts.
    // ===========================================================================
    var initItemsPage = function() {
      if (!editmode()) {
        bindContentItemImageLazyload();
      }
    };

    // ===========================================================================
    // Toggles product categories visibility in main menu.
    // ===========================================================================
    var bindRootItemSettings = function(rootItemValuesObj) {
      if (!('show_product_related_pages_in_main_menu' in rootItemValuesObj)) {
        rootItemValuesObj.show_product_related_pages_in_main_menu = false;
      }

      $('.js-root-item-settings-toggle').each(function(index, languageMenuSettingsButton) {
        var rootItemSettingsEditor = new Edicy.SettingsEditor(languageMenuSettingsButton, {
          menuItems: [
            {
              "titleI18n": "show_in_main_menu",
              "type": "checkbox",
              "key": "show_product_related_pages_in_main_menu",
              "states": {
                "on": true,
                "off": false
              }
            }
          ],

          buttonTitleI18n: "settings",

          values: rootItemValuesObj,

          containerClass: ['js-root-item-settings-popover', 'js-prevent-sideclick'],

          preview: function(data) {
            if (!data.show_product_related_pages_in_main_menu === true) {
              $('.js-menu-item-products').addClass('is-hidden');
            } else {
              $('.js-menu-item-products').removeClass('is-hidden');
            }
          },

          commit: function(data) {
            siteData.set('settings_root_item', data);
          }
        });
      });
    };

    // ===========================================================================
    // Binds editmode image drop areas.
    // ===========================================================================
    var bindContentItemImgDropAreas = function(placeholderText) {
      $('.js-content-item-img-drop-area').each(function(index, imgDropAreaTarget) {
        var $imgDropAreaTarget = $(imgDropAreaTarget),
            $contentItemBox = $imgDropAreaTarget.closest('.js-content-item-box'),
            itemId = $contentItemBox.data('item-id'),
            itemType = $contentItemBox.data('item-type'),
            itemData = new Edicy.CustomData({
              type: itemType,
              id: itemId
            });

        var imgDropArea = new Edicy.ImgDropArea($imgDropAreaTarget, {
          positionable: false,
          target_width: 1280,
          placeholder: '<div class="edy-img-drop-area-placeholder">' + placeholderText + '</div>',
          removeBtn: '<div class="edy-img-drop-area-remove-image">' +
                        '<div class="edy-img-drop-area-remove-image-ico">' +
                          '<svg width="16" height="20" viewBox="0 0 26 30" xmlns="http://www.w3.org/2000/svg">' +
                            '<g fill-rule="nonzero" fill="currentColor">' +
                              '<g transform="translate(2 5)">' +
                                '<path d="M0 .997h2V21c0 1 1 2 2 2h14c1 0 2-1 2-2V1h2v20c0 2.25-1.75 4-4 4H4c-2.25 0-4-1.75-4-4V.997z"/>' +
                                '<rect x="10" y="4" width="2" height="16" rx="1"/>' +
                                '<rect x="5" y="4" width="2" height="16" rx="1"/>' +
                                '<rect x="15" y="4" width="2" height="16" rx="1"/>' +
                              '</g>' +
                              '<path d="M26 4v2H0V4h7V2c0-1 1-2 2-2h8c1 0 2 1 2 2v2h7zM9 4h8V3c0-.5-.5-1-1-1h-6c-.5 0-1 .5-1 1v1z"/>' +
                            '</g>' +
                          '</svg>' +
                        '</div>' +
                      '</div>',

          change: function(data) {
            var imageId;

            $imgDropAreaTarget
              .removeClass('is-cropped')
              .addClass('not-cropped')
              .css('opacity', .1)
            ;

            if (data) {
              imageId = data.original_id;

              $contentItemBox
                .removeClass('without-image is-loaded with-error')
                .addClass('with-image not-loaded')
              ;

              setImageOrientation($contentItemBox, data.width, data.height);
            } else {
              imageId = null;

              $contentItemBox
                .removeClass('with-image is-loaded with-error')
                .addClass('without-image not-loaded')
              ;

              $contentItemBox.find('.edy-img-drop-area-placeholder').css('opacity', 0);
            }

            setItemImage($contentItemBox, $imgDropAreaTarget, itemId, imageId, itemType);
          }
        });
      });
    };

    var setImageOrientation = function($contentItemBox, width, height) {
      var $imgDropAreaTarget = $contentItemBox.find('.js-content-item-img-drop-area'),
          $cropToggleButton = $contentItemBox.find('.js-toggle-crop-state');

      if (width > height) {
        $imgDropAreaTarget
          .removeClass('image-landscape image-square image-portrait')
          .addClass('image-landscape')
        ;
      } else if (width === height) {
        $imgDropAreaTarget
          .removeClass('image-landscape image-square image-portrait')
          .addClass('image-square')
        ;
      } else {
        $imgDropAreaTarget
          .removeClass('image-landscape image-square image-portrait')
          .addClass('image-portrait')
        ;
      }

      if ($imgDropAreaTarget.hasClass('image-square')) {
        $cropToggleButton
          .removeClass('is-visible')
          .addClass('is-hidden')
        ;
      } else {
        $cropToggleButton
          .removeClass('is-hidden')
          .addClass('is-visible')
        ;
      }
    };

    var setItemImage = function($contentItemBox, $imgDropArea, itemId, imageId, itemType) {
      var apiType = itemType === 'article' ? 'articles' : 'pages',
          itemData = new Edicy.CustomData({
            type: itemType,
            id: itemId
          });

      $.ajax({
         type: 'PATCH',
         contentType: 'application/json',
         url: '/admin/api/' + apiType +'/' + itemId,
         data: JSON.stringify({'image_id': imageId}),
         dataType: 'json',
         success: function(data) {
           itemData.set('image_crop_state', 'not-cropped');
           $contentItemBox.removeClass('not-loaded with-error').addClass('is-loaded');
           $contentItemBox.find('.edy-img-drop-area-placeholder').css('opacity', 1);
           $imgDropArea.css('opacity', 1);
         },
         timeout: 30000,
         error: function(data) {
           $contentItemBox.removeClass('not-loaded is-loaded with-error').addClass('with-error');
         }
      });
    };

    // ===========================================================================
    // Sets functions that will be initiated globally when resizing the browser
    // window.
    // ===========================================================================
    var bindContentItemImageCropToggle = function() {
      $('.js-toggle-crop-state').on('click', function() {
        var $contentItemBox = $(this).closest('.js-content-item-box'),
            $imgDropAreaTarget = $contentItemBox.find('.js-content-item-img-drop-area'),
            itemId = $contentItemBox.data('item-id'),
            itemType = $contentItemBox.data('item-type'),
            itemData = new Edicy.CustomData({
              type: itemType,
              id: itemId
            }),
            imageCropState;

        if ($imgDropAreaTarget.hasClass('is-cropped')) {
          $imgDropAreaTarget
            .removeClass('is-cropped')
            .addClass('not-cropped')
          ;

          imageCropState = 'not-cropped';
        } else {
          $imgDropAreaTarget
            .removeClass('not-cropped')
            .addClass('is-cropped')
          ;

          imageCropState = 'is-cropped';
        }

        itemData.set('image_crop_state', imageCropState);
      });
    };

    // ===========================================================================
    // Load article cover images only when they are close or appearing in the
    // viewport.
    // ===========================================================================
    var bindContentItemImageLazyload = function() {
      $(document).ready(function() {
        setTimeout(function() {
          $('.js-content-item-box').addClass('not-loaded');
        }, 3000);
      });

      $('.js-lazyload').lazyload({
        threshold : 500,
        effect : "fadeIn",
        placeholder: 'data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw==',

        load: function() {
          var $contentItemBox = $(this).closest('.js-content-item-box');

          $contentItemBox.removeClass('not-loaded with-error').addClass('is-loaded');

          setTimeout(function() {
            $contentItemBox.removeClass('not-loaded with-error');
            $contentItemBox.find('.js-loader').remove();
          }, 3000);
        }
      });
    };

    // ===========================================================================
    // Function to detect if site is displayed in editmode.
    // ===========================================================================
    var editmode = function () {
      return $('html').hasClass('editmode');
    };

    // ===========================================================================
    // Sets header menu initial width attribute for menu mode calculation.
    // ===========================================================================
    var setHeaderMenuInitialWidth = function() {
      var $headerMenu = $('.js-header-menu');

      $headerMenu.attr('data-initial-width', $headerMenu.outerWidth(true));
    };

    // ===========================================================================
    // Change product image position on narrower screens (mobile devices)
    // ===========================================================================

    var handleProductPageContent = function () {
      $(document).ready(function () {
        changeProductImagePos();
      });

      $(window).resize(debounce(function () {
        changeProductImagePos();
      }, 25));

      var changeProductImagePos = function () {
        var productGallery = $('.js-product-gallery');
        var productImageContentBox = $('.js-content-item-box');
        var productContentRight = $('.js-product-content-right');

        if ($('.js-buy-btn-content .edy-buy-button-container').length >= 1) {
          if ($(window).width() < 640) {
            if ($('.js-buy-btn-content + .js-product-gallery').length === 0) {
              productContentRight.append(productGallery);
            }
          } else {
            if ($('.js-content-item-box + .js-product-gallery').length === 0) {
              productImageContentBox.parent().append(productGallery);
            }
          }
        }
      }
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

    // Enables the usage of the initiations outside this file.
    // For example add "<script>site.initBlogPage();</script>" at the end of the "Blog & News" page to initiate blog listing view functions.
    window.site = $.extend(window.site || {}, {
      initBlogPage: initBlogPage,
      initArticlePage: initArticlePage,
      initCommonPage: initCommonPage,
      initFrontPage: initFrontPage,
      initItemsPage: initItemsPage,
      handleColorScheme: handleColorScheme,
      handleProductPageContent: handleProductPageContent,
      getCombinedLightness: getCombinedLightness,
      handleHeaderColorScheme: handleHeaderColorScheme,
      getPhotoByWidth: getPhotoByWidth,
      getPhotoByHeight: getPhotoByHeight,
      bindCustomTexteditorStyles: bindCustomTexteditorStyles,
      bindRootItemSettings: bindRootItemSettings,
      bindContentItemImgDropAreas: bindContentItemImgDropAreas,
      bindContentItemImageCropToggle: bindContentItemImageCropToggle,
      bindSiteSearch: bindSiteSearch
    });

    init();
  })(jQuery);
