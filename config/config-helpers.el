;;;
(use-package helpful
  :defer t
  :bind
  ("C-h f" . helpful-function)
  ("C-h f" . helpful-function)
  ("C-h v" . helpful-variable)
  ("C-h k" . helpful-key)
  ("C-h x" . helpful-command))


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
  (indent-bars-width-frac 0.2)
  :hook (prog-mode . indent-bars-mode)
  :bind (:map evil-normal-state-map
              ("<SPC>oi" . indent-bars-mode)))

(use-package transient)

(use-package dashboard
  :config
  (add-hook 'elpaca-after-init-hook #'dashboard-insert-startupify-lists)
  (add-hook 'elpaca-after-init-hook #'dashboard-initialize)
  (dashboard-setup-startup-hook)
  :init
  (setq dashboard-startup-banner
   (expand-file-name "icon.png" user-emacs-directory))

  (setq dashboard-show-shortcuts t)
  (setq dashboard-items '((agenda   . 5)
                     (recents . 5 )
                     (projects  . 5)))
  (setq dashboard-item-shortcuts '((agenda   . "a")
                              (recents . "r")
                              (projects  . "p")))
  (setq dashboard-set-file-icons t)
  (setq dashboard-center-content t)
  (setq dashboard-set-navigator t))


(use-package which-key
  :commands (which-key-mode)
  :config
  (which-key-mode))



(use-package hl-todo
  :ensure (hl-todo
           :host github
           :repo "tarsius/hl-todo")

  :hook
  (prog-mode . hl-todo-mode)
  :defer t)



(use-package avy
  :bind
  ("C-;" . avy-goto-char))


(use-package winner
  :ensure nil
  :bind
  (:map evil-normal-state-map
        ("<SPC>wr" . winner-redo)
        ("<SPC>wu" . winner-undo))
 
  :config
  (winner-mode))

(use-package ace-window
  :custom (aw-keys '(?a ?s ?d ?f ?g ?h ?j ?k ?k ?l ))
  :bind
  (:map evil-normal-state-map
            ("<SPC>wo" .  ace-window)
            ("<SPC>ws" .  ace-swap-window)
            ("<SPC>wh" .  split-window-right)
            ("<SPC>wv" .  split-window-below)
            ("<SPC>wd" .  ace-delete-window)
            ("<SPC>wr" .  ace-delete-window)
            ("<SPC>wD" .  ace-delete-other-windows)))

(use-package resize-window
  :bind (:map evil-normal-state-map
              ("<SPC>or" .  resize-window)))
(provide 'config-helpers)
