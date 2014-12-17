;; -*-Emacs-Lisp-*-
;; .emacs.d/init.el

;; change TAB to 4 spaces
;; http://www.gnu.org/software/emacs/manual/html_node/elisp/Mode_002dSpecific-Indent.html#Mode_002dSpecific-Indent
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(setq indent-line-function 'insert-tab)

(add-to-list 'load-path "~/.emacs.d/vendor")
(require 'guru-mode)

;; melpa
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)
(when (< emacs-major-version 24)
  ;; For important compativility Libraries like cl-lib
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))
(package-initialize)

;; orgmode -- http://orgmode.org/elpa.html
(require 'package)
(add-to-list 'package-archives
             '("org" . "http://orgmode.org/elpa/") t)

;; the following lines are always needed. Choose your own keys.
;; (add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode)) ; not needed since Emacs 22.2
(add-hook 'org-mode-hook 'turn-on-font-lock) ; not needed when global-font-lock-mode is on
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)
