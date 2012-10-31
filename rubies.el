
;; Load rvm.el
(require 'rvm)
;; use rvm’s default ruby for the current Emacs session
(rvm-use-default)


;; Integrate RVM into my Ruby editing experience
;; http://devblog.avdi.org/2011/10/11/rvm-el-and-inf-ruby-emacs-reboot-14/

(add-hook 'ruby-mode-hook
          (lambda () (rvm-activate-corresponding-ruby)))

;;Improving Ruby Mode
; auto-indent the next line after you hit return
;http://appsintheopen.com/articles/1-setting-up-emacs-for-rails-development/part/7-emacs-ruby-foo

(add-hook 'ruby-mode-hook
      (lambda()
        (add-hook 'local-write-file-hooks
                  '(lambda()
                     (save-excursion
                       (untabify (point-min) (point-max))
                       (delete-trailing-whitespace)
                       )))
        (set (make-local-variable 'indent-tabs-mode) 'nil)
        (set (make-local-variable 'tab-width) 2)
        (imenu-add-to-menubar "IMENU")
        (define-key ruby-mode-map "\C-m" 'newline-and-indent) ;Not sure if this line is 100% right!
     ;   (require 'ruby-electric)
     ;   (ruby-electric-mode t)
        ))
