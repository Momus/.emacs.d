;; This is the main init file.  It should get split up as it gets bigger.


;;My custom bindings go first so I know what they are and what they do.
(global-set-key (kbd "C-x g") 'magit-status)

;;Autocomplete
;;From http://cx4a.org/software/auto-complete/
;;(add-to-list 'load-path "~/.emacs.d/")
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d//ac-dict")
(ac-config-default)



;; add the directory in which are kept various elsips loaded below.
(add-to-list 'load-path "~/.emacs.d/elisp")

;; ido-mode iZ TeH BomB
(require 'ido)
(ido-mode t)

;; Org mode configuration
(load "my_org")

;; All ruby stuff
(load "rubies")

;;Git!
(load "gits")

;;Eshell!
(load "my_eshell")

;; We like desktop save mode, however, it is a bad idea to keep saved
;; desktops in a git repository.  So while it is enabled, make sure that
;; the desktop directory is in git ignore

(desktop-save-mode 1)
(add-to-list 'desktop-path  '"~/.emacs.d/desktops" )



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

; Get rid of autofill. Fly fill worls much better.
;;Visual line mode 
(global-visual-line-mode 1)
(remove-hook 'text-mode-hook #'turn-on-auto-fill)
(auto-fill-mode -1)
(turn-off-auto-fill)
(set-fringe-mode '(0 . 0)); Disable fringe for  visual-line-mode

;;Transparent Emacs!!!


;;; AUCTeX
;; Customary Customization, p. 1 and 16 in the manual, and http://www.emacswiki.org/emacs/AUCTeX#toc2
(setq TeX-parse-self t); Enable parse on load.
(setq TeX-auto-save t); Enable parse on save.
(setq-default TeX-master nil)

(setq TeX-PDF-mode t); PDF mode (rather than DVI-mode)

(add-hook 'TeX-mode-hook 'flyspell-mode); Enable Flyspell mode for TeX modes such as AUCTeX. Highlights all misspelled words.
(add-hook 'emacs-lisp-mode-hook 'flyspell-prog-mode); Enable Flyspell program mode for emacs lisp mode, which highlights all misspelled words in comments and strings.
(add-hook 'TeX-mode-hook
          (lambda () (TeX-fold-mode 1))); Automatically activate TeX-fold-mode.
;;; RefTeX
;; Turn on RefTeX for AUCTeX http://www.gnu.org/s/auctex/manual/reftex/reftex_5.html
(add-hook 'TeX-mode-hook 'turn-on-reftex)





; Winner Mode Wins!
(setq winner-mode t)

;;How about a nice clock?
(setq display-time t)

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
