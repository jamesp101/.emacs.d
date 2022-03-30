;;; config-programming.el -*- lexical-binding: t; -*-


(straight-use-package 'company)
(straight-use-package 'lsp-mode)
(straight-use-package 'lsp-ui)
(straight-use-package 'flycheck)
(straight-use-package 'dap-mode)

;;; Company Mode
(require 'company)

(setq company-minimum-prefix-length 1
      company-tooltip-align-annotations t
      company-idle-delay 0.0
      company-show-numbers t)

(add-hook 'prog-mode-hook  #'company-mode)
(diminish 'company-mode)

;;; LSP Mode
(require 'lsp-mode)
(straight-use-package 'lsp-treemacs)
(add-hook 'lsp-mode-hook #'lsp-treemacs-sync-mode 1)

;;; PYTHON
(straight-use-package 'python-mode)
(require 'python-mode)
(require 'dap-python)
(straight-use-package 'lsp-pyright)

(add-hook 'python-mode-hook #'(lambda ()
                                (require 'lsp-pyright)
                                (lsp-deferred)))


(provide 'config-programming)
;;;
