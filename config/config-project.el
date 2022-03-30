;;;; config-project.el -*- lexical-binding: t; -*-

(straight-use-package 'projectile)
(straight-use-package 'consult-projectile)
(straight-use-package 'magit)
(straight-use-package 'git-gutter)
(straight-use-package 'treemacs)
(straight-use-package 'treemacs-projectile)

;; Projectile 
(require 'projectile)
(require 'consult-projectile)
(setq projectile-indexing-method 'alien
      projectile-project-serach-path
      '(default-directory "~/projects"))

(with-eval-after-load 'meow
  (meow-leader-define-key
   '("p" . projectile-command-map)
   '("SPC" . consult-projectile)))

(add-hook 'after-init-hook 'projectile-mode 1) 

;; Magit
(require 'magit)

;;GitGutter
(require 'git-gutter)w
(setq git-gutter:modified-sign " | "
      git-gutter:added-sign    " + "
      git-gutter:deleted-sign  " - ")

(add-hook 'prog-mode-hook 'git-gutter-mode)

;; Treemacs

(require 'treemacs)
(require 'treemacs-projectile)

(setq treemacs-position 'right)

(add-hook 'treemacs-mode-hook #'(lambda()
                                (hide-mode-line-mode nil)
                                (linum-mode nil)))
;; All The Icons
(with-eval-after-load 'all-the-icons
  (straight-use-package 'treemacs-all-the-icons)
  (require 'treemacs-all-the-icons)
  (treemacs-load-theme "all-the-icons"))


(with-eval-after-load 'meow
  (meow-leader-define-key
   '("t" . treemacs)))




(provide 'config-project)
