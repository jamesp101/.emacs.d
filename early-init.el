;;; early-init.el -*- lexical binding: t; -*-


(setq gc-cons-threshold most-positive-fixnum
      gc-cons-percentage 0.6)

(customize-set-variable 'load-prefer-newer noninteractive)

;; Disable package.el
(setq package-enable-at-startup nil
      package--init-file-ensured t)

(defvar config/file-name-handler file-name-handler-alist)
(setq file-name-handler-alist nil)


(setq my/cache-directory
      (expand-file-name ".cache/" user-emacs-directory))

(setq my/var-directory
      (expand-file-name ".vars/" user-emacs-directory))



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

(load-theme 'wombat)
