{% comment %}https://developers.facebook.com/tools/debug - Debug after each modification{% endcomment %}
{% if site.data.fb_admin %}<meta property="fb:admins" content="{{ site.data.fb_admin }}">{% endif %}
<meta property="og:type" content="{% if article %}article{% else %}website{% endif %}">
<meta property="og:url" content="{{ site.url }}{% if article %}{{ article.url | remove_first:'/' }}{% else %}{{ page.url | remove_first:'/' }}{% endif %}">
<meta property="og:title" content="{{ page_title | escape }}">
<meta property="og:site_name" content="{{ page.site_title | escape }}">

{% comment %}Open Graph image{% endcomment %}
{% if front_page == true %}
  {% unless page.data.cover_image == '' %}
    {% if page.data.cover_image == nil %}
      <meta property="og:image" content="{{ site.url }}{{ cover_image | remove_first: '/' }}">
    {% else %}
      <meta property="og:image" content="{{ cover_image }}">
    {% endif %}
  {% endunless %}
{% else %}
  {% if article and article_cover_image != nil and article_cover_image != "" %}
    <meta property="og:image" content="{{ article_cover_image }}">
  {% elsif article and article.data.fb_image %}
    <meta property="og:image" content="{{ article.data.fb_image }}">
  {% elsif page.data.fb_image %}
    <meta property="og:image" content="{{ page.data.fb_image }}">
  {% elsif site.data.fb_image %}
    <meta property="og:image" content="{{ site.data.fb_image }}">
  {% endif %}
{% endif %}

{% comment %}Open Graph description{% endcomment %}
{% if article %}
  {% assign description = article.description %}
{% else %}
  {% assign description = page.description %}
{% endif %}

{% if description != nil and description != "" %}
  <meta property="og:description" content="{{ description | escape }}">
  <meta name="description" content="{{ description | escape }}">
{% endif %}
