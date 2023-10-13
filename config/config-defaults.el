;;; config-defaults.el -*- lexical-binding: t; -*-
(use-package emacs
  :elpaca nil
  :init
  (setq global-auto-revert-non-file-buffers t)

  (if (boundp 'use-short-answers)
      (setq use-short-answers t)
    (advice-add 'yes-or-no-p :override #'y-or-n-p))

  (setq-default indent-tabs-mode nil)

  (setq kill-do-not-save-duplicates t)

  (setq auto-window-vscroll nil)



  ;; Better Scrolling
  (setq auto-window-vscroll nil)
  (setq fast-but-imprecise-scrolling t)
  (setq scroll-conservatively 101)
  (setq scroll-margin 0)
  (setq scroll-preserve-screen-position t)


  (setq make-backup-files nil)
  (setq create-lockfiles nil)
  (setq auto-save-default nil)


  (setq-default indent-tabs-mode nil)
  (setq-default tab-width 2)
  (setq-default standard-input 2)
  (setq indent-line-function 'insert-tab)

  (setq buffer-auto-save-file-name
        (expand-file-name ".cache/auto-save/" user-emacs-directory))

  (setq default-coding-system 'utf-8)

  (setq visible-bell t)

  (setq delete-by-moving-to-trash t)

  (setq auto-save-list-file-prefix (expand-file-name ".cache/auto-save/.auto-save-" user-emacs-directory))

  :config
  (global-auto-revert-mode 1)
  (pixel-scroll-precision-mode 1))




(use-package display-line-numbers
  :elpaca nil
  :hook (prog-mode . display-line-numbers-mode))

(use-package so-long
  :elpaca nil
  :init
  (setq-default bidi-paragraph-direction 'left-to-right)
  (setq-default bidi-inhabit-bpa t)
  :config
  (global-so-long-mode t))


(use-package simple
  :elpaca nil
  :init
  (add-hook 'prog-mode-hook #'(lambda () (toggle-truncate-lines nil)))
  (add-hook 'fundamental-mode-hook #'(lambda () (toggle-truncate-lines t))))


(setq recentf-save-file (expand-file-name ".cache/recentf" user-emacs-directory))
(add-hook 'after-init-hook #'recentf-mode)

(use-package special-mode
  :elpaca nil
  :after solaire-mode
  :hook (special-mode . solaire-mode))


(use-package eshell
  :elpaca nil
  :init
  (setq eshell-directory-name
        (expand-file-name ".cache/eshell" user-emacs-directory)))



(provide 'config-defaults)
