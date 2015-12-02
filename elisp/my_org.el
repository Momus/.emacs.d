;; Enabled by default in newer Emacs, but can't hurt just the same,
;; Necessary for org-mode
(global-font-lock-mode 1)

;; Only required on older versions of Emacs:
;; Org mode is now built in.
;; (add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
;; (require 'org-install)
(require 'org)
(require 'org-agenda)


;; Odd levels by default to keep from clutter.
;; Also, odd numbers are better luck they say.
(setq org-odd-levels-only 1)

;; Speaking of clutter, can't live without
(setq org-indent-mode t)



;; Remember; _global_ keybindings are found in ./elisp/my_keybindings.el
;;

;; Set up Capture mode to replace remember mode
(setq org-default-notes-file (concat org-directory "/notes.org"))

;;AD VERBEM;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(define-key mode-specific-map [?a] 'org-agenda)

(eval-after-load "org"
  '(progn
     (define-prefix-command 'org-todo-state-map)

     (define-key org-mode-map "\C-cx" 'org-todo-state-map)

     (define-key org-todo-state-map "x"
       #'(lambda nil (interactive) (org-todo "CANCELLED")))
     (define-key org-todo-state-map "d"
       #'(lambda nil (interactive) (org-todo "DONE")))
     (define-key org-todo-state-map "f"
       #'(lambda nil (interactive) (org-todo "DEFERRED")))
     (define-key org-todo-state-map "l"
       #'(lambda nil (interactive) (org-todo "DELEGATED")))
     (define-key org-todo-state-map "s"
       #'(lambda nil (interactive) (org-todo "STARTED")))
     (define-key org-todo-state-map "w"
       #'(lambda nil (interactive) (org-todo "WAITING")))
     (define-key org-agenda-mode-map "\C-n" 'next-line)
     (define-key org-agenda-keymap "\C-n" 'next-line)
     (define-key org-agenda-mode-map "\C-p" 'previous-line)
     (define-key org-agenda-keymap "\C-p" 'previous-line)
     )
  )

;; ;;https://lists.gnu.org/archive/html/emacs-orgmode/2008-07/msg00027.html]
;; ;; an (easier and cleaner, I think) alternate way to achieve
;; ;;this would be something like this:

;; (setq org-use-fast-todo-selection t)
;; (setq org-todo-keywords
;;       '((sequence "TODO(t)"
;;                   "STARTED(s)"
;;                   "WAITING(w)"
;;                   "DELEGATED(l)" "|"
;;                   "DONE(d)"
;;                   "DEFERRED(f)")))


(custom-set-variables
 '(org-agenda-files (concat org-directory "/todo.org"))
 '(org-default-notes-file (concat org-directory "/notes.org"))
 '(org-agenda-ndays 7)
 '(org-deadline-warning-days 14)
 '(org-agenda-show-all-dates t)
 '(org-agenda-skip-deadline-if-done t)
 '(org-agenda-skip-scheduled-if-done t)
 '(org-agenda-start-on-weekday nil)
 '(org-reverse-note-order t)
 '(org-fast-tag-selection-single-key (quote expert))
 '(org-agenda-custom-commands
   (quote (("d" todo "DELEGATED" nil)
          ("c" todo "DONE|DEFERRED|CANCELLED" nil)
          ("w" todo "WAITING" nil)
          ("W" agenda "" ((org-agenda-ndays 21)))
          ("A" agenda ""
           ((org-agenda-skip-function
             (lambda nil
               (org-agenda-skip-entry-if (quote notregexp) "\\=.*\\[#A\\]")))
            (org-agenda-ndays 1)
            (org-agenda-overriding-header "Today's Priority #A tasks: ")))
          ("u" alltodo ""
           ((org-agenda-skip-function
             (lambda nil
               (org-agenda-skip-entry-if (quote scheduled) (quote deadline)
                                         (quote regexp) "\n]+>")))
            (org-agenda-overriding-header "Unscheduled TODO entries: "))))))

 ;; '(org-remember-templates
 ;;   (quote ((116 "* TODO %?\n  %u" "~/todo.org" "Tasks")
 ;;       (110 "* %u %?" "~/notes.org" "Notes"))))
 ;; '(remember-annotation-functions (quote (org-remember-annotation)))
 ;; '(remember-handler-functions (quote (org-remember-handler)))
 
 )


(setq org-capture-templates
      '(("t" "Todo" entry (file+headline (concat org-directory "/todo.org") "Tasks")
         "* TODO %?\n  %i\n  %a")
        ("j" "Journal" entry (file+datetree (concat org-directory "/notes.org"))
         "* %?\nEntered on %U\n  %i\n  %a")))




;; End of Wiegley
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;[[http://orgmode.org/worg/org-gtd-etc.html][Pomodoro in Org]]
;; Start a clock to work on task.
;; http://thread.gmane.org/gmane.emacs.orgmode/29347

(add-to-list 'org-modules 'org-timer)

;; Set a default value for the timer.
(setq org-timer-default-timer 25)

;; Modify the org-clock-in so that a timer is started with the default
;; value unless a timer is already started:

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
