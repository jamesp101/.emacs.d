;;; config-editing -*- lexical-binding: t; -*-
(use-package evil
  :custom
  (evil-want-integration t)
  (evil-want-keybinding nil)
  :config
  (evil-mode)
  (electric-pair-mode))
  ;:bind (:map evil-normal-state-map
  ;            ("<SPC>0" .  delete-window)
  ;            ("<SPC>1" .  delete-other-windows)
  ;            ("<SPC>2" .  split-window-below)
  ;            ("<SPC>3" .  split-window-right)))

(use-package hs-minor-mode
  :ensure nil
  :hook (prog-mode . hs-minor-mode))


(use-package evil-commentary
  :after evil
  :hook (prog-mode . evil-commentary-mode))


(use-package evil-mc
  :after evil
  :hook (evil-mode . evil-mc-mode))

(use-package evil-surround
  :after evil
  :config (global-evil-surround-mode))


(use-package evil-collection
  :after evil
  :config (evil-collection-init))

(use-package smartparens
  :after evil
  :hook (after-init . smartparens-global-mode))


(use-package origami
  :after evil
  :hook (after-init . global-origami-mode))

(use-package undo-fu
  :after evil
  :config
  (setq undo-limit 6710886400)
  (setq evil-undo-system 'undo-fu))

(use-package undo-fu-session
  :after undo-fu
  :init
  (setq undo-fu-session-incompatible-files '("/COMMIT_EDITMSG\\'" "/git-rebase-todo\\'"))
  (setq undo-fu-session-directory
	(expand-file-name "undo-fu-session/" my/cache-directory))
  :config
  (undo-fu-session-global-mode))

(use-package editorconfig
  :hook (prog-mode . editorconfig-mode))


(use-package expreg
  :bind (:map evil-normal-state-map
              ("M-." . expreg-expand)
              ("M-S-." . expreg-contract)))

 (use-package vundo)
 
(provide 'config-editing)
