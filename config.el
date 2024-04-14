

;; (set-frame-font "Comic Mono 13")
(set-frame-font "VictorMono Nerd Font  11")
;
(add-hook 'prog-mode-hook
          #'(lambda () (setq display-line-numbers 'relative)))

(setq treemacs-position 'right)
;; (setq-default copilot-indent-offset-warning-disable t)
(setq-default line-spacing 4)

(consult-theme 'doom-horizon)


