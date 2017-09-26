(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-startup-folded nil)
(setq org-log-done t)
(setq org-directory "~/org") ;; rarely used by org
(setq org-agenda-files (file-expand-wildcards "~/org/*.org"))

(provide 'init-org)
