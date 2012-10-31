{% if editmode or site.has_many_languages? %}
<div id="langmenu" class="langmenu">
  <div class="langmenu-content"><div>{% for language in site.languages %}{% if language.selected? %}{{language.title}}{% endif %}{% endfor %}</div></div>
  <select>
    {% for language in site.languages %}
      <option value="{{language.url}}"{% if language.selected? %} selected="selected"{% endif %}>{{language.title}}</option>
    {% endfor %}
  </select>
</div>
{% endif %}