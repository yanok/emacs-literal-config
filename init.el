(require 'cask "~/.cask/cask.el")
(cask-initialize)

(when (not (cl-remove-if-not 
	    (lambda (p) (or (equal 'org (car p))
                            (equal 'org-plus-contrib (car p))))
	    package-alist))
  (message "No org-mode package found; installing now...")
  (package-install 'org-plus-contrib))

(require 'org)
(when (string-match "^[1234567]" (org-version))
  (warn "Org-Mode is out of date. We expect org 8 or higher, but instead we have %s" (org-version)))

(require 'pallet)

(org-babel-load-file "~/.emacs.d/emacs.org")

