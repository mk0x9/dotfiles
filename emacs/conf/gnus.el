(setq user-mail-address "tensai@cirno.in")
(setq user-full-name "Michael Kuryshev")
(setq gnus-select-method '(nnimap "localhost"
				  (nnimap-stream network)))

;(defun mk9/gnus-hook ()
;  (menu-bar-mode 1))

;(add-hook 'gnus-startup-hook 'mk9/gnus-hook)

(setq message-send-mail-function 'message-send-mail-with-sendmail)
(setq sendmail-program "msmtp")
