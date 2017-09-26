(require 'req-package)

;; Most key binds are scattered throughout these init files.
;; Some extraneous binds are made here.

;; With evil, most binds under the meta key are fine for rebinding.
;; Exceptions are:
;; M-x, M-o (facemap prefix), M-s (isearch prefix), M-w (kill ring save)

(bind-keys
  ;; Scroll in medium increments
  ("C-," . (lambda ()
            (interactive)
            (evil-scroll-line-down 5)))
  ("C-;" . (lambda ()
            (interactive)
            (evil-scroll-line-up 5))))

(provide 'init-binds)
