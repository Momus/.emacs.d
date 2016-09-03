
;; Define where config files are kept
(setq dotfiles-dir (file-name-directory (or (buffer-file-name) load-file-name)))

;; Use org-babel initialize emacs by running all the code in .org files
(mapc #'org-babel-load-file (directory-files dotfiles-dir t "\\.org$"))
