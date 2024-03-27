

;; (set-frame-font "Comic Mono 13")
(set-frame-font "DaddyTimeMono Nerd Font Propo 10")


(add-hook 'prog-mode-hook #'(lambda () (setq display-line-numbers 'relative)))
(treemacs-load-theme 'all-the-icons)
(setq treemacs-position 'right)
(setq-default copilot-indent-offset-warning-disable t)
(setq-default line-spacing 3)

(consult-theme 'doom-monokai-ristretto)


