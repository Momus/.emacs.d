;;  Initial configuration taken from 
;;  http://orgmode.org/worg/org-tutorials/orgtutorial_dto.html

(require 'org-install)
 (add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
 (define-key global-map "\C-cl" 'org-store-link)
 (define-key global-map "\C-ca" 'org-agenda)
 (setq org-log-done t)


;; Something about setting vis line mode is wrong
;; but I don't feel like changing it.

(add-hook 'org-mode-hook
	  '(lambda ()
	     (auto-fill-mode nil)
	     (visual-line-mode t)))
