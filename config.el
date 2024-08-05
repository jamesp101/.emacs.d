;;;

;; (set-frame-font "Comic Mono 13")
(set-frame-font "VictorMono NFM:spacing=100:size=13" )
(set-face-font 'eldoc-box-body "VictorMono NFM:spacing=100:size=13")
;; (set-fontset-font )
(add-hook 'prog-mode-hook
          #'(lambda ()
              (setq display-line-numbers 'relative)))

(treemacs-load-theme 'nerd-icons)
(setq treemacs-position 'right)
(setq-default line-spacing 2)
(consult-theme 'kaolin-dark)

(defun calendar-insert-date ()
  "Capture the date at point, exit the Calendar, insert the date."
  (interactive)
  (seq-let (month day year) (save-match-data (calendar-cursor-to-date))
    (calendar-exit)
    (insert (format "%d-%02d-%02d" year month day))))

(define-key calendar-mode-map (kbd "C-<return>") 'calendar-insert-date)

(setq lsp-ui-sideline-show-diagnositcs nil)
(setq lsp-ui-sideline-enable nil)

(when (eq system-type 'windows-nt)
  (setq find-program "C:\\msys64\\usr\\bin\\find.exe")
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

(global-unset-key (kbd "C-z"))

(global-set-key (kbd "C-+") 'text-scale-increase)
(global-set-key (kbd "C--") 'text-scale-decrease)
(global-set-key (kbd "C-=") 'text-scale-set)
(provide 'config)
