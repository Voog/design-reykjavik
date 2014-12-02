{% capture dont_render %}
  <!-- Sets the "front page" cover image and color values -->
  {% if page.data.cover_image == nil %}
    {% assign cover_image = images_path | append: '/tree.jpg' %}
  {% else %}
    {% assign cover_image = page.data.cover_image %}
  {% endif %}

  {% if page.data.cover_color == nil %}
    {% assign cover_color = 'rgba(255,255,255,0.5)' %}
  {% else %}
    {% assign cover_color = page.data.cover_color %}
  {% endif %}

  <!-- Builds style tag for background image -->
  {% assign cover_image_style = '' %}
  {% unless cover_image == nil %}
    {% assign cover_image_style = ' style="background-image: ' %}
    {% if cover_image == '' %}
      {% assign cover_image_style = cover_image_style | append: 'none' %}
    {% else %}
      {% assign cover_image_style = cover_image_style | append: "url('" | append: cover_image | append: "')" %}
    {% endif %}
    {% assign cover_image_style = cover_image_style | append: ';"' %}
  {% endunless %}

  <!-- Builds style tag for background color -->
  {% assign cover_color_style = "" %}
  {% unless cover_color == nil %}
    {% assign cover_color_style = ' style="background: ' %}
    {% if cover_color == '' %}
      {% assign cover_color_style = cover_color_style | append: 'transparent' %}
    {% else %}
      {% assign cover_color_style = cover_color_style | append: cover_color %}
    {% endif %}
    {% assign cover_color_style = cover_color_style | append: ';"' %}
  {% endunless %}

  <!-- Sets the global background color and type -->
  {% if site.data.background_color == nil %}
    {% assign background_color = 'white' %}
  {% else %}
    {% assign background_color = site.data.background_color %}
  {% endif %}

  {% if site.data.background_type == nil %}
    {% assign background_type = 'light' %}
  {% else %}
    {% assign background_type = site.data.background_type %}
  {% endif %}

  <!-- Builds style tag for global background color -->
  {% assign background_color_style = "" %}
    {% assign background_color_style = ' style="background: ' %}
    {% if site.data.background_color == '' or site.data.background_color == nil %}
      {% assign background_color_style = background_color_style | append: 'white' %}
    {% else %}
      {% assign background_color_style = background_color_style | append: site.data.background_color %}
    {% endif %}
    {% assign background_color_style = background_color_style | append: ';"' %}
{% endcapture %}
