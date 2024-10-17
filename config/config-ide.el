;;; config-ide.el -*- lexical-binding: t; -*-

(use-package lsp-mode
  :hook (lsp-mode . sideline-mode)
  :init
  (setq lsp-headerline-breadcrumb-enable nil
        lsp-auto-guess-root t
        lsp-use-plists t
        lsp-signature-auto-activate t
        lsp-signature-doc-lines 5
        lsp-completion-show-detail t
        lsp-completion-show-kind t
        lsp-signature-render-documentation t
        lsp-inlay-hint-enable t
        lsp-tcp-connection-timeout 0.01)
  :bind
  (:map evil-normal-state-map
        ("C-." . lsp-execute-code-action)
        ("<SPC>f" . lsp-format-buffer)
        ("gD" . lsp-find-decleration)
        ("gd" . lsp-find-definition)))


(defun lsp-booster--advice-json-parse (old-fn &rest args)
  "Try to parse bytecode instead of json."
  (or
   (when (equal (following-char) ?#)
     (let ((bytecode (read (current-buffer))))
       (when (byte-code-function-p bytecode)
         (funcall bytecode))))
   (apply old-fn args)))
(advice-add (if (progn (require 'json)
                       (fboundp 'json-parse-buffer))
                'json-parse-buffer
              'json-read)
            :around
            #'lsp-booster--advice-json-parse)

(defun lsp-booster--advice-final-command (old-fn cmd &optional test?)
  "Prepend emacs-lsp-booster command to lsp CMD."
  (let ((orig-result (funcall old-fn cmd test?)))
    (if (and (not test?)                             ;; for check lsp-server-present?
             (not (file-remote-p default-directory)) ;; see lsp-resolve-final-command, it would add extra shell wrapper
             lsp-use-plists
             (not (functionp 'json-rpc-connection))  ;; native json-rpc
             (executable-find "emacs-lsp-booster"))
        (progn
          (message "Using emacs-lsp-booster for %s!" orig-result)
          (cons "emacs-lsp-booster" orig-result))
      orig-result)))
(advice-add 'lsp-resolve-final-command :around #'lsp-booster--advice-final-command)


(use-package lsp-ui
  :init
  (setq lsp-ui-sideline-enable nil)
  :bind
  (:map evil-normal-state-map
        ("K" . lsp-ui-doc-toggle)))


(use-package flycheck
  :config
  (custom-set-faces
   '(flycheck-error ((t (:underline (:color "red" :style line))))))
  (custom-set-faces
   '(flycheck-warning ((t (:underline (:color "yellow" :style line))))))
  (custom-set-faces
   '(flycheck-info ((t (:underline (:color "green" :style line))))))

  :hook (lsp-mode . flycheck-mode)
  :bind
  (:map evil-normal-state-map
        ( "[d" . flycheck-next-error )
        ( "]d" . flycheck-prev-error)))

(use-package consult-flycheck)

(use-package company
  :hook
  (prog-mode . company-mode))


(use-package sideline
  :init
  (setq sideline-backends-left-skip-current-line t   ; don't display on current line (left)
        sideline-backends-right-skip-current-line t  ; don't display on current line (right)
        sideline-order-left 'down                    ; or 'up
        sideline-order-right 'up                     ; or 'down
        sideline-format-left "%s   "                 ; format for left aligment
        sideline-format-right "   %s"                ; format for right aligment
        sideline-priority 100                        ; overlays' priority
        sideline-display-backend-name t))

(use-package sideline-lsp
  :init
  (add-to-list 'sideline-backends-right '(sideline-lsp)))

(use-package sideline-flycheck
  :init
  (add-to-list 'sideline-backends-right '(sideline-flycheck)))

(use-package breadcrumb
  :init
  (advice-add #'breadcrumb--format-project-node :around
              (lambda (og p more &rest r)
                "Icon For File"
                (let ((string (apply og p more r)))
                  (if (not more)
                      (concat (nerd-icons-icon-for-file string)
                              " " string)
                    (concat (nerd-icons-faicon
                             "nf-fa-folder_open"
                             :face 'breadcrumb-project-crumbs-face)
                            " "
                            string)))))

  (advice-add #'breadcrumb--project-crumbs-1 :filter-return
              (lambda (return)
                "Icon for Parent Node"
                (if (listp return)
                    (setf (car return)
                          (concat
                           " "
                           (nerd-icons-faicon
                            "nf-fa-rocket"
                            :face 'breadcrumb-project-base-face)
                           " "
                           (car return))))
                return))

  (advice-add #'breadcrumb--format-ipath-node :around
              (lambda (og p more &rest r)
                "Icon for items"
                (let ((string (apply og p more r)))
                  (if (not more)
                      (concat (nerd-icons-codicon
                               "nf-cod-symbol_field"
                               :face 'breadcrumb-imenu-leaf-face)
                              " " string)
                    (cond ((string= string "Packages")
                           (concat (nerd-icons-codicon "nf-cod-package" :face 'breadcrumb-imenu-crumbs-face) " " string))
                          ((string= string "Requires")
                           (concat (nerd-icons-codicon "nf-cod-file_submodule" :face 'breadcrumb-imenu-crumbs-face) " " string))
                          ((or (string= string "Variable") (string= string "Variables"))
                           (concat (nerd-icons-codicon "nf-cod-symbol_variable" :face 'breadcrumb-imenu-crumbs-face) " " string))
                          ((string= string "Function")
                           (concat (nerd-icons-mdicon "nf-md-function_variant" :face 'breadcrumb-imenu-crumbs-face) " " string))
                          (t string))))))
  :custom
  (breadcrumb-project-crumb-separator " > ")
  :hook
  (prog-mode . breadcrumb-mode))




(use-package dap-mode
  :defer t)


(use-package yasnippet
  :hook
  (prog-mode . yas-minor-mode))

(use-package yasnippet-capf
  :after (yasnippet cape)
  :init (add-to-list 'completion-at-point-functions #'yasnippet-capf))


(use-package consult-yasnippet
  :bind
  (:map evil-normal-state-map
        ("<SPC>y" . consult-yasnippet)))

(use-package yasnippet-snippets
  :defer t)

(use-package format-all
  :defer t)

(use-package eldoc-box)

(defun treesit-enabled-p ()
  "Checks if the current buffer has a treesit parser."
  (interactive)
  (and (fboundp 'treesit-available-p)
       (treesit-available-p)
       (treesit-language-at (point))))

(use-package treesit-fold
  :defer t)

(provide 'config-ide)
;;; config-ide.el ends here
