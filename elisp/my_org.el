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

;;The location of the agenda files should be specified in .emacs , since it will be different for each computer, e. g.:
;(setq org-agenda-files (quote ("~/repos/projects/org"
;                               "~/repos/projects/TODO.org"
;                               )))
