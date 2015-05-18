;; All sorts of tasty gitness in this file

;; Magit.  Download from [[https://github.com/magit/magit][github]] and build

(require 'magit)

;;Globally bind  magit status
(global-set-key 
 (kbd "M-s M-s")  'magit-status)

;; Keep warning message from appearing on start up.  Kinda dumb.
 (setq magit-last-seen-setup-instructions "1.4.0")
