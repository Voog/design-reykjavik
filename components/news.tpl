<section class="news">
  <h2 class="news-header">{{ "latest_news"|lc }}</h2>
  <ul>
  {% for article in site.latest_3_articles %}
    <li class="news-item">
      <a class="link" href="{{article.url}}">{{article.title}}</a><span class="date">{{article.created_at | format_date:"long"}}</span>
    </li>
  {% endfor %}
  </ul>
  {% if site.latest_4_articles.size > 3 %}
    {% for item in site.menuitems_with_hidden %}
      {% if item.blog? %}
        <a href="{{ item.url }}" class="link more-news">{{ "older_news" | lc }}</a>
        {% break %}
      {% endif %}
    {% endfor %}
  {% endif %}
</section>
