(server-start)
(setenv "EDITOR" "emacsclient")


(setq-default indent-tabs-mode t)
(setq-default tab-width 3)
(defvaralias 'c-basic-offset 'tab-width)
(defvaralias 'cperl-indent-level 'tab-width)
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

(put 'erase-buffer 'disabled nil)
(setq load-path (cons "~/.xemacs/color-theme-6.6.0" load-path))


(require 'color-theme)

(condition-case nil
    (load  "~/.xemacs/nxml/rng-auto.elc")
  (error nil))
(condition-case nil
    (load "~/.xemacs/nxhtml/autostart.elc")
  (error nil))
(condition-case nil
    (load-library "autostart")
  (error nil))
(condition-case nil
    (load "~/.xemacs/color-theme-almost-monokai.elc")
  (error nil))
(condition-case nil
    (load "~/.xemacs/ssh.elc")
  (error nil))
(condition-case nil
    (load "~/.xemacs/cmake-mode.el")
  (error nil))
(condition-case nil
    (color-theme-almost-monokai)
  (error nil))

(if (string= (substring (shell-command-to-string "uname") 0 -1) "Darwin")
    (progn (setenv "DISPLAY" ":0.0"))
)

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