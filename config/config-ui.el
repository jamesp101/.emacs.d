;;; config-meow.el -*- lexical-binding: t; -*-
(straight-use-package 'doom-themes)
(straight-use-package 'simple-modeline)
(straight-use-package 'hide-mode-line)
(straight-use-package 'helpful)
(straight-use-package 'solaire-mode) 
(straight-use-package 'rainbow-mode)
(straight-use-package 'rainbow-delimiters)
(straight-use-package 'all-the-icons)

;;; Theme
(require 'doom-themes)
(load-theme 'doom-monokai-pro)

;;; Modeline 
(require 'simple-modeline)
(add-hook 'after-init-hook 'simple-modeline-mode)

;:; Solaire Mode
(require 'solaire-mode)
(add-to-list 'solaire-mode-themes-to-face-swap 'doom-one-light)
(add-hook 'after-init-hook 'solaire-global-mode)

(require 'helpful)
(define-key helpful-mode-map [remap revert-buffer] #'helpful-update)
(global-set-key [remap describe-command] #'helpful-command)
(global-set-key [remap describe-function] #'helpful-callable)
(global-set-key [remap describe-key] #'helpful-key)
(global-set-key [remap describe-symbol] #'helpful-symbol)
(global-set-key [remap describe-variable] #'helpful-variable)
(global-set-key (kbd "C-h F") #'helpful-function)

;; Bind extra `describe-*' commands
(global-set-key (kbd "C-h K") #'describe-keymap)


(electric-pair-mode 1)w
(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)

(add-hook 'prog-mode-hook #'linum-mode)


(require 'all-the-icons)
(provide 'config-ui)
