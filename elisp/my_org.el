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
 )


(setq org-capture-templates
      '(
        
        ("t" "Todo" entry (file+headline (concat org-directory "/todo.org") "Tasks")
         "* TODO %?\n  %i\n  %a")
        
        ("j" "Journal" entry (file+datetree (concat org-directory "/notes.org"))
         "* %?\nEntered on %U\n  %i\n  %a")
        
        ("w" "Workout" entry (file+datetree (concat org-directory "/raw_sexy.org"))
         "* %?\nEntered on %U\n  %i\n  %a"))
      )




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
