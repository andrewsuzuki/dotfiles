(require 'req-package)

;; Symon
;; display system monitor in minibuffer during idle
(req-package symon
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
  :config (symon-mode))

(provide 'init-symon)
