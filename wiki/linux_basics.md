# Why Learn the Command Line? (Pain Points & Practical Scenarios)

Many people are accustomed to Graphical User Interfaces (GUIs) in Windows or Mac and often ask: 'Why should I learn entering commands on a black screen?'
Before diving into the tedious syntax, let's look at real-world scenarios in research where **'No GUI can save you'**:

### 1. Hitting the 'GUI Wall'
- **Pain Point**: Try opening a **multi-GB** Next-Generation Sequencing (`.fastq`) file or a massive spreadsheet with Excel or Notepad. Most computers will crash or freeze instantly.
- **Solution**: Entering `head -n 10 large_file.fastq` or `wc -l` in the terminal gets you the first 10 lines or total line count in milliseconds! **'GUIs are for daily tasks; CLIs (Command Line Interfaces) are for big data and computing.'**

### 2. The Agony of Repetitive Tasks (Automation)
- **Pain Point**: 'If your boss gives you 1,000 Excel files, asks you to append today's date to each filename, and extract rows containing a specific gene name, what would you do?'
- **Solution**: Manual clicking (copy/paste) takes days and is prone to errors. A simple `for` loop with `grep` gets it done in under a minute.

### 3. Remote Server Reality
- **Pain Point**: When analyzing large datasets, training AI models, or running tasks on AWS/National Supercomputing Centers, these remote servers **have absolutely NO graphical interface**.
- **Solution**: Without the Command Line, you are forever bound to the weak processing power of your laptop and cannot leverage powerful computing clusters.

### 4. The Unix 'Lego' Philosophy (`|` Pipeline)
- **Pain Point**: Learning massive, complex software packages with endless buttons you can't find.
- **Solution**: Master simple utilities like `cat`, `grep`, `sort`, `uniq`. By chaining them (e.g., `cat demo.fas | grep ">" | wc -l`), you build infinite data processing pipelines out of simple blocks.

### 5. Become a Data Detective (Analysis Challenge)
- **Challenge**: Can you find the exact line containing the word `ERROR` across hundreds of log files in under 3 minutes? This is the core power of the Command Line!

**Linux basics. Outline**

1. Linux and shells
2. reasons why linux is better
3. linux environments
4. commonly-used commands
5. useful tips in Linux
6. command **```man```** (short for MANual page)
7. understand standard input (STDIN, 0), output (STDOUT, 1), and error (STDERR, 2) using **```ls```**
8. file and folder permissions
9. vi editor
10. **```sed```** (short for Stream EDitor) to find and replace text
11. print and count file content
12. use **```grep```** and **```wc```** to count sequences
13. Shell scripting
14. Q&A

* Question 1. How many sequences in a fasta/fastq file?
* Question 2. How to generate a metadata file (.csv) from a sequence file (.fasta)?

![Picture of the Beach -fullwidth](img/demo_raw.png)

# 1. Linux and shells

* Linux is a family of **"open-source" and "Unix-like"** operating systems
    * **kernel**: a computer program, or the core of a computer's OS, controling everything in the system.
    * **shell**: a special user program, providing an interface for user to use OS services.

![Picture of the Beach -50width](img/OS/OS.jpeg)

# 2. reasons why linux is better

* **free to use**
    * better community and support
* **open source culture** (started from Freax v0.01 in 1991)
    * various distributions, ownership, and customization
    * revive older computers
    * reliability (do not worry about re-install or re-boot)
* **security and privacy**
* **perfect for programmers**
    * shell script
    * software updates more quickly

# 3. linux environments

1. Mac user: Terminal app
2. PC user: Windows Subsystem for Linux (WSL) (https://learn.microsoft.com/en-us/windows/wsl/install)

# 4. commonly-used commands

|Mac/Linux| Windows| Note|
|---------|--------|-----|
|cd       | cd     | move to|
|pwd      | cd     | print working directory|
|ls       | dir    | list files |
|mkdir    | mkdir  | create directory|
|touch    | -      | create file |
|cp       | copy   | copy file |
|mv       | move   | move file |
|rm       | del    | delete file| 
|clear    | cls    | clear history|

* Don't use these commands in cmd.exe (命令提示字元) of PC

## 5. useful tips in Linux

1. All commands in Linux are **case-sensitive**.
2. Type commands or scripts in **the system prompt (means ready to command)** and processing actions only when you hit **enter**
3. Use **up arrow** to show the last executed command, and you can search and modify them
4. Use ```history``` to see all executed commands
5. Use **tab** to auto-complete filenames
6. Use **wildcards** to match filenames
    * \* - character(s) in any length (including none)
    * ? - one single character
7. Type Ctrl+d to logout and Ctrl+c to kill running job
8. Type tab in linux: Ctrl+v+tab

# 6. command **```man```** (short for MANual page)

* ```man``` command in Linux is used to display the user manual of any command.
* for example, ```man ls```

**useful tips**

* Hit **return/enter** to advance one line at a time
* Hit **space** to advance one page at a time
* Hit **Ctrl-f/Ctrl-b** to forward/backward one page at a time
* Hit **q** to quit

# 7. Standard input (STDIN, 0), output (STDOUT, 1), and error (STDERR, 2) using **```ls```**

## Difference between “>” and “>>”


```python
## ```ls``` is short for “list”.
## use it to list files and folders in current (or target) directory

## use > to output into a file
! ls > LIST

## use ```cat``` (short for concatenate) file to print the file
! cat LIST

## use >> to append to a file
! ls >> LIST
! cat LIST
```

## use 2> output error message to a file


```python
# output the standard ouput into STDOUT
! ls none > STDOUT
```

    ls: none: No such file or directory



```python
# STDOUT is empty
! cat STDOUT
```


```python
# output the standard error into STDERR
! ls none > STDOUT 2> STDERR
```


```python
! cat STDERR
```

    ls: none: No such file or directory



```python
# assign 2 into 1, and then output into allinone file
! ls none > STDALL 2>&1
```


```python
! cat STDALL
```

    ls: none: No such file or directory


## more about ```ls``` options


```python
# -l
#   List in long format.
! ls -l
```

    total 11024
    drwxr-xr-x  15 yngong  staff      480 Oct 12 22:20 [36mimg[m[m
    -rw-r--r--   1 yngong  staff     9024 Apr 14 07:27 linux_basics.aux
    -rw-r--r--   1 yngong  staff    33141 Oct 12 22:38 linux_basics.ipynb
    -rw-r--r--   1 yngong  staff    39459 Apr 14 07:27 linux_basics.log
    -rw-r--r--   1 yngong  staff     1901 Apr 14 07:27 linux_basics.out
    -rw-r--r--@  1 yngong  staff   803225 Apr 14 07:27 linux_basics.pdf
    -rw-r--r--@  1 yngong  staff   625501 Apr 20 00:00 linux_basics.slides.html
    -rw-r--r--   1 yngong  staff    51333 Apr 14 07:27 linux_basics.tex
    -rw-r--r--   1 yngong  staff    51342 Apr 14 07:27 linux_basics.texe
    -rw-r--r--   1 yngong  staff     7567 Apr 14 09:29 linux_shell.aux
    -rw-r--r--   1 yngong  staff    25757 Apr 14 10:03 linux_shell.ipynb
    -rw-r--r--   1 yngong  staff    40113 Apr 14 09:29 linux_shell.log
    -rw-r--r--   1 yngong  staff     1571 Apr 14 09:29 linux_shell.out
    -rw-r--r--@  1 yngong  staff  2862419 Apr 14 09:29 linux_shell.pdf
    -rw-r--r--@  1 yngong  staff   619540 Apr 20 00:28 linux_shell.slides.html
    -rw-r--r--   1 yngong  staff    51269 Apr 14 09:29 linux_shell.tex
    -rw-r--r--   1 yngong  staff    51278 Apr 14 09:29 linux_shell.texe
    drwxr-xr-x   5 yngong  staff      160 Oct 12 22:40 [36mworkspace[m[m



```python
# -a
#    do not ignore hidden entries starting with .
! ls -la
```

    total 11048
    drwxr-xr-x  23 yngong  staff      736 Oct 12 22:39 [36m.[m[m
    drwxr-xr-x  12 yngong  staff      384 Oct 12 16:40 [36m..[m[m
    -rw-r--r--@  1 yngong  staff     6148 Oct 12 22:40 .DS_Store
    drwxr-xr-x   4 yngong  staff      128 Mar 16  2021 [36m.ipynb_checkpoints[m[m
    -rw-r--r--   1 yngong  staff     1562 Apr 13  2021 .log
    drwxr-xr-x  15 yngong  staff      480 Oct 12 22:20 [36mimg[m[m
    -rw-r--r--   1 yngong  staff     9024 Apr 14 07:27 linux_basics.aux
    -rw-r--r--   1 yngong  staff    33141 Oct 12 22:38 linux_basics.ipynb
    -rw-r--r--   1 yngong  staff    39459 Apr 14 07:27 linux_basics.log
    -rw-r--r--   1 yngong  staff     1901 Apr 14 07:27 linux_basics.out
    -rw-r--r--@  1 yngong  staff   803225 Apr 14 07:27 linux_basics.pdf
    -rw-r--r--@  1 yngong  staff   625501 Apr 20 00:00 linux_basics.slides.html
    -rw-r--r--   1 yngong  staff    51333 Apr 14 07:27 linux_basics.tex
    -rw-r--r--   1 yngong  staff    51342 Apr 14 07:27 linux_basics.texe
    -rw-r--r--   1 yngong  staff     7567 Apr 14 09:29 linux_shell.aux
    -rw-r--r--   1 yngong  staff    25757 Apr 14 10:03 linux_shell.ipynb
    -rw-r--r--   1 yngong  staff    40113 Apr 14 09:29 linux_shell.log
    -rw-r--r--   1 yngong  staff     1571 Apr 14 09:29 linux_shell.out
    -rw-r--r--@  1 yngong  staff  2862419 Apr 14 09:29 linux_shell.pdf
    -rw-r--r--@  1 yngong  staff   619540 Apr 20 00:28 linux_shell.slides.html
    -rw-r--r--   1 yngong  staff    51269 Apr 14 09:29 linux_shell.tex
    -rw-r--r--   1 yngong  staff    51278 Apr 14 09:29 linux_shell.texe
    drwxr-xr-x   5 yngong  staff      160 Oct 12 22:40 [36mworkspace[m[m



```python
# -t
#    Sort by time modified (most recently modified first)
! ls -lat
```

    total 11048
    drwxr-xr-x  23 yngong  staff      736 Oct 12 22:40 [36m.[m[m
    -rw-r--r--   1 yngong  staff    34228 Oct 12 22:40 linux_basics.ipynb
    drwxr-xr-x   5 yngong  staff      160 Oct 12 22:40 [36mworkspace[m[m
    -rw-r--r--@  1 yngong  staff     6148 Oct 12 22:40 .DS_Store
    drwxr-xr-x  15 yngong  staff      480 Oct 12 22:20 [36mimg[m[m
    drwxr-xr-x  12 yngong  staff      384 Oct 12 16:40 [36m..[m[m
    -rw-r--r--@  1 yngong  staff   619540 Apr 20 00:28 linux_shell.slides.html
    -rw-r--r--@  1 yngong  staff   625501 Apr 20 00:00 linux_basics.slides.html
    -rw-r--r--   1 yngong  staff    25757 Apr 14 10:03 linux_shell.ipynb
    -rw-r--r--   1 yngong  staff    40113 Apr 14 09:29 linux_shell.log
    -rw-r--r--@  1 yngong  staff  2862419 Apr 14 09:29 linux_shell.pdf
    -rw-r--r--   1 yngong  staff     1571 Apr 14 09:29 linux_shell.out
    -rw-r--r--   1 yngong  staff     7567 Apr 14 09:29 linux_shell.aux
    -rw-r--r--   1 yngong  staff    51269 Apr 14 09:29 linux_shell.tex
    -rw-r--r--   1 yngong  staff    51278 Apr 14 09:29 linux_shell.texe
    -rw-r--r--   1 yngong  staff    39459 Apr 14 07:27 linux_basics.log
    -rw-r--r--@  1 yngong  staff   803225 Apr 14 07:27 linux_basics.pdf
    -rw-r--r--   1 yngong  staff     1901 Apr 14 07:27 linux_basics.out
    -rw-r--r--   1 yngong  staff     9024 Apr 14 07:27 linux_basics.aux
    -rw-r--r--   1 yngong  staff    51333 Apr 14 07:27 linux_basics.tex
    -rw-r--r--   1 yngong  staff    51342 Apr 14 07:27 linux_basics.texe
    -rw-r--r--   1 yngong  staff     1562 Apr 13  2021 .log
    drwxr-xr-x   4 yngong  staff      128 Mar 16  2021 [36m.ipynb_checkpoints[m[m



```python
# -r
#    Reverse the order of the sort to get reverse lexicographical order
! ls -latr
```

    total 11048
    drwxr-xr-x   4 yngong  staff      128 Mar 16  2021 [36m.ipynb_checkpoints[m[m
    -rw-r--r--   1 yngong  staff     1562 Apr 13  2021 .log
    -rw-r--r--   1 yngong  staff    51342 Apr 14 07:27 linux_basics.texe
    -rw-r--r--   1 yngong  staff    51333 Apr 14 07:27 linux_basics.tex
    -rw-r--r--   1 yngong  staff     9024 Apr 14 07:27 linux_basics.aux
    -rw-r--r--   1 yngong  staff     1901 Apr 14 07:27 linux_basics.out
    -rw-r--r--@  1 yngong  staff   803225 Apr 14 07:27 linux_basics.pdf
    -rw-r--r--   1 yngong  staff    39459 Apr 14 07:27 linux_basics.log
    -rw-r--r--   1 yngong  staff    51278 Apr 14 09:29 linux_shell.texe
    -rw-r--r--   1 yngong  staff    51269 Apr 14 09:29 linux_shell.tex
    -rw-r--r--   1 yngong  staff     7567 Apr 14 09:29 linux_shell.aux
    -rw-r--r--   1 yngong  staff     1571 Apr 14 09:29 linux_shell.out
    -rw-r--r--@  1 yngong  staff  2862419 Apr 14 09:29 linux_shell.pdf
    -rw-r--r--   1 yngong  staff    40113 Apr 14 09:29 linux_shell.log
    -rw-r--r--   1 yngong  staff    25757 Apr 14 10:03 linux_shell.ipynb
    -rw-r--r--@  1 yngong  staff   625501 Apr 20 00:00 linux_basics.slides.html
    -rw-r--r--@  1 yngong  staff   619540 Apr 20 00:28 linux_shell.slides.html
    drwxr-xr-x  12 yngong  staff      384 Oct 12 16:40 [36m..[m[m
    drwxr-xr-x  15 yngong  staff      480 Oct 12 22:20 [36mimg[m[m
    -rw-r--r--@  1 yngong  staff     6148 Oct 12 22:40 .DS_Store
    drwxr-xr-x   5 yngong  staff      160 Oct 12 22:40 [36mworkspace[m[m
    -rw-r--r--   1 yngong  staff    34228 Oct 12 22:40 linux_basics.ipynb
    drwxr-xr-x  23 yngong  staff      736 Oct 12 22:40 [36m.[m[m



```python
# -h
#    When used with the -l option, use unit suffixes: Byte, Kilobyte,
#    Megabyte, Gigabyte, Terabyte and Petabyte
# for example, this option shows linux_shell.ipynb in 25K, not 25757
! ls -latrh
```

    total 11048
    drwxr-xr-x   4 yngong  staff   128B Mar 16  2021 [36m.ipynb_checkpoints[m[m
    -rw-r--r--   1 yngong  staff   1.5K Apr 13  2021 .log
    -rw-r--r--   1 yngong  staff    50K Apr 14 07:27 linux_basics.texe
    -rw-r--r--   1 yngong  staff    50K Apr 14 07:27 linux_basics.tex
    -rw-r--r--   1 yngong  staff   8.8K Apr 14 07:27 linux_basics.aux
    -rw-r--r--   1 yngong  staff   1.9K Apr 14 07:27 linux_basics.out
    -rw-r--r--@  1 yngong  staff   784K Apr 14 07:27 linux_basics.pdf
    -rw-r--r--   1 yngong  staff    39K Apr 14 07:27 linux_basics.log
    -rw-r--r--   1 yngong  staff    50K Apr 14 09:29 linux_shell.texe
    -rw-r--r--   1 yngong  staff    50K Apr 14 09:29 linux_shell.tex
    -rw-r--r--   1 yngong  staff   7.4K Apr 14 09:29 linux_shell.aux
    -rw-r--r--   1 yngong  staff   1.5K Apr 14 09:29 linux_shell.out
    -rw-r--r--@  1 yngong  staff   2.7M Apr 14 09:29 linux_shell.pdf
    -rw-r--r--   1 yngong  staff    39K Apr 14 09:29 linux_shell.log
    -rw-r--r--   1 yngong  staff    25K Apr 14 10:03 linux_shell.ipynb
    -rw-r--r--@  1 yngong  staff   611K Apr 20 00:00 linux_basics.slides.html
    -rw-r--r--@  1 yngong  staff   605K Apr 20 00:28 linux_shell.slides.html
    drwxr-xr-x  12 yngong  staff   384B Oct 12 16:40 [36m..[m[m
    drwxr-xr-x  15 yngong  staff   480B Oct 12 22:20 [36mimg[m[m
    -rw-r--r--@  1 yngong  staff   6.0K Oct 12 22:40 .DS_Store
    drwxr-xr-x   5 yngong  staff   160B Oct 12 22:40 [36mworkspace[m[m
    -rw-r--r--   1 yngong  staff    33K Oct 12 22:40 linux_basics.ipynb
    drwxr-xr-x  23 yngong  staff   736B Oct 12 22:40 [36m.[m[m


# 8. file and folder permissions

![Picture of the Beach -fullwidth](img/man/permissions.png)

* (1) System prompt model (2) file type and permission (3) owner (4) group who owns this file (5) file size (6) time stamp (7) file name (. means current directory and .. as parent)

## ten letters and dashes indicate the permissions

**for example, d rwx r-x r-x**

* The first letter **d** means a directory rather than a file.
* The remaining nine letters are grouped into 3 triplets, including owner, group, and other levels
* r = read; w = write; x = execute
* the owner has the read/write/execute permission
* other users in the same group have the read/execute permission, but no write permission

## convert permission code

* The 3 triplets (e.g., **d rwx r-x r-x**) can be represented by three 3-bit codes (111 101 101).
* converter: r\*$2^{2}$ + w\*$2^{1}$ + x\*$2^{0}$
    * rwx as 111: 1\*$2^{2}$ + 1\*$2^{1}$ + 1\*$2^{0}$ = 4+2+1 = 7
    * r-x as 101: 1\*$2^{2}$ + 0\*$2^{1}$ + 1\*$2^{0}$ = 4+0+1 = 5
* File permission of "d rwx r-x r-x" will be 755.

## change permission

* change permission using ```chmod``` (short for change mode)


```python
#####
# change the permission of list file from 644 to 755
#####
## create a LIST file first
! ls > LIST
! ls -l LIST
```

    -rw-r--r--@ 1 yngong  staff  459 Oct 12 22:53 LIST



```python
! chmod 755 LIST
```


```python
! ls -l LIST
```

    -rwxr-xr-x@ 1 yngong  staff  459 Oct 12 22:53 [32mLIST[m[m


# 9. vi editor

* ```vi``` is the most popular and basic text editor on Linux-like system.
* three editing modes in vi
    * command mode (full screen, by default) 
    * insert mode (full screen)
    * command-line mode (one working line)

## try the followings to enter insert mode

* i: insert before cursor
* I: insert at the beginning of line
* a: append after cursor
* A: append at end of line
* o: open new line below current line
* O: open new line above current line
* press ESC to leave the insert mode


## command-line mode

* press ***shift and :*** to get a command-line prompt **:** at the bottom
* `:wq`: exit and save changes (w = write, q = quit)
* `:q!`: exit without saving changes (! = force quitting by neglecting changes)
* `:w filename`: write to a new filename
* `:w! filename`: force write to a new filename
* delete `:` or press ESC twice to get back to full-screen command mode


## delete in command mode

* x: delete character under cursor
* dd: delete one line under cursor
* dw: delete till the end of this word
* db: delete characters in this word before
* **press u immediately to undo the deletion**


## search and replace in command-line mode

* /string: Search for string
* enter `/` alone followed by return will repeatly search
* s/string1/string2: Replace string1 with string2
* s/string1/string2/g: Replace all string1 with string2 in the current line.
* %s/string1/string2/g: Replace string1 with string2 in the entire document.
* set nu : display line numbers
* set nonu :  hide the line numbers

## Go to specific line and delete lines

* go to line 3: type `:3` in command-line mode or type `3G` in command mode
* delete from line number 3 to 5 by typing `:3,5d`
* delete from line number 3 to end of file by typing `:3,$d`


# 10. **```sed```** (short for Stream EDitor) to find and replace text


```python
## similar option in vi, e.g., s/string1/string2/g 
## to replace string1 with string2 in the entire document

! ls
! ls > LIST
```

    [36m2022[m[m                     generateCSV.sh           linux_basics.tex
    LIST                     generated8shell.csv      linux_basics.texe
    LIST.hs1                 [36mimg[m[m                      linux_shell.ipynb
    LIST.hs2                 linux_basics.aux         linux_shell.pdf
    LIST.hs3                 linux_basics.ipynb       linux_shell.slides.html
    STD                      linux_basics.log         missfont.log
    STDERR                   linux_basics.out         test1
    demo.csv                 linux_basics.pdf         tmp
    demo.fas                 linux_basics.slides.html [36mworkspace[m[m



```python
! sed 's/linux/os/g' LIST
```

    [36m2022[m[m
    LIST
    LIST.hs1
    LIST.hs2
    LIST.hs3
    STD
    STDERR
    demo.csv
    demo.fas
    generateCSV.sh
    generated8shell.csv
    [36mimg[m[m
    os_basics.aux
    os_basics.ipynb
    os_basics.log
    os_basics.out
    os_basics.pdf
    os_basics.slides.html
    os_basics.tex
    os_basics.texe
    os_shell.ipynb
    os_shell.pdf
    os_shell.slides.html
    missfont.log
    test1
    tmp
    [36mworkspace[m[m


# 11. print and count file context

* `cat` will not be a good option, if the file contains too many lines.
* `head filename` or `tail filename` to simply display the first or last lines (default as ten lines).
* More (or less) lines can be displayed, for example, `head -5 filename` or `head -5 filename`.
* `wc -l filename` (short for word count) shows number of lines in file.



```python
! head -3 LIST
```

    [36m2022[m[m
    LIST
    LIST.hs1



```python
! tail -3 LIST
```

    test1
    tmp
    [36mworkspace[m[m



```python
! wc -l LIST
```

          27 LIST


# 12. use ```grep``` and ```wc``` to count sequences

* copy a fasta file from google drive (https://drive.google.com/file/d/1xQRHVKzlVtHV4vGOxAulfJ2YN5OVDx6r/view?usp=sharing)
* grep (short for Globally search a Regular Expression and Print)
    * a command-line utility for searching plain-text data sets for lines that match a **regular expression**
    * from https://en.wikipedia.org/wiki/Grep
* wc (short for word count)
    * -l print the line count
    * -w print the word count
    * from https://en.wikipedia.org/wiki/Wc_(Unix)
* pipe ```|```:  The pipe is used to combine two or more commands. The output of the first command acts as input to the next one.


```python
#####
# Question 1. How many sequences in a fasta/fastq file?
# Try to grep header lines and wc lines, and get a count of 1000
#####
! grep ">" demo.fas | wc -l
```

        1000



```python
#####
# only print the first or last 3 sequences
#####
! grep ">" demo.fas | head -3
```

    >hCoV-19/USA/CA-CZB-2021/2020 | EPI_ISL_486273 | 2020-05-04 | NorthAmerica
    >hCoV-19/Wuhan/WIV04/2019 | EPI_ISL_402124 | 2019-12-30 | China
    >hCoV-19/India/GJ-GBRC99/2020 | EPI_ISL_450788 | 2020-05-06 | Asia



```python
! grep ">" demo.fas | tail -3
```

    >hCoV-19/Peru/LIM-INS-155/2020 | EPI_ISL_536548 | 2020-03-19 | SouthAmerica
    >hCoV-19/Scotland/EDB6157/2020 | EPI_ISL_473893 | 2020-05-14 | Europe
    >hCoV-19/Switzerland/BS-ETHZ-110001/2020 | EPI_ISL_486443 | 2020-04-01 | Europe


**Reminder: grep is a case insensitive search**

* Differences among the following commands?


```python
! grep -i Usa demo.fas | wc -l #--ignore-case
! grep USA demo.fas | wc -l
! grep usa demo.fas | wc -l
```

         211
         211
           0


## use ```sed``` to replace the separator

* Usage: 
    * sed 's/regexp/replacement/g' inputFileName > outputFileName
    * s: substitution; g: global
    * Tips: space is a char; you need a backslash "\\" for slash "/" in sed


```python
# toy example: replace xyz with abc
! echo xyz | sed 's/x/a/g' | sed 's/y/b/g' | sed 's/z/c/g'
```

    abc


* Current format (start with ">" and split by a pipe "|")
    * e.g., >hCoV-19/USA/CA-CZB-2021/2020 | EPI_ISL_486273 | 2020-05-04 | NorthAmerica
    * virus/location/strain/year | accession_number | collection_date | area
* Expected format (split by a semicolon without the space)
    * virus,location,strain,year,accession_number,collection_date,area


```python
# double check metadata
! grep ">" demo.fas | head -1
```

    >hCoV-19/USA/CA-CZB-2021/2020 | EPI_ISL_486273 | 2020-05-04 | NorthAmerica



```python
#####
# Step 1. create CSV file
#####
! echo "virus,location,strain,year,accession_number,collection_date,area" > demo.csv
```


```python
#####
# Step 2. retrieve meta data and stream editor
# current format: >hCoV-19/USA/CA-CZB-2021/2020 
# | EPI_ISL_486273 | 2020-05-04 | NorthAmerica
#
# expected format: hCoV-19;USA;CA-CZB-2021;2020;
# EPI_ISL_486273;2020-05-04;NorthAmerica
#
# 1st sed: remove ">"
# 2nd sed: replace "/" to " | "
# 3rd sed: replace " | " to ","
#####
! grep ">" demo.fas | sed 's/>//g;s/\// | /g;s/ | /,/g' >> demo.csv
```


```python
#####
# final check
#####
! head -3 demo.csv
```

    virus,location,strain,year,accession_number,collection_date,area
    hCoV-19,USA,CA-CZB-2021,2020,EPI_ISL_486273,2020-05-04,NorthAmerica
    hCoV-19,Wuhan,WIV04,2019,EPI_ISL_402124,2019-12-30,China

