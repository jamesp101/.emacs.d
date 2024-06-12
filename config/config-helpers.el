;;;
(use-package helpful)


(use-package consult
  :bind
  ("C-x b" . consult-buffer)
  (:map evil-normal-state-map
    ("<SPC>b" . consult-buffer)))

(use-package indent-bars
  :ensure (indent-bars
           :host github
           :repo "jdtsmith/indent-bars")
  :custom
  (indent-bars-treesit-support t)
  (indent-bars-treesit-ignore-blank-lines-types '("module"))
  :hook (prog-mode . indent-bars-mode)
  :bind (:map evil-normal-state-map
              ("<SPC>oi" . indent-bars-mode)))

(use-package transient
  :init
  (setq transient-history-file (expand-file-name "history.el" my/cache-directory  )
        transient-levels-file (expand-file-name "levels.el"   my/cache-directory )
        transient-values-file (expand-file-name "values.el"   my/cache-directory )))

(use-package dashboard
  :config
  (dashboard-setup-startup-hook)
  :init
  (setq dashboard-startup-banner (expand-file-name "icon.png" user-emacs-directory))
  (setq dashboard-show-shortcuts t)
  (setq dashboard-center-content t)
  (setq dashboard-set-navigator t)
  (setq dashboard-set-heading-icons t)
  (setq dashboard-set-file-icons t)
  (setq dashboard-items '((recents . 5 )
			              (projects  . 5))))

(use-package dashboard-ls
  :custom
  (dashboard-items '((ls-directories . 5 )
                     (ls-files . 5))))

(use-package which-key
  :config
  (which-key-mode))

(use-package harpoon
  :bind
  (:map evil-normal-state-map
        ("<SPC>." . harpoon-find-file))
  :custom (harpoon-cache-file (expand-file-name "harpoon/" my/cache-directory)))


(use-package hl-todo
  :ensure (hl-todo
           :host github
           :repo "tarsius/hl-todo")

  :config
  (global-hl-todo-mode))


(use-package avy
  :bind
  ("C-;" . avy-goto-char))


(use-package winner
  :ensure nil
  :config
  (winner-mode))

(use-package ace-window
  :ensure nil
  :custom (aw-keys '(?a ?s ?d ?f ?g ?h ?j ?k ?k ?l ))
  :bind (:map evil-normal-state-map
              ("<SPC>oo" .  ace-window)
              ("<SPC>os" .  ace-swap-window)
              ("<SPC>oh" .  split-window-right)
              ("<SPC>ov" .  split-window-below)
              ("<SPC>od" .  ace-delete-window)
              ("<SPC>or" .  ace-delete-window)
              ("<SPC>oD" .  ace-delete-other-windows)))

(use-package resize-window
  :bind (:map evil-normal-state-map
              ("<SPC>or" .  resize-window)))
(provide 'config-helpers)
