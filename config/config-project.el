;;; config-project -*- lexical-binding: t; -*-

(use-package project
  :ensure nil)

(use-package compile
  :ensure nil
  :bind
  (:map evil-normal-state-map
        ("<SPC>pc" . project-compile)))



(use-package consult-project-extra
  :bind
  (:map evil-normal-state-map
        ("<SPC><SPC>" . consult-project-extra-find)
        ("<SPC>pp" . project-switch-project)
        ("<SPC>pf" . consult-ripgrep))
  :after project)

(use-package treemacs
  :commands (treemacs treemacs-load-theme)
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
  :after (treemacs)
  :config
  (project-treemacs-mode)
  (treemacs-project-follow-mode))

(use-package treemacs-magit
  :after (treemacs magit))

(use-package treemacs-evil
  :after (treemacs evil))

(use-package treemacs-nerd-icons
  :after treemacs
  :config (treemacs-load-theme 'nerd-icons))



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
        ("<SPC>pg" . magit)))

(use-package git-modes
  :mode (("\\.gitignore\\'" . gitignore-mode)))

(use-package gitignore-snippets
  :defer t)

(use-package gitignore-templates
  :commands (gitignore-templates-insert gitignore-templates-new-file))

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


(use-package imenu-list
  :bind
  (:map evil-normal-state-map
        ("<SPC>m" . imenu-list-smart-toggle)))

(provide 'config-project)
