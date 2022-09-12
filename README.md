Website for Wing Ying Chow's Lab at University of Warwick, UK
=============================================================

[https://wychowlab.org/](https://wychowlab.org/)


Background
=======================

This is a [Jekyll][]-based Web site based on the work of the [sampa][] group at the University of Washington. It was forked from [this repository][uwsamparepo] and detached after significant modifications.

This work is licensed under a [Creative Commons Attribution-NonCommercial 4.0 International License][license].

[Jekyll]: http://jekyllrb.com/
[sampa]: http://sampa.cs.washington.edu/
[license]: https://creativecommons.org/licenses/by-nc/4.0/
[uwsamparepo]: https://github.com/uwsampa/research-group-web

Modifications from uwsampa template
--------
- adapted and optimized the build process for [GitHub Pages](https://pages.github.com/)
- improved `.gitignore` using [Toptal's gitignore tool](https://www.toptal.com/developers/gitignore/)
- added Gemfile for a consistent Jekyll build environment using [Bundler][]
- added [jekyll-seo-tag plugin][jekyll-seo-tag], mostly for improved [Twitter cards][twittercards]
- added jekyll-feed and jekyll-sitemap plugins
- updated from [Bootstrap][] 3 to 5
- updated from [Font Awesome][fa] 4 to 6, originally for the ORCID logo, but possibly now more for the [fun effects](https://fontawesome.com/docs/web/style/animate)
- updated from [jQuery][] 3.5.1 to 3.6.1
- added [favicon generated from fontawesome](https://gauger.io/fonticon/)
- used [pylatexenc][pylatexenc] to convert LaTeX-encoded parts of website back to text
- refactored parts of default.html/index.html as includes
- typography: test with [Fontjoy][], served with [Google web fonts][gwf]
- implemented some accessibility provisions such as `alt` tags for images and screen readers (`aria`)
- renamed master to main (see [github/renaming](https://github.com/github/renaming))
- removed "faculty" as being used for a single-PI lab website
- added [lightbox][]
- implemented a covers gallery on the publication page
- implemented checking for broken links using [html-proofer][] (gem)

[Bundler]: https://bundler.io/
[jekyll-seo-tag]: https://github.com/jekyll/jekyll-seo-tag
[twittercards]: https://developer.twitter.com/en/docs/twitter-for-websites/cards/overview/abouts-cards
[pylatexenc]: https://pylatexenc.readthedocs.io/en/latest/latex2text/
[fontjoy]: https://fontjoy.com/
[gwf]: https://fonts.google.com/
[jQuery]: https://jquery.com/
[lightbox]: https://lokeshdhakar.com/projects/lightbox2/
[html-proofer]: https://github.com/gjtorikian/html-proofer

Documentation
=======================

Features
--------

* Thanks to [Jekyll][], content is just text files.
* Publications list generated from BibTeX.
* Personnel list. Organize your professors, students, staff, and alumni.
* Combined news stream and blog posts.
* Easily extensible navigation bar.
* Responsive (mobile-ready) design based on [Bootstrap][].

[Bootstrap]: http://getbootstrap.com/


Setup
-----

This repository is serving the website of WYChow lab. You are welcome to fork it though it is not set up as a template, and bugs are likely to be introduced instead of fixed!

1. Install the dependencies. You will need:
    - [Python 3][Python]
        - [pip](https://pypi.org/project/pip/)
        - [bibble][] (`pip install bibble`)
    - [Ruby](https://www.ruby-lang.org/en/): on Ubuntu I did `apt install ruby-all`
        - `gem` was included
        - [Jekyll][] and [Bundler][] (`gem install jekyll bundler`).
    - Recommendation: use [Visual Studio Code](https://code.visualstudio.com/)
2. [Fork][fork] this repository on GitHub.
3. Clone the fork to your own machine: `git clone git@github.com:yourgroup/research-group-web.git`.
4. Customize. Start with the `_config.yml` file, where you enter the name of the site and its URL, plus SEO values.
5. Get bundler to install required gems for the build environment `bundle update`
6. Type `make` to build the site and then run `make serve` to view your site.
7. Keep adding content. See below for instructions for each of the various sections.

[bibble]: https://github.com/sampsyo/bibble/
[Python]: https://www.python.org/
[fork]: https://github.com/wychowlab/research-group-web/fork


Publication List
----------------

The list of publications is in `bib/pubs.bib`. Typing `make` will generate `pubs.html`, which contains a pretty, sorted HTML-formatted list of papers. The public page, `publications.html`, also has a link to download the original BibTeX.


News Items and Blog Posts
-------------------------

For both long-form blog posts and short news updates, we use Jekyll's blogging system. To post a new item of either type, you create a file in the `_posts` directory using the naming convention `YYYY-MM-DD-title-for-url.md`. The date part of the filename always matters; the title part is currently only used for full blog posts (but is still required for news updates).

The file must begin with [YAML front matter][yfm]. For news updates, use this:

    ---
    layout: post
    shortnews: true
    ---

For full blog posts, use this format:

    ---
    layout: post
    title:  "Some Great Title Here"
    ---

And concoct a page title for your post. The body of the post goes after the `---` in either case.

You can also customize the icon that is displayed on the news feed. By default it's `newspaper-o`, an icon from the [Font Awesome][fa] icon set.

[yfm]: http://jekyllrb.com/docs/frontmatter/
[fa]: http://fontawesome.io/icons/

Projects
--------

To create a project, just create a markdown file in the `_projects` folder. Here are the things you can put in the YAML frontmatter:

- `title:` The project title.
- `notitle:` Set this to `true` if you don't want a title displayed on the project card. Optional.
- `description:` The text shown in the project card. It supports markdown.
- `people:` The people working on the project. This is a list of keys from the `_data/people.yml` file.
- `layout: project` This sets the layout of the actual project page. It should be set to `project`.
- `image:` The URL of an image for the project. This is shown on both the project page and the project card. Optional.
- `last-updated:` Date in the format of `YYYY-MM-DD`. The project cards are sorted by this, most recent first.
- `status: inactive` Set this to `inactive` if don't want the project to appear on the front page. Just ignore it otherwise.
- `link:` Set this to an external URL if this project has a page somewhere else on the web. If you don't have a `link:`, then the content of this markdown file (below the YAML frontmatter) will be this project's page.
- `no-link: true` Set this if you just don't want a project page for your project.

Personnel
---------

People are listed in a [YAML][] file in `_data/people.yml`. You can list the name, link, bio, and role of each person. 

Roles (e.g., "Postdoc", and "PhD students") are defined in `_data/roles.yml`.

[YAML]: https://en.wikipedia.org/wiki/YAML


Building
--------

The requirements for building the site are:

* [Bundler][]: run `gem install bundler`
* [Jekyll][]: run `gem install jekyll`
* gems listed in the Gemfile - though you can comment out parts you don't need
* [bibble][]: available on `pip`
* ssh and rsync, only if you want to deploy directly.

`make` compiles the bibliography and the website content to the `docs`
directory. To preview the site, run `make serve`` and head to
http://localhost:4000.


Deploying to GitHub Pages
-----------------------

This template is optimized for hosting the site on GitHub Pages using a custom domain in `CNAME`. You can pick which branch you deploy the site on. A new commit/push to GitHub will trigger a rebuild.


