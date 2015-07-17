(require 'magit)
;(require 'magit-svn)

(setq magit-last-seen-setup-instructions "1.4.0")

;; (defun mk9/magit-hook ()
;;   (if (magit-svn-get-ref-info)
;;       (magit-svn-mode)))

;(add-hook 'magit-mode-hook 'mk9/magit-hook)

(global-set-key [f9] 'magit-status)
