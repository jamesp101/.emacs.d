;;; config-lang.el -*- lexical-binding: t; -*-


;;; Python
(use-package python
  :hook (python-mode . (lambda ()
			 (tree-sitter-mode t)
			 (lsp-deferred))))
(use-package lsp-pyright
  :after (lsp python))

;;(use-package dap-python
;;  :after python
;;  :elpaca t
;;  (require 'dap-python))


(use-package emmet-mode)

;;; Web Mode
(use-package web-mode
  :mode (("\\.html\\'" . web-mode)
	 ("\\.jsx\\'" . web-mode)
	 ("\\.tsx\\'" . web-mode)
	 ("\\.astro\\'" . web-mode)
	 ("\\.astro\\'" . web-mode)
   ("\\.svelte\\'" . web-mode)
   ("\\.php\\'" . web-mode))


  :hook (web-mode . (lambda ()
		  (tree-sitter-mode)
		  (emmet-mode)
		  (lsp-deferred))))

(use-package typescript-mode
  :mode (("\\.ts\\'" . typescript-mode)
	 ("\\.js\\'" . typescript-mode))
  :hook (typescript-mode . (lambda ()
			     (tree-sitter-mode)
			     (lsp-deferred))))
(use-package lsp-tailwindcss
  :after (lsp web-mode)
  :init (setq lsp-tailwindcss-add-on-mode t))

;; (use-package prisma-mode
;;   :elpaca (:type git :host github :repo "pimeys/emacs-prisma-mode")
;;   :mode ("\\.prisma\\'" . prisma-mode))


;;; Dart/Flutter
(use-package dart-mode
  :mode ("\\.dart\\'" . dart-mode)
  :hook (dart-mode . (lambda ()
		       (lsp-deferred))))


(use-package lsp-dart
  :after (lsp dart-mode)
  :config
    (with-eval-after-load 'projectile
    (add-to-list 'projectile-project-root-files-bottom-up "pubspec.yaml")
    (add-to-list 'projectile-project-root-files-bottom-up "BUILD")))




;;; GdScript-mode

(use-package gdscript-mode
  :hook (gdscript-mode . (lambda ()
                           (lsp-deferred))))


;;; Data
(use-package json-mode
  :hook (json-mode . (lambda ()
		       (tree-sitter-mode)
		       (lsp-deferred))))

(use-package nix-mode)


(use-package yaml-mode)
(use-package toml-mode)


(provide 'config-lang)
