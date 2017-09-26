;; (package-initialize)

(require 'package)

;; Bootstrap utils

(defconst my-custom-file "~/.emacs.d/custom.el")

(setq custom-file my-custom-file)
(setq package-enable-at-startup nil)
(load my-custom-file t)
(setq auto-save-default nil)
(setq make-backup-files nil)
(put 'erase-buffer 'disabled nil)

;; Turn off startup screen

(setq inhibit-splash-screen t)
(setq inhibit-startup-message t)

;; Load extensions

(add-hook 'after-init-hook (lambda () (load "~/.emacs.d/init-real.el")))
