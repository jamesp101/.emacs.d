

;; (straight-use-package 'bufler)
;; (require 'bufler)
;; (global-set-key (kbd "C-x C-b") 'bufler)

;; (bufler-workspace-mode)




(straight-use-package
 '(tabspaces :type git :host github :repo "mclear-tools/tabspaces"))

(require 'tabspaces)


(defcustom workspace-prefix-key "TAB" nil)
(define-prefix-command 'workspace-prefix-key)

(define-key 'workspace-prefix-key (kbd "n") 'tabspaces-create-new-project-and-workspace)
(define-key 'workspace-prefix-key (kbd "k") 'tabspaces-kill-buffers-close-workspace)
(define-key 'workspace-prefix-key (kbd "TAB") 'tabspaces-switch-workspace)

(setq tabspaces-use-filtered-buffers-as-default t)

(add-hook 'after-init-hook #'tabspaces-mode)


(meow-leader-define-key
 '("TAB" . workspace-prefix-key))

(provide 'config-workspace)

