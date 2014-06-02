<article class="post">
  <header class="post-header">
    <section class="post-meta">
      <span class="post-author">{{ article.author.name }}</span><span class="separator"> &nbsp;•&nbsp;</span>
      <time class="post-date" datetime="{{ article.created_at | date : "%Y-%m-%d" }}">{{ article.created_at | format_date : "long" }}</time>
    </section>
    <h1 class="post-title">{% if post-box == "article" %}{% editable article.title %}{% else %}<a href="{{ article.url }}">{{ article.title }}</a>{% endif %}</h1>
    {% if post-box == "article" %}{% include "tags-post" %}{% endif %}
  </header>

  <section class="post-content">
    <div class="post-excerpt content-formatted">
      {% if post-box == "article" %}
        {% editable article.excerpt %}
      {% else %}
        {{ article.excerpt }}
      {% endif %}
      <a href="{{ article.url }}"class="read-more">{{ "read_more" | lc }}</a>
    </div>
    {% if post-box == "article" %}
      <div class="post-body content-formatted">{% editable article.body %}</div>
    {% endif %}
  </section>

  <!--footer class="post-footer">
    {% unless post-box == "article" %}
      <div class="post-comments-count">
        <a href="{{ article.url }}#comments">{% case article.comments_count %}{% when 0 %}{{ "no_comments" | lc }}{% else %}{{ "comments_for_count" | lc}}: <span class="edy-site-blog-comments-count">{{article.comments_count}}</span>{% endcase %}</a>
      </div>
    {% endunless %}
  </footer-->
</article>
