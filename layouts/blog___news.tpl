<!DOCTYPE html>
<html class="{% if editmode %}editmode{% else %}public{% endif %}" lang="{{ page.language_code }}">
<head prefix="og: http://ogp.me/ns#">
  {% include "edicy-tools-variables" %}
  {% include "html-head" %}
</head>

<body class="blog-page js-body global-background-color {{ background_type }}-background" {% if background_color != '' or editmode %}{{ background_color_style}}{% endif %}>
  {% if editmode %}<button class="bgpicker-toggle-button global-background-settings" style="display:none;" data-bg-color="{{ background_color }}"></button>{% endif %}
  {% if background_color != '' or editmode %}<div class="background-color global-background-color"{{ background_color_style }}></div>{% endif %}

  {% include "header" %}

  <div class="container">
    <main class="content content-formatted" role="main">
      <section class="content-centered">
        {% include "tags-blog" %}
        {% if editmode %}<div>{% addbutton %}</div>{% endif %}

        {% for article in articles %}
          {% include "post-box" %}
        {% endfor %}
      </section>
    </main>
    {% include "footer" %}
  </div>
  {% include "javascripts" %}
  {% include "edicy-tools" %}
  <script>
    $(document).ready(function() {
      currentUrl = window.location.href;
      blogUrl = '{{ site.url }}{{ page.path }}';
      if (currentUrl === blogUrl) {
        $('.js-tags-all').addClass('active');
      };
    });

    site.initBlogPage();
  </script>
</body>
</html>
