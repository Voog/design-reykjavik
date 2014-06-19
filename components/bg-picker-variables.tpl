{% capture dont_render %}
  <!-- Sets the "front page" cover image and color values -->
  {% if page.data.cover_image == 'none' %}
    {% assign cover_image = images_path | append: '/tree.jpg' %}
  {% else %}
    {% assign cover_image = page.data.cover_image %}
  {% endif %}

  {% if page.data.cover_color == nil or page.data.cover_color == '' %}
    {% assign cover_color = 'rgb(255,255,255)' %}
  {% else %}
    {% assign cover_color = page.data.cover_color %}
  {% endif %}

  <!-- Builds style tag for background image -->
  {% assign cover_image_style = '' %}
  {% unless page.data.cover_image == nil %}
    {% assign cover_image_style = ' style="background-image: ' %}
    {% if page.data.cover_image == '' %}
      {% assign cover_image_style = cover_image_style | append: 'none' %}
    {% else %}
      {% assign cover_image_style = cover_image_style | append: "url('" | append: page.data.cover_image | append: "')" %}
    {% endif %}
    {% assign cover_image_style = cover_image_style | append: ';"' %}
  {% endunless %}

  <!-- Builds style tag for background color -->
  {% assign cover_color_style = "" %}
  {% unless page.data.cover_color == nil %}
    {% assign cover_color_style = ' style="background: ' %}
    {% if page.data.cover_color == '' %}
      {% assign cover_color_style = cover_color_style | append: 'none' %}
    {% else %}
      {% assign cover_color_style = cover_color_style | append: page.data.cover_color %}
      {% if page.data.cover_image == '' %}
        {% assign cover_color_style = cover_color_style | append: '; opacity: 1' %}
      {% else %}
        {% assign cover_color_style = cover_color_style | append: '; opacity: 0.25' %}
      {% endif %}
    {% endif %}
    {% assign cover_color_style = cover_color_style | append: ';"' %}
  {% endunless %}

  <!-- Sets the "front page" cover image and color values -->
  {% if site.data.background_color == nil %}
    {% assign background_color = 'white' %}
  {% else %}
    {% assign background_color = site.data.background_color %}
  {% endif %}

  <!-- Builds style tag for background color -->
  {% assign background_color_style = "" %}
  {% unless site.data.background_color == nil %}
    {% assign background_color_style = ' style="background: ' %}
    {% if site.data.background_color == '' %}
      {% assign background_color_style = background_color_style | append: 'white' %}
    {% else %}
      {% assign background_color_style = background_color_style | append: site.data.background_color %}
    {% endif %}
    {% assign background_color_style = background_color_style | append: ';"' %}
  {% endunless %}
{% endcapture %}
