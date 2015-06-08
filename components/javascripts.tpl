<script src="{{ javascripts_path }}/application.min.js"></script>
{% sitejs_include %}
{% if site.search.enabled %}
  <script src="{{ site.static_asset_host }}/libs/edicy-search/latest/edicy-search.js"></script>
  <script>
    var search = new VoogSearch($('.js-search-form').get(0), {
      per_page: 3,
      lang: '{{ page.language_code }}',
      sideclick: true,
      mobileModeWidth: 752,
      updateOnKeypress: false,
      resultsContainer: $('.voog-search-modal').get(0)
    });
  </script>

{% endif %}
{% unless editmode %}{{ site.analytics }}{% endunless %}
