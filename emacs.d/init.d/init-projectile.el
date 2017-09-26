(require 'req-package)

;; Projectile
(req-package projectile
  :diminish projectile-mode
  :config (projectile-mode))

;; Integration with helm
(req-package helm-projectile
  :require helm projectile
  :config (helm-projectile-on))

(provide 'init-projectile)
