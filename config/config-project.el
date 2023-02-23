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
  (projectile-mode)

  :hook
  (treemacs-mode . (lambda ()
                     (solaire-mode)
                     (treemacs-load-theme "all-the-icons")
                     (hide-mode-line-mode))))


(use-package consult-projectile
  :after (consult projectile))


(use-package treemacs
  :hook
  (treemacs-mode . solaire-mode))

(use-package treemacs-magit
  :after (treemacs magit))

(use-package treemacs-evil
  :after (treemacs evil))

(use-package treemacs-projectile
  :after (treemacs projectile))

(use-package treemacs-all-the-icons
  :after (treemacs all-the-icons))


(use-package eshell
  :straight nil
  :config
  (company-mode nil))

(use-package vterm)


(use-package magit
  :config
  (setq transient-history-file
        (expand-file-name ".cache/lsp-session" user-emacs-directory)))

(use-package gitignore-snippets)

(provide 'config-project)

