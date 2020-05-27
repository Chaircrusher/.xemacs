(when (not (display-graphic-p))
  (custom-set-faces

	'(term-color-black ((t (:foreground "#3F3F3F" :background "#2B2B2B"))))
	'(term-color-red ((t (:foreground "#AC7373" :background "#8C5353"))))
	'(term-color-green ((t (:foreground "#7F9F7F" :background "#9FC59F"))))
	'(term-color-yellow ((t (:foreground "#DFAF8F" :background "#9FC59F"))))
	'(term-color-blue ((t (:foreground "#7CB8BB" :background "#4C7073"))))
	'(term-color-magenta ((t (:foreground "#DC8CC3" :background "#CC9393"))))
	'(term-color-cyan ((t (:foreground "#93E0E3" :background "#8CD0D3"))))
	'(term-color-white ((t (:foreground "#DCDCCC" :background "#656555"))))

	'(term-default-fg-color ((t (:inherit term-color-white))))
	'(term-default-bg-color ((t (:inherit term-color-black))))

	)
  )
;;; uncomment this line to disable loading of "default.el" at startup
(setq inhibit-startup-screen t)

;; (setq inhibit-default-init t)
;; add melp repo
(if (not (version< emacs-version "24.4"))
	 (progn
	   (require 'package)
	   (add-to-list 'package-archives
			'("melpa" . "http://melpa.org/packages/") t)
	   )
  (defun toggle-fullscreen ()
	 "Toggle full screen on X11"
	 (interactive)
	 (when (eq window-system 'x)
		(set-frame-parameter
		 nil 'fullscreen
		 (when (not (frame-parameter nil 'fullscreen)) 'fullboth))))

  (global-set-key [f11] 'toggle-fullscreen)
  )
(if (not (version< emacs-version "25.1"))
    (progn
      (require 'saveplace)
      (save-place-mode 1)
      )
      (progn
		  (require 'saveplace)
		  (setq-default save-place t)
		  )
		)
(setq save-place-forget-unreadable-files nil)

;; don't do that annoying 'go to debug on error thing'
(setq debug-on-error nil)

;; enable visual feedback on selections
;;(setq transient-mark-mode t)
(tooltip-mode nil)
(setq tooltip-use-echo-area t)

;; don't use dialogs
(setq use-dialog-box nil)

;; turn off throw to debugger
(setq debug-on-error nil)

;; default to better frame titles
(setq frame-title-format
      (concat  "%b - emacs@" (system-name)))

;; default to unified diffs
(setq diff-switches "-u")

;; always end a file with a newline
(setq require-final-newline 'query)

;;(server-start)
;;(setenv "EDITOR" "emacsclient")


(setq-default indent-tabs-mode nil)
(setq-default tab-width 3)
(defvaralias 'c-basic-offset 'tab-width)
(defvaralias 'cperl-indent-level 'tab-width)
(setq-default c-basic-offset 3 tab-width 3 indent-tabs-mode t)
(setq-default c++-tab-always-indent t)

;;;;;;;;;;;;;;
(c-add-style "leepfrog"
            '("gnu"
              (c-basic-offset . 3)
              (c-offsets-alist
					(c . c-lineup-topmost-intro-cont)
					(inher-intro . 3)
					(innamespace . 0)
					(inline-open . 3)
					(substatement-open . +)
					(statement-block-intro . +) ) ) )
(add-hook 'c++-mode-hook
			 (function (lambda ()
							 (c-set-style "leepfrog")(turn-on-auto-fill))))
(add-to-list 'auto-mode-alist '("\\.txx\\'" . c++-mode))
(add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode))
;;;;;;;;;;;

(global-set-key "\C-h" 'backward-delete-char-untabify)
(global-set-key "\C-cb" 'browse-url)
(global-unset-key (kbd "C-x SPC"))
(global-set-key (kbd "C-x SPC") 'gud-break)

(put 'erase-buffer 'disabled nil)
(setq load-path (cons "~/.xemacs" load-path))
(setq load-path (cons "~/.xemacs/color-theme-6.6.0" load-path))


(if (display-graphic-p)
	 (progn
		(require 'color-theme)

		(condition-case nil
			 (load  "~/.xemacs/nxml/rng-auto.el")
		  (error nil))
		(condition-case nil
			 (load "~/.xemacs/nxhtml/autostart.el")
		  (error nil))
		(condition-case nil
			 (load-library "autostart")
		  (error nil))
		(condition-case nil
			 (load "~/.xemacs/color-theme-almost-monokai.el")
		  (error nil))
		(condition-case nil
			 (load "~/.xemacs/ssh.el")
		  (error nil))
		(condition-case nil
			 (load "~/.xemacs/cmake-mode.el")
		  (error nil))
		(condition-case nil
			 (color-theme-almost-monokai)
		  (error nil))))

(if (string= (substring (shell-command-to-string "uname") 0 -1) "Darwin")
    (progn (setenv "DISPLAY" ":0.0"))
)

;;(add-to-list 'default-frame-alist '(tty-color-mode . -1))
(setq default-truncate-lines nil)
(setq indent-tab-mode nil)
(if (string= system-type "darwin")
 (setq browse-url-browser-function 'browse-url-generic
          browse-url-generic-program "/usr/bin/open")
)

(if (string= system-type "gnu/linux")
(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(browse-url-browser-function (quote browse-url-mozilla))
 '(browse-url-mozilla-program "/usr/bin/firefox")
 '(browse-url-netscape-program "/usr/bin/firefox")
 '(compilation-context-lines 10))
)
(if (string= system-type "darwin")
 '(browse-url-browser-function (quote browse-url-mozilla) t)
 '(browse-url-mozilla-program "/raid0/homes/kent/Desktop/Google Chrome.app/Contents/MacOS/Google Chrome")
 '(browse-url-netscape-program "/raid0/homes/kent/Desktop/Google Chrome.app/Contents/MacOS/Google Chrome")
)
(global-set-key "\C-xp" 'previous-multiframe-window)

(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(auto-compression-mode t nil (jka-compr))
 '(case-fold-search t)
 '(compilation-context-lines 10)
 '(compilation-window-height 20)
 '(current-language-environment "UTF-8")
 '(debug-on-error t)
 '(default-input-method "rfc1345")
 '(global-font-lock-mode t nil (font-lock))
 '(transient-mark-mode nil)
 '(show-trailing-whitespace t)
 '(uniquify-buffer-name-style (quote forward) nil (uniquify)))


(fset 'hardcorps
   [?\M-x ?t ?e ?l ?n ?e ?t ?\C-m ?c ?h ?a ?t ?. ?f ?4 ?. ?c ?a ?  ?6 ?6 ?2 ?3 ?\C-m ?k ?e ?n ?t ?\C-m ?c ?1 ?h ?2 ?a ?3 ?o ?4 ?s ?5  ?\C-m])
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 )

(defun tabify-leading (start end)
  "Call `tabify' with `tabify-regexp' set so that only leading
spaces are treated."
  (interactive "r")
  (when (boundp 'tabify-regexp)
    (setq tabify-regexp-old tabify-regexp))
  (unwind-protect
      (progn
        (setq tabify-regexp "^\t* [ \t]+")
        (tabify start end))
    (when (boundp 'tabify-regexp-old)
      (setq tabify-regexp tabify-regexp-old))
    )
  )
(eval-after-load "sql"
  '(load-library "sql-indent"))

(defun unix-file ()
  "Change the current buffer to Latin 1 with Unix line-ends."
  (interactive)
  (set-buffer-file-coding-system 'iso-latin-1-unix t))
(defun dos-file ()
  "Change the current buffer to Latin 1 with DOS line-ends."
  (interactive)
  (set-buffer-file-coding-system 'iso-latin-1-dos t))
(add-to-list 'default-frame-alist
				 '(vertical-scroll-bars . nil))
;;(eval-after-load 'compile
;;  (add-to-list 'compilation-error-regexp-alist
;;               '("^\\([^(\n]+\\)(\\([0-9]+\\),\\([0-9]+\\)):" 1 2 3)))
