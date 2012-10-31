      {% if site.latest_2_articles.size > 0 %}
<div class="latest-news">
  <h2>{{ "latest_news"|lc }}</h2>
  {% for a in site.latest_2_articles %}
    <div class="news-item">
      {{ a.author.name }}, <a href="{{a.url}}">{{a.title}}</a>
      <div class="date">{{a.created_at | format_date:"short"}}, {{a.created_at | format_date:"%Y"}}</div>
    </div>
  {% endfor %}
 
  {% if site.latest_3_articles.size > 2 %}
    {% for a in site.latest_3_articles %}
      {% if forloop.index == 3 %}
        <a href="{{ a.page.url }}">{{ "older_news" | lc}}</a>
      {% endif  %}
    {% endfor %}
  {% endif %}
</div>
{% endif %}
    