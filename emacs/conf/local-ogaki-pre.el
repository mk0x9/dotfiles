(setq mk9/font "Consolas-15")
(setq mk9/font-jp "Meiryo-13")
(setq mac-option-modifier 'meta)

(setenv "PATH"
	(concat "/Users/mk9/.nix-profile/bin:/Users/mk9/.nix-profile/sbin:" (getenv "PATH") ":/Users/mk9/code/go/bin:/Users/mk9/code/workspace-go/bin"))

(setq exec-path (nconc
		 (split-string (getenv "PATH") ":")
		 (cons (replace-regexp-in-string "/$" "" exec-directory) ())))

(setenv "MANPATH"
	(concat "/Users/mk9/.nix-profile/share/man" (getenv "PATH")))

(setenv "EMACS_SERVER_FILE" (expand-file-name "server/server" user-emacs-directory))
