{% if article.comments_count > 0 %}
<h2 class="comments-title">{{ "comments" | lc }}</h2>

<ul class="comment-messages content-formatted">
  {% for comment in article.comments reversed %}
    <li class="comment edy-site-blog-comment">
      <header class="comment-header">
        <span class="comment-author">{{ comment.author }}</span>
        &nbsp;&nbsp;•&nbsp;&nbsp;
        <span class="comment-date">{{ comment.created_at | format_date: "long" }}</span>
        {% if editmode %}<span class="comment-delete">{% removebutton %}</span>{% endif %}
      </header>
      <section>
        <span class="comment-body">{{ comment.body_html }}</span>
      </section>
    </li>
  {% endfor %}
</ul>
{% endif %}
