(require 'req-package)

;; Evil
(req-package evil
  :diminish undo-tree-mode
  :init
  ;; Substitute the vim C-u behavior for the emacs universal argument
  (setq evil-want-C-u-scroll t)
  :config (evil-mode 1))

;; evil-surround
;; change surroundings in pairs (quotes, parentheses, brackets, etc)
(req-package evil-surround
  :require evil
  :config (global-evil-surround-mode 1))

;; evil-commentary
;; toggle comments
;; Usage: gcc (line) or gc (on visual or object)
(req-package evil-commentary
  :require evil
  :diminish evil-commentary-mode
  :config (evil-commentary-mode))

(req-package evil-indent-textobject
  :require evil)

(req-package evil-org
  :require evil org
  :config (add-hook 'org-mode-hook 'evil-org-mode)
          (add-hook 'evil-org-mode-hook
                    (lambda ()
                      (evil-org-set-key-theme))))

(provide 'init-evil)
