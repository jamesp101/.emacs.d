;;; config-editing -*- lexical-binding: t; -*-


(use-package evil
  :elpaca t
  :custom
  (evil-want-integration t)
  (evil-want-keybinding nil)
  :config
  (evil-mode))

(use-package evil-commentary
  :elpaca t
  :after evil
  :hook (prog-mode . evil-commentary-mode))


(use-package evil-mc
  :elpaca t
  :after evil
  :hook (evil-mode . evil-mc-mode))

(use-package evil-leader
  :elpaca t
  :config  (global-evil-leader-mode))

(use-package evil-surround
  :elpaca t
  :after evil
  :config (global-evil-surround-mode))


(use-package evil-collection
  :elpaca t
  :after evil
  :config (evil-collection-init))

(use-package smartparens
  :elpaca t
  :hook (after-init . smartparens-global-mode))


(use-package origami
  :elpaca t
  :hook (evil-mode . global-origami-mode))



(use-package undo-fu
  :elpaca t
  :after evil
  :init
  (setq undo-limit 6710886400)
  (setq evil-undo-system 'undo-fu))

(use-package undo-fu-session
  :elpaca t
  :after undo-fu
  :init
  (setq undo-fu-session-incompatible-files '("/COMMIT_EDITMSG\\'" "/git-rebase-todo\\'"))
  (setq undo-fu-session-directory
	(expand-file-name ".cache/undo-fu-session" user-emacs-directory))
  :config
  (undo-fu-session-global-mode))

(provide 'config-editing)
