;;; config-ide.el -*- lexical-binding: t; -*- 

(use-package lsp-mode
  :init
  (setq lsp-session-file (expand-file-name ".cache/lsp-session" user-emacs-directory))
  :custom
  (lsp-signature-auto-activate t)
  (lsp-signature-doc-lines 3)
  (lsp-completion-show-detail t)
  (lsp-completion-show-kind t)
  (lsp-signature-re nder-documentation t))
 
(use-package lsp-ui
  :after lsp-mode
  :custom
  (lsp-ui-sideline-show-diagnostics nil)
  (lsp-ui-sideline-enable t)
  (lsp-ui-sideline-show-code-actions t)
  (lsp-ui-imenu-auto-refresh t)
  (lsp-ui-imenu-kind-position 'left)
  (lsp-ui-imenu-window-fix-width 25)
  (lsp-ui-doc-position 'at-point))


(use-package lsp-treemacs
  :hook (lsp-mode . lsp-treemacs-sync-mode)
  :after (lsp-mode treemacs))

(use-package dap-mode
  :init
  (setq dap-breakpoints-file (expand-file-name ".cache/.dap-breakpoints" user-emacs-directory)))

(use-package tree-sitter
  :defer t
  :hook (tree-sitter . (lambda ()
			 (tree-sitter-hl-mode))))
(use-package tree-sitter-langs
  :defer t
  :after tree-sitter)


(use-package flycheck
  :config
  :hook (lsp-mode . flycheck-mode))
(use-package flycheck-posframe
  :init
  :after flycheck
  :init
  (setq flycheck-posframe-position 'window-top-right-corner )
  :hook (flycheck-mode . flycheck-posframe-mode))


(use-package consult-flycheck
  :after flycheck)
  

(provide 'config-ide)
