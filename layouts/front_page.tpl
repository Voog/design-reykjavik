<!DOCTYPE html>
<html class="{% if editmode %}editmode{% else %}public{% endif %}" lang="{{ page.language_code }}">
<head prefix="og: http://ogp.me/ns#">
  {% assign front_page = true %}
  {% include "edicy-tools-variables" %}
  {% include "html-head" %}
</head>

<body class="front-page js-body global-background-color {{ background_type }}-background{% if site.search.enabled %} search-enabled{% endif %}" {% if background_color != '' or editmode %}{{ background_color_style}}{% endif %}>
  {% if editmode %}<button class="bgpicker-toggle-button global-background-settings" style="display:none;" data-bg-color="{{ background_color }}"></button>{% endif %}
  {% if background_color != '' or editmode %}<div class="background-color global-background-color"{{ background_color_style }}></div>{% endif %}

  {% include "header" %}

  <div class="container">

    <main class="content content-formatted" role="main">

      <aside class="content-left">
        <section class="content-header">{% content name="slogan" %}</section>
      </aside>

      <article class="content-right">
        {% if editmode %}
          <button class="bgpicker-toggle-button frontpage-cover-settings" style="display:none;" data-bg-image="{{ cover_image }}" data-bg-color="{{ cover_color }}"></button>
        {% endif %}
        {% if cover_image != '' or editmode %}<div class="background-image cover frontpage-cover-image"></div>{% endif %}
        {% if cover_color != '' or editmode %}<div class="background-color cover frontpage-cover-color"{{ cover_color_style }}></div>{% endif %}
        <section class="content-body global-background-color"{{ background_color_style }}>{% content %}</section>
      </article>
      {% if site.latest_1_articles.size > 0 %}
      <aside class="content-left last">
        {% include "news" %}
      </aside>
      {% endif %}

    </main>
    {% include "footer" %}
    {% include "voog-ref" %}
  </div>
  {% include "javascripts" %}
  <script type="text/javascript">site.initFrontPage();</script>
  {% include "edicy-tools" %}
</body>
</html>
