<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js" integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4=" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery_lazyload/1.9.7/jquery.lazyload.min.js" integrity="sha256-gDUQmMJHiRi7gACNeDZJkwW/b01LKr90K4gjJVu7DY4=" crossorigin="anonymous"></script>
<script src="{{ javascripts_path }}/application.min.js?v={{ template_settings.version }}"></script>
{% sitejs_include %}
{% comment %}Site search related javascript components.{% endcomment %}
{% if site.search.enabled %}
  <script src="{{ site.static_asset_host }}/libs/edicy-search/latest/edicy-search.js"></script>
  <script>site.bindSiteSearch($('.js-search-form').get(0), '{{ page.language_code }}', '{{ 'search_noresults' | lc | escape }}');</script>
{% endif %}

{% unless editmode %}{{ site.analytics }}{% endunless %}
