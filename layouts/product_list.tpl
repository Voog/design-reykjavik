<!DOCTYPE html>
{% include "template-variables" %}
<html class="{% if editmode %}editmode{% else %}public{% endif %}" lang="{{ page.language_code }}">
<head prefix="og: http://ogp.me/ns#">
  {% assign items_page = true %}
  {% include "edicy-tools-variables" %}
  {% include "html-head" items_page: true %}
</head>

<body class="common-page item-list-page js-body global-background-color {{ background_type }}-background{% if site.search.enabled %} search-enabled{% endif %}" {% if background_color != '' or editmode %}{{ background_color_style}}{% endif %}>
  {% if editmode %}<button class="bgpicker-toggle-button global-background-settings" style="display:none;" data-bg-color="{{ background_color }}"></button>{% endif %}
  {% if background_color != '' or editmode %}<div class="background-color global-background-color"{{ background_color_style }}></div>{% endif %}

  {% include "header" %}
  {% include "template-svg-spritesheet" %}

  <div class="container">

    <main class="content content-formatted" role="main">
      <div class="intro-content" data-search-indexing-allowed="true">{% content %}</div>

      {% include "menu-breadcrumbs" %}
      <section class="content-item-boxes">
        {% if site.root_item.selected? %}
          {% for level_1 in site.visible_menuitems_with_data %}
            {% if level_1.layout_title == product_list_layout or level_1.layout_title == product_layout %}
              {% include "product-list-item" menu_level: level_1 %}
            {% endif %}
          {% endfor %}
        {% else %}
          {% include "product-list-loop" %}
        {% endif %}
      </section>
    </main>
    {% include "footer" %}
  </div>

  {% include "site-signout" %}
  {% include "javascripts" %}
  {% include "edicy-tools" items_page: true %}

  <script type="text/javascript">site.initCommonPage();</script>
  <script>site.initItemsPage({% if editmode %}false{% else %}true{% endif %});</script>
</body>
</html>
