;; -*-Emacs-Lisp-*-
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
(require 'guru-mode)

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
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-agenda-files (quote ("~/lab/clj_prog/clojure_programming.org"
                            "~/org"))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
