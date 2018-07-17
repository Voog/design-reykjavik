<li class="{% if forloop.last%}last{% endif %} {% unless item.translated? %}untranslated{%endunless%} {% if item.selected? %}open{% endif %}  {% if render_hidden_categories == true and item.layout_title == product_list_layout or item.layout_title == product_layout %}{% unless show_product_related_pages_in_main_menu %} is-hidden{% endunless %} js-menu-item-products{% endif %}">
  {% if item.children? or editmode and item.translated?  %}<div class="mobile-menu-arr"></div>{% endif %}
  <a href="{{item.url}}"{% if item.selected? %} class="active"{% endif %}{% unless item.translated? %} class="fci-editor-menuadd"{% endunless %}>{{item.title}}</a>
  {% if item.children? or editmode %}
    {% if item.translated? %}
      <ul>
        {% for level2 in item.visible_children %}
          <li class="{% if forloop.last %}last{%endif%} {% unless level2.translated? %}untranslated{% endunless %} {% if level2.selected? %}open{% endif %}">
            {% if level2.children? or editmode and level2.translated? %}<div class="mobile-menu-arr"></div>{% endif %}
            <a href="{{ level2.url }}"{% if level2.selected? %} class="active"{% endif %}{% unless level2.translated? %} class="fci-editor-menuadd"{% endunless %}>{{ level2.title }}</a>
            {% if level2.children? or editmode %}
              {% if level2.translated? %}
                <ul>
                  {% for level3 in level2.visible_children %}
                    <li class="{% if forloop.last %}last{% endif %} {% unless level3.translated? %}untranslated{% endunless %}">
                      <a href="{{ level3.url }}"{% if level3.selected? %} class="active"{% endif%}{% unless level3.translated? %} class="fci-editor-menuadd"{% endunless %}>{{ level3.title }}</a>
                    </li>
                  {% endfor %}
                  {% if editmode %}
                    <li class="edit-btn">{% menuadd parent="level2" %}</li>
                  {% endif %}
                </ul>
              {% endif %}
            {% endif %}
          </li>
        {% endfor %}
        {% if editmode %}
          <li class="edit-btn">{% menuadd parent="item" %}</li>
        {% endif %}
      </ul>
    {% endif %}
  {% endif %}
</li>
