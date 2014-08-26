{% editorjsblock %}
  <script src='http://static.voog.construction/libs/edicy-tools/latest/edicy-tools.js'></script>
  <script>
    // Front page .content-right cover image/color
    var pageData = new Edicy.CustomData({
      type: 'page',
      id: '{{ page.id }}'
    });

    var frontPageCover = new Edicy.BgPicker($('.frontpage-cover-settings').eq(0), {
      picture: true,
      color: true,
      showAlpha: true,

      preview: function(data) {
        var img = (data.image && data.image !== '') ? 'url("' + data.image + '")' : 'none',
            col = (data.color && data.color !== '') ? data.color : 'none';

        $('.frontpage-cover-image').css({'background-image' : img});
        $('.frontpage-cover-color').css({'background' : col});
      },

      commit: function(data) {
        pageData.set({
          'cover_image': data.image || '',
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

    $('.global-background-settings').css({'left': 0, 'top': 0}).show();
  </script>
{% endeditorjsblock %}
