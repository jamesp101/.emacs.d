
(straight-use-package 'org)
(straight-use-package 'org-superstar)
(straight-use-package 'org-re-reveal)
(straight-use-package 'ox-pandoc)
(straight-use-package 'org-download)
(straight-use-package 'org-pdftools)
(straight-use-package 'ox-clip)
(straight-use-package 'org-appear)
(straight-use-package 'org-roam)

(require 'org)
(require 'org-superstar)
(require 'org-re-reveal)
(require 'ox-pandoc)
(require 'org-download)
(require 'org-pdftools)
(require 'ox-clip)
(require 'org-appear)
(require 'org-roam)


;; Org Mode
(setq org-return-follows-link t
      org-mouse-1-follows-link t
      org-descriptive-links t
      org-hide-emphasis-markers t)

(setq org-catch-invisible-edits 'smart)

(add-hook 'org-mode-hook
          (lambda ()
            (org-superstar-mode 1)
            (load-library "ox-re-reveal")
            (load-library "ox-pandoc")
            (org-appear-mode)
            ))
;; Org Roam
(setq org-roam-directory (file-truename "~/org-roam"))

(defvar org-commands-prefix-keyj "p" "Org-Prefix-key")

(define-prefix-command 'org-commands-prefix-key)

(define-key 'org-commands-prefix-key (kbd "c") 'org-roam-capture)
(define-key 'org-commands-prefix-key (kbd "g") 'org-roam-graph)
(define-key 'org-commands-prefix-key (kbd "i") 'org-roam-node-insert)
(define-key 'org-commands-prefix-key (kbd "f") 'org-roam-node-find)
(define-key 'org-commands-prefix-key (kbd "b") 'org-roam-buffer-toggle)

(meow-leader-define-key
 '("o" . org-commands-prefix-key))



(provide 'config-org)
