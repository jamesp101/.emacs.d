;;; config-org -*- lexical-binding: t; -*-
(use-package org
  :ensure nil)

(use-package evil-org
  :after evil
  :hook (org-mode .  evil-org-mode)
  :config
  (require 'evil-org-agenda)
  (evil-org-agenda-set-keys))

(use-package org-download
  :after org)


;; (use-package org-pdftools
;;   :hook (org-mode . org-pdftools-setup-link))


;; (use-package org-roam
;;   :after org
;;   :init
;;   (setq my/org-roam-directory "~/proton-drive/org-roam")
;;   (setq org-roam-db-location
;;         (expand-file-name "org-roam.sqlite" user-emacs-directory))

;;   :config
;;   (setq org-roam-node-display-template (concat "${title:*} ${tags:10} ${file:10"))
;;   (org-roam-db-autosync-mode))


(use-package org-re-reveal
  :after org
  :config
  (require 'org-re-reveal))


(use-package org-tree-slide
  :after org)

(use-package org-modern-indent
  :ensure (org-modern-indent
           :host github
           :repo "jdtsmith/org-modern-indent")
  :hook (org-mode . org-modern-indent-mode))

(use-package org-modern
  :hook (org-mode . org-modern-mode))
(provide 'config-org)
