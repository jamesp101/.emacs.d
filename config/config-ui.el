;;; config-meow.el -*- lexical-binding: t; -*-



(straight-use-package 'doom-themes)
;; (straight-use-package 'simple-modeline)
(straight-use-package 'doom-modeline)
(straight-use-package 'hide-mode-line)
(straight-use-package 'helpful)
(straight-use-package 'solaire-mode) 
(straight-use-package 'rainbow-mode)
(straight-use-package 'rainbow-delimiters)
(straight-use-package 'all-the-icons)
(straight-use-package 'diminish)
(straight-use-package 'parrot)

;;; Theme
(require 'doom-themes)
(load-theme 'doom-monokai-pro t)

;;; Modeline 
;;(require 'simple-modeline)
;;(add-hook 'after-init-hook #'simple-modeline-mode)
(require 'doom-modeline)
(add-hook 'after-init-hook #'doom-modeline-mode)

(electric-pair-mode 1)  
(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)

;;; Parrot
(require 'parrot)
(setq parrot-num-rotations nil)
(add-hook 'meow-normal-mode-hook #'parrot-stop-animation)
(add-hook 'meow-insert-mode-hook #'parrot-start-animation)
(parrot-mode)

;; Visual Line
(setq line-mode-visual 80)
(global-visual-line-mode)

;; Font

(if (find-font (font-spec :name "Fira Code"))
    (lambda ()
      (set-face-attribute 'default nil
                          :font "Fira Code"
                          :weight 'medium
                          :height 110)
      (set-face-attribute 'fixed-pitch nil
                          :font "Fira Code"
                          :weight 'medium
                          :height 110)
      (set-face-attribute 'variable-pitch nil
                          :font "Fira Code"
                          :weight 'bold
                          :height 110)))





(require 'diminish)
(require 'all-the-icons)
(provide 'config-ui)
