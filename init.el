;;; init.el -*- lexical binding: t; -*-


(setq straight-base-dir
      (expand-file-name ".cache/straight" user-emacs-directory))
(setq straight-build-dir
      (expand-file-name ".cache/straight-build" user-emacs-directory))



(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name ".cache/straight/straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 6))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/raxod502/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))




(straight-use-package 'use-package)

(setq straight-use-package-by-default t)


(add-to-list 'load-path
	     (expand-file-name "config/" user-emacs-directory))



(add-hook 'emacs-startup-hook
          (lambda ()
            (setq gc-cons-threshold 167777216
                  gc-cons-percentage 0.1))
          (setq file-name-handler-alist config/file-name-handler))


(add-hook 'minibuffer-setup-hook #'(lambda ()
                                     (setq gc-cons-threshold most-positive-fixnum)))

(add-hook 'minibuffer-setup-hook #'(lambda ()
                                     (setq gc-cons-threshold 167777216)))
          


(require 'config-defaults)
(require 'config-editing)
(require 'config-helpers)
(require 'config-completions)
(require 'config-ui)
(require 'config-ide)
(require 'config-lang)
(require 'config-project)
(require 'config-keybindings)
(require 'config-org)


(load-file (expand-file-name "config.el" user-emacs-directory))
