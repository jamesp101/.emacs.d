;;;

(set-frame-font "VictorMono NFM:spacing=100:size=13" )
(set-face-font 'eldoc-box-body "VictorMono NFM:spacing=100:size=13")

(add-hook 'prog-mode-hook
          #'(lambda ()
              (setq display-line-numbers 'relative)))

(add-hook 'emacs-startup-hook
          #'(lambda () (treemacs-load-theme 'nerd-icons)))

(setq treemacs-position 'right)
(setq-default line-spacing 2)
(load-theme 'kaolin-dark t)

(when (eq system-type 'windows-nt)
  (setq find-program "C:\\msys64\\usr\\bin\\find.exe")
  ;; (setq find-program "fd")
  ;;Hide dos-eol
  (setq buffer-display-table (make-display-table))
  (aset buffer-display-table  ?\^M []))


(defun remove-dos-eol ()
  "Hides ^M"
  (interactive)
  (setq buffer-display-table (make-display-table))
  (aset buffer-display-table  ?\^M []))


(setq org-agenda-files '("C:/ORG/AGENDA"))
(setq org-excalidraw-directory "C:/ORG/EXCALIDRAW")
(setq-default truncate-lines t)

(global-unset-key (kbd "C-z"))

(global-set-key (kbd "C-+") 'text-scale-increase)
(global-set-key (kbd "C--") 'text-scale-decrease)
(global-set-key (kbd "C-=") 'text-scale-set)

;; (setq display-buffer-alist
;;       '(
;;         ("\\*inferior-fsharp\\*"
;;          (display-buffer-use-some-window)
;;          )
;;         ))
(provide 'config)
