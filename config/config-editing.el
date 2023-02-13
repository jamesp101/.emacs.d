;;; config-editing -*- lexical-binding: t; -*-


(use-package evil
  :init
  (setq evil-want-integration t)
  (setq evil-want-keybinding nil)
  :config
  (evil-mode))

(use-package evil-commentary
  :after evil
  :hook (prog-mode . evil-commentary-mode))


(use-package evil-mc
  :after evil
  :hook (evil-mode . evil-mc-mode))

(use-package evil-leader
  :config  (global-evil-leader-mode))

(use-package evil-surround
  :after evil
  :config (global-evil-surround-mode))


(use-package evil-collection
  :after evil
  :config (evil-collection-init))

(use-package smartparens
  :hook (after-init . smartparens-global-mode))


(use-package origami
  :hook (evil-mode . global-origami-mode))



(use-package undo-fu
  :after evil
  :init
  (setq undo-limit 6710886400)
  (setq evil-undo-system 'undo-fu))

(use-package undo-fu-session
  :after undo-fu
  :init
  (setq undo-fu-session-incompatible-files '("/COMMIT_EDITMSG\\'" "/git-rebase-todo\\'"))
  (setq undo-fu-session-directory
	(expand-file-name ".cache/undo-fu-session" user-emacs-directory))
  :config
  (undo-fu-session-global-mode))

(provide 'config-editing)
