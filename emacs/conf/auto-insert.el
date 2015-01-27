(auto-insert-mode)
(setq auto-insert-directory "~/emacs/conf/auto-insert/")
(setq auto-insert-query nil)
(setq auto-insert-alist '(("^.*/rirsrv/.*\\.js$" . ["insert-work.js" mk9/auto-insert-javascript-file])))

(defun mk9/auto-insert-javascript-file ()
  (interactive)
  (if (search-forward "/*CURSORHERE*/" nil t)
      (save-restriction
	(narrow-to-region (match-beginning 0) (match-end 0))
	(delete-region (point-min) (point-max)))))
