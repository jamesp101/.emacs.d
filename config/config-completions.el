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

(use-package corfu
  :custom
  (corfu-cycle t)
  (corfu-auto t)
  (corfu-quit-no-match 'separator)
  (corfu-auto-delay 0)
  (corfu-auto-prefix 1)

  :init
  (setq tab-always-indent 'complete)
  (setq text-mode-ispell-word-cocmpletion nil)
  (setq read-extended-command-prediccate #'command-completion-default-include-p)
  :config
  :hook
  (prog-mode . corfu-mode)
  (corfu-mode . corfu-popupinfo-mode))

(use-package nerd-icons-corfu
  :after corfu
  :config
  (add-to-list 'corfu-margin-formatters #'nerd-icons-corfu-formatter))

(use-package all-the-icons-completion
  :config
  (all-the-icons-completion-marginalia-setup)
  (all-the-icons-completion-mode t))

(use-package cape
  :init
  (add-to-list 'completion-at-point-functions #'cape-dabbrev)
  (add-to-list 'completion-at-point-functions #'cape-file)
  (add-to-list 'completion-at-point-functions #'cape-elisp-block)
  (advice-add 'eglot-completion-at-point :around #'cape-wrap-buster))

(use-package tempel)

(use-package eglot-tempel
  :after eglot
  :hook (eglot . eglot-tempel-mode))



(provide 'config-completions)



