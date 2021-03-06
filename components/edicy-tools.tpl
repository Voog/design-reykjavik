{% editorjsblock %}
  <script src='{{ site.static_asset_host }}/libs/edicy-tools/latest/edicy-tools.js'></script>
  <script>
    // Front page .content-right cover image/color
    var pageData = new Edicy.CustomData({
      type: 'page',
      id: '{{ page.id }}'
    });

    {% if items_page %}
      site.bindContentItemImgDropAreas('{{ "drag_picture_for_product_here" | lc: editor_locale }}');
      site.bindContentItemImageCropToggle();

      {%if site.data.settings_root_item %}
        rootItemValuesObj = {{ site.data.settings_root_item | json }};
      {% else %}
        rootItemValuesObj = {};
      {% endif %};

      site.bindRootItemSettings(rootItemValuesObj);
    {% endif %}

    var frontPageCover = new Edicy.BgPicker($('.frontpage-cover-settings').eq(0), {
      picture: true,
      color: true,
      showAlpha: true,
      target_width: 1280,

      preview: function(data) {
        var col = (data.color && data.color !== '') ? data.color : 'none';

        if (data.image && data.imageSizes) {
          var image_url = site.getPhotoByHeight(data.imageSizes, $('.frontpage-cover-image').height());
          $('.frontpage-cover-image').css({'background-image' : 'url("' + image_url + '")'});
        } else if (data.image) {
          // Fix Safari from constantly loading a new image on Bg picker slider change
          var frontPageCoverBgImage = data.image.split('/').pop();

          $('.frontpage-cover-image').css({'background-image' : 'url(images/"' + frontPageCoverBgImage + '")'});
        } else {
          $('.frontpage-cover-image').css({'background-image' : 'none'});
        }
        $('.frontpage-cover-color').css({'background-color' : col});
      },

      commit: function(data) {
        var normalizeValue = function(value) {
          if (value == null || (typeof value == 'string' && value.match(/^[\\'"]+$/))) {
            return '';
          } else {
            return value;
          }
        };
        pageData.set({
          'cover_image': data.image || '',
          'cover_image_sizes': normalizeValue(data.imageSizes),
          'cover_color': data.color || ''
        });
      }
    });

    $('.frontpage-cover-settings').css({'left': 0, 'top': 0}).show();

    // Global background image/color
    var siteData = new Edicy.CustomData({
      type: 'site'
    });

    var globalBackground = new Edicy.BgPicker($('.global-background-settings').eq(0), {
      picture: false,
      color: true,

      preview: function(data) {
        var col = (data.color && data.color !== '') ? data.color : 'white';

        $('.global-background-color').css({'background' : col});
        {% if editmode %}site.handleColorScheme(data.colorData ? data.colorData.lightness : 1.0);{% endif %}
      },

      commit: function(data) {
        siteData.set({
          'background_color': data.color || '',
          'background_type': data.colorData !== null ? (data.colorData.lightness > 0.6 ? 'light' : 'dark') : 'light'
        });
      }
    });

    site.bindCustomTexteditorStyles('{{ "button" | lc: editor_locale }}');

    $('.global-background-settings').show();
  </script>
{% endeditorjsblock %}
{% unless cover_image_sizes == '' or cover_image_sizes == nil %}
<script type="text/javascript">
  $('.frontpage-cover-image').css({'background-image' : 'url("' + site.getPhotoByHeight(JSON.parse('{{ cover_image_sizes }}'), $('.frontpage-cover-image').height()) + '")'});
</script>
{% endunless %}
