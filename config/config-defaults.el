;;; config-defaults.el  -*- lexical-binding: t; -*-


(customize-set-variable 'global-auto-revert-non-file-buffers t)

(global-auto-revert-mode 1)

(setq-default indent-tabs-mode nil)

(if (boundp 'use-short-answers)
    (setq use-short-answers t)
  (advice-add 'yes-or-no-p
	      :override #'y-or-n-p))

(add-hook 'after-init-hook #'recentf-mode)
(customize-set-variable 'reocentf-save-file
			(expand-file-name ".recentf" (user-emacs-directory))


(customize-set-variable 'kill-do-not-save-duplicates t)

(setq auto-window-vscroll nil)
(customize-set-variable 'fast-but-imprecise-scrolling t)
(customize-set-variable 'scroll-conservatively 101)
(customize-set-variable 'scroll-margin 0)
(customize-set-variable 'scroll-preserve-screen-position t)


(setq-default bidi-paragraph-direction 'left-to-right)
(setq-default bidi-inhibit-bpa t)
(global-so-long-mode 1)

(setq auto-save-default nil)
(setq make-backup-files nil)


(provide 'config-defaults)
