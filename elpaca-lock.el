((company :source "elpaca-menu-lock-file" :recipe
	  (:package "company" :fetcher github :repo
		    "company-mode/company-mode" :files
		    (:defaults "icons"
			       ("images/small"
				"doc/images/small/*.png"))
		    :source "MELPA" :id company :type git :protocol
		    https :inherit t :depth treeless :ref
		    "1cc907ac9e46ae4209eb5a341131787e0c678406"))
 (compat :source "elpaca-menu-lock-file" :recipe
	 (:package "compat" :repo
		   ("https://github.com/emacs-compat/compat"
		    . "compat")
		   :tar "31.0.0.2" :host gnu :files
		   ("*" (:exclude ".git")) :source "GNU ELPA" :id
		   compat :type git :protocol https :inherit t :depth
		   treeless :ref
		   "3e24d9740a5dc103ef40b148520e0187b19b8902"))
 (cond-let :source "elpaca-menu-lock-file" :recipe
	   (:package "cond-let" :fetcher github :repo
		     "tarsius/cond-let" :files
		     ("*.el" "*.el.in" "dir" "*.info" "*.texi"
		      "*.texinfo" "doc/dir" "doc/*.info" "doc/*.texi"
		      "doc/*.texinfo" "lisp/*.el" "docs/dir"
		      "docs/*.info" "docs/*.texi" "docs/*.texinfo"
		      (:exclude ".dir-locals.el" "test.el" "tests.el"
				"*-test.el" "*-tests.el" "LICENSE"
				"README*" "*-pkg.el"))
		     :source "MELPA" :id cond-let :type git :protocol
		     https :inherit t :depth treeless :ref
		     "3b88187fe067d4ca3dec3ef8a329b0ce18bdb356"))
 (consult :source "elpaca-menu-lock-file" :recipe
	  (:package "consult" :repo "minad/consult" :fetcher github
		    :files
		    ("*.el" "*.el.in" "dir" "*.info" "*.texi"
		     "*.texinfo" "doc/dir" "doc/*.info" "doc/*.texi"
		     "doc/*.texinfo" "lisp/*.el" "docs/dir"
		     "docs/*.info" "docs/*.texi" "docs/*.texinfo"
		     (:exclude ".dir-locals.el" "test.el" "tests.el"
			       "*-test.el" "*-tests.el" "LICENSE"
			       "README*" "*-pkg.el"))
		    :source "MELPA" :id consult :type git :protocol
		    https :inherit t :depth treeless :ref
		    "788735b54e5ad9d33137613aebae055443e3e05e"))
 (dash :source "elpaca-menu-lock-file" :recipe
       (:package "dash" :fetcher github :repo "magnars/dash.el" :files
		 ("dash.el" "dash.texi") :source "MELPA" :id dash
		 :type git :protocol https :inherit t :depth treeless
		 :ref "d746dd9edcb67a108818beb0cdc78dc1cb466832"))
 (doom-modeline :source "elpaca-menu-lock-file" :recipe
		(:package "doom-modeline" :repo
			  "seagle0128/doom-modeline" :fetcher github
			  :files
			  ("*.el" "*.el.in" "dir" "*.info" "*.texi"
			   "*.texinfo" "doc/dir" "doc/*.info"
			   "doc/*.texi" "doc/*.texinfo" "lisp/*.el"
			   "docs/dir" "docs/*.info" "docs/*.texi"
			   "docs/*.texinfo"
			   (:exclude ".dir-locals.el" "test.el"
				     "tests.el" "*-test.el"
				     "*-tests.el" "LICENSE" "README*"
				     "*-pkg.el"))
			  :source "MELPA" :id doom-modeline :type git
			  :protocol https :inherit t :depth treeless
			  :ref
			  "adbd6325be5f84eafbc85efb5685452a5ba489bf"))
 (elpaca :source
   "elpaca-menu-lock-file" :recipe
   (:source nil :package "elpaca" :id elpaca :repo
	    "https://github.com/progfolio/elpaca.git" :ref
	    "5b0cbb19421ef20c140b46a7b1fb7d04240b53f6" :depth 1
	    :inherit ignore :files
	    (:defaults "elpaca-test.el" (:exclude "extensions"))
	    :build (:not elpaca-activate) :type git :protocol https))
 (elpaca-use-package :source "elpaca-menu-lock-file" :recipe
		     (:package "elpaca-use-package" :wait t :repo
			       "https://github.com/progfolio/elpaca.git"
			       :files
			       ("extensions/elpaca-use-package.el")
			       :main
			       "extensions/elpaca-use-package.el"
			       :build
			       (:not elpaca-source elpaca-build-docs)
			       :source "Elpaca extensions" :id
			       elpaca-use-package :type git :protocol
			       https :inherit t :depth treeless :ref
			       "5b0cbb19421ef20c140b46a7b1fb7d04240b53f6"))
 (embark :source "elpaca-menu-lock-file" :recipe
	 (:package "embark" :repo "oantolin/embark" :fetcher github
		   :files ("embark.el" "embark-org.el" "embark.texi")
		   :source "MELPA" :id embark :type git :protocol
		   https :inherit t :depth treeless :ref
		   "87e53827cf6659dcc4ac4e54be9af34aeca44f6e"))
 (embark-consult :source "elpaca-menu-lock-file" :recipe
		 (:package "embark-consult" :repo "oantolin/embark"
			   :fetcher github :files
			   ("embark-consult.el") :source "MELPA" :id
			   embark-consult :type git :protocol https
			   :inherit t :depth treeless :ref
			   "87e53827cf6659dcc4ac4e54be9af34aeca44f6e"))
 (f :source "elpaca-menu-lock-file" :recipe
    (:package "f" :fetcher github :repo "rejeep/f.el" :files
	      ("*.el" "*.el.in" "dir" "*.info" "*.texi" "*.texinfo"
	       "doc/dir" "doc/*.info" "doc/*.texi" "doc/*.texinfo"
	       "lisp/*.el" "docs/dir" "docs/*.info" "docs/*.texi"
	       "docs/*.texinfo"
	       (:exclude ".dir-locals.el" "test.el" "tests.el"
			 "*-test.el" "*-tests.el" "LICENSE" "README*"
			 "*-pkg.el"))
	      :source "MELPA" :id f :type git :protocol https :inherit
	      t :depth treeless :ref
	      "931b6d0667fe03e7bf1c6c282d6d8d7006143c52"))
 (llama :source "elpaca-menu-lock-file" :recipe
	(:package "llama" :fetcher github :repo "tarsius/llama" :files
		  ("llama.el" ".dir-locals.el") :source "MELPA" :id
		  llama :type git :protocol https :inherit t :depth
		  treeless :ref
		  "4d4024048053b898a01521046e0f063ee47615b0"))
 (magit :source "elpaca-menu-lock-file" :recipe
	(:package "magit" :fetcher github :repo "magit/magit" :files
		  ("lisp/magit*.el" "lisp/git-*.el" "docs/magit.texi"
		   "docs/AUTHORS.md" "LICENSE" ".dir-locals.el"
		   ("githooks" "githooks/*")
		   ("git-hooks" "git-hooks/*")
		   (:exclude "lisp/magit-section.el"))
		  :source "MELPA" :id magit :type git :protocol https
		  :inherit t :depth treeless :ref
		  "659f89955cf60fe3d4326d881c412df06c69680d"))
 (magit-section :source "elpaca-menu-lock-file" :recipe
		(:package "magit-section" :fetcher github :repo
			  "magit/magit" :files
			  ("lisp/magit-section.el"
			   "docs/magit-section.texi"
			   "magit-section-pkg.el")
			  :source "MELPA" :id magit-section :type git
			  :protocol https :inherit t :depth treeless
			  :ref
			  "659f89955cf60fe3d4326d881c412df06c69680d"))
 (marginalia :source "elpaca-menu-lock-file" :recipe
	     (:package "marginalia" :repo "minad/marginalia" :fetcher
		       github :files
		       ("*.el" "*.el.in" "dir" "*.info" "*.texi"
			"*.texinfo" "doc/dir" "doc/*.info"
			"doc/*.texi" "doc/*.texinfo" "lisp/*.el"
			"docs/dir" "docs/*.info" "docs/*.texi"
			"docs/*.texinfo"
			(:exclude ".dir-locals.el" "test.el"
				  "tests.el" "*-test.el" "*-tests.el"
				  "LICENSE" "README*" "*-pkg.el"))
		       :source "MELPA" :id marginalia :type git
		       :protocol https :inherit t :depth treeless :ref
		       "d76d7e36185ab552240c14fb08f7abcbf9a2910c"))
 (modus-themes :source "elpaca-menu-lock-file" :recipe
	       (:package "modus-themes" :fetcher github :repo
			 "protesilaos/modus-themes" :files
			 ("*.el" "*.el.in" "dir" "*.info" "*.texi"
			  "*.texinfo" "doc/dir" "doc/*.info"
			  "doc/*.texi" "doc/*.texinfo" "lisp/*.el"
			  "docs/dir" "docs/*.info" "docs/*.texi"
			  "docs/*.texinfo"
			  (:exclude ".dir-locals.el" "test.el"
				    "tests.el" "*-test.el"
				    "*-tests.el" "LICENSE" "README*"
				    "*-pkg.el"))
			 :source "MELPA" :id modus-themes :type git
			 :protocol https :inherit t :depth treeless
			 :ref
			 "a3e7ba280524dfd4bdaf3169ef5901ac91dadb01"))
 (nerd-icons :source "elpaca-menu-lock-file" :recipe
	     (:package "nerd-icons" :repo
		       "rainstormstudio/nerd-icons.el" :fetcher github
		       :files (:defaults "data") :source "MELPA" :id
		       nerd-icons :type git :protocol https :inherit t
		       :depth treeless :ref
		       "17faac7977242b470732efd417d3bcc8eb5a830e"))
 (nerd-icons-completion :source "elpaca-menu-lock-file" :recipe
			(:package "nerd-icons-completion" :repo
				  "rainstormstudio/nerd-icons-completion"
				  :fetcher github :files
				  ("*.el" "*.el.in" "dir" "*.info"
				   "*.texi" "*.texinfo" "doc/dir"
				   "doc/*.info" "doc/*.texi"
				   "doc/*.texinfo" "lisp/*.el"
				   "docs/dir" "docs/*.info"
				   "docs/*.texi" "docs/*.texinfo"
				   (:exclude ".dir-locals.el"
					     "test.el" "tests.el"
					     "*-test.el" "*-tests.el"
					     "LICENSE" "README*"
					     "*-pkg.el"))
				  :source "MELPA" :id
				  nerd-icons-completion :type git
				  :protocol https :inherit t :depth
				  treeless :ref
				  "45b585d972192a3eaeb239e15e55de7f46f8920a"))
 (nerd-icons-dired :source "elpaca-menu-lock-file" :recipe
		   (:package "nerd-icons-dired" :repo
			     "rainstormstudio/nerd-icons-dired"
			     :fetcher github :files
			     ("*.el" "*.el.in" "dir" "*.info" "*.texi"
			      "*.texinfo" "doc/dir" "doc/*.info"
			      "doc/*.texi" "doc/*.texinfo" "lisp/*.el"
			      "docs/dir" "docs/*.info" "docs/*.texi"
			      "docs/*.texinfo"
			      (:exclude ".dir-locals.el" "test.el"
					"tests.el" "*-test.el"
					"*-tests.el" "LICENSE"
					"README*" "*-pkg.el"))
			     :source "MELPA" :id nerd-icons-dired
			     :type git :protocol https :inherit t
			     :depth treeless :ref
			     "104acd8879528b8115589f35f1bbcbe231ad732f"))
 (orderless :source "elpaca-menu-lock-file" :recipe
	    (:package "orderless" :repo "oantolin/orderless" :fetcher
		      github :files
		      ("*.el" "*.el.in" "dir" "*.info" "*.texi"
		       "*.texinfo" "doc/dir" "doc/*.info" "doc/*.texi"
		       "doc/*.texinfo" "lisp/*.el" "docs/dir"
		       "docs/*.info" "docs/*.texi" "docs/*.texinfo"
		       (:exclude ".dir-locals.el" "test.el" "tests.el"
				 "*-test.el" "*-tests.el" "LICENSE"
				 "README*" "*-pkg.el"))
		      :source "MELPA" :id orderless :type git
		      :protocol https :inherit t :depth treeless :ref
		      "51f677f464424ce3c46e3deacb7709784795a03b"))
 (posframe :source "elpaca-menu-lock-file" :recipe
	   (:package "posframe" :fetcher github :repo
		     "tumashu/posframe" :files
		     ("*.el" "*.el.in" "dir" "*.info" "*.texi"
		      "*.texinfo" "doc/dir" "doc/*.info" "doc/*.texi"
		      "doc/*.texinfo" "lisp/*.el" "docs/dir"
		      "docs/*.info" "docs/*.texi" "docs/*.texinfo"
		      (:exclude ".dir-locals.el" "test.el" "tests.el"
				"*-test.el" "*-tests.el" "LICENSE"
				"README*" "*-pkg.el"))
		     :source "MELPA" :id posframe :type git :protocol
		     https :inherit t :depth treeless :ref
		     "6f89c0acd29306cb2cd023418d18134cfc507800"))
 (queue :source "elpaca-menu-lock-file" :recipe
	(:package "queue" :repo
		  ("https://github.com/emacsmirror/gnu_elpa" . "queue")
		  :tar "0.2" :host gnu :branch "externals/queue"
		  :files ("*" (:exclude ".git")) :source "GNU ELPA"
		  :id queue :type git :protocol https :inherit t
		  :depth treeless :ref
		  "f986fb68e75bdae951efb9e11a3012ab6bd408ee"))
 (s :source "elpaca-menu-lock-file" :recipe
    (:package "s" :fetcher github :repo "magnars/s.el" :files
	      ("*.el" "*.el.in" "dir" "*.info" "*.texi" "*.texinfo"
	       "doc/dir" "doc/*.info" "doc/*.texi" "doc/*.texinfo"
	       "lisp/*.el" "docs/dir" "docs/*.info" "docs/*.texi"
	       "docs/*.texinfo"
	       (:exclude ".dir-locals.el" "test.el" "tests.el"
			 "*-test.el" "*-tests.el" "LICENSE" "README*"
			 "*-pkg.el"))
	      :source "MELPA" :id s :type git :protocol https :inherit
	      t :depth treeless :ref
	      "d7c04b84d03481a1ed62ee13dbe595224ccbe57c"))
 (shrink-path :source "elpaca-menu-lock-file" :recipe
	      (:package "shrink-path" :fetcher gitlab :repo
			"bennya/shrink-path.el" :files
			("*.el" "*.el.in" "dir" "*.info" "*.texi"
			 "*.texinfo" "doc/dir" "doc/*.info"
			 "doc/*.texi" "doc/*.texinfo" "lisp/*.el"
			 "docs/dir" "docs/*.info" "docs/*.texi"
			 "docs/*.texinfo"
			 (:exclude ".dir-locals.el" "test.el"
				   "tests.el" "*-test.el" "*-tests.el"
				   "LICENSE" "README*" "*-pkg.el"))
			:source "MELPA" :id shrink-path :type git
			:protocol https :inherit t :depth treeless
			:ref
			"c14882c8599aec79a6e8ef2d06454254bb3e1e41"))
 (treesit-auto :source "elpaca-menu-lock-file" :recipe
	       (:package "treesit-auto" :fetcher github :repo
			 "renzmann/treesit-auto" :files
			 ("*.el" "*.el.in" "dir" "*.info" "*.texi"
			  "*.texinfo" "doc/dir" "doc/*.info"
			  "doc/*.texi" "doc/*.texinfo" "lisp/*.el"
			  "docs/dir" "docs/*.info" "docs/*.texi"
			  "docs/*.texinfo"
			  (:exclude ".dir-locals.el" "test.el"
				    "tests.el" "*-test.el"
				    "*-tests.el" "LICENSE" "README*"
				    "*-pkg.el"))
			 :source "MELPA" :id treesit-auto :type git
			 :protocol https :inherit t :depth treeless
			 :ref
			 "3106c739c2a84bec2cb671997fe074e5dd5dd967"))
 (undo-tree :source "elpaca-menu-lock-file" :recipe
	    (:package "undo-tree" :repo
		      ("https://gitlab.com/tsc25/undo-tree"
		       . "undo-tree")
		      :tar "0.8.2" :host gnu :files
		      ("*" (:exclude ".git")) :source "GNU ELPA" :id
		      undo-tree :type git :protocol https :inherit t
		      :depth treeless :ref
		      "2bf5e230f1d11df7bbd9d8c722749e34482bc458"))
 (vertico :source "elpaca-menu-lock-file" :recipe
	  (:package "vertico" :repo "minad/vertico" :files
		    (:defaults "extensions/vertico-*.el") :fetcher
		    github :source "MELPA" :id vertico :type git
		    :protocol https :inherit t :depth treeless :ref
		    "493ac505168006b008b0504366614ee17c63d844"))
 (which-key :source "elpaca-menu-lock-file" :recipe
	    (:package "which-key" :repo "justbur/emacs-which-key"
		      :fetcher github :files
		      ("*.el" "*.el.in" "dir" "*.info" "*.texi"
		       "*.texinfo" "doc/dir" "doc/*.info" "doc/*.texi"
		       "doc/*.texinfo" "lisp/*.el" "docs/dir"
		       "docs/*.info" "docs/*.texi" "docs/*.texinfo"
		       (:exclude ".dir-locals.el" "test.el" "tests.el"
				 "*-test.el" "*-tests.el" "LICENSE"
				 "README*" "*-pkg.el"))
		      :source "MELPA" :id which-key :type git
		      :protocol https :inherit t :depth treeless :ref
		      "38d4308d1143b61e4004b6e7a940686784e51500"))
 (with-editor :source "elpaca-menu-lock-file" :recipe
	      (:package "with-editor" :fetcher github :repo
			"magit/with-editor" :files
			("*.el" "*.el.in" "dir" "*.info" "*.texi"
			 "*.texinfo" "doc/dir" "doc/*.info"
			 "doc/*.texi" "doc/*.texinfo" "lisp/*.el"
			 "docs/dir" "docs/*.info" "docs/*.texi"
			 "docs/*.texinfo"
			 (:exclude ".dir-locals.el" "test.el"
				   "tests.el" "*-test.el" "*-tests.el"
				   "LICENSE" "README*" "*-pkg.el"))
			:source "MELPA" :id with-editor :type git
			:protocol https :inherit t :depth treeless
			:ref
			"5021ef6885381cf5b2852f7a3f67ca8c4be1dca2")))
