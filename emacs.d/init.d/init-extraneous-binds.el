(require 'req-package)

;; Most key binds are scattered throughout these init files.
;; Some extraneous binds are made here.

(bind-keys
  ;; Scroll in medium increments
  ("C-," . (lambda ()
            (interactive)
            (evil-scroll-line-down 5)))
  ("C-;" . (lambda ()
            (interactive)
            (evil-scroll-line-up 5))))

(provide 'init-binds)