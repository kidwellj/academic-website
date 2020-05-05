### Build and deploy https://jeremykidwell.info

### If you want to use this file as-is, then you
### need to change the variables below to your
### own SSH user, document root, etc.
### However, you will most likely also want to
### customize the various steps (e.g. the css target)
### so that it matches the details of your own
### setup.
### 
### Apart from hugo, you will also need rsync to deploy
### the site, and the java-based yuicompressor to
### minify the CSS, should you keep that step.


SSH_USER = jeremyki@jeremykidwell.info
STAGING_USER = 
DOCUMENT_ROOT = /home/jeremyki/public_html
STAGING_ROOT = ~/gits/jeremykidwell.info
PUBLIC_DIR = public/
HUGO_EXECUTABLE = /usr/local/bin/hugo


staging: site
	rsync -crzve 'ssh -p 22' $(PUBLIC_DIR) $(STAGING_USER):$(STAGING_ROOT)

server: /usr/local/bin/hugo server -ws .

rsync: 	rsync -crzve 'ssh -p 22' $(PUBLIC_DIR) $(SSH_USER):$(DOCUMENT_ROOT)

site: css .FORCE
	$(HUGO_EXECUTABLE)
	find $(PUBLIC_DIR) -type d -print0 | xargs -0 chmod 755
	find $(PUBLIC_DIR) -type f -print0 | xargs -0 chmod 644

clean:	rm -rf public/

.FORCE:
