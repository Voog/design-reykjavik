<header class="header js-header">
  <div class="mobile-menu-wrapper js-header-left" id="mobile-menu">
    <div class="mobile-menu-header js-header-left">
      <div class="header-title content-formatted">
        {% unless editmode %}<a class="title-link noborder" href="{{ site.root_item.url }}">{% endunless %}
        {% editable site.header %}
        {% unless editmode %}</a>{% endunless %}
      </div>
      {% if site.search.enabled %}<button class="search-btn js-search-btn"></button>{% endif %}

      <button class="menu-btn mobile-menu-btn">
        <span class="menu-stripe"></span>
        <span class="menu-stripe"></span>
        <span class="menu-stripe"></span>
      </button>
    </div>
    {% include "menu-mobile" %}
  </div>

  <div class="main-menu-wrapper js-header-right">
    <nav class="menu-main">
      {% include "menu-level-1" %}
    </nav>
    {% if editmode or site.has_many_languages? %}
    <nav class="menu-lang">
      {% include "menu-lang" %}
    </nav>
    {% endif %}
  </div>
</header>
