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

<body class="front-page">

  {% include "menu-mobile" %}

  <div class="container">
    {% include "header" %}

    <main class="content content-formatted" role="main">

      <aside class="content-left">
        <section class="content-header"><h1>{% content name="slogan" %}</h1></section>
      </aside>

      <article class="content-right">
        <section class="content-body">{% content %}</section>
      </article>

      <aside class="content-left content-left-last">
        {% include "news" %}
      </aside>

    </main>
  </div>
  {% include "footer" %}
  {% include "javascripts" %}
</body>
</html>
