(deftheme my-custom-theme
  "Created 2015-11-24.")

(custom-theme-set-faces
 'my-custom-theme
 '(default ((t (:family "default" :foundry "default" :width normal :height 1 :weight normal :slant normal :underline nil :overline nil :strike-through nil :box nil :inverse-video nil :foreground "unspecified-fg" :background "unspecified-bg" :stipple nil :inherit nil))))
 '(cursor ((((background light)) (:background "black")) (((background dark)) (:background "white"))))
 '(fixed-pitch ((t (:family "Monospace"))))
 '(variable-pitch ((t (:family "Sans Serif"))))
 '(escape-glyph ((((background dark)) (:foreground "cyan")) (((type pc)) (:foreground "magenta")) (t (:foreground "brown"))))
 '(minibuffer-prompt ((t (:foreground "color-156"))))
 '(highlight ((((class color) (min-colors 88) (background light)) (:background "darkseagreen2")) (((class color) (min-colors 88) (background dark)) (:background "darkolivegreen")) (((class color) (min-colors 16) (background light)) (:background "darkseagreen2")) (((class color) (min-colors 16) (background dark)) (:background "darkolivegreen")) (((class color) (min-colors 8)) (:foreground "black" :background "green")) (t (:inverse-video t))))
 '(region ((((class color) (min-colors 88) (background dark)) (:background "blue3")) (((class color) (min-colors 88) (background light) (type gtk)) (:background "gtk_selection_bg_color" :distant-foreground "gtk_selection_fg_color")) (((class color) (min-colors 88) (background light) (type ns)) (:background "ns_selection_bg_color" :distant-foreground "ns_selection_fg_color")) (((class color) (min-colors 88) (background light)) (:background "lightgoldenrod2")) (((class color) (min-colors 16) (background dark)) (:background "blue3")) (((class color) (min-colors 16) (background light)) (:background "lightgoldenrod2")) (((class color) (min-colors 8)) (:foreground "white" :background "blue")) (((type tty) (class mono)) (:inverse-video t)) (t (:background "gray"))))
 '(shadow ((t (:foreground "color-137"))))
 '(secondary-selection ((((class color) (min-colors 88) (background light)) (:background "yellow1")) (((class color) (min-colors 88) (background dark)) (:background "SkyBlue4")) (((class color) (min-colors 16) (background light)) (:background "yellow")) (((class color) (min-colors 16) (background dark)) (:background "SkyBlue4")) (((class color) (min-colors 8)) (:foreground "black" :background "cyan")) (t (:inverse-video t))))
 '(trailing-whitespace ((((class color) (background light)) (:background "red1")) (((class color) (background dark)) (:background "red1")) (t (:inverse-video t))))
 '(font-lock-builtin-face ((t (:foreground "color-32"))))
 '(font-lock-comment-delimiter-face ((t (:inherit (font-lock-comment-face)))))
 '(font-lock-comment-face ((t (:foreground "color-163"))))
 '(font-lock-constant-face ((t (:foreground "color-29"))))
 '(font-lock-doc-face ((t (:inherit (font-lock-string-face)))))
 '(font-lock-function-name-face ((t (:foreground "color-38"))))
 '(font-lock-keyword-face ((t (:foreground "color-49"))))
 '(font-lock-negation-char-face ((t nil)))
 '(font-lock-preprocessor-face ((t (:inherit (font-lock-builtin-face)))))
 '(font-lock-regexp-grouping-backslash ((t (:inherit (bold)))))
 '(font-lock-regexp-grouping-construct ((t (:inherit (bold)))))
 '(font-lock-string-face ((t (:foreground "color-108"))))
 '(font-lock-type-face ((((class grayscale) (background light)) (:weight bold :foreground "Gray90")) (((class grayscale) (background dark)) (:weight bold :foreground "DimGray")) (((class color) (min-colors 88) (background light)) (:foreground "ForestGreen")) (((class color) (min-colors 88) (background dark)) (:foreground "PaleGreen")) (((class color) (min-colors 16) (background light)) (:foreground "ForestGreen")) (((class color) (min-colors 16) (background dark)) (:foreground "PaleGreen")) (((class color) (min-colors 8)) (:foreground "green")) (t (:underline (:color foreground-color :style line) :weight bold))))
 '(font-lock-variable-name-face ((t (:foreground "color-215"))))
 '(font-lock-warning-face ((t (:inherit (error)))))
 '(button ((t (:inherit (link)))))
 '(link ((t (:underline (:color foreground-color :style line) :foreground "RoyalBlue3"))))
 '(link-visited ((t (:foreground "magenta4" :inherit (link)))))
 '(fringe ((((class color) (background light)) (:background "grey95")) (((class color) (background dark)) (:background "grey10")) (t (:background "gray"))))
 '(header-line ((t (:underline (:color foreground-color :style line) :inverse-video nil :inherit (mode-line)))))
 '(tooltip ((t (:foreground "black" :background "lightyellow" :inherit (variable-pitch)))))
 '(mode-line ((t (:box (:line-width -1 :color nil :style released-button) :foreground "black" :background "grey75"))))
 '(mode-line-buffer-id ((t (:weight bold))))
 '(mode-line-emphasis ((t (:weight bold))))
 '(mode-line-highlight ((((class color) (min-colors 88)) (:box (:line-width 2 :color "grey40" :style released-button))) (t (:inherit (highlight)))))
 '(mode-line-inactive ((t (:weight light :box (:line-width -1 :color "grey75" :style nil) :foreground "grey20" :background "grey90" :inherit (mode-line)))))
 '(isearch ((((class color) (min-colors 88) (background light)) (:foreground "lightskyblue1" :background "magenta3")) (((class color) (min-colors 88) (background dark)) (:foreground "brown4" :background "palevioletred2")) (((class color) (min-colors 16)) (:foreground "cyan1" :background "magenta4")) (((class color) (min-colors 8)) (:foreground "cyan1" :background "magenta4")) (t (:inverse-video t))))
 '(isearch-fail ((((class color) (min-colors 88) (background light)) (:background "RosyBrown1")) (((class color) (min-colors 88) (background dark)) (:background "red4")) (((class color) (min-colors 16)) (:background "red")) (((class color) (min-colors 8)) (:background "red")) (((class color grayscale)) (:foreground "grey")) (t (:inverse-video t))))
 '(lazy-highlight ((((class color) (min-colors 88) (background light)) (:background "paleturquoise")) (((class color) (min-colors 88) (background dark)) (:background "paleturquoise4")) (((class color) (min-colors 16)) (:background "turquoise3")) (((class color) (min-colors 8)) (:background "turquoise3")) (t (:underline (:color foreground-color :style line)))))
 '(match ((((class color) (min-colors 88) (background light)) (:background "yellow1")) (((class color) (min-colors 88) (background dark)) (:background "RoyalBlue3")) (((class color) (min-colors 8) (background light)) (:foreground "black" :background "yellow")) (((class color) (min-colors 8) (background dark)) (:foreground "white" :background "blue")) (((type tty) (class mono)) (:inverse-video t)) (t (:background "gray"))))
 '(next-error ((t (:inherit (region)))))
 '(query-replace ((t (:inherit (isearch))))))

(provide-theme 'my-custom-theme)
