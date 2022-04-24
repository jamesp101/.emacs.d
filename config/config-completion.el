(straight-use-package 'vertico)
(straight-use-package 'consult)
(straight-use-package 'orderless)
(straight-use-package 'marginalia)
(straight-use-package 'embark)
(straight-use-package 'embark-consult)




(defun minibuffer-backward-kill (arg)
  "When minibuffer is completing a file name delete up to parent
folder, otherwise delete a word"
  (interactive "p")
  (if minibuffer-completing-file-name
      ;; Borrowed from https://github.com/raxod502/selectrum/issues/498#issuecomment-803283608
      (if (string-match-p "/." (minibuffer-contents))
          (zap-up-to-char (- arg) ?/)
        (delete-minibuffer-contents))
    (backward-kill-word arg)))

;;;; Vertico

(require 'vertico)
(require 'vertico-directory "extensions/vertico-directory.el")

(with-eval-after-load 'meow
  (define-key vertico-map (kbd "C-j") 'vertico-next)
  (define-key vertico-map (kbd "C-k") 'vertico-previous)
  (define-key vertico-map (kbd "M-h") 'vertico-directory-up))

;; Cycle back to top/bottom result when the edge is reached
(customize-set-variable 'vertico-cycle t)

;; Start Vertico
(vertico-mode 1)

;;;; Marginalia

;; Configure Marginalia
(require 'marginalia)
(setq marginalia-annotators '(marginalia-annotators-heavy marginalia-annotators-light nil))
(marginalia-mode 1)

(straight-use-package 'all-the-icons-completion)
(add-hook 'marginalia-mode-hook #'all-the-icons-completion-marginalia-setup)

;; Set some consult bindings
(global-set-key (kbd "C-s") 'consult-line)
(global-set-key (kbd "C-x b") 'consult-buffer)
(define-key minibuffer-local-map (kbd "C-r") 'consult-history)

(setq completion-in-region-function #'consult-completion-in-region)

;;;; Orderless

;; Set up Orderless for better fuzzy matching
(require 'orderless)
(customize-set-variable 'completion-styles '(orderless))
(customize-set-variable 'completion-category-overrides '((file (styles . (partial-completion)))))
(setq completion-category-defaults nil)



(require 'embark)
(require 'embark-consult)
;; Use Embark to show bindings in a key prefix with `C-h`
(setq prefix-help-command #'embark-prefix-help-command)
(global-set-key (kbd "C-.") 'embark-act)
(global-set-key (kbd "C-;") 'embark-dwim)
(global-set-key (kbd "C-h b") 'embark-bindings)

(add-hook 'consult-preview-at-point-mode-hook #'embark-collect-mode)


(provide 'config-completion)
