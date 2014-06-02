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

<body class="blog-page js-bgpicker-body-image" {% if site.data.body_image %}style="background-image: url('{{ site.data.body_image}}');{% if site.data.body_color %} position: relative;{% endif %}"{% endif %}>

  {% include "menu-mobile" %}

  <div class="container">
    {% include "header" %}
    {% include "menu-level-2" %}

    <div class="content" role="main">
      <section class="content-center">
        {% include "tags-blog" %}

        {% addbutton %}
        {% for article in articles %}
          {% include "post-box" %}
        {% endfor %}
      </section>
    </div>
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
