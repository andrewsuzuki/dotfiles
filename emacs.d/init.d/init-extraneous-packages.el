(require 'req-package)

;; exec-path-from-shell
;; (use $PATH for emacs exec-path on macOS and linux)
(req-package exec-path-from-shell
  :init
  (when (memq window-system '(mac ns x))
    (exec-path-from-shell-initialize)))

;; echo-bell-mode
;; display red bar in minibuffer as bell
(req-package echo-bell
  :diminish echo-bell-mode
  :init (setq echo-bell-string "")
        (setq echo-bell-delay 0.1) ;; show bar for x seconds
        (setq echo-bell-background "#ff5555") ;; dracula-red
  :config (echo-bell-mode))

;; ace-window
;; Better window switching
;; controlled through general (, w)
(req-package ace-window)

;; elscreen
;; Browser-like tabs
(req-package elscreen
  :config (elscreen-start))

;; Editorconfig
(req-package editorconfig
  :diminish editorconfig-mode
  :config (editorconfig-mode 1))

;; git-gutter-fringe
;; (gui-only)
(req-package git-gutter-fringe
  :config
  (global-git-gutter-mode +1))

;; Relative line numbers
(req-package linum-relative
  :config
  ;; Enable linum (emacs built-in)
  (global-linum-mode 1)
  ;; Make them relative
  (linum-relative-on))

;; avy
;; (jump using character)
(req-package avy)

;; Nyan
(req-package nyan-mode
  :init (setq nyan-bar-length 20)
        (nyan-mode))

;; free-keys
;; show free bindings in current buffer
(req-package free-keys)

(provide 'init-extraneous-packages)
