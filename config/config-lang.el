;; Tree sitter
(straight-use-package 'tree-sitter)
(straight-use-package 'tree-sitter-langs)
(require 'tree-sitter)
(require 'tree-sitter-langs)



;;; PYTHON
(straight-use-package 'lsp-pyright)
(straight-use-package 'python-mode)
(require 'python-mode)
(require 'dap-python)

(add-hook 'python-mode-hook #'(lambda ()
                                (tree-sitter-mode)
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
(add-hook 'web-mode-hook
          #'(lambda ()
              (electric-pair-mode nil)
              (tree-sitter-mode)))
;;; CSS
(require 'scss-mode)
(add-to-list 'auto-mode-alist '("\\.css\\'" . scss-mode))
(add-hook 'scss-mode-hook
          #'(lambda ()
              (tree-sitter-mode)
              (lsp-deferred)))
           
;;; JSON
(straight-use-package 'json-mode)
(add-hook 'json-mode-hook
          #'(lambda ()
              (tree-sitter-mode)
              (lsp-deferred)))

;;; haskell
(straight-use-package 'haskell-mode)
(straight-use-package 'lsp-haskell)
(require 'haskell-mode)
(require 'lsp-haskell)

(provide 'config-lang)
