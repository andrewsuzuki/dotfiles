(require 'req-package)

;; Helm
(req-package helm
  :diminish helm-mode
  :config (require 'helm-config)
          (setq helm-M-x-fuzzy-match t)
          (setq helm-grep-ag-command "rg --color=always --colors 'match:fg:black' --colors 'match:bg:yellow' --smart-case --no-heading --line-number %s %s %s")
          (setq helm-grep-ag-pipe-cmd-switches '("--colors 'match:fg:black'" "--colors 'match:bg:yellow'"))

          (helm-mode 1)
  :bind (("C-c h" . helm-mini)
         ("C-h a" . helm-apropos)
         ("C-x C-b" . helm-buffers-list)
         ("C-x b" . helm-buffers-list)
         ("M-y" . helm-show-kill-ring)
         ("M-x" . helm-M-x)
         ("C-x C-f" . helm-find-files)
         ("C-c C-g" . helm-do-grep-ag)
         ("C-x c o" . helm-occur)
         ;; ("C-x c s" . helm-swoop)
         ;; ("C-x c y" . helm-yas-complete)
         ;; ("C-x c Y" . helm-yas-create-snippet-on-region)
         ("C-x c SPC" . helm-all-mark-rings)))

(req-package helm-descbinds
  :require helm
  :bind (("C-h b" . helm-descbinds)
         ("C-h w" . helm-descbinds)))

(provide 'init-helm)
