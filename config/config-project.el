;;; config-project -*- lexical-binding: t; -*-


(use-package projectile
  :init
  (setq projectile-cache-file
    (expand-file-name ".cache/projectile.cache" user-emacs-directory))
  (setq projectile-known-projects-file 
    (expand-file-name ".cache/projectile-bookmarks.eld" user-emacs-directory))
  (setq projectile-indexing-method 'alien)
  (setq projectile-sort-order 'recentf-active)
  (setq projectile-enable-caching t)

  :config
  (projectile-mode))



(use-package consult-projectile
  :after (consult projectile))


(use-package treemacs)
(use-package treemacs-magit
  :after (treemacs magit))

(use-package treemacs-evil
  :after (treemacs evil))

(use-package treemacs-projectile
  :after (treemacs projectile))

(use-package treemacs-all-the-icons
  :after (treemacs all-the-icons))


(use-package eat)

(use-package magit
  :config
  (setq transient-history-file
        (expand-file-name ".cache/magit-transient" user-emacs-directory)))

(use-package forge
  :after magit)

(use-package gitignore-snippets)
(use-package gitignore-templates)

(provide 'config-project)

