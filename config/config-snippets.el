(straight-use-package 'yasnippet)
(straight-use-package 'yasnippet-snippets)
(straight-use-package 'consult-yasnippet)


(require 'yasnippet)
(require 'yasnippet-snippets)
(require 'consult-yasnippet)


(defcustom snippet-prefix-key "y" nil)

(define-prefix-command 'snippet-prefix-key)

(define-key 'snippet-prefix-key (kbd "i") 'consult-yasnippet)
(define-key 'snippet-prefix-key (kbd "n") 'yas-new-snippet)

(meow-leader-define-key
   '("y" . window-prefix-key))

(provide 'config-snippets)
