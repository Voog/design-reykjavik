<header class="header">
  <div class="header-inner">
    <div class="header-title content-formatted">
      {% unless editmode %}<a href="{{ site.root_item.url }}">{% endunless %}
      {% editable site.header %}
      {% unless editmode %}</a>{% endunless %}
    </div>

    <nav class="menu-main">
      {% include "menu-level-1" %}
      {% if editmode or site.has_many_languages? %}
      <nav class="menu-lang">
        {% include "menu-lang" %}
      </nav>
      {% endif %}
    </nav>
  </div>
</header>
