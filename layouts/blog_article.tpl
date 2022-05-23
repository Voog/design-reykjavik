<!DOCTYPE html>
{%- include "template-settings" -%}
{%- include "template-variables" -%}
{%- include "blog-article-variables" -%}
<html class="{% if editmode %}editmode{% else %}public{% endif %}" lang="{{ page.language_code }}">
<head prefix="og: http://ogp.me/ns#">
  {% assign blog_article = true %}
  {% include "edicy-tools-variables" %}
  {% include "edicy-tools-article-variables" %}
  {% include "html-head" blog_article: true %}
  {{ site.stats_header }}
</head>

<body class="post-page js-body global-background-color {{ background_type }}-background{% if editmode %} editmode{% endif %}{% if site.search.enabled %} search-enabled{% endif %}" {% if background_color != '' or editmode %}{{ background_color_style}}{% endif %}>
  <div class="header-wrapper {{ article_cover_type }}">
    <div class="background-image cover article-cover-image"></div>
    {% if article_cover_color != '' or editmode %}<div class="background-color cover article-cover-color edy-img-drop-area"{{ article_cover_color_style }}></div>{% endif %}

    {% include "header" %}
    <div class="post-header-wrapper">
      {% if editmode %}
        <button class="bgpicker-toggle-button article-cover-settings" style="display:none;" data-bg-color="{{ article_cover_color }}" data-bg-image="{{ article_cover_image }}"></button>
      {% endif %}

      <header class="post-header content-formatted">
        <h1 class="post-title">
          {% editable article.title %}
        </h1>
        <section class="post-meta">
          <span class="post-author">{{ article.author.name }}</span><span class="separator"> &nbsp;•&nbsp;</span>
          {% assign article_year = article.created_at | format_date: "%Y" | to_num %}

          {% if article_year == current_year %}
            {% assign article_date_format = "long_without_year" %}
          {% else %}
            {% assign article_date_format = "long" %}
          {% endif %}

          <time class="post-date" datetime="{{ article.created_at | date: '%Y-%m-%d' }}">{{ article.created_at | format_date: article_date_format }}</time>
        </section>
      </header>
    </div>
  </div>
  <div class="container">
  {% if background_color != '' or editmode %}<div class="background-color global-background-color"{{ background_color_style }}></div>{% endif %}

    <main class="content content-formatted" role="main">
      <article class="post full">

        <section class="post-content content-centered">
          <div class="post-excerpt content-formatted" {{ edy_intro_edit_text }}>{% editable article.excerpt %}</div>
          <div class="post-body content-formatted">{% editable article.body %}</div>
          <div class="post-body content-formatted">
            {%- assign additional_content_title = "additional_content" | lce -%}
            {%- assign additional_content_title_tooltip = "content_tooltip_additional_information" | lce -%}
            {% content
              name="additional_body"
              bind="Article"
              title=additional_content_title
              title_tooltip=additional_content_title_tooltip
            %}
          </div>

          {%- assign gallery_title = "gallery" | lce -%}
          {%- assign gallery_title_tooltip = "content_tooltip_additional_images" | lce -%}
          {% content name="gallery" bind="Article" title=gallery_title title_tooltip=gallery_title_tooltip %}
          {% include "tags-post" %}
        </section>
      </article>

      {% if article.older or article.newer %}
        <div class="post-nav">
          <div class="post-nav-inner">
            {% if article.older %}
              <a class="post-nav-link post-nav-link-older noborder" href="{{ article.older.url }}">
                <div class="post-nav-link-inner">
                  <div class="post-nav-direction">{{ "previous" | lc }}</div>
                  <div class="post-nav-title">{{ article.older.title }}</div>
                </div>
              </a>
            {% endif %}

            {% if article.newer %}
              <a class="post-nav-link post-nav-link-newer noborder" href="{{ article.newer.url }}">
                <div class="post-nav-link-inner">
                  <div class="post-nav-direction">{{ "next" | lc }}</div>
                  <div class="post-nav-title">{{ article.newer.title }}</div>
                </div>
              </a>
            {% endif %}
          </div>
        </div>
      {% endif %}

      <section id="comments" class="comments content-formatted content-centered">
        {% include "comments" %}
        {% unless article.new_record? %}
          {% include "comment-form" %}
        {% endunless %}
      </section>

    </main>
    {% include "footer" %}
  </div>
  {% include "site-signout" %}
  {% include "javascripts" %}
  <script type="text/javascript">
    site.initArticlePage();
  </script>
  {% include "edicy-tools-article" %}
</body>
</html>
