---
---
PATH := ../node_modules/.bin:$(PATH)

FA_ROOT_DIRECTORY = assets/font-awesome
FA_LESS_DIRECTORY = assets/font-awesome/less
FA_SCSS_DIRECTORY = assets/font-awesome/scss
FA_CSS_DIRECTORY = assets/font-awesome/css

FA_LESS_MODERN = ${FA_LESS_DIRECTORY}/font-awesome.less
FA_LESS_FONT = ${FA_LESS_DIRECTORY}/font-awesome-font.less
FA_SCSS_MODERN = ${FA_SCSS_DIRECTORY}/font-awesome.scss

FA_CSS_MODERN = ${FA_CSS_DIRECTORY}/font-awesome.css
FA_CSS_MODERN_MIN = ${FA_CSS_DIRECTORY}/font-awesome.min.css
FA_CSS_FONT = ${FA_CSS_DIRECTORY}/font-awesome-font.css

SITE_LESS_DIRECTORY = assets/less
SITE_CSS_DIRECTORY = assets/css

SITE_LESS = ${SITE_LESS_DIRECTORY}/site.less
SITE_CSS = ${SITE_CSS_DIRECTORY}/site.css

build:
	@echo "Compiling Less files"
	@mkdir -p ${FA_CSS_DIRECTORY}

	bundle exec lessc ${FA_LESS_MODERN} > ${FA_CSS_MODERN}
	bundle exec lessc ${FA_LESS_FONT} > ${FA_CSS_FONT}

	bundle exec lessc --compress ${FA_LESS_MODERN} > ${FA_CSS_MODERN_MIN}

#	sass ${FA_SCSS_MODERN} ${FA_CSS_MODERN}

#	bundle exec lessc --yui-compress ${SITE_LESS} > ${SITE_CSS}
	cp -r ${FA_ROOT_DIRECTORY}/* ../
	mv README.md-nobuild ../README.md
	cd ${FA_ROOT_DIRECTORY} && zip -r9 font-awesome.zip css fonts

	find .. -type f ! -perm 644 -exec chmod 644 {} \;

default: build


.PHONY: build
