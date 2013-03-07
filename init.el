;; This is the main init file.  It should get split up as it gets bigger.


;; add the directory in which are kept various elsips loaded below.
(add-to-list 'load-path "~/.emacs.d/elisp")

;; ido-mode iX TeH BomB
(require 'ido)
(ido-mode t)

;; Org mode configuration
(load "my_org")

;; All ruby stuff
(load "rubies")

;;Git!
(load "gits")

;;Eshell!
(load "eshell")


;;Some basic config options


;A steady light, not blinking parens
(show-paren-mode t)
(setq show-paren-style 'expression)
(setq show-paren-delay 0)

;No splash screen at start-up
(setq inhibit-startup-screen t)

;Leave on the training wheels for a while longer
(menu-bar-mode 1)

; Save space
(tool-bar-mode -1)


;;With Emacs 24 some package management goodies
;; AKA  ELPA
(require 'package)
(add-to-list 'package-archives
  '("marmalade" . "http://marmalade-repo.org/packages/"))
;; You don't need this one if you have marmalade:
;; (add-to-list 'package-archives
;;  '("geiser" . "http://download.savannah.gnu.org/releases/geiser/packages"))
(package-initialize)

;; When I configure more eshell stuff, it will get it's own file

; TODO:   em-last.el --- insert arguments from previous commands
;;(add-to-list 'eshell-modules-list "eshell-last")
