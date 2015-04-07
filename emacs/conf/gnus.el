(setq user-mail-address "me@mk9.name")
(setq user-full-name "Michael Kuryshev")
(setq gnus-select-method '(nnimap "localhost"
				  (nnimap-stream network)))

(setq message-send-mail-function 'message-send-mail-with-sendmail)
(setq sendmail-program "msmtp")

(defun mk9/my-citation-line ()
  (when message-reply-headers
    (insert
     (or (car (gnus-extract-address-components
	       (mail-header-from message-reply-headers)))
	 "Somebody")
     " writes:\n")))

(setq message-citation-line-function 'mk9/my-citation-line)
