;; -*-Emacs-Lisp-*-
;; .emacs.d/init.el

;; change TAB to 4 spaces
;; http://www.gnu.org/software/emacs/manual/html_node/elisp/Mode_002dSpecific-Indent.html#Mode_002dSpecific-Indent
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(setq indent-line-function 'insert-tab)
