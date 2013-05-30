  <meta http-equiv="X-UA-Compatible" content="IE=Edge,chrome=1">
  
  <meta name="keywords" content="{{ page.keywords }}" />
  <meta name="description" content="{{ page.description }}" />
  <meta name="copyright" content="{{ site.copyright }}" />
  <meta name="author" content="{{ site.author }}" />
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  
  {% if page.language_code == "ru" or page.language_code == "ab" or page.language_code == "av" or page.language_code == "ba" or page.language_code == "be" or page.language_code == "bg" or page.language_code == "ce" or page.language_code == "cu" or page.language_code == "cv" or page.language_code == "kk" or page.language_code == "kv" or page.language_code == "ky" or page.language_code == "mk" or page.language_code == "mn" or page.language_code == "os" or page.language_code == "sh" or page.language_code == "sr" or page.language_code == "tg" or page.language_code == "tk" or page.language_code == "tt" or page.language_code == "ug" or page.language_code == "uk" or page.language_code == "uz" %}
    <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,300italic,400italic,600,700,600italic,700italic&subset=cyrillic-ext,latin-ext' rel='stylesheet' type='text/css'>
  {% else %}
    <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,300italic,400italic,600,700,600italic,700italic&subset=latin-ext' rel='stylesheet' type='text/css'>
  {% endif %}
  
  {% if site.search.enabled %}{% stylesheet_link "assets/site_search/3.0/style.css?1" static_host="true" %}{% endif %}
  {% stylesheet_link "style.css?reykjavik1" %}
  {% if editmode %}{% stylesheet_link "assets/admin/editmode.css" static_host="true" %}{% endif %}

  <link rel="icon" href="/favicon.ico" type="image/x-icon" />
  <link rel="shortcut icon" href="/favicon.ico" type="image/ico" />
  <link rel="shortcut icon" href="/favicon.ico" type="image/x-icon" />
  
  <meta name="viewport" content="initial-scale=1" />
  
  <title>{% if site.root_item.selected? %} {{page.site_title}} | {{ page.title }} {% else %}{% if article %}{{ article.title }}{% else %}{{ page.title }}{% endif %} | {{page.site_title}} {% endif %}</title>
  {% if blog %}{{blog.rss_link}}{% endif %}
  
  <script src="{{ javascripts_path }}/modernizr.js"></script>
    
  
    
    