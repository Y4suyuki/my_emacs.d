;; -*-Emacs-
;; .emacs.d/init.el

;; from http://batsov.com/articles/2012/02/19/package-management-in-emacs-the-good-the-bad-and-the-ugly/
(require 'package)
(package-initialize)

;; change TAB to 4 spaces
;; http://www.gnu.org/software/emacs/manual/html_node/elisp/Mode_002dSpecific-Indent.html#Mode_002dSpecific-Indent
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(setq indent-line-function 'insert-tab)

(add-to-list 'load-path "~/.emacs.d/vendor")

;; melpa
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/") t)

(when (< emacs-major-version 24)
  ;; For important compativility Libraries like cl-lib
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))
(package-initialize)

;; org-mode -- http://orgmode.org/elpa.html
(add-to-list 'package-archives
             '("org" . "http://orgmode.org/elpa/") t)

;; the following lines are always needed. Choose your own keys.
;; (add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode)) ; not needed since Emacs 22.2
(add-hook 'org-mode-hook 'turn-on-font-lock) ; not needed when global-font-lock-mode is on
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)

;; Fast access to TODO stats
;; http://orgmode.org/manual/Fast-access-to-TODO-states.html#Fast-access-to-TODO-states
(setq org-todo-keywords
      '((sequence "TODO(t)" "|" "DONE(d)")))

(setq org-log-done 'time)
(setq org-log-done 'note)

(setq org-default-notes-file (expand-file-name "~/org/note.org"))
(define-key global-map "\C-cc" 'org-capture)

;; For org capture template
(setq org-capture-templates
      '(("t" "TODO" entry (file+headline "~/org/gtd.org" "Tasks")
         "* TODO %?\n %i\n %a\n %u")
        ("n" "note" entry (file "~/org/note.org")
         "* %? :NOTE:\n%U\n%a\n" :clock-in: t :clock-resume t)
        ("r" "read" read (file "~/org/read.org")
         "* %? :READ:\n%U\n%a\n" :clock-in: t :clock-resume t)
        ("j" "Journal" entry (file+datetree "~/org/journal.org")
         "* %?\nEntered on %U\n %i\n %a")))
;;(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
;; '(org-agenda-files (quote ("~/lab/bitbucket/word_bucket/progress.org"
;;                            "~/lab/clj_prog/clojure_programming.org"
;;                            "~/org"))))
(setq org-agenda-files (list "~/lab/bitbucket/word_bucket/progress.org"
                             "~/lab/clj_prog/clojure_programming.org"
                             "~/org"))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(add-to-list 'custom-theme-load-path "~/.emacs.d/my-custom-theme-theme.el")
(load-theme 'my-custom-theme t)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("a240eea56be4be98f79db914603c44bbd33f46e0d4d1d14187f0206bfa4bfea3" "c8b3b9880a637c6585d78b586e23ad88f1c6a39a917038c1e2490a8c3c7f1d63" "b6ae47868dfb79ee2a1d3eee740aea0178d7fb1c6a8bb8eca9bba6292a07abbf" "168cd7977a4df0906c40b659267e1ef13cd2d8a125558d17f0151d4f8a8fce72" "33f420603a81175875e11f8d9c18eda4ce19d45462f7ff9fa4581c926ed88944" "42c235cdaccf1fd9bb40ddc087632efa3d90ae30ec27aa8490bde8e6ddde23ba" "1004c7f179d22a08aba6f8d3100b4762e4e9a51e69aa8fcf95139abe642c24db" "e2686ce582e23b34e3c275003a068e184937d1c957b39b41363ac73b5185433f" default)))
 '(package-selected-packages
   (quote
    (terraform-mode hcl-mode go-mode yaml-mode web-mode sml-mode scss-mode scala-mode sass-mode org markdown-mode jsx-mode flycheck exec-path-from-shell clojure-cheatsheet 4clojure))))

(defun my-web-mode-hook ()
  (setq web-mode-markup-indent-offset 2)
  (setq web-mode-code-indent-offset 2)
  (set-face-attribute 'web-mode-html-tag-face nil :foreground "color-32")
  (set-face-attribute 'web-mode-html-tag-bracket-face nil :foreground "color-25")
  (set-face-attribute 'web-mode-html-attr-name-face nil :foreground "color-58")
  (set-face-attribute 'web-mode-html-attr-value-face nil :foreground "color-35")
  (set-face-attribute 'web-mode-html-attr-equal-face nil :foreground "brightwhite"))
(add-hook 'web-mode-hook 'my-web-mode-hook)

(setq web-mode-content-types-alist
      '(("jsx" . "\\.js[x]?\\'")))

;; reference https://truongtx.me/2014/03/10/emacs-setup-jsx-mode-and-jsx-syntax-checking/#
(add-to-list 'auto-mode-alist '("\\.jsx?$" . web-mode))
(defadvice web-mode-highlight-part (around tweak-jsx activate)
  (if (equal web-mode-content-type "jsx")
      (let ((web-mode-enable-part-face nil))
        ad-do-it)
    ad-do-it))

;; (require 'jsx-mode)
;; (add-to-list 'auto-mode-alist '("\\.js$" . jsx-mode))

;; http://stackoverflow.com/questions/1242352/get-font-face-under-cursor-in-emacs
(defun what-face (pos)
  (interactive "d")
  (let ((face (or (get-char-property (point) 'read-face-name)
                  (get-char-property (point) 'face))))
    (if face (message "Face: %s" face) (message "No face at %d" pos))))

;; https://truongtx.me/2014/03/10/emacs-setup-jsx-mode-and-jsx-syntax-checking/
(require 'flycheck)

;; turn on flycheckig globally
(add-hook 'after-init-hook #'global-flycheck-mode)

;; disable jshint since we prefer eslint checking
(setq-default flycheck-disabled-checkers
              (append flycheck-disabled-checkers
                      '(javascript-jshint)))

;; use eslint with web-mode for jsx files
(flycheck-add-mode 'javascript-eslint 'web-mode)

;; customize flycheck temp file prefix
;;(setq-default flycheck-temp-prefix ".flycheck")

;; disable json-jsonlist checking for json files
(setq-default flycheck-disabled-checkers
              (append flycheck-disabled-checkers
                      '(json-jsonlist)))

;; (flycheck-define-checker jsxhint-checker
;;                          "A JSX syntax and style checker based on JSXHint."
;; 
;;                          :command ("jsxhint" source)
;;                          :error-patterns
;;                          ((error line-start (1+ nonl) ": line " line ", col " column ", " (message) line-end))
;;                          :modes (web-mode))
;; (add-hook 'web-mode-hook
;;           (lambda ()
;;             (when (equal web-mode-content-type "jsx")
;;               ;; enable flycheck
;;               (flycheck-select-checker 'jsxhint-checker)
;;               (flycheck-mode))))
