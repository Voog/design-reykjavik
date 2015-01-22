<!DOCTYPE html>
<html lang="{{ page.language_code }}">

<head>
  {% include "SiteHeader" %}
</head>

<body id="blog">

  <div id="holder">
    {% include "MobileMenus" %}
    <div class="wrap">
      <div id="header" class="cfx">
        <div id="logo">{% editable site.header %}</div>
        <div class="inner">
          {% include "Langmenu" %}
          {% include "Mainmenu" %}
        </div>
      </div>

      
        {% if tags %}
            <div class="tagged-list-header">
                <div class="header-tag-icon"></div>
                {% if tags == empty %}
                    {{ "no_posts_tagged" | lc }}
                {% else %}
                    {{ "posts_tagged" | lc }} '{{ tags | sort:"name" | map:"name" | join:"', '"}}'.
                {% endif %}
            </div>
        {% endif %}
        
      <div id="container" class="cfx">
        <div id="content">
          {% if editmode %}
            <div style="padding-bottom: 30px;">{% addbutton class="add-article" %}</div>
          {% endif %}
          <div class="news-list news-list-all">
            {% for article in articles %}
              {% if forloop.index < 11 %}
                <div class="news-item{% if forloop.index == 1%} news-item-first{% endif %} content-hyphenate">
                  <div class="news-info">
                    {{ article.author.name }} &nbsp;&#149;&nbsp; <span class="date">{{article.created_at | format_date:"short"}}, {{article.created_at | format_date:"%Y"}}</span> {% if article.comments_count > 0 %}&nbsp;<a href="{{article.url}}#comments" class="comments-count">{{article.comments_count}}</a>{% endif %}
                  </div>

                  <h1><a href="{{ article.url }}">{{ article.title }}</a></h1>

                  <div class="excerpt cfx">{{ article.excerpt }} <a href="{{ article.url }}" class="nowrap">{{ "read_more"|lc }}</a></div>
                </div>
              {% endif %}
            {% endfor %}

            
            {% if articles.size > 10%}
            <div class="news-older">
              <h3><a href="#" class="news-older-show">{{ "older_news"|lc }}</a></h3>

              <div class="news-older-hidden">
                {% for article in articles %}
                {% if forloop.index > 10 %}
                <div class="cfx news-older-item">
                  <div class="date">{{article.created_at | format_date:"short"}}, {{article.created_at | format_date:"%Y"}}</div>
                  <div class="news-older-item-text"><a href="{{article.url}}">{{ article.title }}</a></div>
                </div>
                {% endif %}
                {% endfor %}
              </div>
            </div>
            {% endif %}
          </div>
        </div>
      </div>

    </div>
  </div>

  <div id="footer">
    <div class="wrap cfx">
      
      <div class="inner">
        <div class="cfx content-hyphenate">
          {% xcontent name="footer" %}
        </div>
      </div>
      {% include "Search" %}
    </div>
  </div>

  {% include "JS" %}
</body>
</html>