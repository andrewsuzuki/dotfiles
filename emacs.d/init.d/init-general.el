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
    ;; d
    "e b" 'eval-buffer
    "f" 'helm-find-files
    ;; g h i j k l
    "m" 'helm-mini
    ;; n o
    "p" 'helm-projectile-find-file
    ;; q
    "r" 'helm-do-grep-ag
    "s" 'close-window
    "t n" 'elscreen-create
    "t w" 'elscreen-kill
    "u" 'universal-argument
    ;; v
    "w" 'ace-window
    "x" 'helm-M-x
    ;; y z
    "`" (elscreen-make-goto-lambda 0)
    "1" (elscreen-make-goto-lambda 1)
    "2" (elscreen-make-goto-lambda 2)
    "3" (elscreen-make-goto-lambda 3)
    "4" (elscreen-make-goto-lambda 4)
    "5" (elscreen-make-goto-lambda 5)
    "6" (elscreen-make-goto-lambda 6)
    "7" (elscreen-make-goto-lambda 7)
    "8" (elscreen-make-goto-lambda 8)))

(provide 'init-general)
