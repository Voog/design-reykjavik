{% if site.search.enabled %}
<div class="right">
  <form id="search" class="edys-search" method="post" action="#">
    <div class="search-left">
      <input id="onpage_search" class="edys-search-input" type="text" placeholder="{{  "search" | lc }}" name="">
    </div>
    <div class="search-right">
      <input class="search-submit" type="submit" value="" name="">
    </div>
  </form>
</div>
{% endif %}
    