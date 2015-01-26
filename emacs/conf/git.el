(require 'magit)
(require 'magit-svn)

(defun mk9/magit-hook ()
  (if (magit-svn-get-ref-info)
      (magit-svn-mode)))

(add-hook 'magit-mode-hook 'mk9/magit-hook)
