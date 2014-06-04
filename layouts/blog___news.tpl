<!DOCTYPE html>
<html class="{% if editmode %}editmode{% else %}public{% endif %}" lang="{{ page.language_code }}">
<head>
  {% include "html-head" %}

  <meta property="og:url" content="{{ site.url }}">
  <meta property="og:title" content="{{ site.name }}">
  {% unless page.description == nil or page.description == "" %}<meta property="og:description" content="{{ page.description }}">{% endunless %}
  {% if page.data.fb_image %}<meta property="og:image" content="{{ site.url }}{{ photos_path }}/{{ page.data.fb_image }}">{% comment %}<!-- TODO: Add functionality -->{% endcomment %}{% endif %}

  {{ blog.rss_link }}
</head>

<body class="blog-page">

  {% include "menu-mobile" %}

  <div class="container">
    {% include "header" %}
    {% include "tags-blog" %}
    <main class="content content-formatted" role="main">
      <section class="content-centered">

        {% if editmode %}<div style="padding-bottom: 30px">{% addbutton %}</div>{% endif %}

        {% for article in articles %}
          {% include "post-box" %}
        {% endfor %}
      </section>
    </main>
  </div>

  {% include "footer" %}

  {% include "javascripts" %}
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
