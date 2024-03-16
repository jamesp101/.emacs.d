

;; (set-frame-font "Comic Mono 13")
(set-frame-font "FantasqueSansM Nerd Font 13")


(add-hook 'prog-mode-hook #'(lambda () (setq display-line-numbers 'relative)))
(treemacs-load-theme 'all-the-icons)
(setq-default line-spacing 3)

(consult-theme 'doom-material-dark)
