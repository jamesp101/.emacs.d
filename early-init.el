;;; early-init.el --- Early Init -*- no-byte-compile: t; lexical-binding: t; -*-


;;; variables
;; Used for no-littering
(defvar my/etc-directory
  (expand-file-name ".etc/" user-emacs-directory))
(defvar my/var-directory
  (expand-file-name ".var/" user-emacs-directory))

(defvar my/gc-cons-threshold (* 16 1024 1024))
(defvar my/mode-line-format mode-line-format)


;;; Delay GC
(setq gc-cons-threshold most-positive-fixnum)
(add-hook 'emacs-startup-hook
          (lambda ()
            (setq gc-cons-threshold my/gc-cons-threshold)))

;;; Avoid flashbang
(load-theme 'wombat)
;;; Performance
(setq load-prefer-newer t)
(setq read-process-output-max (* 512 1024))


;; Reduce rendering/line scan work
(setq-default cursor-in-non-selected-windows nil)
(setq highlight-nonselected-windows nil)

;; Disable package.el
(setq package-enable-at-startup nil
      package-quickstart nil)

;; Disable warnings from legacy advice API
(setq ad-redefinition-action 'accept)
(setq warning-suppress-types '((lexical-binding)))

(setq idle-update-delay 1.0)
(setq which-func-update-delay 1.0)

(unless (daemonp)
  (let ((old-value (default-toplevel-value 'file-name-handler-alist)))
    (set-default-toplevel-value
     'file-name-handler-alist
     ;; Determine the state of bundled libraries using calc-loaddefs.el.
     ;; If compressed, retain the gzip handler in `file-name-handler-alist`.
     ;; If compiled or neither, omit the gzip handler during startup for
     ;; improved startup and package load time.
     (if (eval-when-compile
           (locate-file-internal "calc-loaddefs.el" load-path))
         nil
       (list (rassq 'jka-compr-handler old-value))))
    ;; Ensure the new value persists through any current let-binding.
    (set-default-toplevel-value 'file-name-handler-alist
                                file-name-handler-alist)
    ;; Remember the old value to reset it as needed.
    (add-hook 'emacs-startup-hook
              (lambda ()
                (set-default-toplevel-value
                 'file-name-handler-alist
                 ;; Merge instead of overwrite to preserve any changes made
                 ;; since startup.
                 (delete-dups (append file-name-handler-alist old-value))))
              101))

  (unless noninteractive
    (progn
      ;; Disable mode-line-format during init
      (defun minimal-emacs--reset-inhibited-vars-h ()
        (setq-default inhibit-redisplay nil
                      ;; Inhibiting `message' only prevents redraws and
                      inhibit-message nil)
        (redraw-frame))

      (setq-default mode-line-format nil)

      (defun minimal-emacs--startup-load-user-init-file (fn &rest args)
        "Around advice for startup--load-user-init-file to reset mode-line-format."
        (let (init)
          (unwind-protect
              (progn
                (apply fn args)  ; Start up as normal
                (setq init t))
            (unless init
              ;; If we don't undo inhibit-{message, redisplay} and there's an
              ;; error, we'll see nothing but a blank Emacs frame.
              (minimal-emacs--reset-inhibited-vars-h))
            (unless (default-toplevel-value 'mode-line-format)
              (setq-default mode-line-format
                            my/mode-line-format)))))

      (advice-add 'startup--load-user-init-file :around
                  #'minimal-emacs--startup-load-user-init-file))

    ;; Without this, Emacs will try to resize itself to a specific column size
    (setq frame-inhibit-implied-resize t)

    ;; A second, case-insensitive pass over `auto-mode-alist' is time wasted.
    ;; No second pass of case-insensitive search over auto-mode-alist.
    (setq auto-mode-case-fold nil)

    ;; Reduce *Message* noise at startup. An empty scratch buffer (or the
    ;; dashboard) is more than enough, and faster to display.
    (setq inhibit-startup-screen t
          inhibit-startup-echo-area-message user-login-name)
    (setq initial-buffer-choice nil
          inhibit-startup-buffer-menu t
          inhibit-x-resources t)

    ;; Disable bidirectional text scanning for a modest performance boost.
    (setq-default bidi-display-reordering 'left-to-right
                  bidi-paragraph-direction 'left-to-right)

    ;; Give up some bidirectional functionality for slightly faster re-display.
    (setq bidi-inhibit-bpa t)

    ;; Remove "For information about GNU Emacs..." message at startup
    (advice-add #'display-startup-echo-area-message :override #'ignore)

    ;; Suppress the vanilla startup screen completely. We've disabled it with
    ;; `inhibit-startup-screen', but it would still initialize anyway.
    (advice-add #'display-startup-screen :override #'ignore)

    ;; Shave seconds off startup time by starting the scratch buffer in
    ;; `fundamental-mode'
    (setq initial-major-mode 'fundamental-mode
          initial-scratch-message nil)

    (unless (memq initial-window-system '(x pgtk))
      (setq command-line-x-option-alist nil))))



(when (featurep 'native-compile)
  (setq native-comp-async-report-warnings-errors nil)

  (setq native-comp-deferred-compilation t)
  (setq package-native-compile t)

  (when (fboundp 'startup-redirect-eln-cache)
    (startup-redirect-eln-cache
     (convert-standard-filename
      (expand-file-name my/etc-directory)))))





(setq inhibit-splash-screen t)
(setq inhibit-startup-message t)

(push '(menu-bar-lines . 0)   default-frame-alist)
(push '(tool-bar-lines . 0)   default-frame-alist)
(push '(vertical-scroll-bars) default-frame-alist)
(push '(horizontal-scroll-bars) default-frame-alist)

(setq tool-bar-mode nil
      scroll-bar-mode nil)


(setq tool-bar-mode nil
      scroll-bar-mode nil)

(when (bound-and-true-p tooltip-mode)
  (tooltip-mode -1))


(setq use-file-dialog nil)
(setq use-dialog-box nil)

(unless (memq window-system '(mac ns))
  (setq menu-bar-mode nil))


;; Allow for shorter responses: "y" for yes and "n" for no.
(if (boundp 'use-short-answers)
    (setq use-short-answers t)
  (advice-add #'yes-or-no-p :override #'y-or-n-p))
(defalias #'view-hello-file #'ignore)  ; Never show the hello file


(provide 'early-init)

;;; early-init.el ends here
