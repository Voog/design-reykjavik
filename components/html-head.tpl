{% comment %}IE SETTINGS{% endcomment %}
<!--[if IE]><meta http-equiv="X-UA-Compatible" content="IE=edge"><![endif]-->

{% comment %}META INFO{% endcomment %}
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<meta name="format-detection" content="telephone=no">

{% comment %}FAV ICON{% endcomment %}
{% if site.has_favicon? %}
  <link rel="icon" href="/favicon.ico" type="image/x-icon">
  <link rel="shortcut icon" href="/favicon.ico" type="image/ico">
  <link rel="shortcut icon" href="/favicon.ico" type="image/x-icon">
{% endif %}
{% comment %}TODO: Add functionality after the CMS is going to support it{% endcomment %}
{% if site.data.touch_icon %}<link rel="apple-touch-icon" href="{{ site.data.touch_icon }}">{% endif %}

{% comment %}STYLESHEETS{% endcomment %}
{% if editmode %}<link rel="stylesheet" href="{{ site.static_asset_host }}/libs/edicy-tools/latest/edicy-tools.css">{% endif %}
<link href="{{ stylesheets_path }}/main.min.css?v={{ template_settings.version }}" media="screen" rel="stylesheet" type="text/css"/>
{% if site.search.enabled %}<link rel="stylesheet" href="{{ site.static_asset_host }}/libs/edicy-search/latest/edicy-search.css">{% endif %}
{% if page.language_code == "ru" or page.language_code == "ab" or page.language_code == "av" or page.language_code == "ba" or page.language_code == "be" or page.language_code == "bg" or page.language_code == "ce" or page.language_code == "cu" or page.language_code == "cv" or page.language_code == "kk" or page.language_code == "kv" or page.language_code == "ky" or page.language_code == "mk" or page.language_code == "mn" or page.language_code == "os" or page.language_code == "sh" or page.language_code == "sr" or page.language_code == "tg" or page.language_code == "tk" or page.language_code == "tt" or page.language_code == "ug" or page.language_code == "uk" or page.language_code == "uz" %}
  <link href='https://fonts.googleapis.com/css?family=Source+Sans+Pro:400,300,300italic,400italic,600,700,600italic,700italic&subset=cyrillic-ext,latin-ext' rel='stylesheet' type='text/css'>
{% else %}
  <link href='https://fonts.googleapis.com/css?family=Source+Sans+Pro:400,300,300italic,400italic,600,700,600italic,700italic&subset=latin-ext' rel='stylesheet' type='text/css'>
{% endif %}

{% comment %}Google fonts for Design Editor{% endcomment %}
<link href="https://fonts.googleapis.com/css?family=Anonymous+Pro:400,400i,700,700i|Arvo:400,400i,700,700i|Cousine:400,400i,700,700i|Crimson+Text:400,400i,700,700i|Fira+Sans:400,400i,700,700i|Lato:400,400i,700,700i|Lora:400,400i,700,700i|Montserrat:400,400i,700,700i|Noto+Serif:400,400i,700,700i|Open+Sans:400,400i,700,700i|PT+Sans:400,400i,700,700i|PT+Serif:400,400i,700,700i|Playfair+Display:400,400i,700,700i|Raleway:400,400i,700,700i|Roboto+Mono:400,400i,700,700i|Roboto+Slab:400,700|Roboto:400,400i,700,700i|Source+Sans+Pro:400,400i,700,700i|Ubuntu+Mono:400,400i,700,700i|Ubuntu:400,400i,700,700i&amp;subset=cyrillic,cyrillic-ext,greek,greek-ext,hebrew,latin-ext,vietnamese" rel="stylesheet">

{% customstyle %}
  {% include "template-cs-main-styles" %}
  {% include "template-cs-header" %}
  {% if blog_list %}
    {% include "template-cs-blog-list" %}
  {% endif %}
  {% if blog_article %}
    {% include "template-cs-blog-article" %}
  {% endif %}
  {% if front_page or common_page or product_page %}
    {% include "template-cs-content" %}
  {% endif %}
  {% include "template-cs-footer" %}
  {% include "template-cs-headings" %}
  {% include "template-cs-table" %}
  {% include "template-cs-form" %}
  {% include "template-cs-button" %}
  {% include "template-cs-style-rules" %}
{% endcustomstyle %}

{% comment %}MODERNIZR - HTML5 SUPPORT FOR OLDER BROWSERS, SVG SUPPORT DETECTION ETC{% endcomment %}
<script src="{{ javascripts_path }}/modernizr-custom.min.js"></script>

{% comment %}SITE TITLE{% endcomment %}
<title>{% title %}</title>

{% comment %}MISC{% endcomment %}
{% include "template-meta" %}

{% comment %}BREADCRUMBS{% endcomment %}
{%- capture breadcrumbsScript -%}
  {%- sd_breadcrumbs -%}
{%- endcapture -%}

{{ breadcrumbsScript }}

{% comment %}MISCELLANEOUS{% endcomment %}
{% if blog %}{{ blog.rss_link }}{% endif %}
{{ site.stats_header }}
