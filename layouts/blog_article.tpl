<!DOCTYPE html>
<html class="{% if editmode %}editmode{% else %}public{% endif %}" lang="{{ page.language_code }}">
<head prefix="og: http://ogp.me/ns#">
  {% include "html-head" %}
  {% include "bg-picker-variables" %}
  {% include "bg-picker-article-variables" %}
  {{ site.stats_header }}
</head>

<body class="post-page js-body global-background-color {{ background_type }}-background{% if editmode %} editmode{% endif %}" {% if background_color != '' or editmode %}{{ background_color_style}}{% endif %}>

  {% include "menu-mobile" %}
  <div class="header-wrapper {{ article_cover_type }}">
    {% if editmode %}
      <button class="bgpicker-toggle-button article-cover-settings" style="display:none;" data-bg-color="{{ article_cover_color }}" data-bg-image="{{ article_cover_image }}"></button>
    {% endif %}
    {% include "header" %}
    <div class="post-header-wrapper">
      {% if article_cover_image != '' or editmode %}<div class="background-image cover article-cover-image"{{ article_cover_image_style }}></div>{% endif %}
      {% if article_cover_color != '' or editmode %}<div class="background-color cover article-cover-color"{{ article_cover_color_style }}></div>{% endif %}
      <header class="post-header content-formatted">
        <h1 class="post-title">
          {% editable article.title %}
        </h1>
        <section class="post-meta">
          <span class="post-author">{{ article.author.name }}</span><span class="separator"> &nbsp;•&nbsp;</span>
          <time class="post-date" datetime="{{ article.created_at | date : "%Y-%m-%d" }}">{{ article.created_at | format_date : "long" }}</time>
        </section>
      </header>
    </div>
  </div>
  <div class="container">
  {% if background_color != '' or editmode %}<div class="background-color global-background-color"{{ background_color_style }}></div>{% endif %}

    <main class="content content-formatted" role="main">
      <article class="post full">

        <section class="post-content content-centered">
          <div class="post-excerpt content-formatted">
            {% editable article.excerpt %}
          </div>

          <div class="post-body content-formatted">
            {% editable article.body %}
          </div>

          {% unless article.new_record? %}{% content name="gallery" bind="Article" %}{% endunless %}
          {% include "tags-post" %}
        </section>
      </article>

      <section id="comments" class="comments content-formatted content-centered">
        {% include "comments" %}
        {% unless article.new_record? %}
          {% include "comment-form" %}
        {% endunless %}
      </section>

    </main>
    {% include "footer" %}
  </div>
  {% include "javascripts" %}
  {% include "bg-picker-article" %}
</body>
</html>
