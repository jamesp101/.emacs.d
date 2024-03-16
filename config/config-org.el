;;; config-org -*- lexical-binding: t; -*-

(use-package org
  :config
  (add-hook 'org-mode-hook #'(lambda ()
                               (org-indent-mode))))

(use-package evil-org
  :after evil
  :hook (org-mode .  evil-org-mode)
  :config
  (require 'evil-org-agenda)
  (evil-org-agenda-set-keys))


(use-package org-bullets
  :custom
  (org-bullets-bullet-list '("" "" "" ))
  :config
  (add-hook 'org-mode-hook 'org-bullets-mode))

(use-package org-download
  :after org)


;; (use-package org-pdftools
;;   :hook (org-mode . org-pdftools-setup-link))


(use-package org-roam
  :after org
  :init
  (setq my/org-roam-directory "~/Documents/org-roam")
  (setq org-roam-db-location
        (expand-file-name "~/Documents/org-roam.sqlite" user-emacs-directory))

  (unless (file-directory-p my/org-roam-directory)
    (make-directory my/org-roam-directory))

  (setq org-roam-directory my/org-roam-directory)

  :config
  (setq org-roam-node-display-template (concat "${title:*} ${tags:10} ${file:10"))
  (org-roam-db-autosync-mode))


(use-package lsp-grammarly
  :after (lsp)
  :config
  (add-hook 'org-mode-hook 'lsp-deferred))

(use-package org-re-reveal
  :after org
  :config
  (require 'org-re-reveal))


(use-package org-tree-slide
  :after org)

(provide 'config-org)
