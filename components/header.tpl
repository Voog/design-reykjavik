<header class="header">
  <div class="header-inner">
    <div class="header-left">
      <div class="header-title content-formatted">
        {% unless editmode %}<a href="{{ site.root_item.url }}">{% endunless %}
        {% editable site.header %}
        {% unless editmode %}</a>{% endunless %}
      </div>
    </div>

    <div class="header-right">
      <nav class="menu-main js-menu-main">
        {% include "menu-level-1" %}
      </nav>

      {% if editmode or site.has_many_languages? %}
      <nav class="menu-lang">
        {% include "menu-lang" %}
      </nav>
      {% endif %}

      <button class="menu-btn js-menu-btn">
        <span class="menu-stripe"></span>
        <span class="menu-stripe"></span>
        <span class="menu-stripe"></span>
      </button>
    </div>
  </div>
</header>
