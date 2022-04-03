
(straight-use-package 'vterm)

(require 'vterm)
(add-hook 'vterm-mode-hook #'(lambda ()
                               (turn-on-solaire-mode)
                               (hide-mode-line-mode)))

(define-key 'project-cmds-prefix-key (kbd "v")  'projectile-run-vterm)



(provide 'config-vterm)
