;; This is the main init file.  It should get split up as it gets bigger.


;; add the directory in which are kept various elsips loaded below.
(add-to-list 'load-path "~/.emacs.d/elisp")

;; Org mode configuration
(load "my_org")

;; All ruby stuff
(load "rubies")

;;Git!
(load "gits")


;;Some basic config options


;A steady light, not blinking parens
(show-paren-mode t)
(setq show-paren-style 'expression)
(setq show-paren-delay 0)

;No splash screen at start-up
(setq inhibit-startup-screen t)

; Save space
(menu-bar-mode -1)
(tool-bar-mode -1)


;; When I configure more eshell stuff, it will get it's own file

; TODO:   em-last.el --- insert arguments from previous commands
;;(add-to-list 'eshell-modules-list "eshell-last")
