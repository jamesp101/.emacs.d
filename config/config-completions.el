;;; config-completions.el -*- lexical-binding: t; -*-


(use-package vertico
  :custom
  (enable-recursive-minibuffers t)
  (vertico-cycle t)
  :init
  (vertico-mode)
  :bind 
  (:map vertico-map
	      ("C-j" . vertico-next)
	      ("C-k" . vertico-previous)
	      ("C-u" . vertico-directory-up)
          ("ESC" . vertico-exit)
          ("C-<escape>" . vertico-suspend))
  (:map evil-normal-state-map 
        ("C-<escape>" . vertico-suspend)))


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
  :custom
  (company-minimum-prefix-length 0)
  (company-tooltip-align-annotations t)
  (company-idle-delay 0.1)
  (company-tooltip-maximum-width 100)
  (company-tooltip-minimum-width 100)
  :config
  (global-company-mode)
  :bind
  ("C-M-i" . company-complete))


(use-package company-box
  :hook (company-mode . company-box-mode))



(provide 'config-completions)



