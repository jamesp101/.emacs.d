;;; config-project -*- lexical-binding: t; -*-

(use-package project
  :ensure nil)

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

(use-package project-treemacs
  :after (treemacs )
  :config
  (project-treemacs-mode)
  (treemacs-project-follow-mode))

(use-package treemacs-magit
  :after (treemacs magit))

(use-package treemacs-evil
  :after (treemacs evil))

(use-package treemacs-all-the-icons)
(use-package treemacs-nerd-icons)



(if (eq system-type 'windows-nt)
  (use-package eat
    :ensure (eat
             :repo "https://codeberg.org/thearcticcat/emacs-eat"
             :branch "windows-hack"
             :files ("*.el" ("term" "term/*.el") "*.texi"
               "*.ti" ("terminfo/e" "terminfo/e/*")
               ("terminfo/65" "terminfo/65/*")
               ("integration" "integration/*")
               (:exclude ".dir-locals.el" "*-tests.el")))
    :bind
    (:map evil-normal-state-map
            ("<SPC>tp" . eat-project)
            ("<SPC>to" . eat-project-other-window)))
  (use-package eat
    :bind
    (:map evil-normal-state-map
        ("<SPC>tp" . eat-project)
        ("<SPC>to" . eat-project-other-window))))

(use-package magit
  :bind
  (:map evil-normal-state-map
        ("<SPC>gg" . magit)
        ("<SPC>pg" . magit))
  :config
  (setq transient-history-file
        (expand-file-name "magit-transient" my/cache-directory)))

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


(use-package diff-hl
  :hook (find-file   . diff-hl-mode)
  :hook (vc-dir-mode . diff-hl-dir-mode)
  :hook (dired-mode  . diff-hl-dired-mode)
  :config
  (global-diff-hl-mode)
  :custom
  (vc-git-diff-switches '("--histogram"))
  (diff-hl-side 'right)
  (diff-hl-draw-borders nil))

(provide 'config-project)

