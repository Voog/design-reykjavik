<!DOCTYPE html>
<html>

<head>
  {% include "SiteHeader" %}
</head>

<body id="front">

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
        <div id="content" class="cfx">
          <div class="content-left slogan">
              <div class="cfx">
              {% content name="slogan" %}
              </div>
          </div>

          <div class="content-right">
            <div class="cfx">
            {% content %}
            </div>
            
            <div class="cfx">
            {% contentblock name="default-content" %}
              <p style="margin-bottom: 0;">
                <img src="{{ images_path }}/photo01.jpg" alt="" >
              </p>
            {% endcontentblock %}
            </div>
          </div>
          
          <div class="content-left content-left-last">
            {% include "LatestNews" %}
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
