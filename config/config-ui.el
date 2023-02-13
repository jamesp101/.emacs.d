;;; config-ui -*- lexical-binding: t; -*-


(use-package modus-themes)
(use-package doom-themes
  :config
  (load-theme 'modus-vivendi-tinted t))

(use-package doom-modeline
  :init
  :config
  (doom-modeline-mode))

(use-package nano-theme
  :straight
  (:host github
         :repo "rougier/nano-theme"
         :type git))

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



(custom-set-faces
 `(default ((t (:font "ComicMono NF 11"))))
 `(fixed-pitch ((t (:inherit (default)))))
 `(fixed-pitch-serif ((t (:inherit (default)))))
 `(variable-pitch ((t (:font "Roboto Condensed 18")))))


(setq-default line-spacing 0.4)


(provide 'config-ui)
