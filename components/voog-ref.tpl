{% if site.branding.enabled and page.path == blank -%}
  <div class="voog-reference">
    {% loginblock %}
      {{ "footer_login_link" | lc }}
    {% endloginblock %}
  </div>
{% endif -%}
