;;; config-programming.el -*- lexical-binding: t; -*-


(straight-use-package 'lsp-mode)
(straight-use-package 'lsp-ui)
(straight-use-package 'flycheck)
(straight-use-package 'flycheck-popup-tip)
(straight-use-package 'dap-mode)
(straight-use-package 'editorconfig)
;; Corfu
(straight-use-package 'corfu)
(straight-use-package 'corfu-doc)
(straight-use-package 'kind-icon)
;; Editor Config
(require 'editorconfig)
(editorconfig-mode 1)


;; Corfu
(require 'corfu)
(require 'corfu-doc)
(require 'kind-icon)
(setq corfu-cycle t
      corfu-auto t
      corfu-separator ?\s
      corfu-echo-documentation t)

(define-key corfu-map (kbd "M-n") #'corfu-doc-scroll-up)
(define-key corfu-map (kbd "M-p") #'corfu-doc-scroll-up)

(add-hook 'corfu-mode-hook
          #'(lambda () (corfu-doc-mode t)))
(setq kind-icon-default-face 'corfu-default
      kind-icon-use-icons t)
(add-to-list 'corfu-margin-formatters #'kind-icon-margin-formatter)



;;; Flycheck
(require 'flycheck)
(require 'flycheck-popup-tip)
(setq flycheck-popup-tip-error-prefix "-> ")
(add-hook 'flycheck-mode-hook 'flycheck-popup-tip-mode)



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
(define-key 'lsp-prefix-key (kbd "m") 'consult-imenu)
(define-key 'lsp-prefix-key (kbd "M") 'lsp-ui-imenu)

(meow-leader-define-key
 '("l" . lsp-prefix-key))


(provide 'config-programming)
;;;
