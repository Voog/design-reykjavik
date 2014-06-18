<!DOCTYPE html>
<html class="{% if editmode %}editmode{% else %}public{% endif %}" lang="{{ page.language_code }}">
<head>
  {% include "html-head" %}

  <meta property="og:url" content="{{ site.url }}">
  <meta property="og:title" content="{{ site.name }}">
  {% unless page.description == nil or page.description == "" %}<meta property="og:description" content="{{ page.description }}">{% endunless %}
  {% if page.data.fb_image %}<meta property="og:image" content="{{ site.url }}{{ photos_path }}/{{ page.data.fb_image }}">{% comment %}<!-- TODO: Add functionality -->{% endcomment %}{% endif %}
  {% include "bg-picker-variables" %}
  {{ blog.rss_link }}
</head>

<body class="blog-page js-body global-background-color" {% if background_color != '' or editmode %}{{ background_color_style}}{% endif %}>
  {% if editmode %}<button class="bgpicker-toggle-button global-background-settings" data-bg-color="{{ background_color }}"></button>{% endif %}
  {% if background_color != '' or editmode %}<div class="background-color global-background-color"{{ background_color_style }}></div>{% endif %}

  {% include "menu-mobile" %}

  <div class="container">
    {% include "header" %}
    <main class="content content-formatted" role="main">
      <section class="content-centered">
        {% include "tags-blog" %}
        {% if editmode %}<div style="padding-bottom: 30px">{% addbutton %}</div>{% endif %}

        {% for article in articles %}
          {% include "post-box" %}
        {% endfor %}
      </section>
    </main>
    {% include "footer" %}
  </div>
  {% include "javascripts" %}
  {% include "bg-picker" %}
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
