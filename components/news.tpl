{% for a in site.latest_1_articles %}
<section class="news">
  <h2 class="news-header">{{ "latest_news"|lc }}</h2>
  <ul>
  {% for article in site.latest_3_articles %}
    <li class="news-item">
      <a class="link" href="{{article.url}}">{{article.title}}</a><span class="date">{{article.created_at | format_date:"long"}},&nbsp;</span><span class="author">{{article.author.firstname}}</span>
    </li>
  {% endfor %}
  </ul>
  {% if site.latest_2_articles.size == 2 %}
  <a href="/blog" class="link more-news">More news</a>
  {% endif %}
</section>
{% endfor %}
