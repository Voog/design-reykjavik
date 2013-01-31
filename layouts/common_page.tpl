<!DOCTYPE html>
<html>

<head>
  {% include "SiteHeader" %}
</head>

<body>

  <div id="holder">
    {% include "MobileMenus" %}
    <div class="wrap">
      <div id="header" class="cfx">
        <div id="logo">{% editable site.header %}</div>
        <div class="inner">
          {% include "Langmenu" %}
          {% include "Mainmenu" %}
        </div>
      </div>

      <div id="container" class="cfx">
        
        {% include "Submenu" %}
        
        <div id="content"{% unless editmode%}{% for item in site.menuitems_with_hidden %}{% if item.selected? and item.visible_children.size == 0 %} class="content-centered"{%endif%}{% endfor%}{% endunless%}>
          <div class="cfx">
            <h1>{% contentblock name="slogan" %}{{ "title_goes_here" | lc }}{% endcontentblock %}</h1>
            {% content %}
          </div>
        </div>
      </div>

    </div>
  </div>

  <div id="footer">
    <div class="wrap cfx">
      
      <div class="inner">
        <div class="cfx">
          {% xcontent name="footer" %}
        </div>
      </div>
      {% include "Search" %}
    </div>
  </div>

  {% include "JS" %}
</body>
</html>