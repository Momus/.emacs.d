;; Nothing but bound keys here

;; Reopen any file and edit as root user!!
;; (sudo access using tramp)
(global-set-key (kbd "C-x C-r") 'sudo-edit)


(global-set-key (kbd "C-x g") 'magit-status)
(global-set-key (kbd "C-x e") 'ert) ;Testing for ESS
(global-set-key (kbd "C-x c") 'auto-complete)
(global-set-key (kbd "C-c r") 'remember)

;; Org mode and GTD

(define-key global-map "\C-ca" 'org-agenda)
;; Switch to any org buffers:
(global-set-key "\C-cb" 'org-iswitchb)

;; Capture!
(define-key global-map "\C-cc" 'org-capture)

;;WTF?
(define-key global-map "\C-cl" 'org-store-link)
