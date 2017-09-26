(require 'req-package)

;; Inhibit start screen; use *scratch* without message
(setq inhibit-startup-screen t)
(setq initial-scratch-message nil)

;; Font
(set-face-attribute 'default nil :family "Hack" :height 150)

;; Theme
(req-package dracula-theme
  :config (load-theme 'dracula t))

;; Disable menu-bar
(menu-bar-mode -1)

;; Disable cursor blink
(blink-cursor-mode -1)

;; Disable scrollbars
(if (boundp 'scroll-bar-mode)
  (scroll-bar-mode -1))

(provide 'init-look-and-feel)
