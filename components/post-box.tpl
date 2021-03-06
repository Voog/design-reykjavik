<article class="post">
  <header class="post-header">
    <section class="post-meta">
      <span class="post-author">{{ article.author.name }}</span><span class="separator"> &nbsp;•&nbsp;</span>
      {% assign article_year = article.created_at | format_date: "%Y" | to_num %}

      {% if article_year == current_year %}
        {% assign article_date_format = "long_without_year" %}
      {% else %}
        {% assign article_date_format = "long" %}
      {% endif %}

      <time class="post-date" datetime="{{ article.created_at | date: '%Y-%m-%d' }}">{{ article.created_at | format_date: article_date_format }}</time>
      {% if article.comments_count > 0 %}&nbsp;<a href="{{article.url}}#comments" class="comments-count">{{article.comments_count}}</a>{% endif %}
    </section>
    <h1 class="post-title">{% if post-box == "article" %}{% editable article.title %}{% else %}<a href="{{ article.url }}">{{ article.title }}</a>{% endif %}</h1>
  </header>

  <section class="post-content">
    <div class="post-excerpt content-formatted">
      {% if post-box == "article" %}
        {% editable article.excerpt %}
      {% else %}
        {{ article.excerpt }}
      {% endif %}
      {% unless post-box == "article" %}<a href="{{ article.url }}" class="read-more">{{ "read_more" | lc }}</a>{% endunless %}
    </div>
    {% if post-box == "article" %}
      <div class="post-body content-formatted">{% editable article.body %}</div>
    {% endif %}
    {% if post-box == "article" %}{% unless article.new_record? %}{% content name="gallery" bind="Article" %}{% endunless %}{% endif %}
    {% if post-box == "article" %}{% include "tags-post" %}{% endif %}
  </section>
</article>
