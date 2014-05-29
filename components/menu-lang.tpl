<div class="langmenu langmenu-with-popup">
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

<div class="langmenu popup">
  <div class="popup-content">{% for language in site.languages %}{% if language.selected? %}{{language.title}}{% endif %}{% endfor %}</div>
  <select>
    {% for language in site.languages %}
      <option value="{{language.url}}"{% if language.selected? %} selected="selected"{% endif %}>{{language.title}}</option>
    {% endfor %}
  </select>
</div>
