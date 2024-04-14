;;; config-ide.el -*- lexical-binding: t; -*- 
(use-package eglot
  :config
  (add-to-list 'eglot-server-programs
               '((templ-ts-mode) "templ" "lsp"))
  :ensure nil
  :bind
  (:map evil-normal-state-map
        ("C-." . eglot-code-actions)
        ("<SPC>f" . eglot-format)
        ))
  
(use-package eglot-booster
  :ensure (eglot-booster
           :repo "jdtsmith/eglot-booster"
           :host github)
  :after (eglot emacs-lsp-booster)
  :hook (eglot . eglot-booster-mode)
  :config
  (eglot-booster-mode))

(use-package sideline
  :after eglot
  :hook
  (eglot-mode . sideline-mode)
  (eglot-mode . flycheck-mode)
  (flycheck-mode . sideline-mode)
  :init
  (setq sideline-backends-left-skip-current-line t   ; don't display on current line (left)
        sideline-backends-right-skip-current-line t  ; don't display on current line (right)
        sideline-order-left 'down                    ; or 'up
        sideline-order-right 'up                     ; or 'down
        sideline-format-left "%s   "                 ; format for left aligment
        sideline-format-right "   %s"                ; format for right aligment
        sideline-priority 100                        ; overlays' priority
        sideline-display-backend-name t
        sideline-backends-right '((sideline-eglot . up)
                                  (sideline-flycheck . down)))

  :config
  (add-to-list 'eglot-stay-out-of 'flymake))



(use-package sideline-eglot
  :ensure (sideline-eglot
           :repo "emacs-sideline/sideline-eglot"
           :host github))


(use-package sideline-lsp
  :after sideline)

(use-package flycheck
  :init
  :config
  (global-flycheck-mode))

(use-package sideline-flymake)
(use-package sideline-flycheck
  :after (flycheck sideline)
  :hook (flycheck-mode . sideline-flycheck-setup))

(use-package breadcrumb
  :config (breadcrumb-mode))


(use-package consult-flycheck)

(provide 'config-ide)
;;; config-ide.el ends here
