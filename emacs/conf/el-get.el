(add-to-list 'load-path (mk9/concat-extensions-directory "el-get"))

(require 'package)
(add-to-list 'package-archives
	     '("melpa-unstable" . "http://melpa.org/packages/") t)

(require 'el-get)
(require 'el-get-elpa)

(setq el-get-byte-compile nil)
(add-to-list 'el-get-recipe-path "~/emacs/conf/el-get-recipes")
(setq el-get-my-packages '(;magit
			   window-numbering smex js2-mode indent-guide
				 json-mode twittering-mode
				 jazz-theme ; mac-classic-theme
				 json-mode auto-complete php-mode scss-mode
				 paredit vala-mode ; tern
				 ; markdown-mode
				 go-mode
				 go-autocomplete
				 flycheck
				 yasnippet protobuf-mode gh go-test
				 rust-mode company-mode ; haskell-mode
				 web-mode emmet-mode sx elisp-slime-nav
				 ; nix-mode
				 jade-mode yaml-mode
				 ; tern ; swank-js slime
				 color-theme-leuven
				 ; auctex
				 projectile flx
				 leuven-theme
				 color-theme-sanityinc-tomorrow
				 edit-server
				 elm-mode
				 ensime
				 cider
				 ; go-errcheck
				 ; sr-speedbar
				 rjsx-mode
				 prettier-js
				 ocp-indent
				 tide
				 exec-path-from-shell
				 dockerfile-mode
					; sidebar
				 editorconfig
				 cucumber
				 ))

(el-get-bundle mac-classic-theme :checkout "3cd6d173a350458e927d935c6f08c1fc709bbdf8")
(el-get-bundle magit :checkout "v2.90.1")
(el-get 'sync el-get-my-packages)
