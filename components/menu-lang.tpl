<div class="langmenu langmenu-with-popup" {{ edy_intro_add_lang }}>
  <div class="langmenu-content">{% for language in site.languages %}{% if language.selected? %}{{language.title}}{% endif %}{% endfor %}</div>
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
