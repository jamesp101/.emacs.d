;;; config-project -*- lexical-binding: t; -*-


(use-package project
  :ensure nil
  :after evil)

(use-package consult-project-extra
  :bind
  (:map evil-normal-state-map
        ("<SPC><SPC>" . consult-project-extra-find)
        ("<SPC>pp" . project-switch-project)
        ("<SPC>pf" . consult-ripgrep))
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
        ("<SPC>pf" . consult-ripgrep)))
  

(use-package treemacs-magit
  :after (treemacs magit))

(use-package treemacs-evil
  :after (treemacs evil))

(use-package treemacs-all-the-icons
  :after (treemacs all-the-icons))


(use-package eat
  :bind
  (:map evil-normal-state-map
        ("<SPC>tp" . eat-project)
        ("<SPC>to" . eat-project-other-window)))

(use-package magit
  :bind
  (:map evil-normal-state-map
        ("<SPC>gg" . magit)
        ("<SPC>pg" . magit))
  :config
  (setq transient-history-file
        (expand-file-name "magit-transient/" my/cache-directory)))

(use-package git-modes)
(use-package gitignore-snippets)
(use-package gitignore-templates)


(use-package color-rg
  :ensure (color-rg
           :host github
           :repo "manateelazycat/color-rg")
  :bind
  (:map evil-normal-state-map
        ("<SPC>pF" . color-rg-search-input)))

(provide 'config-project)

