{% editorjsblock %}
  <script src='/assets/admin/tools/0.1.3/edicy-tools.js'></script>
  <script>
    $(window).load(function(window) {
      setTimeout(function(){
        var articleCover = new Edicy.BgPicker($('.article-cover-settings').eq(0), {
          picture: true,
          color: true,
          showAlpha: true,

          preview: function(data) {
            if (data.image && data.image !== '') {
              if (data.image.replace(/.*\/photos/g,'/photos') !== articleCover.prevBgImage) {
                $('.article-cover-image').css({'background-image' : 'url("' + data.image + '")'});
                var img = $('<img>'),
                  canvas = $('<canvas>');
                img[0].src = data.image.replace(/.*\/photos/g,'/photos');
                img.load(function() {
                  ColorExtract.extract(img[0], canvas[0], function(data) {
                    articleCover.bgColor = data.bgColor;
                    site.handleHeaderColorScheme(site.getCombinedLightness(articleCover.bgColor, articleCover.fgColor));
                  });
                });
                articleCover.prevBgImage = data.image.replace(/.*\/photos/g,'/photos');
              } 
            } else {
              $('.article-cover-image').css({'background-image' : 'none'});
              articleCover.bgColor = [255,255,255,0];
            }
            if (data.color && data.color !== '') {
              articleCover.fgColor = data.color;
              site.handleHeaderColorScheme(site.getCombinedLightness(articleCover.bgColor, articleCover.fgColor));
              $('.article-cover-color').css({'background' : data.color});
            } else {
              articleCover.fgColor = [255,255,255,0];
              $('.article-cover-color').css({'background' : 'transparent'});
            }
          },

          commit: function(data) {
            var cover_type = (site.getCombinedLightness(articleCover.bgColor, articleCover.fgColor) > 0.6) ? 'light' : 'dark';
            Edicy.articles.currentArticle.setData({
              'cover_image': data.image || '',
              'cover_color': data.color || '',
              'cover_type': cover_type
            });
          }
        });
        $('.article-cover-settings').css({'left': 0, 'top': 0}).show();
      }, 500);
    });
  </script>
{% endeditorjsblock %}
