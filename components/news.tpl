<section class="news">
  <h2 class="news-header">{{ "latest_news"|lc }}</h2>
  <ul>
  {% for article in site.latest_5_articles %}
    <li class="news-item">
      <a class="link" href="{{article.url}}">{{article.title}}</a><span class="date">{{article.created_at | format_date:"long"}}</span>{% if article.author.firstname %}<span class="author">,&nbsp;{{article.author.firstname}}</span>{% endif %}
    </li>
  {% endfor %}
  </ul>
  {% if site.latest_6_articles.size > 5 %}
  <a href="/blog" class="link more-news">More news</a>
  {% endif %}
</section>
