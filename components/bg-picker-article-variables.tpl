{% capture dont_render %}
<!-- Sets the article cover image and color values -->
  {% if article.data.cover_image == 'none' %}
    {% assign article_cover_image = '' %}
  {% else %}
    {% assign article_cover_image = article.data.cover_image %}
  {% endif %}

  {% if article.data.cover_color == nil or article.data.cover_color == '' %}
    {% assign article_cover_color = 'rgb(255,255,255,0.25)' %}
  {% else %}
    {% assign article_cover_color = article.data.cover_color %}
  {% endif %}

  {% if article.data.cover_type == nil or article.data.cover_type == '' %}
    {% if site.data.background_type == nil %}
      {% assign article_cover_type = 'light' %}
    {% else %}
      {% assign article_cover_type = site.data.background_type %}
    {% endif %}
  {% else %}
    {% assign article_cover_type = article.data.cover_type %}
  {% endif %}

  <!-- Builds style tag for article background image -->
  {% assign article_cover_image_style = '' %}
  {% unless article.data.cover_image == nil %}
    {% assign article_cover_image_style = ' style="background-image: ' %}
    {% if article.data.cover_image == '' %}
      {% assign article_cover_image_style = article_cover_image_style | append: 'none' %}
    {% else %}
      {% assign article_cover_image_style = article_cover_image_style | append: "url('" | append: article.data.cover_image | append: "')" %}
    {% endif %}
    {% assign article_cover_image_style = article_cover_image_style | append: ';"' %}
  {% endunless %}

  <!-- Builds style tag for article background color -->
  {% assign article_cover_color_style = "" %}
    {% assign article_cover_color_style = ' style="background: ' %}
    {% if article.data.cover_color == "" or article.data.cover_color == nil %}
      {% assign article_cover_color_style = article_cover_color_style | append: 'transparent' %}
    {% else %}
      {% assign article_cover_color_style = article_cover_color_style | append: article.data.cover_color %}
    {% endif %}
    {% assign article_cover_color_style = article_cover_color_style | append: ';"' %}
{% endcapture %}
