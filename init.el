;; This is the main init file.  Other init files live in the elisp directory

(add-to-list 'load-path "~/.emacs.d/elisp/")


;; Also needed for the elpa dirs to work
(require 'package)
(package-initialize)


;;My custom bindings go first so I know what they are and what they do.
(global-set-key (kbd "C-x g") 'magit-status)

;;Autocomplete
;;From http://cx4a.org/software/auto-complete/

(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/ac-dict")
(ac-config-default)

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

;;Window number!
(load "window_number")
(require 'window-number)
(window-number-mode 1)

;; We like desktop save mode, however, it is a bad idea to keep saved
;; desktops in a git repository.  So while it is enabled, make sure that
;; the desktop directory is in git ignore

(desktop-save-mode 1)
(add-to-list 'desktop-path  '"~/.emacs.d/desktops" )
(global-set-key "\C-xo"  'window-number-switch)

;;This should make it possible to edit Chrome text areas with Emacs.
;; Not yet convinced of its utility.
(require 'edit-server)
(edit-server-start)



;;Some basic config options


;A steady light, not blinking parens
(show-paren-mode t)
(setq show-paren-style 'expression)
(setq show-paren-delay 0)

;No splash screen at start-up
(setq inhibit-startup-screen t)

;;;Take off  the training wheels for a while longer
(menu-bar-mode -1)

; Save space
(tool-bar-mode -1)

; Get rid of autofill. Fly fill worls much better.
;;Visual line mode 
(global-visual-line-mode 1)
(remove-hook 'text-mode-hook #'turn-on-auto-fill)
(auto-fill-mode -1)
(turn-off-auto-fill)
(set-fringe-mode '(0 . 0)) ; Disable fringe for  visual-line-mode




;;; AUCTeX
;; Customary Customization, p. 1 and 16 in the manual
;; and http://www.emacswiki.org/emacs/AUCTeX#toc2

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



(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)
(when (< emacs-major-version 24)
  ;; For important compatibility libraries like cl-lib
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))
(package-initialize) 


;; Going to give this:
;; http://emacsredux.com/blog/2013/04/21/edit-files-as-root/
;; a try.

(defun sudo-edit (&optional arg)
  "Edit currently visited file as root.

With a prefix ARG prompt for a file to visit.
Will also prompt for a file to visit if current
buffer is not visiting a file."
  (interactive "P")
  (if (or arg (not buffer-file-name))
      (find-file (concat "/sudo:root@localhost:"
                         (ido-read-file-name "Find file(as root): ")))
    (find-alternate-file (concat "/sudo:root@localhost:" buffer-file-name))))

(global-set-key (kbd "C-x C-r") 'sudo-edit)
