;;; config-programming.el -*- lexical-binding: t; -*-


(straight-use-package 'company)
(straight-use-package 'lsp-mode)
(straight-use-package 'lsp-ui)
(straight-use-package 'flycheck)
(straight-use-package 'dap-mode)
(straight-use-package 'editorconfig)

;; Editor Config
(require 'editorconfig)
(editorconfig-mode 1)

;;; Company Mode
(require 'company)

(setq company-minimum-prefix-length 1
      company-tooltip-align-annotations t
      company-idle-delay 0.0
      company-tooltip-minimum-width 50
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


;;; Web Mode
(straight-use-package 'web-mode)
(straight-use-package 'emmet-mode)
(straight-use-package 'scss-mode)

;;; HTML
(require 'web-mode)
(require 'emmet-mode)
(add-to-list 'auto-mode-alist '("\\.html\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.jinja\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.jinja2\\'" . web-mode))
(add-hook 'web-mode-hook #'emmet-mode)
;;; CSS
(require 'scss-mode)
(add-to-list 'auto-mode-alist '("\\.css\\'" . scss-mode))
(add-hook 'scss-mode-hook #'lsp-deferred)
           







(provide 'config-programming)
;;;
