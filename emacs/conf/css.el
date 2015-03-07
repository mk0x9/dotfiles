(defun mk9/css-hook ()
  (setq css-indent-offset 2)
  (auto-complete-mode t)
  (setq indent-tabs-mode nil))

(add-hook 'scss-mode-hook 'mk9/css-hook)
