<!DOCTYPE html>
<html class="{% if editmode %}editmode{% else %}public{% endif %}" lang="{{ page.language_code }}">
<head>
  {% include "html-head" %}

  <!-- FACEBOOK OPENGRAPH -->
  <!-- site specific opengraph tags are located in "html-head" component -->
  <meta property="og:url" content="{{ site.url }}">
  <meta property="og:title" content="{{ site.name }}">
  {% unless page.description == nil or page.description == "" %}<meta property="og:description" content="{{ page.description }}">{% endunless %}
  {% if page.data.fb_image %}<meta property="og:image" content="{{ site.url }}{{ photos_path }}/{{ page.data.fb_image }}">{% comment %}<!-- TODO: Add functionality -->{% endcomment %}{% endif %}
</head>

<body class="common-page js-bgpicker-body-image" {% if site.data.body_image %}style="background-image: url('{{ site.data.body_image}}');"{% endif %}>

  {% include "menu-mobile" %}

  <div class="container">
    {% include "header" %}

    <div class="content" role="main">
      {% comment %} Show sidebar only if current page has children or is child page {% endcomment %}
      {% assign centered = false %}
      {% for item in site.menuitems_with_hidden %}
        {% if item.selected? and item.visible_children.size == 0 %}
          {% assign centered = true %}
        {% endif %}
      {% endfor %}

      {% if centered %}
        <article class="content-centered">
          <h1 class="content-header content-formatted">{% content name="slogan" %}</h1>
          <section class="content-body content-formatted">{% content %}</section>
        </article>
      {% else %}
        <aside class="content-left">
          {% include "sidebar" %}
        </aside>
        <article class="content-right">
          <h1 class="content-header content-formatted">{% content name="slogan" %}</h1>
          <section class="content-body content-formatted">{% content %}</section>
        </article>
      {% endif %}
    </div>
  </div>

  {% include "footer" %}

  {% include "javascripts" %}
</body>
</html>
