<footer class="footer">
  <div class="footer-inner">
    <div class="content-formatted">
      {%- assign footer_content_title = "footer" | lce -%}
      {%- assign footer_content_title_tooltip = "content_tooltip_all_pages_same_language" | lce -%}
      {% xcontent name="footer" title=footer_content_title title_tooltip=footer_content_title_tooltip %}
    </div>
    {% include 'search' %}
    {% if page.private? %}
      <div class="signout-btn-margin"></div>
    {% endif %}
  </div>
</footer>

{% include "voog-ref" %}
