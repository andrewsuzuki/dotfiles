(setq custom-file "~/.emacs.d/custom.el")
(load custom-file)

;; Install use-package if necessary
(require 'package)
(setq package-enable-at-startup nil)
(setq package-archives (append package-archives
  '(("melpa" . "http://melpa.org/packages/")
  ("marmalade" . "http://marmalade-repo.org/packages/")
  ("gnu" . "http://elpa.gnu.org/packages/"))))
(package-initialize)

;; Bootstrap use-package
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

;; Enable use-package
(eval-when-compile
  (require 'use-package))
(require 'diminish)
(require 'bind-key)

;; Configure use-package
(setq use-package-always-ensure t)

;; Increase memory threshold for gc
(setq gc-cons-threshold 20000000)

;; Inhibit start screen; use *scratch* without message
(setq inhibit-startup-screen t)
(setq initial-scratch-message nil)

;; Font
(set-face-attribute 'default nil :family "Hack" :height 150)

;; Disable menu-bar
(menu-bar-mode -1)

;; Disable cursor blink
(blink-cursor-mode -1)

;; Disable scrollbars
(if (boundp 'scroll-bar-mode)
  (scroll-bar-mode -1))

;; Use ESC for keyboard-escape-quit (equivalent to C-g)
(global-set-key [escape] 'keyboard-escape-quit)

;; Require final newline
(setq require-final-newline t)

;; Sentences are followed by a single space+
(setq sentence-end-double-space nil)

;; Never convert spaces to tabs
(setq indent-tabs-mode nil)

;; Move cursor to help windows
;; side-effect: pressing ESC seems to close original buffer?
;; (setq help-window-select t)

;; Configure backups
(setq backup-directory-alist '(("." . "~/.emacs.d/backups")))
(setq delete-old-versions -1)
(setq version-control t)
(setq vc-make-backup-files t)
(setq auto-save-file-name-transforms '((".*" "~/.emacs.d/auto-save-list/" t)))

;; Org-mode config
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-startup-folded nil)
(setq org-log-done t)
(setq org-directory "~/org") ;; rarely used by org
(setq org-agenda-files
  (file-expand-wildcards "~/org/*.org"))

;; exec-path-from-shell
;; (use $PATH for emacs exec-path on macOS and linux)
(use-package exec-path-from-shell
  :init
  (when (memq window-system '(mac ns x))
    (exec-path-from-shell-initialize)))

(use-package echo-bell
  :diminish echo-bell-mode
  :init
  (setq echo-bell-string "")
  (setq echo-bell-delay 0.1) ;; show bar for x seconds
  (setq echo-bell-background "#ff5555") ;; dracula-red
  :config
  (echo-bell-mode))

;; Macro that generates lambda to go to screen #
;; Used below in general.el
(defmacro elscreen-make-goto-lambda (screen)
  `(lambda ()
    (interactive)
    (elscreen-goto ,screen)))

;; general
;; Provides leader key(s) similar to evil-leader,
;; but more powerful and extensible
;; Also provides use-package keyword :general
(use-package general
  :config
  (setq general-default-prefix ",")
  (setq general-default-states '(normal))
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

;; ace-window
;; Better window switching
;; controlled through general (, w)
(use-package ace-window)

;; Editorconfig
(use-package editorconfig
  :diminish editorconfig-mode
  :config
  (editorconfig-mode 1))

;; Magit
(use-package magit)

;; git-gutter
(use-package git-gutter
  :config
  (global-git-gutter-mode +1))

;; Enable evil mode
(use-package evil
  :diminish undo-tree-mode
  :init
  ;; Substitute the vim C-u behavior for the emacs universal argument
  (setq evil-want-C-u-scroll t)
  :config
  (progn
    ;; enable
    (evil-mode 1)))

;; elscreen
;; Browser-like tabs
(use-package elscreen
  :config
  (elscreen-start))

(use-package evil-surround
  :after evil
  :config
  ;; enable
  (global-evil-surround-mode 1))

(use-package evil-commentary
  :after evil
  :diminish evil-commentary-mode
  :config
  (evil-commentary-mode))

(use-package evil-indent-textobject
  :after evil)

(use-package evil-org
  ;; :after org
  :config
  (add-hook 'org-mode-hook 'evil-org-mode)
  (add-hook 'evil-org-mode-hook
            (lambda ()
              (evil-org-set-key-theme))))
  
;; Projectile
(use-package projectile
  :diminish projectile-mode
  :config
  (projectile-mode))

(use-package helm-projectile
  :config
  (helm-projectile-on))

;; Relative line numbers
(use-package linum-relative
  :config
  (progn
    ;; enable linum (emacs built-in)
    (global-linum-mode 1)
    ;; make them relative
    (linum-relative-on)))

;; avy
;; (jump using character)
(use-package avy)

;; Theme
(use-package dracula-theme
  :config
  (load-theme 'dracula t))

;; Nyan
(use-package nyan-mode
  :init
  ;; enable
  (setq nyan-bar-length 20)
  (nyan-mode))

;; sx (Stack Exchange)
(use-package sx
  :config
  (bind-keys
   :prefix "C-c s"
   :prefix-map my-sx-map
   :prefix-docstring "Global keymap for SX."
   ("q" . sx-tab-all-questions)
   ("o" . sx-open-link)))

;; free-keys
;; show free bindings in current buffer
(use-package free-keys)

;; Scroll in medium increments
(bind-keys
 ("C-," . (lambda ()
            (interactive)
            (evil-scroll-line-down 5)))
 ("C-;" . (lambda ()
            (interactive)
            (evil-scroll-line-up 5))))

;; helm
(use-package helm
  :diminish helm-mode
  :init
  (progn
    (require 'helm-config)

    (setq helm-M-x-fuzzy-match t)
    (setq helm-grep-ag-command "rg --color=always --colors 'match:fg:black' --colors 'match:bg:yellow' --smart-case --no-heading --line-number %s %s %s")
    (setq helm-grep-ag-pipe-cmd-switches '("--colors 'match:fg:black'" "--colors 'match:bg:yellow'"))

    (helm-mode 1))
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

(use-package helm-descbinds
  :defer t
  :after helm
  :bind (("C-h b" . helm-descbinds)
         ("C-h w" . helm-descbinds)))

;; symon
;; display system monitor in minibuffer during idle
(use-package symon
  :init
  (setq symon-sparkline-type 'gridded)
  (setq symon-monitors
    (cond ((memq system-type '(gnu/linux cygwin))
           '(;;symon-linux-memory-monitor
             symon-linux-battery-monitor
             symon-linux-cpu-monitor
             symon-linux-network-rx-monitor
             symon-linux-network-tx-monitor))
          ((memq system-type '(darwin))
           '(;;symon-darwin-memory-monitor
             symon-darwin-battery-monitor
             symon-darwin-cpu-monitor
             symon-darwin-network-rx-monitor
             symon-darwin-network-tx-monitor))))
  :config
  (symon-mode))
