
;; Load rvm.el
(require 'rvm)
;; use rvm’s default ruby for the current Emacs session
(rvm-use-default)


;; Integrate RVM into my Ruby editing experience
;; http://devblog.avdi.org/2011/10/11/rvm-el-and-inf-ruby-emacs-reboot-14/

(add-hook 'ruby-mode-hook
          (lambda () (rvm-activate-corresponding-ruby)))
