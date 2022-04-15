;;; config-programming.el -*- lexical-binding: t; -*-


(straight-use-package 'editorconfig)
(straight-use-package 'kind-icon)
(straight-use-package 'corfu)
(straight-use-package 'corfu-doc)
(straight-use-package 'cape)
(straight-use-package 'eldoc-box)
(straight-use-package 'dap-mode)
;; Editor Config
(require 'editorconfig)
(editorconfig-mode 1)


(require 'corfu)

(setq corfu-cycle t)                ;; Enable cycling for `corfu-next/previous'
(setq corfu-auto t)                 ;; Enable auto completiosetq n
(setq corfu-separator ?\s)          ;; Orderless field separator
(setq corfu-quit-at-boundary nil)   ;; Never quit at completion boundary
(setq corfu-quit-no-match nil)      ;; Never quit, even if there is no match
(setq corfu-preview-current nil)    ;; Disable current candidate preview
(setq corfu-preselect-first nil)    ;; Disable candidate preselection
(setq corfu-on-exact-match nil)     ;; Configure handling of exact matches
(setq corfu-echo-documentation nil) ;; Disable documentation in the echo area
(setq corfu-scroll-margin 5)        ;; Use scroll margin

(require 'eldoc-box)



(require 'corfu-doc)
(add-hook 'corfu-mode-hook #'corfu-doc-mode)
(define-key corfu-map (kbd "M-p") #'corfu-doc-scroll-down) ;; corfu-next
(define-key corfu-map (kbd "M-n") #'corfu-doc-scroll-up)  ;; corfu-previous
(corfu-global-mode t)


(require 'kind-icon)
(setq kind-icon-default-face 'corfu-default)
(add-to-list 'corfu-margin-formatters #'kind-icon-margin-formatter)

(require 'cape)
(advice-add 'pcomplete-completions-at-point :around #'cape-wrap-silent)
(advice-add 'pcomplete-completions-at-point :around #'cape-wrap-purify)



(straight-use-package 'eglot)
(require 'eglot)

(add-hook 'eglot--managed-mode #'eldoc-box-hover-mode t)

(defcustom eglot-prefix-key "l" nil)
(define-prefix-command 'eglot-prefix-key)

(define-key 'eglot-prefix-key (kbd "r") 'eglot-rename)
(define-key 'eglot-prefix-key (kbd "a") 'eglot-code-actions)
(define-key 'eglot-prefix-key (kbd "d") 'xref-find-definitions)
(define-key 'eglot-prefix-key (kbd "D") 'xref-find-references)
(define-key 'eglot-prefix-key (kbd "h") 'eldoc)
(define-key 'eglot-prefix-key (kbd "m") 'consult-imenu)
(define-key 'eglot-prefix-key (kbd "M") 'consult-imenu-multi)
(define-key 'eglot-prefix-key (kbd "e") 'consult-flymake)

(meow-leader-define-key
 '("l" . eglot-prefix-key))




(require 'dap-mode)


(defcustom dap-mode-prefix-key "d" nil)
(define-prefix-command 'dap-mode-prefix-key)

(define-key 'dap-mode-prefix-key (kbd "d") 'dap-debug)
(define-key 'dap-mode-prefix-key (kbd "t") 'dap-breakpoint-toggle)
(define-key 'dap-mode-prefix-key (kbd "a") 'dap-breakpoint-add)
(define-key 'dap-mode-prefix-key (kbd "A") 'dap-breakpoint-delete)
(define-key 'dap-mode-prefix-key (kbd "g") 'dap-ui-breakpoints)
(define-key 'dap-mode-prefix-key (kbd "n") 'dap-next)
(define-key 'dap-mode-prefix-key (kbd "N") 'dap-next)
(define-key 'dap-mode-prefix-key (kbd "R") 'dap-debug-restart)
(define-key 'dap-mode-prefix-key (kbd "h") 'dap-hydra)

(meow-leader-define-key
 '("d" . dap-mode-prefix-key))




(straight-use-package 'markdown-mode)
(require 'markdown-mode)
(provide 'config-programming)
;;;
