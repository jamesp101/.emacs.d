;;; config-project -*- lexical-binding: t; -*-


;; (use-package projectile
;;   :init
;;   (setq projectile-cache-file
;;         (expand-file-name "projectile.cache" my/cache-directory))
;;   (setq projectile-known-projects-file 
;;         (expand-file-name "projectile-bookmarks.el" my/var-directory))
;;   (setq projectile-indexing-method 'alien)
;;   (setq projectile-sort-order 'recentf-active)
;;   (setq projectile-enable-caching t)

;;   :bind
;;   (:map evil-normal-state-map
;;         ("<SPC>SPC" .  consult-projectile)
;;         ("<SPC>pp" .  consult-projectile-switch-project)
;;         ("<SPC>pa" . projectile-known-projects)
;;         ("<SPC>pr" . consult-projectile-recentf)
;;         ("<SPC>pf" . consult-ripgrep))
 
;;   :config
;;   (projectile-mode))
  


;; (use-package consult-projectile
;;   :after (consult projectile))

(defun my/configure-projects ()
  (interactive)
  (find-file (expand-file-name "projects" user-emacs-directory)))

(use-package project
  :ensure nil
  :after evil
  :bind
  (:map evil-normal-state-map
        ("<SPC><SPC>" . consult-project-extra-find)
        ("<SPC>pp" . project-switch-project)
        ("<SPC>pf" . consult-ripgrep)
        ("<SPC>pc" . my/configure-projects)))

(use-package consult-project-extra
  :after project)

(use-package treemacs
  :custom
  (treemacs-persist-file
   (expand-file-name "treemacs-persist" my/var-directory))
  (treemacs-last-error-persist-file
   (expand-file-name "treemacs-persist-error" my/var-directory))

  :bind
  (:map evil-normal-state-map
        ("<SPC>t t" . treemacs)
        ("<SPC>t <TAB>" . treemacs-switch-workspace))

  (:map treemacs-mode-map
        ("<SPC>SPC" .  consult-projectile)
        ("<SPC>pp" .  consult-projectile-switch-project)
        ("<SPC>pa" . projectile-known-projects)
        ("<SPC>pr" . consult-projectile-recentf)
        ("<SPC>pf" . consult-ripgrep)))
  

(use-package treemacs-magit
  :after (treemacs magit))

(use-package treemacs-evil
  :after (treemacs evil))

(use-package treemacs-all-the-icons
  :after (treemacs all-the-icons)
  :config
  (treemacs-load-theme 'all-the-icons))

(use-package project-treemacs
  :after (treemacs project))

(use-package eat
  :bind
  ("C-`" . eat-project))

(use-package magit
  :bind
  (:map evil-normal-state-map
        ("<SPC>gg" . magit)
        ("<SPC>pg" . magit))
  :config
  (setq transient-history-file
        (expand-file-name "magit-transient/" my/cache-directory)))


(use-package gitignore-snippets)
(use-package gitignore-templates)

(provide 'config-project)

