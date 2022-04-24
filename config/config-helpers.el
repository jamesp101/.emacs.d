
(straight-use-package 'restart-emacs)
(straight-use-package 'highlight-indent-guides)
(straight-use-package 'origami)

(require 'restart-emacs)
(require 'highlight-indent-guides)
(require 'origami)

(add-hook 'prog-mode-hook #'
          (lambda ()
            (highlight-indent-guides)
            (origami-mode)
            ))



(provide 'config-helpers)
