(require 'company-go)

(defun mk9/go-hook ()
  (add-hook 'before-save-hook 'gofmt-before-save)
  (flycheck-mode 1)
  (set (make-local-variable 'company-backends) '(company-go))
  (setq company-tooltip-limit 20)
  (setq company-idle-delay .3)
  (setq company-echo-delay 0)
  (setq company-begin-commands '(self-insert-command))
  (company-mode 1))

(add-hook 'go-mode-hook 'mk9/go-hook)
