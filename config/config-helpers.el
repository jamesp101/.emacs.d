
(use-package yasnippet
  :hook
  (after-init . yas-global-mode))

(use-package yasnippet-snippets
  :after yasnippet)

(use-package consult
  :bind
  (("C-x b" . consult-buffer)))

(use-package consult-yasnippet
  :after (consult yasnippet))

(use-package highlight-indent-guides
  :hook (prog-mode . highlight-indent-guides-mode)
  :init
  (setq highlight-indent-guides-method 'bitmap))

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

(use-package which-key
  :config
  (which-key-mode))

(use-package copilot
  :ensure (copilot :repo "copilot-emacs/copilot.el"
                 :host github
                 :files ("dist" "*.el"))
  :hook (prog-mode . copilot-mode)
  :custom (copilot-indent-warning-disable t)
  :config
    (setq copilot-indent-warning-disable t)
    (define-key copilot-completion-map (kbd "TAB") 'copilot-accept-completion))

(use-package harpoon
  :bind
  (:map evil-normal-state-map
        ("<SPC>." . harpoon-find-file))
  :custom (harpoon-cache-file (expand-file-name "harpoon/" my/cache-directory)))

(use-package avy
  :bind
  ("C-;" . avy-goto-char))

(provide 'config-helpers)
