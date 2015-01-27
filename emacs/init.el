(defmacro mk9/concat-extensions-directory (&rest args)
  `(concat (file-name-as-directory "~/code/emacs-extensions") ,@args))

(load "~/emacs/conf/cedet")
(load "~/emacs/conf/el-get")
(load "~/emacs/conf/common")
(load "~/emacs/conf/visual")

(load "~/emacs/conf/git")
(load "~/emacs/conf/indent-guide")
(load "~/emacs/conf/window-numbering")
(load "~/emacs/conf/javascript")
(load "~/emacs/conf/twittering-mode")
(load "~/emacs/conf/gnus")
(load "~/emacs/conf/autocomplete")
(load "~/emacs/conf/html")
(load "~/emacs/conf/text")
(load "~/emacs/conf/tramp")
(load "~/emacs/conf/elisp")

(load "~/emacs/conf/javascript-rirsrv")

(defun mk9/get-short-hostname ()
  (let ((idx (string-match "\\." system-name)))
    (if idx
	(substring system-name 0 idx)
      system-name)))

(let ((fname (concat "~/emacs/conf/local-" (mk9/get-short-hostname) ".el")))
  (when (file-exists-p fname)
    (load fname)))
