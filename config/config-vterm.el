
(straight-use-package 'vterm)

(require 'vterm)
(add-hook 'vterm-mode-hook #'(lambda ()
                               (turn-on-solaire-mode)
                               (hide-mode-line-mode)))


(defun project-vterm (&optional arg)
  (interactive "P")
  (defvar vterm-buffer-name)
  (let* ((default-directory (project-root (project-current t)))
         (vterm-buffer-name (project-prefixed-buffer-name "vterm"))
         (vterm-buffer (get-buffer vterm-buffer-name)))
    (if (and vterm-buffer (not current-prefix-arg))
        (pop-to-buffer vterm-buffer (bound-and-true-p display-comint-buffer-action))
      (vterm t))))

(define-key 'project-cmds-prefix-key (kbd "v")  'project-vterm)


(provide 'config-vterm)
