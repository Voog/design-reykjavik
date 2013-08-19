<div id="mobile-menu">
  <div class="mobile-menu-header">
    <a href="#" class="mobile-menu-toggler">
      <span class="line"></span>
      <span class="line line-2"></span>
      <span class="line line-3"></span>
    </a>
    
    {% include "LangmenuSelect" %}
  </div>
  <div class="mobile-menu-inner">
    <ul>
      {% unless site.root_item.hidden? %}<li><a href="{{site.root_item.url}}"{% if site.root_item.selected? %} class="active"{% endif %}>{{site.root_item.title}}</a></li>{% endunless %}
      {% for item in site.visible_menuitems %}
        <li class="{% if forloop.last%}last{% endif %} {% unless item.translated? %}untranslated{%endunless%} {% if item.selected? %}open{% endif %}">
          {% if item.children? %}<div class="mobile-menu-arr"></div>{% endif %}
          <a href="{{item.url}}"{% if item.selected? %} class="active"{% endif %}{% unless item.translated? %} class="fci-editor-menuadd"{% endunless %}>{{item.title}}</a>
          {% if item.children? %}
            <ul>
              {% for level2 in item.visible_children %}
                <li class="{% if forloop.last %}last{%endif%} {% unless level2.translated? %}untranslated{% endunless %} {% if level2.selected? %}open{% endif %}">
                  {% if level2.children? %}<div class="mobile-menu-arr"></div>{% endif %}
                  <a href="{{ level2.url }}"{% if level2.selected? %} class="active"{% endif %}{% unless level2.translated? %} class="fci-editor-menuadd"{% endunless %}>{{ level2.title }}</a>
                
                    {% if level2.children? %}
                      <ul>
                        {% for level3 in level2.visible_children %}
                          <li class="{% if forloop.last %}last{% endif %} {% unless level3.translated? %}untranslated{% endunless %}">
                            <a href="{{ level3.url }}"{% if level3.selected? %} class="active"{% endif%}{% unless level3.translated? %} class="fci-editor-menuadd"{% endunless %}>{{ level3.title }}</a>
                          </li>
                        {% endfor %}
                        
                      </ul>
                    {% endif %}
                </li>
              {% endfor %}
            </ul>
          {% endif %}
        </li>
      {% endfor %}
    </ul>
  </div>
</div>