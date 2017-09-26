(require 'req-package)

;; Macro creates lambda that goes to a screen number with elscreen
;; (used below)
(defmacro elscreen-make-goto-lambda (screen)
  `(lambda ()
    (interactive)
    (elscreen-goto ,screen)))

;; general
;; Provides leader key(s) similar to evil-leader,
;; but more powerful and extensible
(req-package general
  :init (setq general-default-prefix ",")
        (setq general-default-states '(normal))
  :config
  (general-define-key
    "a" 'avy-goto-char-2
    "b" 'helm-buffers-list
    "c" 'evil-commentary-line
    "e b" 'eval-buffer
    "f" 'helm-find-files
    "g" (lambda ()
         (interactive)
         (evil-scroll-up 5))
    "h" (lambda ()
         (interactive)
         (evil-scroll-down 5))
    "m" 'helm-mini
    "r" 'helm-do-grep-ag
    "s" 'close-window
    "t n" 'elscreen-create
    "t w" 'elscreen-kill
    "`" (elscreen-make-goto-lambda 0)
    "1" (elscreen-make-goto-lambda 1)
    "2" (elscreen-make-goto-lambda 2)
    "3" (elscreen-make-goto-lambda 3)
    "4" (elscreen-make-goto-lambda 4)
    "5" (elscreen-make-goto-lambda 5)
    "6" (elscreen-make-goto-lambda 6)
    "7" (elscreen-make-goto-lambda 7)
    "8" (elscreen-make-goto-lambda 8)
    "u" 'universal-argument
    "w" 'ace-window
    "x" 'helm-M-x))

(provide 'init-general)
