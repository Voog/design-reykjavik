<!DOCTYPE html>
<html class="{% if editmode %}editmode{% else %}public{% endif %}" lang="{{ page.language_code }}">
<head>
  {% include "html-head" %}
  {% include "bg-picker-variables" %}
  {{ site.stats_header }}
</head>

<body class="front-page js-body global-background-color {{ background_type }}-background" {% if background_color != '' or editmode %}{{ background_color_style}}{% endif %}>
  {% if editmode %}<button class="bgpicker-toggle-button global-background-settings" style="display:none;" data-bg-color="{{ background_color }}"></button>{% endif %}
  {% if background_color != '' or editmode %}<div class="background-color global-background-color"{{ background_color_style }}></div>{% endif %}

  {% include "menu-mobile" %}

  <div class="container">
    {% include "header" %}

    <main class="content content-formatted" role="main">

      <aside class="content-left">
        <section class="content-header"><h1>{% content name="slogan" %}</h1></section>
      </aside>

      <article class="content-right">
        {% if editmode %}
          <button class="bgpicker-toggle-button frontpage-cover-settings" style="display:none;" data-bg-image="{{ cover_image }}" data-bg-color="{{ cover_color }}"></button>
        {% endif %}
        {% if cover_image != '' or editmode %}<div class="background-image cover frontpage-cover-image"{{ cover_image_style }}></div>{% endif %}
        {% if cover_color != '' or editmode %}<div class="background-color cover frontpage-cover-color"{{ cover_color_style }}></div>{% endif %}
        <section class="content-body global-background-color" {% if background_color != '' or editmode %}{{ background_color_style}}{% else %}style="background:white;"{% endif %}>
          {% content %}
        </section>
      </article>
  
      {% for a in site.latest_1_articles %}
      <aside class="content-left last">
        {% include "news" %}
      </aside>
      {% endfor %}

    </main>
    {% include "footer" %}
    {% include "voog-ref" %}
  </div>
  {% include "javascripts" %}
  <script type="text/javascript">site.initFrontPage();</script>
  {% include "bg-picker" %}
</body>
</html>
