;;; config-org -*- lexical-binding: t; -*-

(use-package org)


(use-package org-bullets
  :custom
  (org-bullets-bullet-list '("" "" "" "" ))
  :config
  :hook
  (org-mode . org-bullets-mode))


(use-package org-tree-slide
  :after org)

(provide 'config-org)
