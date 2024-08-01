;;; config-ide.el -*- lexical-binding: t; -*- 
(use-package lsp-mode
  :init
  (setq lsp-headerline-breadcrumb-enable nil)
  (setq lsp-session-file (expand-file-name ".cache/lsp-session" user-emacs-directory))
  (defun my/lsp-mode-setup-completion ()
    (setf (alist-get 'styles (alist-get 'lsp-capf completion-category-defaults))
          '(flex)))
  :config
  (add-to-list 'lsp-language-id-configuration '(templ-ts-mode . "templ"))
  (lsp-register-client
   (make-lsp-client :new-connection (lsp-stdio-connection '("templ" "lsp"))
                    :activation-fn (lsp-activate-on "templ")
                    :server-id 'templ-ts-mode))
  (set-face-attribute 'lsp-lens-face nil
                      :box 1)

  :hook
  (lsp-completion-mode . my/lsp-mode-setup-completion)
  :custom
  (lsp-auto-guess-root t)
  (lsp-use-plists t)
  (lsp-signature-auto-activate t)
  (lsp-signature-doc-lines 4)
  (lsp-completion-show-detail t)
  (lsp-completion-show-kind t)
  (lsp-signature-render-documentation t)
  (lsp-inlay-hint-enable t)
  (lsp-tcp-cconnection-timeout 0.01)
  (lsp-completion-provider :none)
  :bind
  (:map evil-normal-state-map
        ("C-." . lsp-execute-code-action)
        ("<SPC>f" . lsp-format-buffer)
        ("gD" . lsp-find-declaration)
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
  :after lsp
  :init
  (setq lsp-ui-sideline-show-diagnositcs nil)
  (setq lsp-ui-sideline-enable nil)
  (setq lsp-ui-sideline-show-hover nil)
  (setq lsp-ui-doc-position 'at-point)
  (setq lsp-ui-doc-enable t)
  :hook
  (lsp-mode . lsp-ui-doc-mode)
  :bind
  (:map evil-normal-state-map
        ("K" . lsp-ui-doc-toggle)))

(use-package sideline
  :hook
  (lsp-mode . sideline-mode)
  (flycheck-mode . sideline-mode)
  :init
  (setq sideline-backends-left-skip-current-line t   ; don't display on current line (left)
        sideline-backends-right-skip-current-line t  ; don't display on current line (right)
        sideline-order-left 'down                    ; or 'up
        sideline-order-right 'up                     ; or 'down
        sideline-format-left "%s   "                 ; format for left aligment
        sideline-format-right "   %s"                ; format for right aligment
        sideline-priority 100                        ; overlays' priority
        sideline-lsp-code-actions-prefix "󰌵 "
        sideline-display-backend-name t
        sideline-backends-right '((sideline-lsp . up)
                                  (sideline-flycheck . down))))


(use-package sideline-lsp
  :after sideline)

(use-package sideline-flycheck
  :after sideline
  :hook (flycheck-mode . sideline-flycheck-setup)
  :config
  (setq lsp-ui-sideline-show-diagnositcs nil)
  (setq lsp-ui-sideline-enable nil))

(use-package breadcrumb
  :custom
  (breadcrumb-project-crumb-separator " > ")
  :config (breadcrumb-mode))


(use-package lsp-treemacs
  :hook (lsp-mode . lsp-treemacs-sync-mode)
  :after (lsp-mode treemacs))


(use-package dap-mode
  :custom
  (dap-breakpoints-file (expand-file-name ".dap-breakpoints/" my/cache-directory)))


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
(use-package yasnippet
  :config
  (yas-global-mode))
(use-package consult-yasnippet
  :bind
  (:map evil-normal-state-map
        ("<SPC>y" . consult-yasnippet)))
(use-package yasnippet-snippets)

(provide 'config-ide)
;;; config-ide.el ends here
