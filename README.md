# Writing

A repository for some of my writing. All in Markdown format.

If you stumble across this repository of my writing while checking out my code repo and wonder, “Why is this here?” My answer is basically: Why not?

It helps me keep track of revisions and is motivating me to finalize a lot of rough drafts I have. I do a lot of coding and documentation each day and like Markdown and GitHub so I’m just using the tools I have to help refine and focus another aspect of my creative self.

***

***NOTE:** This is a nice Awk one-liner to do basic Markdown link formatting of everything in the directory.*

    ls -1 *.md | awk '{ split($0,split_name,"."); printf "* [%s](%s)\n", split_name[1], split_name[1] }'