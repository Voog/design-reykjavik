<!DOCTYPE html>
<html class="{% if editmode %}editmode{% else %}public{% endif %}" lang="{{ page.language_code }}">
<head>
  {% include "html-head" %}

  <meta property="og:url" content="{{ site.url }}">
  <meta property="og:title" content="{{ site.name }}">
  <meta property="og:description" content="{{ page.description }}">{% comment %}<!-- TODO: Add correct value -->{% endcomment %}
  {% unless article.data.fb_image == nil or article.data.fb_image == "" %}<meta property="og:image" content="{{ site.url }}{{ photos_path }}/{{ article.data.fb_image }}">{% endunless %}{% comment %}<!-- TODO: Add image location data tag -->{% endcomment %}
  {% include "bg-picker-variables" %}
  {{ site.stats_header }}
</head>

<body class="post-page js-body global-background-color {{ background_type }}-background" {% if background_color != '' or editmode %}{{ background_color_style}}{% endif %}>
  {% if editmode %}<button class="bgpicker-toggle-button global-background-settings" style="display:none;" data-bg-color="{{ background_color }}"></button>{% endif %}
  {% if background_color != '' or editmode %}<div class="background-color global-background-color"{{ background_color_style }}></div>{% endif %}

  {% include "menu-mobile" %}

  <div class="container">
    {% include "header" %}

    <main class="content content-formatted" role="main">
      <article class="content-centered">
        {% include "post-box" with "article" %}

        <section id="comments" class="comments content-formatted">
          {% include "comments" %}
          {% include "comment-form" %}
        </section>

      </article>
    </main>
    {% include "footer" %}
  </div>
  {% include "javascripts" %}
  {% include "bg-picker" %}
</body>
</html>
