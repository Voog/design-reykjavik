  <meta name="keywords" content="{{ page.keywords }}" />
  <meta name="description" content="{{ page.description }}" />
  <meta name="copyright" content="{{ site.copyright }}" />
  <meta name="author" content="{{ site.author }}" />
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  
  {% if site.search.enabled %}{% stylesheet_link "assets/site_search/3.0/style.css?1" static_host="true" %}{% endif %}
  {% stylesheet_link "style.css?reykjavik1" %}
  {% if editmode %}{% stylesheet_link "assets/admin/editmode.css" static_host="true" %}{% endif %}

  <link rel="icon" href="/favicon.ico" type="image/x-icon" />
  <link rel="shortcut icon" href="/favicon.ico" type="image/ico" />
  <link rel="shortcut icon" href="/favicon.ico" type="image/x-icon" />
  
  <meta name="viewport" content="initial-scale=1" />
  
  <title>{% if site.root_item.selected? %} {{page.site_title}} | {{ page.title }} {% else %}{% if article %}{{ article.title }}{% else %}{{ page.title }}{% endif %} | {{page.site_title}} {% endif %}</title>
  {% if blog %}{{blog.rss_link}}{% endif %}
    
  
    
    