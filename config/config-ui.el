;;; config-ui -*- lexical-binding: t; -*-


(use-package modus-themes)
(use-package doom-themes)

(use-package lambda-themes
  :ensure (:type git :host github :repo "lambda-emacs/lambda-themes")
  :custom
  (lambda-themes-set-italic-comments t)
  (lambda-themes-set-italic-keywords t)
  (lambda-themes-set-variable-pitch t))


(use-package catppuccin-theme)

(use-package doom-modeline
  :custom
  (doom-modeline-height 32)
  :config
  (display-battery-mode)
  (doom-modeline-mode))

(use-package nyan-mode
  :custom
  (nyan-animate-nyancat t)
  (nyan-wavy-trail t)
  :after doom-modeline
  :hook
  (doom-modeline . nyan-mode))


(use-package nano-modeline)


(use-package all-the-icons)

(use-package rainbow-delimiters
  :hook
  ((fundamental-mode . rainbow-delimiters-mode)
   (prog-mode        . rainbow-delimiters-mode)))

(use-package solaire-mode)

(use-package pulsar
  :hook
  (after-init . pulsar-mode))


(use-package vi-tilde-fringe
  :hook (prog-mode . vi-tilde-fringe-mode))


(provide 'config-ui)
