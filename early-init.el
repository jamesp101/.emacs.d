;;; early-init.el -*- lexical binding: t; -*-


(setq gc-cons-threshold most-positive-fixnum
      gc-cons-percentage 0.6)

(customize-set-variable 'load-prefer-newer noninteractive)

;; Disable package.el
(setq package-enable-at-startup nil
      package--init-file-ensured t)

(defvar config/file-name-handler file-name-handler-alist)
(setq file-name-handler-alist nil)







;; Native compilation settings
(when (featurep 'native-compile)

  ;; Silence compilation warnings
  (setq native-comp-async-report-warnings-errors nil)

  ;; Native compilation asynchronous
  (setq native-comp-deferred-compilation t)

    (when (fboundp 'startup-redirect-eln-cache)
    (if (version< emacs-version "29")
        (add-to-list 'native-comp-eln-load-path (convert-standard-filename (expand-file-name ".cache/eln-cache/" user-emacs-directory)))
      (startup-redirect-eln-cache (convert-standard-filename (expand-file-name ".cache/eln-cache/" user-emacs-directory)))))

  (add-to-list 'native-comp-eln-load-path (expand-file-name ".cache/eln-cache/" user-emacs-directory)))




(setq inhibit-startup-message t)
(push '(tool-bar-lines . 0) default-frame-alist)
(push '(menu-bar-lines . 0) default-frame-alist)
(push '(vertical-scrool-bars) default-frame-alist)
(push '(mouse-color . "white") default-frame-alist)
(scroll-bar-mode 0)


