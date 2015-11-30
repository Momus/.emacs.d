;;  Initial configuration taken from 
;;  http://orgmode.org/worg/org-tutorials/orgtutorial_dto.html

(require 'org-install)
(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))

(setq org-log-done t)
(global-font-lock-mode 1)


;; Odd levels, lets see if this is the way to go.
(setq org-odd-levels-only 1)

;; Setting the  vis line mode
;;Dedided that vis line mode not such a good idea with org mode.  Messes up the nice columns.  
;; (add-hook 'org-mode-hook                
;; 	  '(lambda ()
;; 	     (auto-fill-mode t)
;; 	     (visual-line-mode nil)))

;;Org Mode - Organize Your Life In Plain Text!
;;http://doc.norang.ca/org-mode.html#Setup

;; If I ever start using the org-mode github source, uncoment next line:
;;(add-to-list 'load-path (expand-file-name "~/git/org-mode/lisp"))

(add-to-list 'auto-mode-alist '("\\.\\(org\\|org_archive\\|txt\\)$" . org-mode))
(require 'org)

;;
;; Standard key bindings
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)


;; Remember mode setup inspired by
;; [[http://sachachua.com/blog/2007/12/emacs-getting-things-done-with-org-basic/][Sacha Chua]]
(require 'remember)
;;(require 'remember-autoloads) ;;doesn't work
(setq org-remember-templates
      '(("Tasks" ?t "* TODO %?\n  %i\n  %a" "~/organizer.org")                      ;; (2)
        ("Appointments" ?a "* Appointment: %?\n%^T\n%i\n  %a" "~/organizer.org")))
(setq remember-annotation-functions '(org-remember-annotation))
(setq remember-handler-functions '(org-remember-handler))
(eval-after-load 'remember
   '(add-hook 'remember-mode-hook 'org-remember-apply-template))



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



;;More Sacha customization's
(setq org-todo-keywords '("TODO" "STARTED" "WAITING" "DONE"))
(setq org-agenda-include-diary t)
(setq org-agenda-include-all-todo t)


;;The location of the agenda files should be specified in .emacs , since it will be different for each computer, e. g.:
;(setq org-agenda-files (quote ("~/repos/projects/org"
;                               "~/repos/projects/TODO.org"
;                               )))
