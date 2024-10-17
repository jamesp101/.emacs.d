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
(use-package gdscript-mode)

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



(use-package racket-mode
  :mode
  (("\\.rkt\\'" . racket-mode)))

(use-package docstr
  :config
  (setq docstr-csharp-modes '(csharp-mode csharp-ts-mode))
  (add-to-list 'docstr-writers-alist '("/" . docstr-trigger-csharp))
  (add-to-list 'docstr-writers-alist '((csharp-ts-mode . docstr-writers-csharp)))
  :hook (prog-mode . docstr-mode))

(defun my/install-treesitter-languages ()
  "install treesitter languages"
  (interactive)
  (let ((languages (mapcar 'car treesit-language-source-alist)))
    (dolist (lang languages)
      (treesit-install-language-grammar lang)
      (message "`%s' parser was installed. " lang)
      (sit-for 0.75))))

;;; https://github.com/theschmocker/dotfiles/blob/33944638a5a59ddba01b64066daf50d46e5f0c3a/emacs/.doom.d/config.el#L807
(defun reapply-csharp-ts-mode-font-lock-settings ()
  "Fixes csharp-ts-mode font lock with latest version of parser"
  (interactive)
  (setq csharp-ts-mode--keywords
        '("this" "add" "alias" "as" "base" "break" "case" "catch" "checked" "class" "continue"
          "default" "delegate" "do" "else" "enum" "event" "explicit" "extern" "finally"
          "for" "foreach" "global" "goto" "if" "implicit" "interface" "is" "lock"
          "namespace" "notnull" "operator" "params" "return" "remove" "sizeof"
          "stackalloc" "static" "struct" "switch" "throw" "try" "typeof" "unchecked"
          "using" "while" "new" "await" "in" "yield" "get" "set" "when" "out" "ref" "from"
          "where" "select" "record" "init" "with" "let"))

  (let ((ops '("--" "-" "-=" "&" "&=" "&&" "+" "++" "+=" "<" "<=" "<<" "<<=" "="
               "==" "!" "!=" "=>" ">" ">=" ">>" ">>=" ">>>" ">>>=" "|" "|=" "||"
               "?" "??" "??=" "^" "^=" "~" "*" "*=" "/" "/=" "%" "%=" ":")))
    (setq csharp-ts-mode--font-lock-settings
          (treesit-font-lock-rules
           :language 'c-sharp
           :feature 'bracket
           '((["(" ")" "[" "]" "{" "}" (interpolation_brace)]) @font-lock-bracket-face)

           :language 'c-sharp
           :feature 'delimiter
           `((["," ":" ";"]) @font-lock-delimiter-face
             ([,@ops]) @font-lock-operator-face
             )

           :language 'c-sharp
           :override t
           :feature 'comment
           '((comment) @font-lock-comment-face)

           :language 'c-sharp
           :override t
           :feature 'keyword
           `([,@csharp-ts-mode--keywords] @font-lock-keyword-face
             (modifier) @font-lock-keyword-face
             (implicit_type) @font-lock-keyword-face)

           :language 'c-sharp
           :override t
           :feature 'property
           `((attribute name: (identifier) @font-lock-property-use-face))

           :language 'c-sharp
           :override t
           :feature 'literal
           `((integer_literal) @font-lock-number-face
             (real_literal) @font-lock-number-face
             (null_literal) @font-lock-constant-face
             (boolean_literal) @font-lock-constant-face)

           :language 'c-sharp
           :override t
           :feature 'string
           `([(character_literal)
              (string_literal)
              (raw_string_literal)
              (verbatim_string_literal)
              ;; (interpolated_string_expression)
              (string_content)
              (interpolation_start)
              (interpolation_quote)] @font-lock-string-face)

           :language 'c-sharp
           :override t
           :feature 'escape-sequence
           '((escape_sequence) @font-lock-escape-face)

           :language 'c-sharp
           :feature 'type
           :override t
           '((generic_name (identifier) @font-lock-type-face)
             (type_parameter (identifier) @font-lock-type-face)
             (parameter type: (identifier) @font-lock-type-face)
             (type_argument_list (identifier) @font-lock-type-face)
             (as_expression right: (identifier) @font-lock-type-face)
             (is_expression right: (identifier) @font-lock-type-face)
             (_ type: (identifier) @font-lock-type-face)
             (predefined_type) @font-lock-builtin-face
             )

           :language 'c-sharp
           :feature 'definition
           :override t
           '((interface_declaration name: (identifier) @font-lock-type-face)
             (class_declaration name: (identifier) @font-lock-type-face)
             (enum_declaration name: (identifier) @font-lock-type-face)
             (struct_declaration (identifier) @font-lock-type-face)
             (record_declaration (identifier) @font-lock-type-face)
             (namespace_declaration name: (identifier) @font-lock-type-face)
             (constructor_declaration name: (identifier) @font-lock-constructor-face)
             (destructor_declaration name: (identifier) @font-lock-constructor-face)
             (base_list (identifier) @font-lock-type-face)
             (enum_member_declaration (identifier) @font-lock-variable-name-face)
             (parameter name: (identifier) @font-lock-variable-name-face)
             (implicit_parameter) @font-lock-variable-name-face
             )

           :language 'c-sharp
           :feature 'function
           '((method_declaration name: (identifier) @font-lock-function-name-face)
             (local_function_statement name: (identifier) @font-lock-function-name-face)
             (invocation_expression
              function: (member_access_expression
                         name: (identifier) @font-lock-function-call-face))
             (invocation_expression
              function: (identifier) @font-lock-function-call-face)
             (invocation_expression
              function: (member_access_expression
                         name: (generic_name (identifier) @font-lock-function-call-face)))
             (invocation_expression
              function: (generic_name (identifier) @font-lock-function-call-face)))

           :language 'c-sharp
           :feature 'expression
           '((identifier) @font-lock-variable-use-face)

           :language 'c-sharp
           :feature 'directives
           :override t
           '((preproc_if
              "#if" @font-lock-preprocessor-face)
             (preproc_if
              "#endif" @font-lock-preprocessor-face)
             (preproc_elif
              "#elif" @font-lock-preprocessor-face)
             (preproc_else
              "#else" @font-lock-preprocessor-face)
             ;; (preproc_endif) @font-lock-preprocessor-face
             (preproc_define
              "#define" @font-lock-preprocessor-face
              (preproc_arg) @font-lock-constant-face)
             (preproc_undef
              "#undef" @font-lock-preprocessor-face
              (preproc_arg) @font-lock-constant-face)

             (preproc_nullable) @font-lock-preprocessor-face
             (preproc_pragma) @font-lock-preprocessor-face
             (preproc_region
              "#region" @font-lock-preprocessor-face
              (preproc_arg) @font-lock-comment-face)
             (preproc_endregion) @font-lock-preprocessor-face)))))

(use-package csharp-mode
  :ensure nil
  :hook
  (csharp-ts-mode . reapply-csharp-ts-mode-font-lock-settings)
  :mode (("\\.cs\\'" . csharp-ts-mode)))


(provide 'config-lang)
