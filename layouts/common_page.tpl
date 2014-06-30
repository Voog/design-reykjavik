<!DOCTYPE html>
<html class="{% if editmode %}editmode{% else %}public{% endif %}" lang="{{ page.language_code }}">
<head>
  {% include "html-head" %}

  <!-- FACEBOOK OPENGRAPH -->
  <!-- site specific opengraph tags are located in "html-head" component -->
  <meta property="og:url" content="{{ site.url }}">
  <meta property="og:title" content="{{ site.name }}">
  {% unless page.description == nil or page.description == "" %}<meta property="og:description" content="{{ page.description }}">{% endunless %}
  {% if page.data.fb_image %}<meta property="og:image" content="{{ site.url }}{{ photos_path }}/{{ page.data.fb_image }}">{% endif %}
  {% include "bg-picker-variables" %}
</head>

<body class="common-page js-body global-background-color {{ background_type }}-background" {% if background_color != '' or editmode %}{{ background_color_style}}{% endif %}>
  {% if editmode %}<button class="bgpicker-toggle-button global-background-settings" style="display:none;" data-bg-color="{{ background_color }}"></button>{% endif %}
  {% if background_color != '' or editmode %}<div class="background-color global-background-color"{{ background_color_style }}></div>{% endif %}

  {% include "menu-mobile" %}

  <div class="container">
    {% include "header" %}

    <main class="content content-formatted" role="main">
      {% comment %} Show sidebar only if current page has children or is child page {% endcomment %}
      {% assign centered = false %}
      {% for item in site.menuitems_with_hidden %}
        {% if item.selected? and item.visible_children.size == 0 %}
          {% assign centered = true %}
        {% endif %}
      {% endfor %}

      {% if editmode or centered == false %}
        <aside class="content-left">
          {% include "sidebar" %}
        </aside>
        <article class="content-right">
          <section class="content-header">{% content name="slogan" %}</section>
          <section class="content-body">{% content %}</section>
        </article>
      {% else %}
        <article class="content-centered">
          <section class="content-header">{% content name="slogan" %}</section>
          <section class="content-body">{% content %}</section>
        </article>
      {% endif %}
    </main>
    {% include "footer" %}
  </div>


  {% include "javascripts" %}
  {% include "bg-picker" %}
</body>
</html>
