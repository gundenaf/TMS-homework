```bash
<!-- TASK 1 -->
slava@phobos:~/git-projects/$ git config --global user.name "Slava Mikhalenka"
slava@phobos:~/git-projects/$ git config --global user.email gundenaf@gmail.com
slava@phobos:~/git-projects/$ git clone https://github.com/gundenaf/tms-git.git
Cloning into 'tms-git'...
warning: You appear to have cloned an empty repository.
slava@phobos:~/git-projects/$ cd tms-git/
slava@phobos:~/git-projects/tms-git$ ls -l
total 4
drwxr-xr-x 3 slava slava 4096 Dec 23  2020 wild_animals
slava@phobos:~/git-projects/tms-git$ git add wild_animals/
slava@phobos:~/git-projects/tms-git$ git status
On branch main

No commits yet

Changes to be committed:
  (use "git rm --cached <file>..." to unstage)
        new file:   wild_animals/index.html
        new file:   wild_animals/pictures/elephant.jpg
        new file:   wild_animals/pictures/giraffe.jpg
        new file:   wild_animals/pictures/paw_print.jpg
slava@phobos:~/git-projects/tms-git$ cat .git/index
DIRCd�*��{_����������%�J���,�>��.4/T^�wild_animals/index.htmld�*��{_����������Kb����ZY��+-3D"wild_animals/pictures/elephant.jpgd�*��{_���)�������軍X�D�H���NE��nh!wild_animals/pictures/giraffe.jpgd�*��{_���(����`���.R�#ɭ�.��Fd�9�#wild_animals/pictures/paw_print.jpge����_+
                                                                                                            v]�
                                                                                                               ��0?,�
slava@phobos:~/git-projects/tms-git$ ls -l .git/objects/
total 24
drwxr-xr-x 2 slava slava 4096 Jun 18 18:12 9f
drwxr-xr-x 2 slava slava 4096 Jun 18 18:12 ce
drwxr-xr-x 2 slava slava 4096 Jun 18 18:12 e9
drwxr-xr-x 2 slava slava 4096 Jun 18 18:12 eb
drwxr-xr-x 2 slava slava 4096 Jun 18 18:09 info
drwxr-xr-x 2 slava slava 4096 Jun 18 18:09 pack
slava@phobos:~/git-projects/tms-git$ git push
Enumerating objects: 8, done.
Counting objects: 100% (8/8), done.
Delta compression using up to 12 threads
Compressing objects: 100% (7/7), done.
Writing objects: 100% (8/8), 82.89 KiB | 27.63 MiB/s, done.
Total 8 (delta 0), reused 0 (delta 0), pack-reused 0
To https://github.com/gundenaf/tms-git.git
 * [new branch]      main -> main
 slava@phobos:~/git-projects/tms-git$ git log
commit 47124ca66011e1c27c1bfb1c07ea9083ec88f820 (HEAD -> main, origin/main)
Author: Slava Mikhalenka <gundenaf@gmail.com>
Date:   Sun Jun 18 18:13:47 2023 +0200

    Added directory wild_animals
slava@phobos:~/git-projects/tms-git$ nano wild_animals/index.html
<!-- fix Elephant -->
slava@phobos:~/git-projects/tms-git$ git add wild_animals/index.html
slava@phobos:~/git-projects/tms-git$ git commit -m "Fix Elephant in index.html"
[main e740660] Fix Elephant in index.html
 1 file changed, 1 insertion(+), 1 deletion(-)
slava@phobos:~/git-projects/tms-git$ git push
Enumerating objects: 7, done.
Counting objects: 100% (7/7), done.
Delta compression using up to 12 threads
Compressing objects: 100% (3/3), done.
Writing objects: 100% (4/4), 376 bytes | 376.00 KiB/s, done.
Total 4 (delta 1), reused 0 (delta 0), pack-reused 0
remote: Resolving deltas: 100% (1/1), completed with 1 local object.
To https://github.com/gundenaf/tms-git.git
   47124ca..e740660  main -> main

<!-- TASK 2 -->
slava@phobos:~/git-projects$ git clone https://github.com/smartiqaorg/geometric_lib
Cloning into 'geometric_lib'...
remote: Enumerating objects: 35, done.
remote: Counting objects: 100% (18/18), done.
remote: Compressing objects: 100% (12/12), done.
remote: Total 35 (delta 8), reused 6 (delta 6), pack-reused 17
Receiving objects: 100% (35/35), 4.25 KiB | 4.25 MiB/s, done.
Resolving deltas: 100% (9/9), done.
slava@phobos:~/git-projects$ cd geometric_lib/
slava@phobos:~/git-projects/geometric_lib$ git checkout feature
branch 'feature' set up to track 'origin/feature'.
Switched to a new branch 'feature'
slava@phobos:~/git-projects/geometric_lib$ git checkout develop
branch 'develop' set up to track 'origin/develop'.
Switched to a new branch 'develop'
slava@phobos:~/git-projects/geometric_lib$ git log --graph --oneline --decorate --all
* 86edb1c (origin/release) L-05: Update Docs. Add user agreement info
* 438b89a L-05: Add user agreement
* 6adb962 L-03: Docs added
| * 3049431 (origin/feature, feature) L-04: Add rectangle.py
| | * b5b0fae (HEAD -> develop, origin/develop) L-04: Update docs for calculate.py
| | * d76db2a L-04: Add calculate.py
| | * 51c40eb L-04: Doc updated for triangle
| | * d080c78 L-04: Triangle added
| |/
| * d078c8d (origin/main, origin/HEAD, main) L-03: Docs added
|/
* 8ba9aeb L-03: Circle and square added
slava@phobos:~/git-projects/geometric_lib$ git checkout feature
Switched to branch 'feature'
Your branch is up to date with 'origin/feature'.
slava@phobos:~/git-projects/geometric_lib$ git log
commit d078c8d9ee6155f3cb0e577d28d337b791de28e2 (HEAD -> feature, origin/main, origin/HEAD, main)
Author: smartiqa <info@smartiqa.ru>
Date:   Thu Mar 4 14:55:29 2021 +0300

    L-03: Docs added

commit 8ba9aeb3cea847b63a91ac378a2a6db758682460
Author: smartiqa <info@smartiqa.ru>
Date:   Thu Mar 4 14:54:08 2021 +0300

    L-03: Circle and square added
slava@phobos:~/git-projects/geometric_lib$ git revert HEAD
[feature 74a2472] Revert "L-03: Docs added"
 1 file changed, 10 deletions(-)
 delete mode 100644 docs/README.md
slava@phobos:~/git-projects/geometric_lib$ git checkout develop
Switched to branch 'develop'
Your branch is up to date with 'origin/develop'.
slava@phobos:~/git-projects/geometric_lib$ git log
commit b5b0fae727ca72c317c383b39c0af73d6adcd81c (HEAD -> develop, origin/develop)
Author: Daniil.K <dlkay@yandex.ru>
Date:   Tue Mar 30 18:02:23 2021 +0300

    L-04: Update docs for calculate.py

commit d76db2ac7f69cc920ae2e6f669fb0671a7fa7d71
Author: Daniil.K <dlkay@yandex.ru>
Date:   Tue Mar 30 17:57:42 2021 +0300

    L-04: Add calculate.py

commit 51c40ebfd0e0b65f52fe5e54740cbb038e492db3
Author: smartiqa <info@smartiqa.ru>
Date:   Fri Mar 26 14:52:26 2021 +0300

    L-04: Doc updated for triangle

commit d080c7888b81955bad2ed78d58ad910526b5132a
Author: smartiqa <info@smartiqa.ru>
Date:   Fri Mar 26 14:48:39 2021 +0300

    L-04: Triangle added

commit d078c8d9ee6155f3cb0e577d28d337b791de28e2 (origin/main, origin/HEAD, main)
Author: smartiqa <info@smartiqa.ru>
Date:   Thu Mar 4 14:55:29 2021 +0300

    L-03: Docs added

commit 8ba9aeb3cea847b63a91ac378a2a6db758682460
Author: smartiqa <info@smartiqa.ru>
Date:   Thu Mar 4 14:54:08 2021 +0300

    L-03: Circle and square added
slava@phobos:~/git-projects/geometric_lib$ git rebase -i HEAD~2
[detached HEAD 3432dcb] L-04: Add calculate.py and Update docs for calculate.py
 Author: Daniil.K <dlkay@yandex.ru>
 Date: Tue Mar 30 17:57:42 2021 +0300
 2 files changed, 50 insertions(+), 8 deletions(-)
 create mode 100644 calculate.py
Successfully rebased and updated refs/heads/develop.
slava@phobos:~/git-projects/geometric_lib$ git checkout main
Switched to branch 'main'
Your branch is up to date with 'origin/main'.
slava@phobos:~/git-projects/geometric_lib$ git branch experiment main
slava@phobos:~/git-projects/geometric_lib$ git checkout experiment
Switched to branch 'experiment'
slava@phobos:~/git-projects/geometric_lib$ git checkout develop -- docs/README.md
slava@phobos:~/git-projects/geometric_lib$ git checkout develop
Switched to branch 'develop'
Your branch and 'origin/develop' have diverged,
and have 1 and 2 different commits each, respectively.
  (use "git pull" to merge the remote branch into yours)
slava@phobos:~/git-projects/geometric_lib$ git log
commit 3432dcb7b286d4d0909da5080fcb326c034b1b24 (HEAD -> develop)
Author: Daniil.K <dlkay@yandex.ru>
Date:   Tue Mar 30 17:57:42 2021 +0300

    L-04: Add calculate.py and Update docs for calculate.py

commit 51c40ebfd0e0b65f52fe5e54740cbb038e492db3
Author: smartiqa <info@smartiqa.ru>
Date:   Fri Mar 26 14:52:26 2021 +0300

    L-04: Doc updated for triangle

commit d080c7888b81955bad2ed78d58ad910526b5132a
Author: smartiqa <info@smartiqa.ru>
Date:   Fri Mar 26 14:48:39 2021 +0300

    L-04: Triangle added

commit d078c8d9ee6155f3cb0e577d28d337b791de28e2 (origin/main, origin/HEAD, main, experiment)
Author: smartiqa <info@smartiqa.ru>
Date:   Thu Mar 4 14:55:29 2021 +0300

    L-03: Docs added

commit 8ba9aeb3cea847b63a91ac378a2a6db758682460
Author: smartiqa <info@smartiqa.ru>
Date:   Thu Mar 4 14:54:08 2021 +0300

    L-03: Circle and square added
slava@phobos:~/git-projects/geometric_lib$ git checkout experiment
Switched to branch 'experiment'
slava@phobos:~/git-projects/geometric_lib$ git cherry-pick 3432dcb7b286d4d0909da5080fcb326c034b1b24
Auto-merging docs/README.md
CONFLICT (content): Merge conflict in docs/README.md
error: could not apply 3432dcb... L-04: Add calculate.py and Update docs for calculate.py
hint: After resolving the conflicts, mark them with
hint: "git add/rm <pathspec>", then run
hint: "git cherry-pick --continue".
hint: You can instead skip this commit with "git cherry-pick --skip".
hint: To abort and get back to the state before "git cherry-pick",
hint: run "git cherry-pick --abort".
slava@phobos:~/git-projects/geometric_lib$ nano docs/README.md
slava@phobos:~/git-projects/geometric_lib$ git add docs/README.md
slava@phobos:~/git-projects/geometric_lib$ git cherry-pick --continue
[experiment 80d583f] L-04: Add calculate.py and Update docs for calculate.py
 Author: Daniil.K <dlkay@yandex.ru>
 Date: Tue Mar 30 17:57:42 2021 +0300
 2 files changed, 49 insertions(+), 6 deletions(-)
 create mode 100644 calculate.py
slava@phobos:~/git-projects/geometric_lib$ ls -l
total 20
-rw-r--r-- 1 slava slava  688 Jun 18 18:37 calculate.py
-rw-r--r-- 1 slava slava  102 Jun 18 18:19 circle.py
drwxr-xr-x 2 slava slava 4096 Jun 18 18:38 docs
-rw-r--r-- 1 slava slava   76 Jun 18 18:21 rectangle.py
-rw-r--r-- 1 slava slava   68 Jun 18 18:19 square.py
slava@phobos:~/git-projects/geometric_lib$ git add -A
slava@phobos:~/git-projects/geometric_lib$ git commit -m "Added all files for experiment branch"
[experiment 78f472c] Added all files for experiment branch
 1 file changed, 7 insertions(+)
 create mode 100644 rectangle.py
slava@phobos:~/git-projects/geometric_lib$ git add -A
slava@phobos:~/git-projects/geometric_lib$ git commit -m "Removed circle.py and square.py"
[experiment e31f9f9] Added all files for experiment branch
 2 files changed, 17 deletions(-)
 delete mode 100644 circle.py
 delete mode 100644 square.py

<!-- TASK 3 -->
slava@phobos:~/git-projects$ git clone https://github.com/smartiqaorg/geometric_lib
Cloning into 'geometric_lib'...
remote: Enumerating objects: 35, done.
remote: Counting objects: 100% (18/18), done.
remote: Compressing objects: 100% (12/12), done.
remote: Total 35 (delta 8), reused 6 (delta 6), pack-reused 17
Receiving objects: 100% (35/35), 4.25 KiB | 4.25 MiB/s, done.
Resolving deltas: 100% (9/9), done.
slava@phobos:~/git-projects$ cd geometric_lib
slava@phobos:~/git-projects/geometric_lib$ git checkout feature
branch 'feature' set up to track 'origin/feature'.
Switched to a new branch 'feature'
slava@phobos:~/git-projects/geometric_lib$ git checkout develop
branch 'develop' set up to track 'origin/develop'.
Switched to a new branch 'develop'
slava@phobos:~/git-projects/geometric_lib$ git log --graph --oneline --decorate --all
* 86edb1c (origin/release) L-05: Update Docs. Add user agreement info
* 438b89a L-05: Add user agreement
* 6adb962 L-03: Docs added
| * 3049431 (origin/feature, feature) L-04: Add rectangle.py
| | * b5b0fae (HEAD -> develop, origin/develop) L-04: Update docs for calculate.py
| | * d76db2a L-04: Add calculate.py
| | * 51c40eb L-04: Doc updated for triangle
| | * d080c78 L-04: Triangle added
| |/
| * d078c8d (origin/main, origin/HEAD, main) L-03: Docs added
|/
* 8ba9aeb L-03: Circle and square added
slava@phobos:~/git-projects/geometric_lib$ git checkout main
Switched to branch 'main'
Your branch is up to date with 'origin/main'.
slava@phobos:~/git-projects/geometric_lib$ git merge develop
Updating d078c8d..b5b0fae
Fast-forward
 calculate.py   | 33 +++++++++++++++++++++++++++++++++
 docs/README.md | 23 +++++++++++++++++------
 triangle.py    |  6 ++++++
 3 files changed, 56 insertions(+), 6 deletions(-)
 create mode 100644 calculate.py
 create mode 100644 triangle.py
slava@phobos:~/git-projects/geometric_lib$ git checkout main
Already on 'main'
Your branch is ahead of 'origin/main' by 4 commits.
  (use "git push" to publish your local commits)
slava@phobos:~/git-projects/geometric_lib$ git log
commit b5b0fae727ca72c317c383b39c0af73d6adcd81c (HEAD -> main, origin/develop, develop)
Author: Daniil.K <dlkay@yandex.ru>
Date:   Tue Mar 30 18:02:23 2021 +0300

    L-04: Update docs for calculate.py

commit d76db2ac7f69cc920ae2e6f669fb0671a7fa7d71
Author: Daniil.K <dlkay@yandex.ru>
Date:   Tue Mar 30 17:57:42 2021 +0300

    L-04: Add calculate.py

commit 51c40ebfd0e0b65f52fe5e54740cbb038e492db3
Author: smartiqa <info@smartiqa.ru>
Date:   Fri Mar 26 14:52:26 2021 +0300

    L-04: Doc updated for triangle

commit d080c7888b81955bad2ed78d58ad910526b5132a
Author: smartiqa <info@smartiqa.ru>
Date:   Fri Mar 26 14:48:39 2021 +0300

    L-04: Triangle added

commit d078c8d9ee6155f3cb0e577d28d337b791de28e2 (origin/main, origin/HEAD)
Author: smartiqa <info@smartiqa.ru>
Date:   Thu Mar 4 14:55:29 2021 +0300

    L-03: Docs added

commit 8ba9aeb3cea847b63a91ac378a2a6db758682460
Author: smartiqa <info@smartiqa.ru>
Date:   Thu Mar 4 14:54:08 2021 +0300

    L-03: Circle and square added
slava@phobos:~/git-projects/geometric_lib$ git log --graph --oneline --decorate --all
* 86edb1c (origin/release) L-05: Update Docs. Add user agreement info
* 438b89a L-05: Add user agreement
* 6adb962 L-03: Docs added
| * 3049431 (origin/feature, feature) L-04: Add rectangle.py
| | * b5b0fae (HEAD -> main, origin/develop, develop) L-04: Update docs for calculate.py
| | * d76db2a L-04: Add calculate.py
| | * 51c40eb L-04: Doc updated for triangle
| | * d080c78 L-04: Triangle added
| |/
| * d078c8d (origin/main, origin/HEAD) L-03: Docs added
|/
* 8ba9aeb L-03: Circle and square added
slava@phobos:~/git-projects/geometric_lib$ git reset --hard HEAD^
HEAD is now at d76db2a L-04: Add calculate.py
slava@phobos:~/git-projects/geometric_lib$ git checkout main
Already on 'main'
Your branch is ahead of 'origin/main' by 3 commits.
  (use "git push" to publish your local commits)
slava@phobos:~/git-projects/geometric_lib$ git merge --ff-only develop
Updating d76db2a..b5b0fae
Fast-forward
 docs/README.md | 25 +++++++++++++++++--------
 1 file changed, 17 insertions(+), 8 deletions(-)
slava@phobos:~/git-projects/geometric_lib$ git checkout release
branch 'release' set up to track 'origin/release'.
Switched to a new branch 'release'
slava@phobos:~/git-projects/geometric_lib$ git rebase -i main
warning: skipped previously applied commit 6adb962
hint: use --reapply-cherry-picks to include skipped commits
hint: Disable this message with "git config advice.skippedCherryPicks false"
Auto-merging docs/README.md
CONFLICT (content): Merge conflict in docs/README.md
error: could not apply 438b89a... L-05: Add user agreement
hint: Resolve all conflicts manually, mark them as resolved with
hint: "git add/rm <conflicted_files>", then run "git rebase --continue".
hint: You can instead skip this commit: run "git rebase --skip".
hint: To abort and get back to the state before "git rebase", run "git rebase --abort".
Could not apply 438b89a... L-05: Add user agreement
slava@phobos:~/git-projects/geometric_lib$ git status
interactive rebase in progress; onto b5b0fae
Last command done (1 command done):
   pick 438b89a L-05: Add user agreement
Next command to do (1 remaining command):
   squash 86edb1c L-05: Update Docs. Add user agreement info
  (use "git rebase --edit-todo" to view and edit)
You are currently rebasing branch 'release' on 'b5b0fae'.
  (fix conflicts and then run "git rebase --continue")
  (use "git rebase --skip" to skip this patch)
  (use "git rebase --abort" to check out the original branch)

Changes to be committed:
  (use "git restore --staged <file>..." to unstage)
        new file:   user_agreement.txt

Unmerged paths:
  (use "git restore --staged <file>..." to unstage)
  (use "git add <file>..." to mark resolution)
        both modified:   docs/README.md
slava@phobos:~/git-projects/geometric_lib$ nano docs/README.md
slava@phobos:~/git-projects/geometric_lib$ git add user_agreement.txt
slava@phobos:~/git-projects/geometric_lib$ git add docs/README.md
slava@phobos:~/git-projects/geometric_lib$ git rebase --continue
[detached HEAD 043137f] L-05: Update Docs. Add user agreement info
 Author: Danny <bublikplushka@yandex.ru>
 Date: Mon Apr 19 15:12:19 2021 +0300
 2 files changed, 22 insertions(+), 1 deletion(-)
 create mode 100644 user_agreement.txt
Successfully rebased and updated refs/heads/release.
slava@phobos:~/git-projects/geometric_lib$ git rebase -i main
Successfully rebased and updated refs/heads/release.
slava@phobos:~/git-projects/geometric_lib$ git log --graph --oneline --decorate --all
* 043137f (HEAD -> release) L-05: Update Docs. Add user agreement info
* b5b0fae (origin/develop, main, develop) L-04: Update docs for calculate.py
* d76db2a L-04: Add calculate.py
* 51c40eb L-04: Doc updated for triangle
* d080c78 L-04: Triangle added
| * 86edb1c (origin/release) L-05: Update Docs. Add user agreement info
| * 438b89a L-05: Add user agreement
| * 6adb962 L-03: Docs added
| | * 3049431 (origin/feature, feature) L-04: Add rectangle.py
| |/
|/|
* | d078c8d (origin/main, origin/HEAD) L-03: Docs added
|/
* 8ba9aeb L-03: Circle and square added
slava@phobos:~/git-projects/geometric_lib$ git checkout main
Switched to branch 'main'
Your branch is ahead of 'origin/main' by 4 commits.
  (use "git push" to publish your local commits)
slava@phobos:~/git-projects/geometric_lib$ git merge release --ff
Updating b5b0fae..043137f
Fast-forward
 docs/README.md     |  9 ++++++++-
 user_agreement.txt | 14 ++++++++++++++
 2 files changed, 22 insertions(+), 1 deletion(-)
 create mode 100644 user_agreement.txt
slava@phobos:~/git-projects/geometric_lib$ git log --graph --oneline --decorate --all
* 043137f (HEAD -> main, release) L-05: Update Docs. Add user agreement info
* b5b0fae (origin/develop, develop) L-04: Update docs for calculate.py
* d76db2a L-04: Add calculate.py
* 51c40eb L-04: Doc updated for triangle
* d080c78 L-04: Triangle added
| * 86edb1c (origin/release) L-05: Update Docs. Add user agreement info
| * 438b89a L-05: Add user agreement
| * 6adb962 L-03: Docs added
| | * 3049431 (origin/feature, feature) L-04: Add rectangle.py
| |/
|/|
* | d078c8d (origin/main, origin/HEAD) L-03: Docs added
|/
* 8ba9aeb L-03: Circle and square added
```
