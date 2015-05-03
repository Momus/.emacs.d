
;; Load rvm.el
(require 'rvm)
;; use rvm’s default ruby for the current Emacs session
(rvm-use-default)


;; Integrate RVM into my Ruby editing experience
;; http://devblog.avdi.org/2011/10/11/rvm-el-and-inf-ruby-emacs-reboot-14/

(add-hook 'ruby-mode-hook
          (lambda () (rvm-activate-corresponding-ruby)))


;;; Rinari

(require 'rinari)
;; Have Rinari automatically update your tags-file-name variable
;; to point to the tags of your current rails project
(setq rinari-tags-file-name "TAGS")

;; Use web mode for erb rather than Ruby mode:
;; http://web-mode.org/
(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(setq web-mode-enable-auto-pairing t)
(setq web-mode-enable-css-colorization t)
(setq web-mode-enable-block-face t)
(setq web-mode-enable-current-element-highlight t)
(setq web-mode-enable-current-column-highlight t)
(setq web-mode-ac-sources-alist
  '(("css" . (ac-source-css-property))
    ("html" . (ac-source-words-in-buffer ac-source-abbrev)))

;;Improving Ruby Mode

;;Ruby-mode file associations:
;;http://stackoverflow.com/questions/13165811/enabling-ruby-mode-for-sundry-rails-files
;(add-to-list 'auto-mode-alist '("\\.\\(rb\\|ru\\|builder\\|rake\\|thor\\|gemspec\\)\\'" . ruby-mode))
;(add-to-list 'auto-mode-alist '("\\(rake\\|thor\\|guard\\|gem\\|cap\\|vagrant\\)file\\'" . ruby-mode))


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
