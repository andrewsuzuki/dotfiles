(require 'diminish)

;; Increase memory threshold for gc
(setq gc-cons-threshold 20000000)

;; Inhibit start screen; use *scratch* without message
(setq inhibit-startup-screen t)
(setq initial-scratch-message nil)

;; Use ESC for keyboard-escape-quit (equivalent to C-g)
(global-set-key [escape] 'keyboard-escape-quit)

;; Require final newline
(setq require-final-newline t)

;; Sentences are followed by a single space+
(setq sentence-end-double-space nil)

;; Never convert spaces to tabs
(setq indent-tabs-mode nil)

;; Diminish auto-revert-mode
;; Not really a var, but...
(eval-after-load "autorevert" '(diminish 'auto-revert-mode))
(eval-after-load "autorevert" '(diminish 'global-auto-revert-mode))

(provide 'init-extraneous-vars)
