(defun mk9/css-hook ()
  (setq css-indent-offset 2)
  (auto-complete-mode t)
  (setq indent-tabs-mode nil))

(setq sws-tab-width 4)

(add-hook 'scss-mode-hook 'mk9/css-hook)
