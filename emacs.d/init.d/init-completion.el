(require 'req-package)

;; Company
;; completion framework
(req-package company
  :config (global-company-mode))

;; Show documentation for completion options
(req-package company-quickhelp
  :require company
  :config (company-quickhelp-mode 1))

;; Javascript completion
(req-package company-tern
  :require company
  :config (add-to-list 'company-backends 'company-tern))

(provide 'init-completion)
