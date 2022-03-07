body {
  font-family: var(--font);
}

body.light-background {
  color: var(--dark-primary);
}

body.dark-background {
  color: var(--light-primary);
}

.header,
.container,
.content,
.footer .footer-inner,
.voog-reference,
.blog-page .tagged-list-header {
  max-width: var(--site-width);
}

@media screen and (min-width: 752px) {
  .header,
  .container {
    padding-left: 20px;
    padding-right: 20px;
  }
  .front-page .content-left {
    max-width: 900px;
  }
}

.light-background .content-formatted a:not(.noborder):not(.custom-btn):not(.link):not(.edy-content-social-button):not(.edy-product-widget-item-btn):not(.edy-product-widget-item-link):not(.edy-product-widget-item-url),
.light-background .voog-search-modal a:not(.noborder):not(.custom-btn),
.dark-background .content-formatted a:not(.noborder):not(.custom-btn):not(.link):not(.edy-content-social-button):not(.edy-product-widget-item-btn):not(.edy-product-widget-item-link):not(.edy-product-widget-item-url),
.dark-background .voog-search-modal a:not(.noborder):not(.custom-btn) {
  border-bottom-color: var(--content-links-border-bottom-color);
  -webkit-box-shadow: inset 0 -4px 0 var(--content-links-border-bottom-color);
          box-shadow: inset 0 -4px 0 var(--content-links-border-bottom-color);
}

.light-background .content-formatted a:not(.noborder):not(.custom-btn):not(.link):not(.edy-content-social-button):not(.edy-product-widget-item-btn):not(.edy-product-widget-item-link):not(.edy-product-widget-item-url):hover,
.light-background .voog-search-modal a:not(.noborder):not(.custom-btn):hover,
.dark-background .content-formatted a:not(.noborder):not(.custom-btn):not(.link):not(.edy-content-social-button):not(.edy-product-widget-item-btn):not(.edy-product-widget-item-link):not(.edy-product-widget-item-url):hover,
.dark-background .voog-search-modal a:not(.noborder):not(.custom-btn):hover {
  border-bottom-color: var(--content-links-hover-border-bottom-color);
  -webkit-box-shadow: inset 0 -4px 0 0 var(--content-links-hover-border-bottom-color);
          box-shadow: inset 0 -4px 0 0 var(--content-links-hover-border-bottom-color);
}

.light-background .header .header-title,
.light-background .header .header-title a {
  color: var(--dark-primary);
}

.light-background .menu-main .menu .menu-link {
  color: var(--dark-primary);
}

.light-background .menu-main .menu .menu-link:hover {
  color: var(--dark-primary);
}

.light-background .menu-main .menu .menu-link.active, .light-background .menu-main .menu .menu-link.active:hover {
  color: var(--dark-primary);
}

.light-background .header .langmenu .langmenu-content {
  color: var(--dark-secondary);
}

.light-background .content-left .menu .menu-link.active {
  color: var(--dark-primary);
}

.light-background .post .post-excerpt,
.light-background .post .post-body {
  color: var(--dark-secondary);
}

.light-background .post .post-date {
  color: var(--dark-primary);
  opacity: .4;
}

.light-background .comments .comment-body {
  color: var(--dark-primary);
}

.light-background .content-formatted,
.light-background .content-formatted b,
.light-background .content-formatted strong,
.light-background .content-formatted h1,
.light-background .content-formatted h2,
.light-background .content-formatted h3,
.light-background .content-formatted h4,
.light-background .content-formatted h5,
.light-background .content-formatted h6,
.light-background .content-formatted li:before,
.light-background .content-formatted a:not(.noborder):not(.custom-btn) {
  color: var(--dark-primary);
}

.light-background .content-formatted a:not(.noborder):not(.custom-btn):hover {
  color: var(--dark-primary);
  opacity: .6;
}

.light-background .content-formatted table tr {
  border-top-color: var(--dark-secondary);
  border-top-style: var(--table-border-style);
}

.light-background .content-formatted .form_field_textfield,
.light-background .content-formatted .form_field_textarea,
.light-background .content-formatted .form_field_select,
.light-background .content-formatted .form_field_file {
  color: var(--dark-primary);
}

.light-background .content-formatted .custom-btn:not(.custom-btn-disabled),
.light-background .content-formatted .form_submit input {
  background: -webkit-gradient(linear, left top, left bottom, color-stop(0, rgba(255, 255, 255, 0.6)), to(rgba(255, 255, 255, 0.8)));
  background: -webkit-linear-gradient(top, rgba(255, 255, 255, 0.6) 0, rgba(255, 255, 255, 0.8) 100%);
  background: -o-linear-gradient(top, rgba(255, 255, 255, 0.6) 0, rgba(255, 255, 255, 0.8) 100%);
  background: linear-gradient(to bottom, rgba(255, 255, 255, 0.6) 0, rgba(255, 255, 255, 0.8) 100%);
  background-color: var(--button-background-color);
  color: var(--dark-secondary);
}

.light .post-header .post-title,
.light .post-header .post-meta {
  color: var(--dark-primary);
}

.blog-page.light-background .tagged-list-header .menu-link.active {
  color: var(--dark-primary);
  font-weight: 600;
}

.light-background .search input {
  color: var(--dark-secondary);
}

.light-background .news .date,
.light-background .news .author,
.light-background .comments .comment-date {
  color: var(--dark-primary);
  opacity: .4;
}

.light-background .voog-reference a, .voog-reference a {
  color: var(--dark-secondary);
}

.dark-background .header .header-title,
.dark-background .header .header-title a {
  color: var(--light-primary);
}

.dark-background .menu-main .menu .menu-link {
  color: var(--light-primary);
}

.dark-background .menu-main .menu .menu-link:hover {
  color: var(--light-primary);
}

.dark-background .menu-main .menu .menu-link.active, .dark-background .menu-main .menu .menu-link.active:hover {
  color: var(--light-primary);
}

.dark-background .header .langmenu .langmenu-content {
  color: var(--light-secondary);
}

.dark-background .content-left .menu .menu-link.active {
  color: var(--light-primary);
}

.dark-background .post .post-excerpt,
.dark-background .post .post-body {
  color: var(--light-secondary);
}

.dark-background .post .post-date {
  color: var(--light-primary);
  opacity: .4;
}

.dark-background .comments .comment-body {
  color: var(--light-primary);
}

.dark-background .content-formatted,
.dark-background .content-formatted b,
.dark-background .content-formatted strong,
.dark-background .content-formatted h1,
.dark-background .content-formatted h2,
.dark-background .content-formatted h3,
.dark-background .content-formatted h4,
.dark-background .content-formatted h5,
.dark-background .content-formatted h6,
.dark-background .content-formatted li:before,
.dark-background .content-formatted a:not(.noborder):not(.custom-btn) {
  color: var(--light-primary);
}

.dark-background .content-formatted a:not(.noborder):not(.custom-btn):hover {
  color: var(--light-primary);
  opacity: .6;
}

.dark-background .content-formatted table tr {
  border-top-color: var(--light-secondary);
  border-top-style: var(--table-border-style);
}

.dark-background .content-formatted .form_field_textfield,
.dark-background .content-formatted .form_field_textarea {
  color: var(--dark-primary);
}

.dark-background .content-formatted .custom-btn:not(.custom-btn-disabled),
.dark-background .content-formatted .form_submit input {
  background: -webkit-gradient(linear, left top, left bottom, color-stop(0, rgba(0, 0, 0, 0.6)), to(rgba(0, 0, 0, 0.8)));
  background: -webkit-linear-gradient(top, rgba(0, 0, 0, 0.6) 0, rgba(0, 0, 0, 0.8) 100%);
  background: -o-linear-gradient(top, rgba(0, 0, 0, 0.6) 0, rgba(0, 0, 0, 0.8) 100%);
  background: linear-gradient(to bottom, rgba(0, 0, 0, 0.6) 0, rgba(0, 0, 0, 0.8) 100%);
  background-color: var(--button-background-color);
  color: var(--light-secondary);
}

.dark .post-header .post-title,
.dark .post-header .post-meta {
  color: var(--light-primary);
}

.blog-page.dark-background .tagged-list-header .menu-link.active {
  color: var(--light-primary);
  font-weight: 600;
}

.dark-background .search input {
  color: var(--light-secondary);
}

.dark-background .news .date,
.dark-background .news .author,
.dark-background .comments .comment-date {
  color: var(--light-primary);
  opacity: .4;
}

.dark-background .voog-reference a, .voog-reference a {
  color: var(--light-secondary);
}

.header .header-title,
.header .header-title a {
  font-size: var(--header-site-title-font-size);
  font-style: var(--header-site-title-font-style);
  font-weight: var(--header-site-title-font-weight);
  line-height: var(--header-site-title-line-height);
  -webkit-text-decoration: var(--header-site-title-text-decoration);
          text-decoration: var(--header-site-title-text-decoration);
  text-transform: var(--header-site-title-text-transform);
}

.menu-main .menu .menu-link {
  font-size: var(--header-mainmenu-font-size);
  font-style: var(--header-mainmenu-font-style);
  font-weight: var(--header-mainmenu-font-weight);
  line-height: var(--header-mainmenu-line-height);
  -webkit-text-decoration: var(--header-mainmenu-text-decoration);
          text-decoration: var(--header-mainmenu-text-decoration);
  text-transform: var(--header-mainmenu-text-transform);
}

.menu-main .menu .menu-link:hover {
  font-style: var(--header-mainmenu-hover-font-style);
  font-weight: var(--header-mainmenu-hover-font-weight);
  opacity: .6;
  -webkit-text-decoration: var(--header-mainmenu-hover-text-decoration);
          text-decoration: var(--header-mainmenu-hover-text-decoration);
  text-transform: var(--header-mainmenu-hover-text-transform);
}

.menu-main .menu .menu-link.active, .menu-main .menu .menu-link.active:hover {
  font-style: var(--header-mainmenu-active-font-style);
  font-weight: var(--header-mainmenu-active-font-weight);
  -webkit-text-decoration: var(--header-mainmenu-active-text-decoration);
          text-decoration: var(--header-mainmenu-active-text-decoration);
  text-transform: var(--header-mainmenu-active-text-transform);
}

main.content-formatted h1,
main.content-formatted h1 a,
main.content-formatted h1 a:hover,
.item-page .content-header .content-item-title h1,
.item-page .content-header .content-item-title h1 a,
.item-page .content-header .content-item-title h1 a:hover {
  font-size: var(--h1-font-size);
  font-style: var(--h1-font-style);
  font-weight: var(--h1-font-weight);
  line-height: var(--h1-line-height);
  text-align: var(--h1-alignment);
  -webkit-text-decoration: var(--h1-text-decoration);
          text-decoration: var(--h1-text-decoration);
  text-transform: var(--h1-text-transform);
}

main.content-formatted h2,
main.content-formatted h2 a,
main.content-formatted h2 a:hover,
.item-page .content-header .content-item-title h2,
.item-page .content-header .content-item-title h2 a,
.item-page .content-header .content-item-title h2 a:hover {
  font-size: var(--h2-font-size);
  font-style: var(--h2-font-style);
  font-weight: var(--h2-font-weight);
  line-height: var(--h2-line-height);
  text-align: var(--h2-alignment);
  -webkit-text-decoration: var(--h2-text-decoration);
          text-decoration: var(--h2-text-decoration);
  text-transform: var(--h2-text-transform);
}

main.content-formatted h3,
main.content-formatted h3 a,
main.content-formatted h3 a:hover,
.item-page .content-header .content-item-title h3,
.item-page .content-header .content-item-title h3 a,
.item-page .content-header .content-item-title h3 a:hover {
  font-size: var(--h3-font-size);
  font-style: var(--h3-font-style);
  font-weight: var(--h3-font-weight);
  line-height: var(--h3-line-height);
  text-align: var(--h3-alignment);
  -webkit-text-decoration: var(--h3-text-decoration);
          text-decoration: var(--h3-text-decoration);
  text-transform: var(--h3-text-transform);
}

.content-formatted .content-header {
  font-size: var(--content-title-font-size);
  font-style: var(--content-title-font-style);
  font-weight: var(--content-title-font-weight);
  line-height: var(--content-title-line-height);
  -webkit-text-decoration: var(--content-title-text-decoration);
          text-decoration: var(--content-title-text-decoration);
  text-transform: var(--content-title-text-transform);
}

#sidebar {
  line-height: var(--content-submenu-line-height);
}

#sidebar .menu .menu-item a {
  font-size: var(--content-submenu-font-size);
  font-style: var(--content-submenu-font-style);
  font-weight: var(--content-submenu-font-weight);
  line-height: var(--content-submenu-line-height);
  -webkit-text-decoration: var(--content-submenu-text-decoration);
          text-decoration: var(--content-submenu-text-decoration);
  text-transform: var(--content-submenu-text-transform);
}

#sidebar .menu .menu-item a:hover {
  font-style: var(--content-submenu-hover-font-style);
  font-weight: var(--content-submenu-hover-font-weight);
  -webkit-text-decoration: var(--content-submenu-hover-text-decoration);
          text-decoration: var(--content-submenu-hover-text-decoration);
  text-transform: var(--content-submenu-hover-text-transform);
}

#sidebar .menu .menu-item a.menu-link.active, #sidebar .menu .menu-item a.menu-link.active:hover, #sidebar .menu .menu-item a.active, #sidebar .menu .menu-item a.active:hover {
  font-style: var(--content-submenu-active-font-style);
  font-weight: var(--content-submenu-active-font-weight);
  -webkit-text-decoration: var(--content-submenu-active-text-decoration);
          text-decoration: var(--content-submenu-active-text-decoration);
  text-transform: var(--content-submenu-active-text-transform);
}

main.content-formatted .content-body {
  font-size: var(--content-font-size);
  line-height: var(--content-line-height);
}

.post-page .post {
  font-size: var(--content-font-size);
  line-height: var(--content-line-height);
}

main.content-formatted a:not(.noborder):not(.custom-btn):not(.link):not(.edy-content-social-button):not(.edy-product-widget-item-btn):not(.edy-product-widget-item-link):not(.edy-product-widget-item-url),
footer .content-formatted a:not(.noborder):not(.custom-btn):not(.link):not(.edy-content-social-button):not(.edy-product-widget-item-btn):not(.edy-product-widget-item-link):not(.edy-product-widget-item-url) {
  border-bottom-style: var(--content-links-border-bottom);
  font-style: var(--content-links-font-style);
  font-weight: var(--content-links-font-weight);
  text-transform: var(--content-links-text-transform);
}

main.content-formatted a:not(.noborder):not(.custom-btn):not(.link):not(.edy-content-social-button):not(.edy-product-widget-item-btn):not(.edy-product-widget-item-link):not(.edy-product-widget-item-url):hover,
footer .content-formatted a:not(.noborder):not(.custom-btn):not(.link):not(.edy-content-social-button):not(.edy-product-widget-item-btn):not(.edy-product-widget-item-link):not(.edy-product-widget-item-url):hover {
  border-bottom-style: var(--content-links-hover-border-bottom);
  font-style: var(--content-links-hover-font-style);
  font-weight: var(--content-links-hover-font-weight);
  text-transform: var(--content-links-hover-text-transform);
}

.light-background .content-formatted .post .post-title, .light-background .content-formatted .post .post-title:hover,
.light-background .content-formatted .post .post-title a,
.light-background .content-formatted .post .post-title a:hover {
  color: var(--dark-primary);
}

.content-formatted .post .post-title, .content-formatted .post .post-title:hover,
.content-formatted .post .post-title a,
.content-formatted .post .post-title a:hover {
  font-size: var(--blog-list-title-font-size);
  line-height: var(--blog-list-title-line-height);
  font-weight: var(--blog-list-title-font-weight);
  font-style: var(--blog-list-title-font-style);
  text-align: var(--blog-list-title-alignment);
  -webkit-text-decoration: var(--blog-list-title-text-decoration);
          text-decoration: var(--blog-list-title-text-decoration);
  text-transform: var(--blog-list-title-text-transform);
}

.post .post-date {
  font-size: 0.833em;
  font-style: var(--blog-list-date-font-style);
  font-weight: var(--blog-list-date-font-weight);
  line-height: var(--content-line-height);
  -webkit-text-decoration: var(--blog-list-date-text-decoration);
          text-decoration: var(--blog-list-date-text-decoration);
  text-transform: var(--blog-list-date-text-transform);
}

.post-page .header-wrapper .post-header h1 {
  font-size: var(--blog-article-title-font-size);
  font-style: var(--blog-article-title-font-style);
  font-weight: var(--blog-article-title-font-weight);
  line-height: var(--blog-article-title-line-height);
  text-align: var(--blog-article-title-alignment);
  -webkit-text-decoration: var(--blog-article-title-text-decoration);
          text-decoration: var(--blog-article-title-text-decoration);
  text-transform: var(--blog-article-title-text-transform);
}

.post-page .header-wrapper .post-header .post-meta {
  font-size: var(--blog-article-date-font-size);
  font-style: var(--blog-article-date-font-style);
  font-weight: var(--blog-article-date-font-weight);
  line-height: var(--blog-article-date-line-height);
  -webkit-text-decoration: var(--blog-article-date-text-decoration);
          text-decoration: var(--blog-article-date-text-decoration);
  text-transform: var(--blog-article-date-text-transform);
}

.footer .content-formatted {
  font-size: var(--footer-font-size);
  line-height: var(--footer-line-height);
}

.light-background .footer .content-formatted {
  color: var(--dark-primary);
}

.dark-background .footer .content-formatted {
  color: var(--light-primary);
}

.content-formatted .custom-btn,
.content-formatted .form_submit input {
  font-size: var(--button-font-size);
  font-style: var(--button-font-style);
  font-weight: var(--button-font-weight);
  line-height: var(--button-line-height);
  -webkit-text-decoration: var(--button-text-decoration);
          text-decoration: var(--button-text-decoration);
  text-transform: var(--button-text-transform);
}

.content-formatted .custom-btn:not(.custom-btn-disabled):hover,
.content-formatted .form_submit input:hover {
  opacity: .6;
}

.content-formatted table td {
  padding: var(--table-cell-padding) 0;
}

.content-formatted .form_field_textfield,
.content-formatted .form_field_textarea,
.content-formatted .form_field_select,
.content-formatted .form_field_file,
.content-formatted .form_field,
.content-formatted .edy-fe-label {
  font-size: var(--form-field-text-font-size);
  font-style: var(--form-field-text-font-style);
  font-weight: var(--form-field-text-font-weight);
  line-height: var(--form-field-text-line-height);
  -webkit-text-decoration: var(--form-field-text-decoration);
          text-decoration: var(--form-field-text-decoration);
  text-transform: var(--form-field-text-transform);
}

nav.tags,
section.news {
  font-size: var(--content-font-size);
  line-height: var(--content-line-height);
}

.comments {
  font-size: var(--content-font-size);
  line-height: var(--content-line-height);
}

.comments .comment-form,
.comments .comment-title {
  font-size: 1.1em;
}

.item-page .product-content .product-price {
  color: var(--content-area-product-price__color);
  font-size: var(--content-area-product-price__font-size);
  font-weight: var(--content-area-product-price__font-weight);
  font-style: var(--content-area-product-price__font-style);
  -webkit-text-decoration: var(--content-area-product-price__text-decoration);
          text-decoration: var(--content-area-product-price__text-decoration);
}

.item-page .product-content .product-description {
  color: var(--content-area-product-description__color);
  font-size: var(--content-area-product-description__font-size);
  font-weight: var(--content-area-product-description__font-weight);
  font-style: var(--content-area-product-description__font-style);
  -webkit-text-decoration: var(--content-area-product-description__text-decoration);
          text-decoration: var(--content-area-product-description__text-decoration);
}

.item-page .product-content .content-item-title h1 {
  color: var(--content-area-product-title__color);
  font-size: var(--content-area-product-title__font-size);
  font-weight: var(--content-area-product-title__font-weight);
  font-style: var(--content-area-product-title__font-style);
  -webkit-text-decoration: var(--content-area-product-title__text-decoration);
          text-decoration: var(--content-area-product-title__text-decoration);
  text-align: var(--content-area-product-title__alignment);
}

.dark-background .edy-product-widget-grid .edy-product-widget-item .edy-product-widget-item-details-wrap .edy-product-widget-item-title,
.dark-background .edy-product-widget-grid .edy-product-widget-item .edy-product-widget-item-details-wrap .edy-product-widget-item-link {
  color: var(--light-primary);
}

.dark-background .edy-product-widget-grid .edy-product-widget-item .edy-product-widget-item-details-wrap .edy-product-widget-item-price,
.dark-background .edy-product-widget-grid .edy-product-widget-item .edy-product-widget-item-details-wrap .edy-product-widget-item-description {
  color: var(--light-primary);
  opacity: .7;
}

.dark-background .edy-product-widget-grid .edy-product-widget-item .edy-product-widget-item-top-outer .edy-product-widget-item-top.edy-product-widget-item-without-image {
  border: 1px solid var(--light-primary);
  opacity: .5;
}

.dark-background .edy-product-widget-grid .edy-product-widget-item .edy-product-widget-item-details-flex-wrap .edy-product-widget-item-out-of-stock,
.dark-background .edy-product-widget-grid .edy-product-widget-item .edy-product-widget-item-details-flex-wrap .edy-product-widget-item-btn {
  color: var(--light-primary);
}

.dark-background .edy-product-widget-grid .edy-product-widget-item:hover .edy-product-widget-item-price {
  opacity: 0;
}

.dark-background .edy-product-widget-list .edy-product-widget-item-wrap .edy-product-widget-item .edy-product-widget-item-details-wrap .edy-product-widget-item-header .edy-product-widget-item-title .edy-product-widget-item-link {
  color: var(--light-primary);
}

.dark-background .edy-product-widget-list .edy-product-widget-item-wrap .edy-product-widget-item .edy-product-widget-item-details-wrap .edy-product-widget-item-header .edy-product-widget-item-price {
  color: var(--light-primary);
  opacity: .7;
}

.dark-background .edy-product-widget-list .edy-product-widget-item-wrap .edy-product-widget-item .edy-product-widget-item-details-wrap .edy-product-widget-item-header .edy-product-widget-item-out-of-stock {
  color: var(--light-primary);
}

.dark-background .edy-product-widget-list .edy-product-widget-item-wrap .edy-product-widget-item .edy-product-widget-item-details-wrap .edy-product-widget-item-description {
  color: var(--light-primary);
}

.dark-background .edy-product-widget-list .edy-product-widget-item-wrap .edy-product-widget-item .edy-product-widget-item-details-wrap .edy-product-widget-item-without-image {
  border: 1px solid var(--light-primary);
  opacity: .5;
}

.edy-product-widget-filter-sort option {
  color: var(--dark-primary);
}

.dark-background .edy-product-widget-filter-name,
.dark-background .edy-product-widget-filter-sort,
.dark-background .edy-product-widget-filter-label,
.dark-background .edy-product-widget-filter-search-input {
  color: var(--light-primary);
}
