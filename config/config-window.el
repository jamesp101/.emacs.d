

(winner-mode 1)

(defcustom window-prefix-key "c" nil)

(define-prefix-command 'window-prefix-key)


(define-key 'window-prefix-key (kbd "u") 'winner-undo)
(define-key 'window-prefix-key (kbd "r") 'winner-redo)

(define-key 'window-prefix-key (kbd "j") 'windmove-down)
(define-key 'window-prefix-key (kbd "k") 'windmove-up)
(define-key 'window-prefix-key (kbd "h") 'windmove-left)
(define-key 'window-prefix-key (kbd "l") 'windmove-right)

(define-key 'window-prefix-key (kbd "J") 'windmove-swap-states-down)
(define-key 'window-prefix-key (kbd "K") 'windmove-swap-states-up)
(define-key 'window-prefix-key (kbd "H") 'windmove-swap-states-left)
(define-key 'window-prefix-key (kbd "L") 'windmove-swap-states-right)

(meow-leader-define-key
   '("w" . window-prefix-key))

(provide 'config-window)
