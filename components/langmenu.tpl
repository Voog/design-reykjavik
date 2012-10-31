{% if editmode or site.has_many_languages? %}
<div id="langmenu" class="langmenu-with-popup">
  <div class="langmenu-content"><div>{% for language in site.languages %}{% if language.selected? %}{{language.title}}{% endif %}{% endfor %}</div></div>
  
  <div class="langmenu-popup">
    <div class="langmenu-arrow"></div>
    <div class="langmenu-arrow2"></div>
    <ul>
      {% for language in site.languages %}
        <li><a href="{{ language.url}}"{% if language.selected? %} class="active"{% endif %}>{{language.title}}</a></li>
      {% endfor %}
      {% if editmode %}<li>{% languageadd %}</li>{% endif %}
    </ul>
  </div>
</div>
{% endif %}