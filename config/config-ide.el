;;; config-ide.el -*- lexical-binding: t; -*- 
(use-package lsp-mode
  :init
  (setq lsp-session-file (expand-file-name ".cache/lsp-session" user-emacs-directory))
  :config
  (add-to-list 'lsp-language-id-configuration '(templ-ts-mode . "templ"))
  (lsp-register-client
   (make-lsp-client :new-connection (lsp-stdio-connection '("templ" "lsp"))
                    :activation-fn (lsp-activate-on "templ")
                    :server-id 'templ-ts-mode))

  :custom
  (lsp-use-plists t)
  (lsp-signature-auto-activate t)
  (lsp-signature-doc-lines 3)
  (lsp-completion-show-detail t)
  (lsp-completion-show-kind t)
  (lsp-signature-render-documentation t)
  :bind
  (:map evil-normal-state-map
        ("C-." . lsp-execute-code-action)
        ("<SPC>f" . lsp-format-buffer)
        ("gD" . lsp-find-declaration)
        ("gd" . lsp-find-definition)))
 
(use-package lsp-ui
  :after lsp-mode
  :custom
  (lsp-ui-sideline-show-diagnostics t)
  (lsp-ui-sideline-enable t)
  (lsp-ui-sideline-show-code-actions t)
  (lsp-ui-imenu-auto-refresh t)
  (lsp-ui-imenu-window-fix-width 25)
  (lsp-ui-doc-position 'at-point))


(use-package lsp-treemacs
  :hook (lsp-mode . lsp-treemacs-sync-mode)
  :after (lsp-mode treemacs))

;; (use-package lsp-bridge
;;   :ensure '(lsp-bridge
;;             :host github
;;             :repo "manateelazycat/lsp-bridge"
;;             :type git
;;             :files (:defaults "*.el" "*.py" "acm" "core"
;;                               "langserver" "multiserver"
;;                               "resources")
;;             :build (:not compile))
;;   :custom
;;   (lsp-bridge-enable-hover-diagnostic t)
;;   (lsp-bridge-user-multiserver-dir
;;    (expand-file-name "lsp-bridge-config/multi" user-emacs-directory))
;;   :bind
;;   (:map evil-insert-state-map
;;         ("C-n" . acm-select-next)
;;         ("C-p" . acm-select-prev))
;;   (:map evil-normal-state-map
;;         ("C-." . lsp-bridge-code-action)
;;         ("gd" . lsp-bridge-find-definition)
;;         ("gr" . lsp-bridge-find-references)
;;         ("gR" . lsp-bridge-find-references)
;;         ("gi" . lsp-bridge-find-implementation)
;;         ("K" . lsp-bridge-popup-documentation))
;;   :config
;;   (add-to-list 'lsp-bridge-multi-lang-server-mode-list
;;                ((templ-ts-mode) . "templ"))
  ;; :init
  ;; (global-lsp-bridge-mode))

(use-package dap-mode
  :custom
  (dap-breakpoints-file (expand-file-name ".dap-breakpoints/" my/cache-directory)))


(use-package flycheck
  :config
  :hook (lsp-mode . flycheck-mode))

(use-package flycheck-posframe
  :after flycheck
  :custom
  (flycheck-posframe-position 'point-bottom-left-corner)
  :hook (flycheck-mode . flycheck-posframe-mode))


(use-package consult-flycheck)

(provide 'config-ide)
;;; config-ide.el ends here
