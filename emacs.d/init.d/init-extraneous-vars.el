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

(provide 'init-extraneous-vars)
