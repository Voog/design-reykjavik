{% editorjsblock %}
  <script src='/assets/admin/tools/0.1.1/edicy-tools.js'></script>
  <script>
    // Front page .content-right cover image/color
    var pageData = new Edicy.CustomData({
      type: 'page',
      id: '{{ page.id }}'
    });

    var frontPageCover = new Edicy.BgPicker($('.frontpage-cover-settings').eq(0), {
      picture: true,
      color: true,

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

    var frontPageCover = new Edicy.BgPicker($('.global-background-settings').eq(0), {
      picture: false,
      color: true,

      preview: function(data) {
        var col = (data.color && data.color !== '') ? data.color : 'white';

        $('.global-background-color').css({'background' : col});
        {% if editmode %}site.handleColorScheme();{% endif %}
      },

      commit: function(data) {
        siteData.set({'background_color': data.color || ''
        });
      }
    });

    $('.global-background-settings').css({'left': 0, 'top': 0}).show();
  </script>
{% endeditorjsblock %}
