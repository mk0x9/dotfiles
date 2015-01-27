(defun mk9/js2-rirsrv-hook ()
  (let ((fname buffer-file-name)
	(regexp "^.*/rirsrv/.*\\.js$"))
    (when (string-match-p regexp fname)
      (setq js2-additional-externs '("define" "setTimeout" "clearTimeout" "btoa")))))

(add-hook 'js2-init-hook 'mk9/js2-rirsrv-hook)
