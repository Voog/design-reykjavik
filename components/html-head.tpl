{% comment %}<!-- IE SETTINGS -->{% endcomment %}
<!--[if IE]><meta http-equiv="X-UA-Compatible" content="IE=edge"><![endif]-->

{% comment %}<!-- BASIC META INFO -->{% endcomment %}
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<meta name="format-detection" content="telephone=no">
{% unless page.keywords == nil or page.keywords == "" %}<meta name="keywords" content="{{ page.keywords }}">{% endunless %}
{% unless page.description == nil or page.keywords == "" %}<meta name="description" content="{{ page.description }}">{% endunless %}

{% comment %}<!-- FAV ICON -->{% endcomment %}
<link rel="icon" href="/favicon.ico" type="image/x-icon">
<link rel="shortcut icon" href="/favicon.ico" type="image/ico">
<link rel="shortcut icon" href="/favicon.ico" type="image/x-icon">
{% comment %}<!-- TODO: Add functionality after the CMS is going to support it -->{% endcomment %}
{% if site.data.touch_icon %}<link rel="apple-touch-icon" href="{{ site.data.touch_icon }}">{% endif %}

{% comment %}<!-- MODERNIZR - HTML5 SUPPORT FOR OLDER BROWSERS, SVG SUPPORT DETECTION ETC -->{% endcomment %}
<script src="{{ javascripts_path }}/modernizr.min.js"></script>

{% comment %}<!-- STYLESHEETS -->{% endcomment %}
{% stylesheet_link "main.min.css" %}
{% if editmode %}<link rel="stylesheet" href="{{ site.static_asset_host }}/libs/edicy-tools/latest/edicy-tools.css">{% endif %}
{% if site.search.enabled %}<link rel="stylesheet" href="{{ site.static_asset_host }}/libs/edicy-search/1.0.0/edicy-search.css">{% endif %}
{% if page.language_code == "ru" or page.language_code == "ab" or page.language_code == "av" or page.language_code == "ba" or page.language_code == "be" or page.language_code == "bg" or page.language_code == "ce" or page.language_code == "cu" or page.language_code == "cv" or page.language_code == "kk" or page.language_code == "kv" or page.language_code == "ky" or page.language_code == "mk" or page.language_code == "mn" or page.language_code == "os" or page.language_code == "sh" or page.language_code == "sr" or page.language_code == "tg" or page.language_code == "tk" or page.language_code == "tt" or page.language_code == "ug" or page.language_code == "uk" or page.language_code == "uz" %}
  <link href='http://fonts.googleapis.com/css?family=Source+Sans+Pro:400,300,300italic,400italic,600,700,600italic,700italic&subset=cyrillic-ext,latin-ext' rel='stylesheet' type='text/css'>
{% else %}
  <link href='http://fonts.googleapis.com/css?family=Source+Sans+Pro:400,300,300italic,400italic,600,700,600italic,700italic&subset=latin-ext' rel='stylesheet' type='text/css'>
{% endif %}
<!--[if lt IE 9]>{% stylesheet_link "ie8.min.css" %}<![endif]-->

{% comment %}<!-- SITE TITLE -->{% endcomment %}
{% capture page_title %}{% if article %}{{ article.title }} — {{ page.site_title }}{% else %}{% if site.root_item.selected? %}{{ page.site_title }}{% else %}{{ page.title }} — {{ page.site_title }}{% endif %}{% endif %}{% endcapture %}
<title>{{ page_title }}</title>

{% comment %}<!-- FACEBOOK OPENGRAPH -->{% endcomment %}
<!-- https://developers.facebook.com/tools/debug - Debug after each modification -->
{% comment %}<!-- TODO: Add admin and image editing support after the CMS is going to support it -->{% endcomment %}
{% if site.data.fb_admin %}<meta property="fb:admins" content="{{ site.data.fb_admin }}">{% endif %}
<meta property="og:type" content="{% if article %}article{% else %}website{% endif %}">
<meta property="og:url" content="{{ site.url }}{% if article %}{{ article.url | remove_first:'/' }}{% else %}{{ page.url | remove_first:'/' }}{% endif %}">
<meta property="og:title" content="{{ page_title | escape }}">
<meta property="og:site_name" content="{{ page.site_title | escape }}">

{% if article %}
  {% if article.data.fb_image %}
    <meta property="og:image" content="{{ article.data.fb_image }}">
  {% elsif page.data.fb_image %}
    <meta property="og:image" content="{{ page.data.fb_image }}">
  {% elsif site.data.fb_image %}
    <meta property="og:image" content="{{ site.data.fb_image }}">
  {% endif %}
  <meta property="og:description" content="{{ article.excerpt | strip_html | truncate: 200 }}">
  <meta name="description" content="{{ article.excerpt | strip_html | truncate: 200 }}">
{% else %}
  {% if page.data.fb_image %}
    <meta property="og:image" content="{{ page.data.fb_image }}">
  {% elsif site.data.fb_image %}
    <meta property="og:image" content="{{ site.data.fb_image }}">
  {% endif %}
  {% unless page.description == nil or page.description == "" %}
    <meta property="og:description" content="{{ page.description }}">
    <meta name="description" content="{{ page.description }}">
  {% endunless %}
{% endif %}

{% if blog %}{{ blog.rss_link }}{% endif %}
{{ site.stats_header }}
