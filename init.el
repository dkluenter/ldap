;; $Id: init.el,v 1.12 2017/09/03 20:32:12 dieter Exp dieter $ 
;;(setq spacemacs-start-directory "~/.emacs.d/spacemacs/")
;;(load-file (concat spacemacs-start-directory "init.el"))
;;(when (>= emacs-major-version 24)
  (require 'package)
(add-to-list 'package-archives 
	      '("melpa" . "http://melpa.org/packages/") t)
(add-to-list 'load-path "~/.emacs.d/lisp")
(add-to-list 'load-path "~/.emacs.d/elpa")
(add-to-list 'load-path "~/.emacs.d/pde")
;;(add-to-list 'load-path "~/.emacs.d/site-lisp/magit/lisp")
;;(with-eval-after-load 'info
;;  (info-initialize)
;;  (add-to-list 'Info-directory-list
;;	       "~/.emacs.d/site-lisp/magit/Documentation/"))
(with-eval-after-load 'info
  (info-initialize)
  (add-to-list 'Info-directory-list
               "~/emacs.d/lisp/Info/"))
(package-initialize)
(autoload 'mode-compile "mode-compile" t)
(autoload 'mode-compile-kill "mode-compile" t)
(autoload 'desktop-entry-mode "desktop-entry-mode" "Desktop Entry mode" t)
(add-to-list 'auto-mode-alist
             '("\\.desktop\\(\\.in\\)?$" . desktop-entry-mode))
(add-hook 'desktop-entry-mode-hook 'turn-on-font-lock)
(require 'pde-load)
(require 'pde)
(require 'pde-abbv)
(require 'pde-project)
(require 'pde-util)
(require 'pandoc-mode)
(require 'magit)
(require 'org-install)
(require 'ldap-mode)
(require 'dash)
(require 'selectric-mode)
;;(require 'smtpmail-multi)
(require 'color-theme)
(color-theme-initialize)
(color-theme-ramangalahy)
;;(require 'doom-themes)
;;(setq doom-themes-enable-bold t    ; if nil, bold is universally disabled
;;      doom-themes-enable-italic t) ; if nil, italics is universally disabled
;;(load-theme 'doom-city-lights t)
(require 'epa-file)
(epa-file-enable)
;;(epa-file-encrypt-to "E9ED159B")
(add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))

(global-set-key [f5] 'find-file)
(global-set-key [f6] 'switch-to-buffer-other-window)
(global-set-key [f7] 'save-buffer)

(defun Init-kill-entire-line (&optional arg)
"Kill the entire line.
With prefix argument, kill that many lines from point.  Negative
arguments kill lines backward.
When calling from a program, nil means \"no arg\",
a number counts as a prefix arg."
  (interactive "*P")
  (let ((kill-whole-line t))
    (beginning-of-line) 
    (call-interactively 'kill-line)))
(global-set-key [f8]
  (if (fboundp 'kill-entire-line) 'kill-entire-line 'Init-kill-entire-line))

(setq-default major-mode 'text-mode)
(add-hook 'text-mode-hook 'auto-fill-mode)
(line-number-mode 1)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(column-number-mode t)
 '(custom-safe-themes
   (quote
    ("6eb36e7cab0fe6d05e7da2acd8b52fe9daea7edd3922d022b0e8e550c41c3a62" default)))
 '(delete-selection-mode nil)
 '(package-selected-packages
   (quote
    (boxquote company-auctex danneskjold-theme dashboard date-at-point yasnippet-snippets 0xc cl-generic cl-lib clojure-mode german-holidays gh git git-auto-commit-mode git-messenger helm helm-addressbook helm-eww helm-firefox imenu-anywhere md4rd json-mode s-buffer cl-libify tree-mode request hierarchy selectric-mode dash-functional async-await magit stash latex-extra latex-preview-pane list-packages-ext pandoc-mode pandoc all-the-icons async auctex auto-complete company yaml-tomato yaml-mode with-editor sokoban smtpmail-multi perlbrew perl-completion pde pcache packed org-email muse master-mode marmalade-service markdown-mode logito ldap-mode js2-mode ietf-docs highlight guru-mode gnorb etags-table etags-select epl doom-themes docbook ctags-update ctags csv-mode cperl-mode context-coloring color-theme-vim-insert-mode color-theme bbdb babcore auto-package-update auctex-latexmk ac-emacs-eclim)))
 '(paradox-automatically-star t)
 '(paradox-github-token "72801cc785d1d14d5ec1f9bff4b6f459f669a62c")
 '(show-paren-mode t)
 '(text-mode-hook
   (quote
    (turn-on-auto-fill auto-fill-mode text-mode-hook-identify)))
 '(yas-snippet-dirs
   (quote
    ("/home/dieter/.emacs.d/snippets" yasnippet-snippets-dir)))
 '(yas-use-menu (quote abbreviate)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(require 'german-holidays)
(setq calendar-holidays holiday-german-holidays)
(require 'yasnippet)
(yas-global-mode 1)
;;
(require 'yaml-mode)
(add-to-list 'auto-mode-alist '("\\.yml\\'" . yaml-mode))
;;
(autoload 'markdown-mode "markdown-mode" 
  "Major mode for editing Markdown files" t)
(autoload 'pandoc-mode "Minor Mode for Markdown" t)
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.xsd\\'" . xml-mode))
(add-to-list 'auto-mode-alist '("\\.xml\\'" . xml-mode))
(add-to-list 'auto-mode-alist '("\\.xslt\\'" . xml-mode))
(add-to-list 'auto-mode-alist '("\\.schema\\'" . ldap-mode))
(add-hook 'markdown-mode-hook 'pandoc-load-default-settings)
(add-hook 'pandoc-mode-hook 'pandoc-load-default-settings)
(add-hook 'nxml-mode-hook
          '(lambda ()
             (make-local-variable 'indent-tabs-mode)
             (setq indent-tabs-mode nil)
             (add-to-list 'rng-schema-locating-files
             "~/.emacs.d/schemas/schemas.xml" 
)))
(defalias 'perl-mode 'cperl-mode)
;;(defun pde-perl-mode-hook ()
;;  (abbrev-mode t)
;;  (add-to-list 'cperl-style-alist
;;               '("PDE"
;;                 (cperl-auto-newline                         . t)
;;                 (cperl-brace-offset                         . 0)
;;                 (cperl-close-paren-offset                   . -4)
;;                 (cperl-continued-brace-offset               . 0)
;;                 (cperl-continued-statement-offset           . 4)
;;                 (cperl-extra-newline-before-brace           . nil)
;;                 (cperl-extra-newline-before-brace-multiline . nil)
;;                 (cperl-indent-level                         . 4)
;;                 (cperl-indent-parens-as-block               . t)
;;                 (cperl-label-offset                         . -4)
;;                 (cperl-merge-trailing-else                  . t)
;;                 (cperl-tab-always-indent                    . t)))
;;  (cperl-set-style "PDE"))
(setq cperl-hairy t)
;;
(require 'reftex) 
(setq TeX-auto-save t)
(setq TeX-parse-self t)
(setq-default TeX-master nil)
(add-hook 'LaTeX-mode-hook 'turn-on-reftex)
;;(add-hook 'LaTeX-mode-hook 'visual-line-mode)
;;(add-hook 'LaTeX-mode-hook 'flyspell-mode)
;;(add-hook 'LaTeX-mode-hook 'LaTeX-math-mode)
;;(add-hook 'LaTeX-mode-hook 'turn-on-reftex)
;;(setq reftex-plug-into-AUCTeX t)
;;(setq TeX-PDF-mode t)
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode 1)
(setq ido-use-filename-at-point 'guess)
