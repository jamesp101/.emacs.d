;;; config-ui -*- lexical-binding: t; -*-


(use-package modus-themes)
(use-package doom-themes)

(use-package catppuccin-theme)

(use-package doom-modeline
  :config
  (display-battery-mode)
  (doom-modeline-mode))

(use-package nyan-mode
  :custom
  (nyan-animate-nyancat t)
  (nyan-wavy-trail t)
  :hook
  (doom-modeline . nyan-mode))


(use-package nano-modeline)


(use-package all-the-icons)

(use-package rainbow-delimiters
  :hook
  ((fundamental-mode . rainbow-delimiters-mode)
   (prog-mode        . rainbow-delimiters-mode)))

(use-package solaire-mode)

(use-package focus
  :bind (:map evil-normal-state-map
              ("<SPC>of" . focus-mode)))


(use-package lsp-focus
  :after (lsp focus)
  :hook (focus-mode  . lsp-focus-mode))


(use-package pulsar
  :config
  (pulsar-global-mode))


(use-package vi-tilde-fringe
  :hook (prog-mode . vi-tilde-fringe-mode))

(use-package kaolin-themes)

(use-package keypression)

(provide 'config-ui)







