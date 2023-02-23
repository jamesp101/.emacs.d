;;; config-completions.el -*- lexical-binding: t; -*-


(use-package vertico
  :custom
  (vertico-cycle t)

  :hook
  (after-init . vertico-mode)

  :bind (:map vertico-map
	      ("C-j" . vertico-next)
	      ("C-k" . vertico-previous)
	      ("C-u" . vertico-directory-up)
        ("ESC" . vertico-exit)))


(use-package marginalia
  :custom
  (marginalia-annotattors
   '(marginalia-annotators-heavy marginalia-annotators-light nil))


  :config
  (marginalia-mode))



(use-package orderless
  :config
  (setq completion-styles '(orderless basic))
  (setq completion-category-overrides '((file (styles . (partial-completion)))))
  (setq completion-category-defaults nil))


(use-package all-the-icons-completion
  :config
  (all-the-icons-completion-marginalia-setup)
  (all-the-icons-completion-mode t))


(use-package company
  :init
  (setq company-minimum-prefix-length 1)
  (setq company-idle-delay 0)
  (setq company-icon-size 25)
  (setq company-tooltip-minimum-width 64)
  (setq company-tooltip-maximum-width 64)
  :config
  (global-company-mode))
  
(use-package company-tabnine
  :after company)

(use-package company-posframe
  :after company
  :hook (company-mode . company-posframe-mode))

(provide 'config-completions)
