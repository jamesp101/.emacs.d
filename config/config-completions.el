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
          ("C-<backspace>" . vertico-suspend))
  (:map evil-normal-state-map 
        ("C-<backspace>" . vertico-suspend)))



(use-package marginalia
  :after vertico
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





(use-package nerd-icons-completion
  :after marginalia
  :config
  (nerd-icons-completion-mode)
  (add-hook 'marginalia-mode-hook #'nerd-icons-completion-marginalia-setup))


(use-package cape
  :init
  (add-to-list 'completion-at-point-functions #'cape-dabbrev)
  (add-to-list 'completion-at-point-functions #'cape-file)
  (add-to-list 'completion-at-point-functions #'cape-elisp-block))

(use-package tempel)




(provide 'config-completions)



