;;; config-defaults.el -*- lexical-binding: t; -*-

;;; Minibuffer
(setq enable-recursive-minibuffers t)
;; Keep the cursor out of the read-only portions of the.minibuffer
(setq minibuffer-prompt-properties
      '(read-only t intangible t cursor-intangible t face
                  minibuffer-prompt))

(add-hook 'minibuffer-setup-hook #'cursor-intangible-mode)


(setq switch-to-buffer-obey-display-actions t)
(setq show-paren-delay 0.1
      show-paren-highlight-openparen t
      show-paren-when-point-inside-paren t
      show-paren-when-point-in-periphery t)

(add-hook 'minibuffer-setup-hook
          (lambda () (setq gc-cons-threshold most-positive-fixnum)))
(add-hook 'minibuffer-exit-hook
          (lambda () (setq gc-cons-threshold (* 16 1024 1024))))


(setq whitespace-line-column nil)

(setq-default fill-column 80)

(setq-default display-line-numbers-widen t)
(setq-default display-line-numbers-width 3)

(setq global-auto-revert-non-file-buffers t)
(setq-default indent-tabs-mode nil)
(setq kill-do-not-save-duplicates t)
(setq auto-window-vscroll nil)

;; Better Scrolling
(setq auto-window-vscroll nil)
(setq fast-but-imprecise-scrolling t)
(setq scroll-conservatively 15)
(setq scroll-margin 0)
(setq scroll-preserve-screen-position t)

;;; Disable backup files
(setq make-backup-files nil)
(setq create-lockfiles nil)
(setq auto-save-default nil)

;;; Text Wrap
(setq-default word-wrap t)
(setq-default truncate-lines t)
(setq truncate-partial-width-windows nil)
;;; Tabs
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(setq-default standard-input 4)
(setq-default tab-always-indent t)
(setq indent-line-function 'insert-tab)

(setq buffer-auto-save-file-name
    (expand-file-name my/var-directory user-emacs-directory))

(set-language-environment "UTF-8")
(setq default-coding-system 'utf-8)
(prefer-coding-system 'utf-8-unix)

(setq visible-bell 'ignore)

(setq delete-by-moving-to-trash t)

(setq auto-save-list-file-prefix
    (expand-file-name my/var-directory user-emacs-directory))

(setq warning-minimum-level :error)


(setq delete-pair-blink-delay 0.03)

;; Comment
(setq comment-multi-line t)

;; Cursors
(blink-cursor-mode -1)

;;
(setq kill-do-not-save-duplicates t)

(setq window-divider-default-bottom-width 1
      window-divider-default-places t
      window-divider-default-right-width 1)

(add-hook 'after-init-hook #'window-divider-mode)

(setq lazy-highlight-initial-delay 0)


(use-package recentf
  :ensure nil
  :custom
  (add-to-list 'recentf-exclude
               (recentf-expand-file-name my/etc-directory))
  (add-to-list 'recentf-exclude
               (recentf-expand-file-name my/var-directory))
  :hook
  (after-init . recentf-mode))
  
(setq x-stretch-cursor nil)

(provide 'config-defaults)
