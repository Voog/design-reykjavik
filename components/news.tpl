{% for a in site.latest_1_articles %}
<section class="news content-body">
  <h2 class="news-header">{{ "latest_news"|lc }}</h2>
  <ul>
  {% for article in site.latest_2_articles %}
    <li class="news-item">
      <span class="author">{{article.author.name}},</span> <a class="link" href="{{article.url}}">{{article.title}}</a> <br><span class="date">{{article.created_at | format_date:"long"}}</span>
    </li>
  {% endfor %}
  </ul>
</section>
{% endfor %}
