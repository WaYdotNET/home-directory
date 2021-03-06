(setq default-frame-alist
      '((top . 22) (left . 2)
        (width . 187) (height . 59)))


(add-to-list 'load-path (expand-file-name "~/.emacs.d"))

(require 'column-marker)
(add-hook 'python-mode-hook (lambda () (interactive) (column-marker-1 80)))
(add-hook 'ruby-mode-hook (lambda () (interactive) (column-marker-1 80)))
;;toggle column 80 marker
;;(global-set-key "\C-X8" 'column-marker-1)


(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(auto-compression-mode t nil (jka-compr))
 '(case-fold-search t)
 '(column-number-mode t)
 '(cua-mode nil nil (cua-base))
 '(current-language-environment "ASCII")
 '(custom-browse-sort-alphabetically t)
 '(display-time-mode 1)
 '(ecb-auto-activate nil)
 '(ecb-layout-window-sizes (quote (("left8" (0.17714285714285713 . 0.4057971014492754) (0.17714285714285713 . 0.13043478260869565) (0.17714285714285713 . 0.34782608695652173) (0.17714285714285713 . 0.10144927536231885)))))
 '(ecb-options-version "2.32")
 '(ecb-primary-secondary-mouse-buttons (quote mouse-1--mouse-2))
 '(ecb-tip-of-the-day nil)
 '(ecb-tree-indent 3)
 '(ecb-wget-setup (quote cons))
 '(explicit-bash-args (quote ("--noediting" "-i" "-l")))
 '(frame-title-format "emacs %f" t)
 '(load-home-init-file t t)
 '(markdown-command "/usr/local/bin/markdown")
 '(save-place t nil (saveplace))
 '(scroll-bar-mode nil)
 '(show-paren-mode t nil (paren))
 '(speedbar-sort-tags t)
 '(tool-bar-mode nil nil (tool-bar))
 '(transient-mark-mode t)
 '(uniquify-buffer-name-style (quote forward) nil (uniquify))
 '(visible-bell f))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 )

;;OSX stuff
(set-frame-parameter (selected-frame) 'alpha '(99 85))
(add-to-list 'exec-path "/usr/local/mysql/bin")
(add-to-list 'exec-path "/opt/local/sbin")
(add-to-list 'exec-path (getenv "PATH"))
(setq mac-option-key-is-meta nil)
(setq mac-command-key-is-meta t)
(setq mac-command-modifier 'meta)
(setq mac-option-modifier nil)
(server-start) ;; so it's listening for the emacsclient alias
(setq ns-pop-up-frames nil) ;; keep OSX from opening more windows

;;UI stuff
(menu-bar-mode (if window-system 1 -1))
(fset 'yes-or-no-p 'y-or-n-p)

;;fonts
;;(set-face-font 'menu "-*-monaco-medium-r-*--9-*-*-*-*-*-*-*")
;;(set-face-font 'default "-*-monaco-medium-r-*--15-*-*-*-*-*-*-*")
;;(set-face-font 'default "-*-andale mono-medium-r-*--15-*-*-*-*-*-*-*")
;;(set-face-font 'default "-apple-inconsolata-bold-r-normal--18-180-72-72-m-180-iso10646-1")
;;(set-face-font 'default "-*-inconsolata mono-medium-r-*--15-*-*-*-*-*-*-*")

(set-face-font 'default "-*-bitstream vera sans mono-medium-r-*--15-*-*-*-*-*-*-*")
;;(set-face-font 'menu "-misc-fixed-medium-*-*-*-12-*-*-*-*-*-*-*")
;;(set-face-font 'default "-misc-fixed-medium-*-*-*-20-*-*-*-*-*-*-*")
 (defun jfb-set-mac-font (name  size)
    (interactive
     (list (completing-read "font-name: " (mapcar (lambda (n) (list n n)) (mapcar (lambda (p) (car p)) (x-font-family-list))) nil t)
           (read-number "size: " 12)))
    (set-face-attribute 'default nil
                        :family name
                        :slant  'normal
                        :weight 'normal
                        :width  'normal
                        :height (* 10 size)))



;;Key bindings
;;skip to line number
(global-set-key "\C-Xg" 'goto-line)
;;toggle comment out block
(global-set-key "\C-cc" 'comment-region)
(global-set-key "\C-cu" 'uncomment-region)
;;indent-region
(global-set-key "\C-ci" 'indent-region)
;;insert another buffer
(global-set-key "\C-cb" 'insert-buffer)
;;set C-h to delete
(global-set-key "\C-h" 'delete-backward-char)
;;toggle word-wrap
(global-set-key "\C-xt" 'toggle-truncate-lines)

;;toggle word-wrap
(global-set-key "\C-xd" 'dirs)

;;sort buffer list by name
(setq Buffer-menu-sort-column 2)

;;color theme
(require 'color-theme)
(color-theme-deep-blue-mray)
;;(color-theme-dark-blue2)
;;(color-theme-subtle-hacker)


;; turn on mouse wheel scrolling
;; (defun sd-mousewheel-scroll-up (event)
;;   "Scroll window under mouse up by five lines."
;;   (interactive "e")
;;   (let ((current-window (selected-window)))
;;     (unwind-protect
;;   (progn
;;     (select-window (posn-window (event-start event)))
;;     (scroll-up 2))
;;       (select-window current-window))))
;; (defun sd-mousewheel-scroll-down (event)
;;   "Scroll window under mouse down by five lines."
;;   (interactive "e")
;;   (let ((current-window (selected-window)))
;;     (unwind-protect
;;   (progn
;;     (select-window (posn-window (event-start event)))
;;     (scroll-down 2))
;;       (select-window current-window))))
;; (global-set-key (kbd "<mouse-5>") 'sd-mousewheel-scroll-up)
;; (global-set-key (kbd "<mouse-4>") 'sd-mousewheel-scroll-down)

;;skip startup message
(setq inhibit-startup-message t)

;;require a newline end of file
(setq require-final-newline 'query)


;;always use spaces, never tabs
(setq-default indent-tabs-mode nil)
;;(define-key text-mode-map (kbd "TAB") 'tab-to-tab-stop);
(setq default-tab-width 2);


;;Don't echo passwords when communicating with interactive programs:
(add-hook 'comint-output-filter-functions 'comint-watch-for-password-prompt)

;;unset C-z when in X-windows
(when window-system
  (global-unset-key "\C-z")) ; iconify-or-deiconify-frame (C-x C-z)



;; Ruby settings
(require 'rvm)
(rvm-use-default) ;; use rvm’s default ruby for the current Emacs session

;; ruby-mode
;;(setq load-path (cons "~/.emacs.d/emacs-rails" load-path))
;;(require 'rails)
;;(require 'snippet)
;;(autoload 'ruby-mode "ruby-mode" "Load ruby-mode" t)
;;(setq auto-mode-alist  (cons '("\\.rb$" . ruby-mode) auto-mode-alist))
;;(setq auto-mode-alist  (cons '("\\.rhtml$" . html-mode) auto-mode-alist))
;;(add-hook 'ruby-mode-hook 'turn-on-font-lock)



;;JSP stuff
;;(setq auto-mode-alist (cons '("\\.jsp$" . html-helper-mode) auto-mode-alist))
;;(setq auto-mode-alist (cons '("\\.tag$" . html-helper-mode) auto-mode-alist))
;;(setq auto-mode-alist (cons '("\\.xsd$" . sgml-mode) auto-mode-alist))


;;XML-Lite Mode
;;(global-set-key "\C-cx" 'xml-lite-mode)
;;(autoload 'xxml-mode-routine "xml-lite")
;;(add-hook 'sgml-mode-hook 'xxml-mode-routine)


;;cedet stuff
;; (add-to-list 'load-path "~/.emacs.d/cedet-1.0pre4")
;; (load-file "~/.emacs.d/cedet-1.0pre4/common/cedet.el")
;;(semantic-load-enable-code-helpers)
;; (semantic-load-enable-excessive-code-helpers)
;; (setq semanticdb-default-save-directory "~/.emacs/.semantic")
;; (global-set-key "\C-co" 'ecb-goto-window-edit1)


;;ECB goes here
;; (add-to-list 'load-path "~/.emacs.d/ecb-2.32")
;; (require 'ecb-autoloads)


;;nXML
;; (setq auto-mode-alist
;;       (cons '("\\.\\(xml\\|xsl\\|rng\\|html\\|deki\\|xhtml\\)\\'" . nxml-mode)
;;             auto-mode-alist))
;;(load-library "autostart")


;;(require 'mmm-mode)
;;(require 'mmm-auto)
;;(setq mmm-global-mode 'maybe)
;;(setq mmm-submode-decoration-level 2)
;;(set-face-background 'mmm-output-submode-face  "DarkSlateBlue")
;;(set-face-background 'mmm-code-submode-face    "LightGrey")
;;(set-face-background 'mmm-comment-submode-face "DarkOliveGreen")
;; (mmm-add-classes
;;  '((erb-code
;;     :submode ruby-mode
;;     :match-face (("<%#" . mmm-comment-submode-face)
;;                  ("<%=" . mmm-output-submode-face)
;;                  ("<%"  . mmm-code-submode-face))
;;     :front "<%[#=]?"
;;     :back "-?%>"
;;     :insert ((?% erb-code       nil @ "<%"  @ " " _ " " @ "%>" @)
;;              (?# erb-comment    nil @ "<%#" @ " " _ " " @ "%>" @)
;;              (?= erb-expression nil @ "<%=" @ " " _ " " @ "%>" @))
;;     )))
;; (add-hook 'html-mode-hook
;;           (lambda ()
;;             (setq mmm-classes '(erb-code))
;;             (mmm-mode-on)))
;; (add-to-list 'auto-mode-alist '("\\.rhtml$" . html-mode))

(put 'downcase-region 'disabled nil)

;;whitespace
(require 'whitespace)
(autoload 'whitespace-mode "whitespace" "Toggle whitespace visualization." t)
(autoload 'whitespace-toggle-options "whitespace" "Toggle local `whitespace-mode' options." t)


;; Add color to a shell running in emacs ‘M-x shell’
;; (autoload 'ansi-color-for-comint-mode-on “ansi-color” nil t)
;; (add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)

;; Then set the colors:
;;(custom-set-faces
;; custom-set-faces was added by Custom — don’t edit or cut/paste it!
;; Your init file should contain only one such instance.
;;'(comint-highlight-prompt ((t (:foreground “white”)))))
;;; Shell mode

;; suppress shell echoes
;; (defun my-comint-init ()
;;   (setq comint-process-echoes t))
;; (add-hook 'comint-mode-hook 'my-comint-init)

;; make completion buffers disappear after 8 seconds.
;; (add-hook 'completion-setup-hook
;;   (lambda () (run-at-time 8 nil
;;     (lambda () (delete-windows-on "*Completions*")))))


;;keep backup files in /tmp
(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))

;;install dired+.el for single dired window and colored directories
(require 'dired+)
(toggle-dired-find-file-reuse-dir 1)
(setq diredp-font-lock-keywords-1
      (list
       '("^  \\(.+:\\)$" 1 diredp-dir-heading) ; Directory headers
       '("^  wildcard.*$" 0 'default)       ; Override others, e.g. `l' for `diredp-other-priv'.
       '("^  (No match).*$" 0 'default)     ; Override others, e.g. `t' for `diredp-other-priv'.
       '("[^ .]\\.\\([^. /]+\\)$" 1 diredp-file-suffix) ; Suffix
       '("\\([^ ]+\\) -> [^ ]+$" 1 diredp-symlink) ; Symbolic links
       ;; 1) Date/time and 2) filename w/o suffix:
       (list dired-move-to-filename-regexp  '(1 diredp-date-time t t) ; Date/time
             (list "\\(.+\\)$" nil nil (list 0 diredp-file-name 'keep t))) ; Filename
       ;; Files to ignore
       (list (concat "^  \\(.*\\("
                     (concat (mapconcat 'regexp-quote
                                        (or (and (boundp 'dired-omit-extensions)
                                                 dired-omit-extensions)
                                            completion-ignored-extensions)
                                        "[*]?\\|")
                             "[*]?")        ; Allow for executable flag (*).
                     "\\|\\.\\(g?z\\|Z\\)[*]?\\)\\)$") ; Compressed.
             1 diredp-ignored-file-name t)
       '("[^ .]\\.\\([bg]?[zZ]2?\\)[*]?$" 1 diredp-compressed-file-suffix t) ; Compressed (*.z)
       '("\\([*]\\)$" 1 diredp-executable-tag t) ; Executable (*)
       '(" \\([0-9]+\\(\\.[0-9]+\\)?[kKMGTPEZY]?\\)" 1 diredp-inode+size) ; File inode number & size
       ;; Directory names
       (list "^..\\([0-9]* \\)*d"
             (list dired-move-to-filename-regexp nil nil)
             (list "\\(.+\\)" nil nil '(0 diredp-dir-priv t t)))
       '("^..\\([0-9]* \\)*.........\\(x\\)" 2 diredp-exec-priv) ;o x
       '("^..\\([0-9]* \\)*.........\\([lsStT]\\)" 2 diredp-other-priv) ; o misc
       '("^..\\([0-9]* \\)*........\\(w\\)" 2 diredp-write-priv) ; o w
       '("^..\\([0-9]* \\)*.......\\(r\\)" 2 diredp-read-priv)   ; o r
       '("^..\\([0-9]* \\)*......\\(x\\)" 2 diredp-exec-priv)    ; g x
       '("^..\\([0-9]* \\)*....[^0-9].\\([lsStT]\\)" 2 diredp-other-priv) ; g misc
       '("^..\\([0-9]* \\)*.....\\(w\\)" 2 diredp-write-priv) ; g w
       '("^..\\([0-9]* \\)*....\\(r\\)" 2 diredp-read-priv)   ; g r
       '("^..\\([0-9]* \\)*...\\(x\\)" 2 diredp-exec-priv)    ; u x
       '("^..\\([0-9]* \\)*...\\([lsStT]\\)" 2 diredp-other-priv) ; u misc
       '("^..\\([0-9]* \\)*..\\(w\\)" 2 diredp-write-priv) ; u w
       '("^..\\([0-9]* \\)*.\\(r\\)" 2 diredp-read-priv)   ; u r
       '("^..\\([0-9]* \\)*.\\([-rwxlsStT]+\\)" 2 diredp-no-priv keep) ;-
       '("^..\\([0-9]* \\)*\\([bcsmpS]\\)[-rwxlsStT]" 2 diredp-rare-priv) ; (rare)
       '("^..\\([0-9]* \\)*\\(l\\)[-rwxlsStT]" 2 diredp-link-priv) ; l
       (list (concat "^\\([^\n " (char-to-string dired-del-marker) "].*$\\)")
             1 diredp-flag-mark-line t) ; Flag/mark lines
       (list (concat "^\\([" (char-to-string dired-del-marker) "]\\)") ; Deletion flags (D)
             '(1 diredp-deletion t)
             '(".+" (dired-move-to-filename) nil (0 diredp-deletion-file-name t)))
       (list (concat "^\\([^\n " (char-to-string dired-del-marker) "]\\)") ; Flags, marks (except D)
             1 diredp-flag-mark t)
       ))


;;Markdown mode 
(autoload 'markdown-mode "markdown-mode.el"
  "Major mode for editing Markdown files" t)
(setq auto-mode-alist (cons '("\\.md" . markdown-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.text" . markdown-mode) auto-mode-alist))
