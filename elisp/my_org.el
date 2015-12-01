;; Enabled by default in newer Emacs, but can't hurt just the same,
;; Necessary for org-mode
(global-font-lock-mode 1)

;; Only required on older versions of Emacs:
;; Org mode is now built in.
;; (add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
;; (require 'org-install)
(require 'org)


;; Odd levels by default to keep from clutter.
;; Also, odd numbers are better luck they say.
(setq org-odd-levels-only 1)

;; Speaking of clutter, can't live without
(setq org-indent-mode t)

;;Org Mode - Organize Your Life In Plain Text!
;;http://doc.norang.ca/org-mode.html#Setup


;; Remember; _global_ keybindings are found in ./elisp/my_keybindings.el
;; 




;;[[http://orgmode.org/worg/org-gtd-etc.html][Pomodoro in Org]]
;; Start a clock to work on task.
;; http://thread.gmane.org/gmane.emacs.orgmode/29347

(add-to-list 'org-modules 'org-timer)

;; Set a default value for the timer.
(setq org-timer-default-timer 25)

;; Modify the org-clock-in so that a timer is started with the default
;; value except if a timer is already started:

(add-hook 'org-clock-in-hook
          (lambda ()
            (if (not org-timer-current-timer)
                (org-set-timer '(16)))))


;; The location of the agenda files should be specified in .emacs,
;; since it will be different for each computer, e. g.:
;; (setq org-agenda-files (quote ("~/repos/projects/org"
;;                               "~/repos/projects/TODO.org"
;;                               )))


;; Capture time stamps when TODO states changes.

(setq org-log-done 'time) ;Insert time stamp when DONE
