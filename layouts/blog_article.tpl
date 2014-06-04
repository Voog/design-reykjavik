<!DOCTYPE html>
<html class="{% if editmode %}editmode{% else %}public{% endif %}" lang="{{ page.language_code }}">
<head>
  {% include "html-head" %}

  <meta property="og:url" content="{{ site.url }}">
  <meta property="og:title" content="{{ site.name }}">
  <meta property="og:description" content="{{ page.description }}">{% comment %}<!-- TODO: Add correct value -->{% endcomment %}
  {% unless article.data.fb_image == nil or article.data.fb_image == "" %}<meta property="og:image" content="{{ site.url }}{{ photos_path }}/{{ article.data.fb_image }}">{% endunless %}{% comment %}<!-- TODO: Add image location data tag -->{% endcomment %}
</head>

<body class="post-page">

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
  </div>

  {% include "footer" %}

  {% include "javascripts" %}
</body>
</html>
