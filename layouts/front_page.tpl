<!DOCTYPE html>
<html class="{% if editmode %}editmode{% else %}public{% endif %}" lang="{{ page.language_code }}">
<head>
  {% include "html-head" %}

  <!-- FACEBOOK OPENGRAPH -->
  <!-- site specific opengraph tags are located in "html-head" component -->
  <meta property="og:url" content="{{ site.url }}">
  <meta property="og:title" content="{{ site.name }}">
  {% unless page.description == nil or page.description == "" %}<meta property="og:description" content="{{ page.description }}">{% endunless %}
  {% if page.data.fb_image %}<meta property="og:image" content="{{ site.url }}{{ photos_path }}/{{ page.data.fb_image }}"><!-- TODO: Add functionality -->{% endif %}
</head>

<body class="front-page js-bgpicker-body-image" {% if site.data.body_image %}style="background-image: url('{{ site.data.body_image}}');"{% endif %}>

  {% include "menu-mobile" %}

  <div class="container">
    {% include "header" %}

    <div class="content" role="main">

      <aside class="content-left">
        <section class="content-header content-formatted">{% content name="slogan" %}</section>
      </aside>

      <article class="content-right">
        <section class="content-body content-formatted">{% content %}</section>
      </article>

      <aside class="content-left content-left-last">
        {% include "news" %}
      </aside>

    </div>
  </div>
  {% include "footer" %}
  {% include "javascripts" %}
</body>
</html>
