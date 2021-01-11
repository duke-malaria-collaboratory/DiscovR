teaching: 90
exercises: 30
[![Piled Higher and Deeper by Jorge Cham, http://www.phdcomics.com/comics/archive_print.php?comicid=1531]({{ page.root }}/fig/git/phd101212s.png)](http://www.phdcomics.com)
![Changes Are Saved Sequentially]({{ page.root }}/fig/git/play-changes.svg)
![Different Versions Can be Saved]({{ page.root }}/fig/git/versions.svg)
![Multiple Versions Can be Merged]({{ page.root }}/fig/git/merge.svg)
>cd ~/Desktop/un-report
> On Windows' Unix subsystem for Linux:
.	..	.git	code	data	figures
> Despite our concerns, Riley creates a `countries` project inside their `un-report`
Let's create a file called `README.md`. We'll write some notes about the plot we
have made so far -- later we'll add more details about the project. We'll use
`nano` to edit the file; you can use whatever text editor you like.
$ nano README.md
Type the text below into the `README.md` file:
README.md
`README.md` contains a single line, which we can see by running:
$ cat README.md
	README.md
$ git add README.md
	new file:   README.md
Git now knows that it's supposed to keep track of `README.md`,
 create mode 100644 README.md
> If we run `ls` at this point, we will still see just one file called `README.md`.
$ nano README.md
$ cat README.md
	modified:   README.md
diff --git a/README.md b/README.md
--- a/README.md
+++ b/README.md
	modified:   README.md
$ git add README.md
> or you might find yourself searching for "how to undo a commit" more
> We'll show you how to do this a little later with a command called `revert`.
![The Git Staging Area]({{ page.root }}/fig/git/git-staging-area.svg)
$ nano README.md
$ cat README.md
diff --git a/README.md b/README.md
--- a/README.md
+++ b/README.md
$ git add README.md
diff --git a/README.md b/README.md
--- a/README.md
+++ b/README.md
>    $ touch analysis/file-1.txt analysis/file-2.txt
>    Note: the `touch` command creates blank text files that you can later edit
>    with your preferred text editor.
>
>    $ git commit -m "Create blank text files"
![The Git Commit Workflow]({{ page.root }}/fig/git/git-committing.svg)
> last commit made to `README.md`?
> 2. "Added line 'Continents are grouped by color.' to README.md"
> 1. Add some text to `README.md` noting your decision
> to consider writing a manuscript.
> 2. Create a new file `manuscript.txt` with your initial thoughts.
> > First we make our changes to the `README.md` and `manuscript.txt` files:
> > $ nano README.md
> > $ cat README.md
> > This is where I will write an awesome manuscript.
> > $ git add README.md manuscript.txt
> > $ git add README.md
> > $ git commit -m "Note plans to start a draft manuscript"
> >  Note plans to start a draft manuscript
We've been adding one line at a time to `README.md`, so it's easy to track our
let's make a change to `README.md`, adding yet another line.
$ nano README.md
$ cat README.md
An ill-considered change.
$ git diff HEAD README.md
diff --git a/README.md b/README.md
--- a/README.md
+++ b/README.md
$ git diff HEAD~1 README.md
$ git diff HEAD~3 README.md
diff --git a/README.md b/README.md
--- a/README.md
+++ b/README.md
$ git show HEAD~3 README.md
    Make a change that I'll regret later
diff --git a/README.md b/README.md
+++ b/README.md
$ git diff f22b25e3233b4645dabd0d81e651fe074bd8e73b README.md
diff --git a/README.md b/README.md
--- a/README.md
+++ b/README.md
$ git diff f22b25e README.md
diff --git a/README.md b/README.md
--- a/README.md
+++ b/README.md
`README.md` (the "ill-considered change").
    modified:   README.md
$ git checkout HEAD README.md
$ cat README.md
$ git checkout f22b25e README.md
$ cat README.md
    modified:   README.md
$ git checkout HEAD README.md
> $ git checkout f22b25e README.md
> to revert `README.md` to its state after the commit `f22b25e`. But be careful!
> if you forget `README.md` in the previous command.
> HEAD is now at f22b25e Make a change that I'll regret later
![Git Checkout]({{ page.root }}/fig/git/git-checkout.svg)
> what is the missing command in step 1 below?
>
> > ## Solution
> >
> > Use `git log` to look at the git history to find the commit ID.
> {: .solution}
> $ echo "Here are my notes from the workshop." > notes.txt
> $ git add notes.txt
> $ echo "I learned the unix shell, git & github, and the R programming language." >> notes.txt
> $ git commit -m "Create workshop notes"
> $ git checkout HEAD notes.txt
> $ cat notes.txt #this will print the contents of notes.txt to the screen
>    I learned the unix shell, git & github, and the R programming language.
>    Here are my notes from the workshop.
>    Here are my notes from the workshop.
>    I learned the unix shell, git & github, and the R programming language.
>    Error because you have changed notes.txt without committing the changes
> > The command `git add notes.txt` places the current version of `notes.txt` into the staging area.
> > So, when `git commit -m "Create workshop notes"` is executed,
> > the version of `notes.txt` committed to the repository is the one from the staging area and
> >  `git status` will show that the file is modified). However, `git checkout HEAD notes.txt`
> >  replaces the working copy with the most recently committed version of `notes.txt`.
> >  So, `cat notes.txt` will output
> >  ```
> >  Here are my notes from the workshop..
> Consider this command: `git diff HEAD~3 README.md`. What do you predict this command
> > ## Solution
> > The diff will show the difference between the current version of README.md
> > and the version that existed 3 commits ago.
> {. :solution}
>
> Try another command, `git diff [ID] README.md`, where [ID] is replaced with
>
> > ## Solution
> >
> > The diff will show the difference between the current version of README.md
> > and the version that exited in the commit from [ID].
> {. :solution}
> Make a change to `README.md`, add that change, and use `git checkout` to see if
>
> > ## Solution
> >
> > `git checkout README.md` does not work for this purpose.
> > Instead, use the restore command with the staged flag:
> > `git restore --staged README.md`
> {: .solution}
> You would like to find a commit that modifies some specific text in `README.md`.
> e.g., `git diff README.md`. We can apply a similar idea here.
> $ git log README.md
> $ git log --patch README.md
![Creating a Repository on GitHub (Step 1)]({{ page.root }}/fig/git/github-create-repo-01.png)
![Creating a Repository on GitHub (Step 2)]({{ page.root }}/fig/git/github-create-repo-02.png)
![Creating a Repository on GitHub (Step 3)]({{ page.root }}/fig/git/github-create-repo-03.png)
committed our earlier work on `README.md`, we had a diagram of the local repository
![The Local Repository with Git Staging Area]({{ page.root }}/fig/git/git-staging-area.svg)
![Freshly-Made GitHub Repository]({{ page.root }}/fig/git/git-freshly-made-github-repo.svg)
Note that our local repository still contains our earlier work on `README.md`, but the
![Where to Find Repository URL on GitHub]({{ page.root }}/fig/git/github-find-repo-string.png)
![GitHub Repository After First Push]({{ page.root }}/fig/git/github-repo-after-first-push.svg)
![Adding Collaborators on GitHub]({{ page.root }}/fig/git/github-add-collaborators.png)
> Some backup software (e.g. Time Machine on macOS, Google Drive) can keep a
> history of the versions of your files.
> They also allow you to recover specific versions.
> How is this functionality different from version control?
>
> > ## Solution
> >
> > Automated back software gives you less control over how often backups are
> > created and it is often difficult to compare changes between backups.
> > However, Git has a steeper learning curve than backup software.
> > Advantages of using Git and GitHub for version control include:
> >   - Great control over which files to include in commits and when to make commits.
> >   - Very popular way to collaborate on code and analysis projects among
        programmers, data scientists, and researchers.
> >   - Free and open source.
> >   - GitHub allows you to share your project with the world and accept
        contributions from outside collaborators.
> {: .solution}