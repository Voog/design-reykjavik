<footer class="footer">
  <div class="footer-inner">
    <div class="content-formatted">{% xcontent name="footer" %}</div>
    {% include 'search' %}

    {% if page.private? %}   
      <div class="signout-btn-pad"></div>
    {% endif %}
  </div>
</footer>
