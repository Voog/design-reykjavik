<script src="{{ javascripts_path }}/modernizr.min.js?21"></script>
<script src="{{ javascripts_path }}/jquery.min.js?2"></script>
<script src="{{ javascripts_path }}/retina.min.js?2"></script>
<script src="{{ javascripts_path }}/overthrow.min.js?2"></script>
<script src="{{ javascripts_path }}/main.min.js?2"></script>
<script src="{{ site.static_asset_host }}/libs/picturefill/1.0.0/picturefill.min.js"></script>
{% if site.search.enabled %}
  <script src="{{ site.static_asset_host }}/libs/edicy-search/1.0.0/edicy-search.js"></script>
  <script>
    var search = new VoogSearch($('.js-search-form').get(0), {
      per_page: 3,
      lang: '{{ page.language_code }}',
      sideclick: true,
      mobileModeWidth: 480,
      updateOnKeypress: false
    });
  </script>
{% endif %}
{% unless editmode %}{{ site.analytics }}{% endunless %}
