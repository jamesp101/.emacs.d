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
           



;;; Haskell
(straight-use-package 'haskell-mode)
(straight-use-package 'lsp-haskell)



(provide 'config-lang)
