;;  Initial configuration taken from 
;;  http://orgmode.org/worg/org-tutorials/orgtutorial_dto.html

(require 'org-install)
(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))

(setq org-log-done t)
(global-font-lock-mode 1)


;; Setting the  vis line mode

(add-hook 'org-mode-hook
	  '(lambda ()
	     (auto-fill-mode nil)
	     (visual-line-mode t)))

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

;;This is where my main agenda files should be kept
(custom-set-variables
 '(org-agenda-files (quote ("~/repos/projects/TODO.org"))))
(custom-set-variables
 '(org-agenda-files (quote ("~/repos/projects/org"))))
