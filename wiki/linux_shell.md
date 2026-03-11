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

# 13. Shell scripting

* **Shell scripts** allow several commands that would be **entered manually at a command-line interface** to be **executed automatically**, and without having to wait for a user to trigger each stage of the sequence.
* components
    * all of Linux commands
    * variables 
    * looping 
    * any 3rd-party or user developed programs that can be executed on Linux, like python, R, java
* from https://en.wikipedia.org/wiki/Shell_script

## The first shell script
1. Use ```touch``` and ```vi``` to create and edit a new file
2. Type Shebeng ```#!/bin/bash```
3. Type something about you
4. Type the ```read``` command to take the input from the keyborard and assign to the INPUT variable
5. **Please download all of scripts from https://drive.google.com/drive/folders/1sD1llq5nsidFSriCjlJJeuPR8kzYvfNG?usp=drive_link**


```python
#!/bin/bash

# Author : Zac Gong
# Affiliation: CGU
# The first shell script follows here:

echo "What is your name?"
read INPUT
echo "Hello, $INPUT. Good to see you."
```


```python
# Type the file name
! ./input_name.sh
# or bash file_name
! bash ./input_name.sh
```

## Shell Basic Operators
* **Arithmetic Operators** (Kahoot)
![Picture of the Beach -100width](img/shell/arithmetic.png)(https://drive.google.com/uc?export=view&id=1Com2VKv8SoMYyf0bmRp7Wpp8OsiqyTe_)
* All the following tables from https://www.tutorialspoint.com/unix/unix-basic-operators.htm


```python
#!/bin/bash

val=`expr 1 + 1`
echo "Sum : $val"

## The above script will generate the following result
## Sum : 2
```


```python
! bash ./arith_opt.sh
```

### Relational Operators
* Assume variable a holds 10 and variable b holds 20

![Picture of the Beach -100width](img/shell/relational.png)(https://drive.google.com/uc?export=view&id=1Cns9fo-xTipR7Mf7GKpszmqX1Z8vFFc9)

### String Operators
* Assume variable a holds 10 and variable b holds 20

![Picture of the Beach -100width](img/shell/string.png)(https://drive.google.com/uc?export=view&id=1Cnw5iac4DHpxRBwMC2k0qRjDYe9UPTLp)

### Boolean Operators
* Assume variable a holds 10 and variable b holds 20

![Picture of the Beach -100width](img/shell/boolean.png)(https://drive.google.com/uc?export=view&id=1CoC1OZKhgZ0BTA492LeEFmu8z1LV_VI3)

### File Test Operators
* Assume variable a holds 10 and variable b holds 20

![Picture of the Beach -100width](img/shell/file.png)(https://drive.google.com/uc?export=view&id=1Cnua-EdDnQFd5w2UiXABTbst3pCnv3Du)

### Shell Decision Making
* if...else is a commonly-used, decision-making statement.
    * if...fi statement
    * if...else...fi statement
    * if...elif...else...fi statement


```python
#!/bin/bash

# Author : Zac Gong
# Affiliation: CGU
# The first shell script follows here:

echo "What is your name?"
read INPUT

if [ "$INPUT" == ""]; then
    echo "Null input. Program stopped."
    exit
else
    echo "Hello, $INPUT. Good to see you."
fi
```


```python
! bash ./input_name_decision_making.sh
```

## use getopts to parse command-line arguments and display your input and output file names

* getopts command: retrieve options and their arguments
* for example, two required arguments as input and output file names


```python
! bash ./print_io.sh -i input.fas -o output.fas
```


```python
#!/bin/bash
# Retrieve file names and print out

### get args
while getopts i:o: option
do
case "${option}"
in
i) i=${OPTARG};;
o) o=${OPTARG};;
esac
done

### check args
if [ "$i" == "" -o "$o" == "" ]
then
	echo "Input Error, please make sure"
	echo "-i as input file name"
	echo "-o as output file name"
	echo "Usage: sh printInputOutput.sh -i input.fas -o output.fas"
	exit
fi

echo "input file name: "$i
echo "output file name: "$o
```

## Read a fasta file and generate a CSV file


```python
! bash ./generate_csv.sh -i input.fas -o output.fas
```


```python
#!/bin/bash

### get args
while getopts i:o: option
do
case "${option}"
in
i) i=${OPTARG};;
o) o=${OPTARG};;
esac
done

### check args
if [ "$i" == "" -o "$o" == "" ]
then
    echo "Input Error, please make sure"
    echo "-i as input file name"
    echo "-o as output file name"
    echo "Usage: bash generate_csv.sh -i input.fas -o output.fas"
    exit
fi
echo "input file name: "$i
echo "output file name: "$o

# step 1. create CSV file
echo "virus,location,strain,year,accession_number,collection_date,area" > $o
# step 2. retrieve meta data and stream editor
grep ">" $i | sed 's/>//g' | sed 's/\// | /g' | sed 's/ | /,/g' >> $o
```


```python
# execute this shell script
! bash ./generate_csv.sh -i demo.fas -o metadata.csv
```

    input file name: demo.fas
    output file name: metadata.csv



```python
! head -3 metadata.csv
```

    virus,location,strain,year,accession_number,collection_date,area
    hCoV-19,USA,CA-CZB-2021,2020,EPI_ISL_486273,2020-05-04,NorthAmerica
    hCoV-19,Wuhan,WIV04,2019,EPI_ISL_402124,2019-12-30,China

