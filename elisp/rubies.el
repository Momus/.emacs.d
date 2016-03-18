;; Load rvm.el
(require 'rvm)
;; use rvm’s default ruby for the current Emacs session
(rvm-use-default)


;; Integrate RVM into my Ruby editing experience
;; http://devblog.avdi.org/2011/10/11/rvm-el-and-inf-ruby-emacs-reboot-14/

(add-hook 'ruby-mode-hook
          (lambda () (rvm-activate-corresponding-ruby)))


;; Stolen from https://rejeep.github.io/emacs/elisp/ruby/2010/11/10/ruby-interpolation.html

(defun ruby-interpolate ()
  "In a double quoted string, interpolate."
  (interactive)
  (insert "#")
  (when (and
         (looking-back "\".*")
         (looking-at ".*\""))
    (insert "{}")
    (backward-char 1)))
;(define-key ruby-mode-map (kbd "#") 'ruby-interpolate)


;;; Rinari

(require 'rinari)
;; Have Rinari automatically update your tags-file-name variable
;; to point to the tags of your current rails project
(setq rinari-tags-file-name "TAGS")

;; ;; Use web mode for erb rather than Ruby mode:
;; ;; http://web-mode.org/
(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
 (setq web-mode-enable-auto-pairing t)
 (setq web-mode-enable-css-colorization t)
 (setq web-mode-enable-block-face t)
 (setq web-mode-enable-current-element-highlight t)
 (setq web-mode-enable-current-column-highlight t)
 (setq web-mode-ac-sources-alist
   '(("css" . (ac-source-css-property))
     ("html" . (ac-source-words-in-buffer ac-source-abbrev))))

