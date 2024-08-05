;;; config-lang.el -*- lexical-binding: t; -*-

(use-package treesit-auto
  :custom
  (treesit-auto-install 'prompt)
  :config
  (treesit-auto-add-to-auto-mode-alist 'all)
  (global-treesit-auto-mode))

;;; Python
(use-package python
  :ensure nil
  :hook (python-mode . eglot)
  :init
  (add-to-list 'major-mode-remap-alist '(python-mode . python-ts-mode)))

(use-package lsp-pyright
  :after (lsp python))


(use-package emmet-mode)

;;; Web Mode
(use-package web-mode
  :mode (("\\.html\\'" . web-mode)
	 ("\\.jsx\\'" . web-mode)
	 ("\\.tsx\\'" . web-mode)
	 ("\\.astro\\'" . web-mode)
	 ("\\.astro\\'" . web-mode)
     ("\\.svelte\\'" . web-mode)
     ("\\.cshtml\\'" . web-mode)
     ("\\.php\\'" . web-mode))
  :hook
  (web-mode . emmet-mode)
  )


;; ;;; Dart/Flutter
(use-package dart-mode
  :mode ("\\.dart\\'" . dart-mode)
  :hook
  (dart-mode . (lambda () (indent-bars-mode nil))))


;; (use-package flutter)
 


(use-package lsp-dart
  :after (lsp dart-mode))

;;; GdScript-mode
(use-package gdscript-mode
  :hook (gdscript-ts-mode . (lsp-deferred)))

(use-package nix-mode)

(use-package templ-ts-mode
  :mode ("\\.templ\\'" . templ-ts-mode)
  :hook
  (templ-ts-mode . lsp-deferred)
  (templ-ts-mode . emmet-mode)
  (templ-ts-mode . auto-rename-tag-mode)
  :init
  (setq my/templ-tsauto-config
        (make-treesit-auto-recipe
        :lang 'templ
        :ts-mode 'templ-ts-mode
        :url "https://github.com/vrischmann/tree-sitter-templ"
        :source-dir "src"
        :revision "master"
        :ext "\\.templ\\'"))
    (add-to-list 'treesit-auto-recipe-list my/templ-tsauto-config))

(use-package auto-rename-tag
  :hook
  (web-mode . auto-rename-tag-mode)
  (html-mode . auto-rename-tag-mode)
  (xml-mode . auto-rename-tag-mode))

(use-package go-ts-mode
  :ensure nil
  :mode ("\\.go\\'" . go-ts-mode)
  :hook
  (go-ts-mode . lsp-deferred)
  :init
  (setq treesit-font-lock-level 4)
  (add-to-list 'major-mode-remap-alist '(go-mode go-ts-mode))
  :custom (go-ts-mode-indent-offset 4))

(add-to-list 'major-mode-remap-alist '(javascript-mode . js-ts-mode))
(add-to-list 'major-mode-remap-alist '(typescript-mode . typescript-ts-mode))

(use-package dotenv-mode
  :mode (("\\.env\\'" . dotenv-mode)
     ("\\.env\\.local\\'" . dotenv-mode)))
(use-package yaml-ts-mode
  :ensure nil
  :mode (("\\.yaml\\'" . yaml-ts-mode)
         ("\\.yml\\'" . yaml-ts-mode)))

(use-package zig-mode
  :mode (("\\.zig\\'"  . zig-mode)))

(use-package csharp-mode
  :ensure nil
  :hook (csharp-mode . eglot)
  :mode (("\\.cs\\'" . csharp-mode)))

(use-package fsharp-mode
  :mode
  (("\\.fs\\'" . fsharp-mode)
   ("\\.fsi\\'" . fsharp-mode)
   ("\\.fsx\\'" . fsharp-mode)))


(use-package eglot-fsharp
  :init
  (setq eglot-fsharp-server-install-dir
        (expand-file-name "fsharp-lsp/" my/cache-directory))
  :after fsharp-mode)

(use-package racket-mode)
(use-package jsdoc)
(use-package docstr
  :config
  (global-docstr-mode))



(provide 'config-lang)
