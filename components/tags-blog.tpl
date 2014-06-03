{% if tags %}
  <div class="tagged-list-header">
    <div class="tag-icon"></div>
    {% if tags == empty %}
      {{ "no_posts_tagged" | lc }}
    {% else %}
      {{ "posts_tagged" | lc }} '{{ tags | sort:"name" | map:"name" | join:"', '"}}'.
    {% endif %}
  </div>
{% endif %}
