<script src="{{ javascripts_path }}/modernizr.js?21"></script>
<script src="{{ javascripts_path }}/jquery.js?2"></script>
<script src="{{ javascripts_path }}/retina.js?2"></script>
<script src="{{ javascripts_path }}/overthrow.js?2"></script>
<script src="{{ javascripts_path }}/search.js?2"></script>
<script src="{{ javascripts_path }}/main.js?2"></script>

<script>
  var search = new VoogSearch($('.js-search-form').get(0), {
    per_page: 2,
    lang: '{{ page.language_code }}'
  });
</script>
{% unless editmode %}{{ site.analytics }}{% endunless %}
