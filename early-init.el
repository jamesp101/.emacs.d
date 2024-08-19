;;; early-init.el -*- lexical binding: t; -*-



(setq gc-cons-threshold most-positive-fixnum
      gc-cons-percentage 0.6)

(customize-set-variable 'load-prefer-newer noninteractive)


;; Disable package.el
(setq package-enable-at-startup nil
      package--init-file-ensured t
      package-quickstart nil)

(defvar config/file-name-handler file-name-handler-alist)
(setq file-name-handler-alist nil)


(setq my/cache-directory
      (expand-file-name ".cache/" user-emacs-directory))

(setq my/var-directory
      (expand-file-name ".vars/" user-emacs-directory))





(setq load-prefer-newer t)

(setq-default cursor-in-non-selected-windows nil)
(setq highlight-nonselected-windows nil)

(setq ad-redefinition-action 'accpet)


(setq idle-update-delay 1.0)
(setq inhibit-compacting-font-caches t)
(setq-default bidi-display-reordering 'left-to-right)
(setq-default bidi-paragraph-start-direction 'left-to-right)
(setq bidi-inhabit-bpa t)

(advice-add #'display-startup-echo-area-message :override #'ignore)
(advice-add #'display-startup-startup-screen :override #'ignore)

(setq frame-inhibit-implied-resize t)
(setq nxml-cached-auto-mode-alist nil)



;; Native compilation settings
(when (featurep 'native-compile)

  ;; Silence compilation warnings
  (setq native-comp-async-report-warnings-errors nil)

  ;; Native compilation asynchronous
  (setq native-comp-deferred-compilation t)

    (when (fboundp 'startup-redirect-eln-cache)
    (if (version< emacs-version "29")
        (add-to-list 'native-comp-eln-load-path
                     (convert-standard-filename (expand-file-name "eln-cache/" my/cache-directory)))

      (startup-redirect-eln-cache
       (convert-standard-filename (expand-file-name "eln-cache/" my/cache-directory)))))

    (add-to-list 'native-comp-eln-load-path
                 (expand-file-name "eln/" my/cache-directory)))

(setq auto-save-list-file-prefix (expand-file-name ".cache/auto-save/.auto-save-" user-emacs-directory))

(setenv "LSP_USE_PLISTS" "true")

(setq inhibit-startup-message t)

(push '(tool-bar-lines . 0) default-frame-alist)
(push '(vertical-scrool-bars) default-frame-alist)
(push '(mouse-color . "white") default-frame-alist)
(scroll-bar-mode 0)
(menu-bar-mode 0)

(setq use-file-dialog nil)
(setq use-dialog-box nil)

(load-theme 'wombat)

(add-hook 'emacs-startup-hook
          (lambda ()
            (setq gc-cons-threshold (* 16 1024 1024))))
          ;;   (setq gc-cons-threshold (* 100 1024 1024)
          ;;         gc-cons-percentage 0.1))
          ;; (setq file-name-handler-alist config/file-name-handler)
          ;; (setq read-process-output-max (* 1024 1024)))
(provide 'early-init)
