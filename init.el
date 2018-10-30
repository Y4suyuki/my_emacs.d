
(require 'package)

;;; Code:

(add-to-list 'package-archives
	     '("melpa" . "http://melpa.milkbox.net/packages/") t)
(add-to-list 'package-archives
	     '("marmalade" . "http://marmalade-repo.org/packages/") t)
(package-initialize)

(use-package flycheck
  :ensure t
  :init (global-flycheck-mode))

(use-package markdown-mode
  :ensure t
  :mode (("README\\.md\\'" . gfm-mode)
	 ("\\.md\\'" . markdown-mode)
	 ("\\.markdown\\'" . markdown-mode))
  :init (setq markdown-command "multimarkdown"))

(use-package org-bullets
  :ensure t
  :commands org-bullets-mode
  :hook (org-mode . org-bullets-mode))

(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")

(add-hook 'json-mode-hook
	  (lambda ()
	    (make-local-variable 'js-indent-level)
	    (setq js-indent-level 2)))

(setq select-enable-clipboard t)

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
(setq org-agenda-files (list "~/org"))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#212526" "#ff4b4b" "#b4fa70" "#fce94f" "#729fcf" "#e090d7" "#8cc4ff" "#eeeeec"])
 '(custom-enabled-themes (quote (dracula)))
 '(custom-safe-themes
   (quote
    ("aaffceb9b0f539b6ad6becb8e96a04f2140c8faa1de8039a343a4f1e009174fb" "c3f5e75f0a1e35354efc0f70facd93091712bda40f49a4a0e93f02f7fff8ec70" "ad615811a543eee88559d210b25cee657b9c092f52fbf3665b5cfbf780e451b2" default)))
 '(package-selected-packages
   (quote
    (powerline dracula-theme web-mode use-package terraform-mode scala-mode org-bullets org markdown-mode json-mode jinja2-mode hive go-mode flycheck fish-mode dockerfile-mode docker-compose-mode))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(powerline-default-theme)

(defun on-after-init()
  (unless (display-graphic-p (selected-frame))
    (set-face-background 'default "unspecific-bg" (selected-frame))))

(add-hook 'window-setup-hook 'on-after-init)

(provide 'init)

;;; init.el ends here
