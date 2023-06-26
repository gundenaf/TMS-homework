```bash
<!-- TASK 1 -->
slava@phobos:~$ cd extra/TeachMeSkills/lessons/lesson12/
slava@phobos:~/extra/TeachMeSkills/lessons/lesson12$ nano 1.c
slava@phobos:~/extra/TeachMeSkills/lessons/lesson12$ cat 1.c
#include <stdio.h>

int main() {
    printf("HELLO Ubuntu\n");
    return 0;
}
slava@phobos:~/extra/TeachMeSkills/lessons/lesson12$ gcc 1.c -o 1
slava@phobos:~/extra/TeachMeSkills/lessons/lesson12$ ./1
HELLO Ubuntu
slava@phobos:~/extra/TeachMeSkills/lessons/lesson12$ chmod +x task2.sh
slava@phobos:~/extra/TeachMeSkills/lessons/lesson12$ ./task2.sh arg1 arg2 arg3
Command line arguments:
arg1
arg2
arg3
Command line arguments stored in: arg_output.txt
slava@phobos:~/extra/TeachMeSkills/lessons/lesson12$ cat arg_output.txt
Command line arguments:
arg1
arg2
arg3
slava@phobos:~/extra/TeachMeSkills/lessons/lesson12$ ./task3.sh output_file.txt /home/slava/extra/TeachMeSkills/lessons/lesson12/ sh
File names with this .sh in directory /home/slava/extra/TeachMeSkills/lessons/lesson12/ are stored in file output_file.txt
slava@phobos:~/extra/TeachMeSkills/lessons/lesson12$ cat output_file.txt
task2.sh
task3.sh
slava@phobos:~/extra/TeachMeSkills/lessons/lesson12$ ./task4.sh /home/slava/extra/TeachMeSkills/lessons/
/home/slava/extra/TeachMeSkills/lessons//lesson1:
total 3424
-rw-r--r-- 1 slava slava 3503330 Jun  8 18:42 'lesson 1_30_03_23.pptx'

/home/slava/extra/TeachMeSkills/lessons//lesson10:
total 0

/home/slava/extra/TeachMeSkills/lessons//lesson11:
total 1252
-rw-r--r-- 1 slava slava     118 Jun 18 18:00  git-commands.md
-rw-r--r-- 1 slava slava  126332 Jun 15 15:24  hw_11.pdf
-rw-r--r-- 1 slava slava 1147023 Jun 18 18:11 'lesson 11.pdf'

/home/slava/extra/TeachMeSkills/lessons//lesson12:
total 892
-rwxr-xr-x 1 slava slava  15952 Jun 18 19:02  1
-rw-r--r-- 1 slava slava     79 Jun 18 19:01  1.c
-rw-r--r-- 1 slava slava     39 Jun 18 19:24  arg_output.txt
-rw-r--r-- 1 slava slava   1119 Jun 18 19:36  bash-commands.md
-rw-r--r-- 1 slava slava   3742 Jun 18 19:39  bash-tasks.zip
-rw-r--r-- 1 slava slava  61424 Jun 18 18:57  hw_12.pdf
-rw-r--r-- 1 slava slava 799687 Jun 18 18:57 'lesson 12.pdf'
-rw-r--r-- 1 slava slava     18 Jun 18 19:36  output_file.txt
-rwxr-xr-x 1 slava slava    367 Jun 18 19:24  task2.sh
-rwxr-xr-x 1 slava slava    607 Jun 18 19:34  task3.sh
-rwxr-xr-x 1 slava slava    370 Jun 18 19:50  task4.sh

/home/slava/extra/TeachMeSkills/lessons//lesson2:
total 3156
-rw-r--r-- 1 slava slava 3227904 Jun  8 18:42 'lesson 2_03_04_23.pptx'

/home/slava/extra/TeachMeSkills/lessons//lesson4:
total 780
-rw-r--r-- 1 slava slava 795701 Jun  8 18:42 'my_lesson 4.pptx'

/home/slava/extra/TeachMeSkills/lessons//lesson6:
total 924
-rw-r--r-- 1 slava slava 942527 Jun  8 18:42 lesson_17_04_23.pptx

/home/slava/extra/TeachMeSkills/lessons//lesson7:
total 1868
-rw-r--r-- 1 slava slava 923125 Jun  8 18:42  hw_7.pdf
-rw-r--r-- 1 slava slava 985439 Jun  8 18:42 'lesson 7.pptx.pdf'
Here it is!
```
