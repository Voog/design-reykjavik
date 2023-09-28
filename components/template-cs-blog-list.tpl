:root {
  /* VoogStyle
    "pathI18n": ["blog", "title"],
    "titleI18n": "size",
    "editor": "rangePicker",
    "min": 8,
    "max": 80,
    "unit": "px",
    "scope": "global",
    "featured": true
  */
  --blog-list-title-font-size: 40px;
  /* VoogStyle
     "pathI18n": ["blog", "title"],
     "titleI18n": "line_height",
     "editor": "rangePicker",
     "min": 0.8,
     "max": 3,
     "step": 0.1,
     "unit": "em",
     "scope": "global"
  */
  --blog-list-title-line-height: 1.2;
  /* VoogStyle
     "pathI18n": ["blog", "title"],
     "titleI18n": "alignment",
     "editor": "listPicker",
     "list": {{ base_alignment_set }},
     "scope": "global"
  */
  --blog-list-title-alignment: left;
  /* VoogStyle
    "pathI18n": ["blog", "title"],
    "titleI18n": "font_weight",
    "type": "button",
    "editor": "toggleIcon",
    "states": {
      "on": "600",
      "off": "400"
    },
    "icon": "bold",
    "scope": "global"
  */
  --blog-list-title-font-weight: 600;
  /* VoogStyle
    "pathI18n": ["blog", "title"],
    "titleI18n": "font_style",
    "type": "button",
    "editor": "toggleIcon",
    "states": {
      "on": "italic",
      "off": "normal"
    },
    "icon": "italic",
    "scope": "global"
  */
  --blog-list-title-font-style: normal;
  /* VoogStyle
    "pathI18n": ["blog", "title"],
    "titleI18n": "text_decoration",
    "type": "button",
    "editor": "toggleIcon",
    "states": {
      "on": "underline",
      "off": "none"
    },
    "icon": "underline",
    "scope": "global"
  */
  --blog-list-title-text-decoration: none;
  /* VoogStyle
    "pathI18n": ["blog", "title"],
    "titleI18n": "text_transform",
    "type": "button",
    "editor": "toggleIcon",
    "states": {
      "on": "uppercase",
      "off": "none"
    },
    "icon": "uppercase",
    "scope": "global"
  */
  --blog-list-title-text-transform: none;
  /* VoogStyle
    "pathI18n": ["blog", "date"],
    "titleI18n": "font_weight",
    "type": "button",
    "editor": "toggleIcon",
    "states": {
      "on": "600",
      "off": "400"
    },
    "icon": "bold",
    "scope": "global"
  */
  --blog-list-date-font-weight: 400;
  /* VoogStyle
    "pathI18n": ["blog", "date"],
    "titleI18n": "font_style",
    "type": "button",
    "editor": "toggleIcon",
    "states": {
      "on": "italic",
      "off": "normal"
    },
    "icon": "italic",
    "scope": "global"
  */
  --blog-list-date-font-style: normal;
  /* VoogStyle
    "pathI18n": ["blog", "date"],
    "titleI18n": "text_decoration",
    "type": "button",
    "editor": "toggleIcon",
    "states": {
      "on": "underline",
      "off": "none"
    },
    "icon": "underline",
    "scope": "global"
  */
  --blog-list-date-text-decoration: none;
  /* VoogStyle
    "pathI18n": ["blog", "date"],
    "titleI18n": "text_transform",
    "type": "button",
    "editor": "toggleIcon",
    "states": {
      "on": "uppercase",
      "off": "none"
    },
    "icon": "uppercase",
    "scope": "global"
  */
  --blog-list-date-text-transform: none;
  /* VoogStyle
    "pathI18n": ["blog", "text"],
    "titleI18n": "size",
    "editor": "rangePicker",
    "min": 8,
    "max": 80,
    "unit": "px",
    "scope": "global",
    "featured": true
  */
  --content-font-size: 18px;
  /* VoogStyle
     "pathI18n": ["blog", "text"],
     "titleI18n": "line_height",
     "editor": "rangePicker",
     "min": 0.8,
     "max": 3,
     "step": 0.1,
     "unit": "em",
     "scope": "global"
  */
  --content-line-height: 1.45;
  /* VoogStyle
      "pathI18n": ["blog", "link", "normal"],
      "titleI18n": "font_weight",
      "type": "button",
      "editor": "toggleIcon",
      "states": {
        "on": "600",
        "off": "400"
      },
      "icon": "bold",
      "scope": "global",
      "boundVariables": [
        "--content-links-hover-font-weight"
      ]
    */
  --content-links-font-weight: 400;
  /* VoogStyle
    "pathI18n": ["blog", "link", "hover"],
    "titleI18n": "font_weight",
    "type": "button",
    "editor": "toggleIcon",
    "states": {
      "on": "600",
      "off": "400"
    },
    "icon": "bold",
    "scope": "global"
  */
  --content-links-hover-font-weight: 400;
  /* VoogStyle
    "pathI18n": ["blog", "link", "normal"],
    "titleI18n": "font_style",
    "type": "button",
    "editor": "toggleIcon",
    "states": {
      "on": "italic",
      "off": "normal"
    },
    "icon": "italic",
    "scope": "global",
    "boundVariables": [
      "--content-links-hover-font-style"
    ]
  */
  --content-links-font-style: normal;
  /* VoogStyle
    "pathI18n": ["blog", "link", "hover"],
    "titleI18n": "font_style",
    "type": "button",
    "editor": "toggleIcon",
    "states": {
      "on": "italic",
      "off": "normal"
    },
    "icon": "italic",
    "scope": "global"
  */
  --content-links-hover-font-style: normal;
  /* VoogStyle
    "pathI18n": ["blog", "link", "normal"],
    "titleI18n": "text_decoration",
    "type": "button",
    "editor": "toggleIcon",
    "states": {
      "on": "solid",
      "off": "none"
    },
    "icon": "underline",
    "scope": "global",
    "boundVariables": [
      "--content-links-hover-border-bottom"
    ]
  */
  --content-links-border-bottom: solid;
  /* VoogStyle
    "pathI18n": ["blog", "link", "hover"],
    "titleI18n": "text_decoration",
    "type": "button",
    "editor": "toggleIcon",
    "states": {
      "on": "solid",
      "off": "none"
    },
    "icon": "underline",
    "scope": "global"
  */
  --content-links-hover-border-bottom: solid;
  /* VoogStyle
    "pathI18n": ["blog", "link", "normal"],
    "titleI18n": "border_color",
    "editor": "colorPicker",
    "scope": "global",
    "featured": true
  */
  --content-links-border-bottom-color: rgba(0, 150, 255, 0.2);
  /* VoogStyle
    "pathI18n": ["blog", "link", "hover"],
    "titleI18n": "border_color",
    "editor": "colorPicker",
    "scope": "global",
    "featured": true
  */
  --content-links-hover-border-bottom-color: rgba(0, 150, 255, 0.3);
  /* VoogStyle
    "pathI18n": ["blog", "link", "normal"],
    "titleI18n": "text_transform",
    "type": "button",
    "editor": "toggleIcon",
    "states": {
      "on": "uppercase",
      "off": "none"
    },
    "icon": "uppercase",
    "scope": "global"
  */
  --content-links-text-transform: none;
  /* VoogStyle
    "pathI18n": ["blog", "link", "hover"],
    "titleI18n": "text_transform",
    "type": "button",
    "editor": "toggleIcon",
    "states": {
      "on": "uppercase",
      "off": "none"
    },
    "icon": "uppercase",
    "scope": "global"
  */
  --content-links-hover-text-transform: none;
}