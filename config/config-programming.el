;;; config-programming.el -*- lexical-binding: t; -*-


(straight-use-package 'company)
(straight-use-package 'lsp-mode)
(straight-use-package 'lsp-ui)
(straight-use-package 'flycheck)
(straight-use-package 'flycheck-popup-tip)
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
      company-show-numbers t
      company-backends '(company-capf)
      company-frontends
      '(company-pseudo-tooltip-frontend
        company-echo-metadata-frontend)
      company-dabbrev-other-buffers nil
      company-dabbrev-ignore-case nil
      company-dabbrev-downcase nil)
;;; Flycheck
(require 'flycheck)
(require 'flycheck-popup-tip)
(setq flycheck-popup-tip-error-prefix "-> ")
(add-hook 'flycheck-mode-hook 'flycheck-popup-tip-mode)


(add-hook 'prog-mode-hook  #'company-mode)
(diminish 'company-mode)

;;; LSP Mode
(require 'lsp-mode)
(require 'lsp-ui)
(straight-use-package 'lsp-treemacs)
(add-hook 'lsp-mode-hook #'lsp-treemacs-sync-mode 1)

(add-hook 'lsp-mode-hook #'(lambda ()
                             (lsp-ui-sideline-mode nil)))
(setq lsp-ui-use-webkit t)



(defcustom lsp-prefix-key "l" nil)
(define-prefix-command 'lsp-prefix-key)

(define-key 'lsp-prefix-key (kbd "r") 'lsp-rename)
(define-key 'lsp-prefix-key (kbd "a") 'lsp-execute-code-action)
(define-key 'lsp-prefix-key (kbd "h") 'lsp-ui-doc-glance)
(define-key 'lsp-prefix-key (kbd "f") 'lsp-ui-doc-focus-frame)
(define-key 'lsp-prefix-key (kbd "F") 'lsp-ui-doc-unfocus-frame)
(define-key 'lsp-prefix-key (kbd "e") 'lsp-treemacs-error-list)
(define-key 'lsp-prefix-key (kbd "d") 'lsp-ui-peek-find-definitions)
(define-key 'lsp-prefix-key (kbd "R") 'lsp-ui-peek-find-references)
(define-key 'lsp-prefix-key (kbd "D") 'lsp-find-declaration)

(meow-leader-define-key
 '("l" . lsp-prefix-key))


(provide 'config-programming)
;;;
