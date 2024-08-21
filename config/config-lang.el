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


(use-package emmet-mode
  :commands (emmet-mode))

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
  (web-mode . emmet-mode))


(use-package auto-close-block
  :ensure (auto-close-block :type git :host github :repo "emacs-vs/auto-close-block")
  :hook
  (web-mode . auto-close-block-mode))


;; ;;; Dart/Flutter
(use-package dart-mode
  :mode ("\\.dart\\'" . dart-mode)
  :hook
  (dart-mode . (lambda () (indent-bars-mode nil))))


;; (use-package flutter)


;;; GdScript-mode
(use-package gdscript-mode
  :hook (gdscript-ts-mode . eglot))

(use-package nix-ts-mode
  :mode ("\\.nix\\'" . nix-ts-mode))

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
  :mode (("\\.cs\\'" . csharp-mode)))

(use-package fsharp-mode
  :config
  ;;; Indent fix
  (defun fsharp--compute-indentation-open-bracket (open-bracket-pos)
    "Computes indentation for a line within an open bracket expression."
    (save-excursion
      (let ((startpos (point))
            placeholder)
        (goto-char (1+ open-bracket-pos)) ; just beyond bracket
        (skip-chars-forward " \t")
        (if (and (null (memq (following-char) '(?\n ?# ?\\)))
                 (not fsharp-conservative-indentation-after-bracket))
            (current-column)
          (forward-line 1)
          (while (and (< (point) startpos)
                      (looking-at "[ \t]*\\(//\\|[\n\\\\]\\)")) ; skip noise
            (forward-line 1))
          (if (and (< (point) startpos)
                   (/= startpos
                       (save-excursion
                         (goto-char (1+ open-bracket-pos))
                         (forward-comment (point-max))
                         (point))))
              (current-indentation)
            (goto-char open-bracket-pos)
            (setq placeholder (point))
            (fsharp-goto-beginning-of-tqs
             (save-excursion (nth 3 (parse-partial-sexp
                                     placeholder (point)))))
            (+ (current-indentation) fsharp-indent-offset))))))
  :mode
  (("\\.fs\\'" . fsharp-mode)
   ("\\.fsi\\'" . fsharp-mode)
   ("\\.fsx\\'" . fsharp-mode)))


(use-package eglot-fsharp
  :init
  (setq eglot-fsharp-server-install-dir
        (expand-file-name "fsharp-lsp/" my/var-directory))
  :after fsharp-mode)

(use-package racket-mode
  :mode
  (("\\.rkt\\'" . racket-mode)))

(use-package docstr
  :commands (docstr-mode)
  :hook (prog-mode . docstr-mode))

(setq treesit-language-source-alist
      '((csharp . ("https://github.com/tree-sitter/tree-sitter-c-sharp"))))


(defun my/install-treesitter-languages ()
  "install treesitter languages"
  (interactive)
  (let ((languages (mapcar 'car treesit-language-source-alist)))
    (dolist (lang languages)
      (treesit-install-language-grammar lang)
      (message "`%s' parser was installed. " lang)
      (sit-for 0.75))))



(provide 'config-lang)
