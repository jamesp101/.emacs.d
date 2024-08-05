;;; config-ide.el -*- lexical-binding: t; -*-
(use-package eglot
  :bind
  (:map evil-normal-state-map
        ("<SPC>f" . eglot-format-buffer)
        ("C-." . eglot-code-actions)
        ("<SPC>lr" . eglot-rename)

        ))


(use-package sideline
  :hook
  (flymake-mode . sideline-mode)
  :init
  (setq sideline-backends-left-skip-current-line t   ; don't display on current line (left)
        sideline-backends-right-skip-current-line t  ; don't display on current line (right)
        sideline-order-left 'down                    ; or 'up
        sideline-order-right 'up                     ; or 'down
        sideline-format-left "%s   "                 ; format for left aligment
        sideline-format-right "   %s"                ; format for right aligment
        sideline-priority 100                        ; overlays' priority
        sideline-display-backend-name t))

(use-package sideline-flymake
  :after sideline
  :config
  (add-to-list 'sideline-backends-right 'sideline-flymake))

(use-package sideline-eglot
  :ensure (sideline-eglot :host github :repo "emacs-sideline/sideline-eglot")
  :after sideline
  :config
  (setq sideline-eglot-code-actions-prefix "󰌵 ")
  (add-to-list 'sideline-backends-right 'sideline-eglot))

(use-package sideline-eldoc
  :ensure (sideline-eldoc :host github :repo "ginqi7/sideline-eldoc"))

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
  :config
  (breadcrumb-mode))




(use-package dap-mode
  :custom
  (dap-breakpoints-file (expand-file-name ".dap-breakpoints/" my/cache-directory)))


(use-package yasnippet
  :config
  (yas-global-mode))
(use-package consult-yasnippet
  :bind
  (:map evil-normal-state-map
        ("<SPC>y" . consult-yasnippet)))

(use-package yasnippet-snippets
  :defer t)

(use-package format-all)

(use-package eldoc-box)

(provide 'config-ide)
;;; config-ide.el ends here
