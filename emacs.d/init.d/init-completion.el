(require 'req-package)

;; Company
;; completion framework
(req-package company
  :config (global-company-mode))

;; Javascript completion
(req-package company-tern
  :require company
  :config (add-to-list 'company-backends 'company-tern))

(provide 'init-completion)
