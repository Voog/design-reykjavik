<section class="news">
  <h2 class="news-header">{{ "latest_news"|lc }}</h2>
  <ul>
  {% for article in site.latest_3_articles %}
    <li class="news-item">
      <a class="link" href="{{article.url}}">{{article.title}}</a>
      {% assign article_year = article.created_at | format_date: "%Y" | to_num %}

      {% if article_year == current_year %}
        {% assign article_date_format = "long_without_year" %}
      {% else %}
        {% assign article_date_format = "long" %}
      {% endif %}

      <time class="date" datetime="{{ article.created_at | date: '%Y-%m-%d' }}">{{ article.created_at | format_date: article_date_format }}</time>
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
