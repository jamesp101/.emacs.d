;;; 

;; (set-frame-font "Comic Mono 13")
(set-frame-font "VictorMono Nerd Font  11")
(add-hook 'prog-mode-hook
          #'(lambda ()
              (setq display-line-numbers 'relative)))

(treemacs-load-theme 'nerd-icons)
(setq treemacs-position 'right)
(setq-default line-spacing 4)
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


(global-set-key (kbd "C-+") 'text-scale-increase)
(global-set-key (kbd "C--") 'text-scale-decrease)
(global-set-key (kbd "C-=") 'text-scale-set)
(provide 'config)
