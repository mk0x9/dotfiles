(require 'auto-complete-config)
(ac-config-default)
(setq-default ac-auto-start nil)
(define-key ac-mode-map [(meta return)] 'auto-complete)
