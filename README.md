This is the source code for my [personal website](https://rewong.tech). It's based off of [Hugo Coder theme](https://github.com/luizdepra/hugo-coder/), but I've made minor
changes to create the [projects page](https://rewong.tech/projects) and the [project info pages](https://rewong.tech/projects/d-gen). I provide documentation below to show 
how to utilize these modifications.

## Projects Page
In Hugo Coder, content pages placed within a subdirectory of the `content` folder are rendered using the `list.html` partial. To change this to our custom projects page, 
first, add the following front matter into an `_index.md` file in the subdirectory:

```
title: "Projects"
author: "Ryan Wong"
date: "2020-06-01"
slug: "projects"
is_gh_projects: true
```

Now, additional parameters can be set in the front matter of each content file to modify how the projects page looks:

- `title`
  - Title of page to display
- `date`
  - Date of page to display
- `gh_repo`
  - Link to GitHub repo of project. Additional information about the project such as project language, forks, and starts are retrieved and displayed using the GitHub API.
- `project_link`
  - Link to project if the project is not hosted on GitHub or of the link is not a GitHub Repo.
- `project_language`
  - Language of the project if a `project_link` is provided instead of a `gh_repo` link
- `summary`
  - A summary of the project. Project summaries are truncated to 150 characters. If no summary is provided, the first 150 characters of the content file will be used instead.

## Project Info Page
In Hugo Coder, content pages are normally rendered with the `page.html` partial. To change this to our custom project info page, add this line to the front matter of your file:

```
project_page: true
```

Now, additional parameters can be set in the frontmatter of each content file to modify how the info page looks:

- `title`
  - Title of project
- `short_description`
  - A short description of the project to display
- `technologies`
  - A list of strings containing any tools/softwares used
- `team`
  - A list of strings containing contributors to the project
- `time`
  - How long you worked on the project for
- `project_image_tag_file`
  - Path to a file containing the HTML code of the image. An example can be found [here](https://github.com/rewong03/rewong03_site_source/blob/master/static/images/projects/d-gen/title_image.txt). 
SVG are automatically set to match the light/dark modes of the theme.

The text in the content file is split up into user-defined sections. The start of a section is defined using the pattern `[SECTION NAME]:\n` (since content pages are written in 
markdown, the newline character is typed by using two spaces and an enter). The end of a section is defined using the pattern `[END]`. Here is an example:  
  
```
[About]:
[d-gen](https://github.com/raulcf/d-gen) is a project that I developed as part of the [2020 CDAC Summer Lab](https://cdac.uchicago.edu/engage/summerlab/#project-profiles)
under the mentorship of [Professor Raul Castro-Ferenandez](https://raulcastrofernandez.com). The purpose of d-gen is to synthetically
generate relational databases that adhere to a user-defined schema for the purposes of query testing and optimization.[END]
```
