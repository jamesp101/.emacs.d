;;; config-programming.el -*- lexical-binding: t; -*-


(straight-use-package 'company)
(straight-use-package 'lsp-mode)
(straight-use-package 'lsp-ui)


;;; Company Mode
(require 'company)

(setq company-minimum-prefix-length 1
      company-tooltip-align-annotations t
      company-require-match 'never
      company-idle-delay 0.1
      company-show-numbers t)

(add-hook 'prog-mode-hook  'company-mode)


;;; LSP Modew
(require 'lsp-mode)

(provide 'config-programming)
