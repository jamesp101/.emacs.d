;;; config-org -*- lexical-binding: t; -*-
(use-package org
  :ensure nil
  :hook (org-mode . org-indent-mode)
  :custom
  (org-id-locations (expand-file-name ".org-id-locations" my/var-directory))
  (org-agenda-files '("~/org/agenda/"))
  (org-log-done 'time)
  (org-adapt-indentation t)
  (org-return-follows-link t)
  (org-auto-align-tags nil)
  (org-catch-invisible-edits 'show-and-error)
  (org-special-ctrl-a/e t)
  (org-insert-heading-respect-content t)
  (org-hide-emphasis-markers t)
  (org-pretty-entities t)
  (org-adapt-indentation t)
  (org-todo-keywords '((sequence "TODO(t)" "PLANNING(p)" "IN-PROGRESS(i@/!) DONE(i@/!)")))
  (org-confirm-babel-evaluate nil)
  (org-capture-templates
   '(
     ("s" "School Note"
      entry (file+datetree "~/org/notes/school.org")
      "* %?\n:Created: %T\n"
      )
     ("S" "School ToDo"
      entry (file+datetree "~/org/agenda/school.org")
      "* TODO %?\n:Deadline: \n"
      )
     ("k" "Side Note"
      entry (file+datetree "~/org/notes/sides.org")
      "* %?\n:Created: %T\n"
      )
     ("k" "Side ToDo"
      entry (file+datetree "~/org/agenda/sides.org")
      "* TODO %?\n:Deadline: \n"
      )
     )
   )
  :bind
  (:map evil-normal-state-map
        ("<SPC>ca" . org-agenda)
        ("<SPC>cc" . org-capture))
  :config
  (require 'ob-js)
  (org-babel-do-load-languages
   'org-babel-load-languages
   '((emacs-lisp . t)
     (python . t)
     (js . t)
     ))
  )

(use-package evil-org
  :hook (org-mode .  (lambda () (evil-org-mode)))
  :config
  (require 'evil-org-agenda)
  (evil-org-agenda-set-keys))

(use-package org-download)



;; (use-package org-roam
;;   :custom
  
;;   (org-roam-db-location (expand-file-name "org-roam.db" my/var-directory))
;;   (org-roam-directory "~/org/roam/")
;;   (org-roam-node-display-template
;;    (concat "${title:*} " (propertize "${tags:10}" 'face 'org-tag)))
;;   :config
;;   (org-roam-db-autosync-mode))


(use-package org-re-reveal
  :config
  (require 'org-re-reveal))


(use-package org-tree-slide
  :after org)

(use-package org-modern-indent
  :ensure (org-modern-indent
           :host github
           :repo "jdtsmith/org-modern-indent")
  :config
  (add-hook 'org-mode-hook  #'org-modern-indent-mode 90))

(use-package org-modern
  :after org
  :config (global-org-modern-mode))


(provide 'config-org)
