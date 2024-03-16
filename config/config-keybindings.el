;;; config-keybindings.el -*- lexical-binding: t; -*-


(elpaca-wait)
(evil-leader/set-leader "SPC") 


(evil-leader/set-key
  "SPC" 'consult-projectile
  "r" 'consult-recent-file)

;; ;; LSP Keybinding
(evil-define-key 'normal 'global (kbd "<SPC>lr") '("Rename" . lsp-rename))
(evil-define-key 'normal 'global (kbd "<SPC>la") '("Action" . lsp-execute-code-action ))
(evil-define-key 'normal 'global (kbd "<C-.>") '("Action" . lsp-execute-code-action ))

(evil-define-key 'normal 'global (kbd "<SPC>le") '("Errors" . lsp-treemacs-errors-list))
(evil-define-key 'normal 'global (kbd "<SPC>ld") '("Definition" . lsp-find-definition))
(evil-define-key 'normal 'global (kbd "<SPC>lR") '("References" . lsp-find-references))
(evil-define-key 'normal 'global (kbd "<SPC>lm") '("imenu" . consult-imenu))
(evil-define-key 'normal 'global (kbd "<SPC>lM") '("LSP-imenu" . lsp-ui-imenu))
(evil-define-key 'normal 'global (kbd "<SPC>lh") '("Hover" . lsp-ui-doc-glance))
(evil-define-key 'normal 'global (kbd "<SPC>lf") '("Format Buffer" . lsp-format-buffer))
(evil-define-key 'normal 'global (kbd "<SPC>?") '("Doc" . lsp-ui-doc-show))
(evil-define-key 'normal 'global (kbd "K") '("Doc" . lsp-ui-doc-toggle))
(evil-define-key 'normal 'global (kbd "<SPC>ly") '("YasSnippet" . consult-yasnippet))
;;

(evil-define-key 'normal 'global (kbd "<SPC>pp") '("Switch Project" . consult-projectile-switch-project))
(evil-define-key 'normal 'global (kbd "<SPC>pf") '("RipGrep Project" . consult-ripgrep))
(evil-define-key 'normal 'global (kbd "<SPC>pt") '("Treemacs" . treemacs))
(evil-define-key 'normal 'global (kbd "<SPC>SPC") '("Project Find File" . consult-projectile))
(evil-define-key 'normal 'global (kbd "<SPC>t") '("Treemacs" . treemacs-select-window))
(evil-define-key 'normal 'global (kbd "<SPC>pg") '("Magit" . magit))
(evil-define-key 'normal 'global (kbd "<SPC>pc") '("Eshell" . projectile-run-eshell))

;; Temrinal
(evil-define-key 'normal 'global (kbd "C-`") '("Terminal" . eat))
(evil-define-key 'normal 'global (kbd "<SPC>pt") '("Project Terminal" . eat-project))
(evil-define-key 'normal 'global (kbd "<SPC>r") '("Recent File" . consult-recent-file))

;; Org Roam
(evil-define-key 'normal 'global (kbd "<SPC>oc") '("Org-Roam Caputer" . org-roam-capture))
(evil-define-key 'normal 'global (kbd "<SPC>og") '("Org-Roam Graph" . org-roam-graph))
(evil-define-key 'normal 'global (kbd "<SPC>of") '("Org-Roam Find" . org-roam-node-find))
(evil-define-key 'normal 'global (kbd "<SPC>oi") '("Org-Roam Find" . org-roam-insert))
(evil-define-key 'normal 'global (kbd "<SPC>oi") '("Org-Roam Find" . org-roam-insert))
;; Org Roam Dailies
(evil-define-key 'normal 'global (kbd "<SPC>od") '("Org-Roam Capture Today" . org-roam-dailies-capture-today))
(evil-define-key 'normal 'global (kbd "<SPC>od") '("Org-Roam Capture Today" . org-roam-dailies-capture-today))

;; Window
(setq aw-keys '(?a ?s ?d ?d ?f ?g ?h ?j ?k ?l ))
(evil-define-key 'normal 'global (kbd "C-x o") 'ace-select-window)


(evil-define-key 'normal 'global (kbd "<SPC>Y") '("Browse kill ring" . browse-kill-ring))
(evil-define-key 'normal 'global (kbd "<SPC>y") '("Kill Ring" . yank-from-kill-ring))

(evil-define-key 'normal 'global (kbd "<SPC>f") '("Goto Char" . avy-goto-char))


(global-set-key (kbd "M-f") #'avy-goto-char)

(add-hook 'dart-mode-hook
          (lambda ()
            (evil-define-key 'normal 'global (kbd "<SPC>dr") '("Flutter hot reload" . lsp-dart-dap-flutter-hot-reload))
            (evil-define-key 'normal 'global (kbd "<SPC>dR") '("Flutter hot restart" . lsp-dart-dap-flutter-hot-restart))))




;;; Wind Move
(global-set-key (kbd "M-l") 'windmove-right)
(global-set-key (kbd "M-h") 'windmove-left)
(global-set-key (kbd "M-j") 'windmove-down)
(global-set-key (kbd "M-k") 'windmove-up)

(global-set-key (kbd "C-M-l") 'windmove-swap-states-right)
(global-set-key (kbd "C-M-h") 'windmove-swap-states-left)
(global-set-key (kbd "C-M-j") 'windmove-swap-states-down)
(global-set-key (kbd "C-M-k") 'windmove-swap-states-up)


(provide 'config-keybindings)
