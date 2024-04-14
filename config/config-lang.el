;;; config-lang.el -*- lexical-binding: t; -*-


;;; Python
;; (use-package python
;;   :ensure nil
;;   :hook (python-mode . (lambda ()
;; 			 (lsp-deferred))))
;; (use-package lsp-pyright
;;   :after (lsp python))


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
		  (emmet-mode))))

;; (use-package prisma-mode
;;   :elpaca (:type git :host github :repo "pimeys/emacs-prisma-mode")
;;   :mode ("\\.prisma\\'" . prisma-mode))


;;; Dart/Flutter
(use-package dart-mode
  :mode ("\\.dart\\'" . dart-mode)
  :hook (dart-mode . (lambda () (lsp-deferred))))


;; (use-package lsp-dart
;;   :after (lsp dart-mode)
;;   :config
;;     (with-eval-after-load 'projectile
;;     (add-to-list 'projectile-project-root-files-bottom-up "pubspec.yaml")
;;     (add-to-list 'projectile-project-root-files-bottom-up "BUILD")))



;;; GdScript-mode
(use-package gdscript-mode
  :hook (gdscript-mode . (lambda ()
                           (lsp-deferrd))))

(use-package nix-mode)


(use-package templ-ts-mode
  :init
  :mode ("\\.templ\\'" . templ-ts-mode)
  :hook
  (templ-ts-mode . eglot)
  (templ-ts-mode . auto-rename-tag-mode)
  )

(use-package auto-rename-tag)
(use-package go-ts-mode
  :ensure nil
  :custom (go-ts-mode-indent-offset 4))

(setq treesit-language-source-alist
   '((bash "https://github.com/tree-sitter/tree-sitter-bash")
     (cmake "https://github.com/uyha/tree-sitter-cmake")
     (css "https://github.com/tree-sitter/tree-sitter-css")
     (elisp "https://github.com/Wilfred/tree-sitter-elisp")
     (go "https://github.com/tree-sitter/tree-sitter-go")
     (gomod "https://github.com/camdencheek/tree-sitter-go-mod")
     (html "https://github.com/tree-sitter/tree-sitter-html")
     (javascript "https://github.com/tree-sitter/tree-sitter-javascript" "master" "src")
     (json "https://github.com/tree-sitter/tree-sitter-json")
     (make "https://github.com/alemuller/tree-sitter-make")
     (markdown "https://github.com/ikatyang/tree-sitter-markdown")
     (python "https://github.com/tree-sitter/tree-sitter-python")
     (toml "https://github.com/tree-sitter/tree-sitter-toml")
     (tsx "https://github.com/tree-sitter/tree-sitter-typescript" "master" "tsx/src")
     (typescript "https://github.com/tree-sitter/tree-sitter-typescript" "master" "typescript/src")
     (yaml "https://github.com/ikatyang/tree-sitter-yaml")
     (templ "https://github.com/camdencheek/tree-sitter-go-mod")))

(defun install-treesitter-grammars () (interactive) 
       (mapc #'treesit-install-language-grammar (mapcar #'car treesit-language-source-alist)))




(use-package dotenv-mode
  :mode (("\\.env\\'" . dotenv-mode)
     ("\\.env\\.local\\'" . dotenv-mode)
     ("\\.env\\.development\\'" . dotenv-mode)
     ("\\.env\\.test\\'" . dotenv-mode)
     ("\\.env\\.production" . dotenv-mode)))


(provide 'config-lang)
