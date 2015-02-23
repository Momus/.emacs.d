
;;Some useful eshell settings

;;This is so ehshell finds our alias files.
(setq eshell-directory-name "~/.emacs.d/eshell") 

;;This will fix crashing problems
(setq eshell-prompt-regexp "^[^#$\n]*[#$] ")

;;  pcomplete-list better than the completion cycling. 
 (setq eshell-cmpl-cycle-completions nil)
