<!DOCTYPE html>
{%- include "template-settings" -%}
{%- include "template-variables" -%}
<html class="{% if editmode %}editmode{% else %}public{% endif %}" lang="{{ page.language_code }}">
<head prefix="og: http://ogp.me/ns#">
  {% assign common_page = true %}
  {% include "edicy-tools-variables" %}
  {% include "html-head" common_page: true %}
</head>

<body class="common-page js-body global-background-color {{ background_type }}-background{% if site.search.enabled %} search-enabled{% endif %}" {% if background_color != '' or editmode %}{{ background_color_style}}{% endif %}>
  {% if editmode %}<button class="bgpicker-toggle-button global-background-settings" style="display:none;" data-bg-color="{{ background_color }}"></button>{% endif %}
  {% if background_color != '' or editmode %}<div class="background-color global-background-color"{{ background_color_style }}></div>{% endif %}

  {% include "header" %}

  <div class="container">

    <main class="content content-formatted" role="main">
      {% comment %} Show sidebar only if current page has children or is child page {% endcomment %}
      {% assign centered = false %}
      {% for item in site.menuitems_with_hidden %}
        {% if item.selected? and item.visible_children.size == 0 %}
          {% assign centered = true %}
        {% endif %}
      {% endfor %}

      {%- assign content_default_title = "content" | lce -%}
      {%- assign content_default_title_tooltip = "content_tooltip_specific_page" | lce -%}

      {%- assign bottom_content_title = "additional_content" | lce -%}
      {%- assign bottom_content_title_tooltip = "content_tooltip_additional_information" | lce -%}

      {% if editmode or centered == false %}
        <aside class="content-left">
          {% include "sidebar" %}
        </aside>
        <article class="content-right">
          <section class="content-header">
            {% content name="slogan" title=content_default_title title_tooltip=content_default_title_tooltip %}
          </section>
          <section class="content-body">
            {% content title=bottom_content_title title_tooltip=bottom_content_title_tooltip %}
          </section>
        </article>
      {% else %}
        <article class="content-centered">
          <section class="content-header">
            {% content name="slogan" title=content_default_title title_tooltip=content_default_title_tooltip %}
          </section>
          <section class="content-body">
            {% content title=bottom_content_title title_tooltip=bottom_content_title_tooltip %}
          </section>
        </article>
      {% endif %}
    </main>
    {% include "footer" %}
  </div>

  {% include "site-signout" %}
  {% include "javascripts" %}
  <script type="text/javascript">
    site.initCommonPage();
  </script>
  {% include "edicy-tools" %}
</body>
</html>
