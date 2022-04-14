

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

(with-eval-after-load 'consult
  ;; hide full buffer list (still available with "b")
  (consult-customize consult--source-buffer :hidden t :default nil)
  ;; set consult-workspace buffer list
  (defvar consult--source-workspace
    (list :name     "Workspace Buffers"
          :narrow   ?w
          :category 'buffer
          :state    #'consult--buffer-state
          :default  t
          :items    (lambda ()
                      (tabspaces--tab-bar-buffer-name-filter ((lambda () (consult--buffer-query :sort 'visibility
                                                                                                  :as #'buffer-name))))))

    "Set workspace buffer list for consult-buffer.")
  (push consult--source-workspace consult-buffer-sources))

(meow-leader-define-key
 '("TAB" . workspace-prefix-key))

(provide 'config-workspace)

