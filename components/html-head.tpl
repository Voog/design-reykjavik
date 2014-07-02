<!--[if IE]><meta http-equiv="X-UA-Compatible" content="IE=edge"><![endif]-->
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="viewport" id="viewport-meta" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<meta name="format-detection" content="telephone=no">
<meta name="keywords" content="{{ page.keywords }}">
<meta name="description" content="{{ page.description }}">
<meta name="author" content="{{ site.author }}">

<link rel="icon" href="/favicon.ico" type="image/x-icon">
<link rel="shortcut icon" href="/favicon.ico" type="image/ico">
<link rel="shortcut icon" href="/favicon.ico" type="image/x-icon">
<link rel="apple-touch-icon" href="{{ images_path }}/{{ page.data.touchicon }}"> <!-- TODO: Add image location data tag -->

{% stylesheet_link "main.css?21" %}
{% if site.search.enabled %}<link rel="stylesheet" href="{{ site.static_asset_host }}/libs/edicy-search/1.0.0/edicy-search.css">{% endif %}
{% if editmode %}<link rel="stylesheet" href="/assets/admin/tools/0.1.3/edicy-tools.css">{% endif %}

{% if page.language_code == "ru" or page.language_code == "ab" or page.language_code == "av" or page.language_code == "ba" or page.language_code == "be" or page.language_code == "bg" or page.language_code == "ce" or page.language_code == "cu" or page.language_code == "cv" or page.language_code == "kk" or page.language_code == "kv" or page.language_code == "ky" or page.language_code == "mk" or page.language_code == "mn" or page.language_code == "os" or page.language_code == "sh" or page.language_code == "sr" or page.language_code == "tg" or page.language_code == "tk" or page.language_code == "tt" or page.language_code == "ug" or page.language_code == "uk" or page.language_code == "uz" %}
  <link href='http://fonts.googleapis.com/css?family=Source+Sans+Pro:400,300,300italic,400italic,600,700,600italic,700italic&subset=cyrillic-ext,latin-ext' rel='stylesheet' type='text/css'>
{% else %}
  <link href='http://fonts.googleapis.com/css?family=Source+Sans+Pro:400,300,300italic,400italic,600,700,600italic,700italic&subset=latin-ext' rel='stylesheet' type='text/css'>
{% endif %}

<title>{% if article %}{{ article.title }} &mdash; {{ page.site_title }}{% else %}{% if site.root_item.selected? %}{{ page.site_title }}{% else %}{{ page.title }} &mdash; {{ page.site_title }}{% endif %}{% endif %}</title>

<meta property="og:type" content="website">
<meta property="og:url" content="{{ site.url }}">
<meta property="og:title" content="{{ site.name }}">
<meta property="og:description" content="{{ page.description }}">
