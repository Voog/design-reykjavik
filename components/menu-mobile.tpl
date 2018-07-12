<nav class="mobile-menu-main">
  <ul class="pages">
    {% unless site.root_item.hidden? %}<li><a href="{{site.root_item.url}}"{% if site.root_item.selected? %} class="active"{% endif %}>{{site.root_item.title}}</a></li>{% endunless %}

    {% for item in site.visible_menuitems %}
      {% if site.root_item.layout_title == product_list_layout %}
        {% if editmode %}
          {% include "mobile-menu-link" render_hidden_categories: true %}
        {% else %}
          {% unless show_product_related_pages_in_main_menu %}
            {% unless item.layout_title == product_list_layout or item.layout_title == product_layout %}
              {% include "mobile-menu-link" %}
            {% endunless %}
          {% else %}
            {% include "mobile-menu-link" %}
          {% endunless %}
        {% endif %}
      {% else %}
        {% include "mobile-menu-link" %}
      {% endif %}
    {% endfor %}

    {% if editmode %}
      {% if site.hidden_menuitems.size > 0 %}
        <li class="edit-btn">{% menubtn site.hidden_menuitems %}</li>
      {% endif %}

      <li class="edit-btn">{% menuadd %}</li>
    {% endif %}
  </ul>
  <ul class="languages">
    {% for language in site.languages %}
      <li class="{% if forloop.last%}last{% endif %} {% if language.selected? %}open{% endif %}">
        <a href="{{language.url}}" {% if language.selected? %} class="active"{% endif %}>{{language.title}}</a>
      </li>
    {% endfor %}
  </ul>
</nav>
