;; $Id: init.el,v 1.14 2019/07/09 15:58:27 dieter Exp dieter $ 
(require 'package)
(add-to-list 'package-archives 
     '("melpa" . "http://melpa.org/packages/") t)
(add-to-list 'load-path "~/.emacs.d/lisp")
(add-to-list 'load-path "~/.emacs.d/elpa")
(add-to-list 'load-path "~/.emacs.d/pde")
(with-eval-after-load 'info
  (info-initialize)
  (add-to-list 'Info-directory-list
               "~/emacs.d/lisp/Info/"))
(add-to-list 'load-path
             (expand-file-name "~/.emacs.d/edwin"))
(package-initialize)
(require 'use-package)
(use-package org-chef
  :ensure t)
(autoload 'mode-compile "mode-compile" t)
(autoload 'mode-compile-kill "mode-compile" t)
(autoload 'desktop-entry-mode "desktop-entry-mode" "Desktop Entry mode" t)
(add-to-list 'auto-mode-alist
             '("\\.desktop\\(\\.in\\)?$" . desktop-entry-mode))
(add-hook 'desktop-entry-mode-hook 'turn-on-font-lock)
(setq display-buffer-base-action '(display-buffer-below-selected))
(0blayout-mode)
(require 'pde)
(require 'pde-load)
(require 'pde-abbv)
(require 'pde-project)
(require 'pde-util)
(require 'pandoc-mode)
(require 'magit)
(require 'org-install)
(require 'ldap-mode)
(require 'ldap)
(require 'eudc)
(require 'dash)
(require 'selectric-mode)
(require 'edwin)
;;(require 'color-theme)
;;(color-theme-initialize)
;;(color-theme-ramangalahy)
;;(require 'doom-themes)
;;(setq doom-themes-enable-bold t    ; if nil, bold is universally disabled
;;      doom-themes-enable-italic t) ; if nil, italics is universally disabled
;;(load-theme 'doom-city-lights t)
;;(require 'evil)
;;(evil-mode 1)
(add-hook 'org-mode-hook 'turn-on-font-lock)
(windmove-default-keybindings)
(require 'epa-file)
(epa-file-enable)
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
(global-set-key (kbd "C-x g") 'magit-status)

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
    ("6d589ac0e52375d311afaa745205abb6ccb3b21f6ba037104d71111e7e76a3fc" "6eb36e7cab0fe6d05e7da2acd8b52fe9daea7edd3922d022b0e8e550c41c3a62" default)))
 '(delete-selection-mode nil)
 '(package-selected-packages
   (quote
    (let-alist all-the-icons-dired all-the-icons-gnus all-the-icons-ivy ivy ivy-omni-org ivy-pages ivy-rich ivy-todo use-package ob-blockdiag ob-diagrams ob-tmux org-ac org-agenda-property org-autolist org-bullets org-caldav org-chef projectile rfc-mode ace-window ess-smart-equals ess-smart-underscore ess-view evil evil-collection ox-pandoc ox-gfm edit-indirect yasnippet-snippets 0xc cl-generic cl-lib clojure-mode german-holidays gh git git-auto-commit-mode git-messenger helm helm-addressbook helm-eww helm-firefox imenu-anywhere md4rd json-mode s-buffer cl-libify tree-mode request hierarchy selectric-mode dash-functional async-await magit stash latex-extra latex-preview-pane list-packages-ext pandoc-mode pandoc all-the-icons async auctex auto-complete company yaml-tomato yaml-mode with-editor sokoban perlbrew perl-completion pde pcache packed org-email muse master-mode marmalade-service markdown-mode logito ldap-mode js2-mode highlight guru-mode gnorb etags-table etags-select epl doom-themes docbook ctags-update ctags csv-mode cperl-mode context-coloring color-theme-vim-insert-mode color-theme bbdb auto-package-update auctex-latexmk ac-emacs-eclim)))
 '(paradox-automatically-star t)
 '(paradox-github-token "d55f7ec10e2355aa26cd2ee0f6bd3a5230a5525f")
 '(send-mail-function (quote smtpmail-send-it))
 '(show-paren-mode t)
 '(smtpmail-smtp-server "secmail.sys4.de")
 '(smtpmail-smtp-service 25)
 '(text-mode-hook
   (quote
    (turn-on-auto-fill auto-fill-mode text-mode-hook-identify))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(require 'danneskjold-theme)
(require 'rfc-mode)
(setq rfc-mode-directory (expand-file-name "~/Dokumente/rfc/"))
(require 'german-holidays)
(setq calendar-holidays holiday-german-BE-holidays)
;;
(require 'all-the-icons)
(require 'ivy)
(ivy-mode 1)
(require 'yaml-mode)
(add-to-list 'auto-mode-alist '("\\.yml\\'" . yaml-mode))
;;
(setq ivy-use-virtual-buffers t)
(setq ivy-count-format "(%d/%d) ")
(all-the-icons-ivy-setup)
;;
(autoload 'markdown-mode "markdown-mode" 
  "Major mode for editing Markdown files" t)
(autoload 'pandoc-mode "Minor Mode for Markdown" t)
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.xsd\\'" . xml-mode))
(add-to-list 'auto-mode-alist '("\\.xml\\'" . xml-mode))
(add-to-list 'auto-mode-alist '("\\.xslt\\'" . xml-mode))
(add-to-list 'auto-mode-alist '("\\.ldif\\'" . ldap-mode))
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
(setq cperl-hairy t)
;;
(require 'reftex) 
(setq TeX-auto-save t)
(setq TeX-parse-self t)
(setq-default TeX-master nil)
(add-hook 'LaTeX-mode-hook 'turn-on-reftex)
(require 'ido)
(ido-mode t)
(setq ido-use-filename-at-point 'guess)

(setq eudc-default-return-attributes nil
      eudc-strict-return-matches nil)
(setq ldap-ldapsearch-args (quote ("-tt" "-LLL" "-x")))
(setq eudc-inline-expansion-format '("%s %s <%s>" givenName name email))
(setq eudc-inline-query-format '((name)
                                 (firstname)
                                 (firstname name)
                                 (email)
                                 ))

(setq ldap-host-parameters-alist
      (quote (("ldap://localhost"
               base "ou=adressbuch,o=avci,c=de"
               binddn "cn=admanager,o=avci,c=de"
               passwd "dressa")))
      )

(eudc-set-server "ldap://localhost" 'ldap t)
(setq eudc-server-hotlist '(("ldap://localhost" . ldap)))
(setq eudc-inline-expansion-servers 'hotlist)

(defun enz-eudc-expand-inline()
  (interactive)
  (move-end-of-line 1)
  (insert "*")
  (unless (condition-case nil
              (eudc-expand-inline)
            (error nil))
    (backward-delete-char-untabify 1))
  )
