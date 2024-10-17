;;;

(set-frame-font "Comic Mono:spacing=110:size=13" )
(set-face-font 'eldoc-box-body "VictorMono NFM:spacing=100:size=13")

(add-hook 'prog-mode-hook
          #'(lambda ()
              (setq display-line-numbers 'relative)))

;; (add-hook 'emacs-startup-hook
;;           #'(lambda () (treemacs-load-theme 'nerd-icons)))

(setq treemacs-position 'right)

(setq-default line-spacing 2)
(load-theme 'kaolin-dark t)

(when (eq system-type 'windows-nt)
  (setq find-program "C:\\msys64\\usr\\bin\\find.exe")
  ;; (setq find-program "fd")
  ;;Hide dos-eol
  (setq buffer-display-table (make-display-table))
  (aset buffer-display-table  ?\^M []))


(defun my/evil-delete (orig &rest args)
  "Add pulsar to delete"
  (apply orig args)
  (pulsar-pulse-line-red))

(defun my/evil-yank (orig &rest args)
  "Add pulsar to delete"
  (apply orig args)
  (pulsar-pulse-line-yellow))

(advice-add 'evil-yank :around #'my/evil-yank)


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

(add-to-list 'display-buffer-alist
      '(("\\*inferior.*\\*"
         (display-buffer-in-atom-window)
         (side . right)
         (slot . 0)
         (window-width . 40))
        ("\\*Treemacs\\*"
         (display-buffer-reuse-window
          display-buffer-in-side-window)
            (side . right)
            (slot . -1)
            (window-width . 10))

        ("\\*helpful.*\\*"
            (display-buffer-reuse-window)
            (side . right)
            (slot . 2)
            (window-width . 80))
        ("\\*Ilist\\*"
            (display-buffer-reuse-window)
            (side . left)
            (slot . 0)
            (window-width . 40))))

(reapply-csharp-ts-mode-font-lock-settings)
(provide 'config)
