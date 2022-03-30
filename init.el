;;; init.el -*- lexical-binding: t; -*-

(add-to-list 'load-path
	     (expand-file-name "config/" user-emacs-directory))

(set-default-coding-systems 'utf-8)
(customize-set-variable 'visible-bell 1)
(customize-set-variable 'large-file-warning-threhsold 100000000)





;; Initialize straight.el
(defvar bootstrap-version)
(let ((bootstrap-file
      (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 5))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
        "https://raw.githubusercontent.com/raxod502/straight.el/develop/install.el"
        'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))



;; Custom file
(customize-set-variable 'custom-file
			(expand-file-name "custom.el" user-emacs-directory))


(setq gc-cons-threshold ( * 1000 1000))

(require 'config-defaults)
(require 'config-ui)

(require 'config-meow)
(require 'config-project)
(require 'config-completion)

(require 'config-programming)
(require 'config-workspace)
(require 'config-vterm)


(require 'config-snippets)
