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

      <div id="container" class="cfx">
        <div id="content">
          <div class="news-list">
            <div class="news-item news-item-first">
              <div class="news-info">
                {{ article.author.name }} &nbsp;&#149;&nbsp; <span class="date">{{article.created_at | format_date:"short"}}, {{article.created_at | format_date:"%Y"}}</span> {% if article.comments_count > 0 %}&nbsp;<a href="{{article.url}}#comments" class="comments-count">{{article.comments_count}}</a>{% endif %}
              </div>

              <h1>{% editable article.title %}</h1>

              <div class="excerpt cfx" data-search-indexing-allowed="true">
                {% editable article.excerpt %}
              </div>
              
              <div class="article-body cfx" data-search-indexing-allowed="true">
                {% editable article.body %}
              </div>
              <div class="cfx">
                {% unless article.new_record? %}{% content name="gallery" bind="Article" %}{% endunless %}
              </div>
                  {% if editmode %}
                    <div class="cfx article-tags">
                        <div class="article-tag-icon"></div>
                        {% editable article.tags %}
                    </div>
                  {% else %}
                    {% unless article.tags == empty %}
                        <div class="cfx article-tags">
                            <div class="article-tag-icon"></div>
                            {% for tag in article.tags %}
                                <a href="{{ article.page.url }}/tagged/{{ tag.path }}">{{ tag.name }}</a>{% unless forloop.last %}, {% endunless %}
                            {% endfor %}
                        </div>
                    {% endunless %}
                  {% endif %}
            </div>
          </div>
          
          <div class="comments-holder">
            <div class="comments" id="comments">
            {% if article.comments_count > 0 %}
            <h2>{{"comments"|lc }}</h2>
            {% endif %}
            
            {% if article.comments_count > 0 %}
            <ul class="comments-list">{% for comment in article.comments %}
              <li class="edy-site-blog-comment">
                {{comment.author}} &nbsp;&#149;&nbsp; <span class="date">{{comment.created_at | format_date:"short"}}, {{comment.created_at | format_date:"%Y"}}</span> {% removebutton %}
                <p class="comment-body">
                  {{comment.body_html}}
                </p>
              </li>{% endfor %}
            </ul>
            
            {% endif %}
           
            <div class="comments-add{% if article.comments_count > 0 %} comments-add-border{% endif %}">
            <h2>{{"add_a_comment"|lc}}</h2>
            {% commentform %}
              {% unless comment.valid? %}
                <ul class="comment-errors">
                  {% for error in comment.errors %}
                    <li>{{ error | lc }}</li>
                  {% endfor %}
                </ul>
              {% endunless %}
           
              <p>
                <label for="commentform-name">{{"name"|lc}}</label>
                <input type="text" class="textbox bold blog-form-small" id="commentform-name" value="{{comment.author}}" name="comment[author]" />
              </p>
     
              <p>
                <label for="commentform-email">{{"email"|lc}}</label>
                <input type="text" class="textbox blog-form-small" id="commentform-email" value="{{comment.author_email}}" name="comment[author_email]" />
              </p>
     
              <p>
                <label for="commentform-body">{{"comment"|lc}}</label>
                <textarea class="textbox blog-form-large" rows="4" cols="62" name="comment[body]">{{comment.body}}</textarea>
              </p>
     
              <p style="margin-bottom: 0;"><input type="submit" class="submit" value="{{"submit"|lc}}" /></p>
            {% endcommentform %}
            </div>
            </div>
          </div>
          
        </div>
      </div>

    </div>
  </div>

  <div id="footer">
    <div class="wrap cfx">
      <div class="inner">
        <div class="cfx">
          {% xcontent name="footer" %}
        </div>
      </div>
      {% include "Search" %}
    </div>
  </div>

  {% include "JS" %}
</body>
</html>


