<!DOCTYPE html>
{%- include "template-settings" -%}
{%- include "template-variables" -%}
{%- include "blog-article-variables" -%}
<html class="{% if editmode %}editmode{% else %}public{% endif %}" lang="{{ page.language_code }}">
<head prefix="og: http://ogp.me/ns#">
  {% assign front_page = true %}
  {% include "edicy-tools-variables" %}
  {% include "html-head" front_page: true %}
</head>

<body class="front-page js-body global-background-color {{ background_type }}-background{% if site.search.enabled %} search-enabled{% endif %}" {% if background_color != '' or editmode %}{{ background_color_style}}{% endif %}>
  {% if background_color != '' or editmode %}<div class="background-color global-background-color"{{ background_color_style }}></div>{% endif %}

  {% include "header" %}

  <div class="container">
    {% if editmode %}<button class="bgpicker-toggle-button global-background-settings" style="display:none;" data-bg-color="{{ background_color }}"></button>{% endif %}

    <main class="content content-formatted" role="main">
      {%- assign content_default_title = "content" | lce -%}
      {%- assign content_default_title_tooltip = "content_tooltip_specific_page" | lce -%}

      <aside class="content-left">
        <section class="content-header">
          {% content name="slogan" title=content_default_title title_tooltip=content_default_title_tooltip %}
        </section>
      </aside>

      <article class="content-right">
        {% if editmode %}
          <button class="bgpicker-toggle-button frontpage-cover-settings" style="display:none;" data-bg-image="{{ cover_image }}" data-bg-color="{{ cover_color }}"></button>
        {% endif %}
        {% if cover_image != '' or editmode %}<div class="background-image cover frontpage-cover-image hidden"></div>{% endif %}
        {% if cover_color != '' or editmode %}<div class="background-color cover frontpage-cover-color hidden"{{ cover_color_style }}></div>{% endif %}
        <section class="content-body global-background-color"{{ background_color_style }}>
          {% content title=content_default_title title_tooltip=content_default_title_tooltip %}
        </section>
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
  {% include "site-signout" %}
  {% include "javascripts" %}
  <script type="text/javascript">site.initFrontPage();</script>
  {% include "edicy-tools" %}
</body>
</html>
