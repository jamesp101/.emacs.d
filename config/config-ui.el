;;; config-ui -*- lexical-binding: t; -*-


(use-package modus-themes
  :defer t)

(use-package doom-themes
  :defer t)

(use-package catppuccin-theme
  :defer t)

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



(use-package all-the-icons)

(use-package rainbow-delimiters
  :custom (rainbow-delimiters-max-face-count 5)
  :hook
  ((fundamental-mode . rainbow-delimiters-mode)
   (prog-mode        . rainbow-delimiters-mode)))

(use-package solaire-mode
  :commands (solaire-mode)
  :hook (special-mode . solaire-mode))

(use-package focus
  :bind (:map evil-normal-state-map
              ("<SPC>of" . focus-mode)))


(use-package pulsar
  :commands
  (pulsar-pulse-line-red
   pulsar-pulse-line-yellow
   pulsar-pulse-line
   )
  :hook
  (minibuffer-setup . pulsar-pulse-line)
  (consult-after-jump . pulsar-pulse-line)
  )


(use-package vi-tilde-fringe
  :hook (prog-mode . vi-tilde-fringe-mode))

(use-package kaolin-themes)

(use-package keypression
  :defer t)


(provide 'config-ui)
