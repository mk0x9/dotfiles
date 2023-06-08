(require 'tramp)
(setq tramp-auto-save-directory "~/.emacs.d/tramp-autosave")

(push
 (cons
  "kubectl"
  '((tramp-login-program "kubectl")
    (tramp-login-args (("exec" "-it") ("-u" "%u") ("%h") ("--") ("sh")))
    (tramp-remote-shell "/bin/sh")
    (tramp-remote-shell-args ("-i" "-c"))))
 tramp-methods)
