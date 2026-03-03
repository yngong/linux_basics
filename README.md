# Linux Command Line Teaching Materials

Welcome to this comprehensive Linux Command Line course repository! This repository contains the complete teaching content designed for researchers, analysts, and beginners to master the Linux Command Line.

## Course Structure

This repository contains the presentation slides and Jupyter Notebooks demonstrating core concepts:

1. **Session 1: Linux Basics (Concepts and Operations)**
   - Core Material: `linux_basics.ipynb`
   - Covers: Why we need Linux, system architecture concepts, directory structure, absolute/relative paths, file permission management, and basic file operations (`ls`, `cd`, `cp`, `mv`, `rm`, etc.).
   - **Engagement Focus**: Demonstrating how to accomplish repetitive tasks, which would require hundreds of mouse clicks, using a single command.

2. **Session 2: Linux Shell (Data Streams and Text Processing)**
   - Core Material: `linux_shell.ipynb`
   - Covers: The Unix "Lego" philosophy (Pipeline `|`), standard input/output redirection (`>`, `<`), and advanced text processing tools (`cat`, `head`, `tail`, `grep`, `wc`, `sort`, `uniq`).
   - **Engagement Focus**: Showcasing the limitations of GUI when opening massive data files, and the reality that remote supercomputing centers rely solely on text-based interfaces.

3. **Advanced Supplement: Linux Advanced**
   - Includes `linux_adv.ipynb` to explore deeper topics and automation scripting.

## Required Example Data

To facilitate hands-on practice, key data files are provided in the directory:

- `demo.fas` (~30MB sequence file): Ideal for demonstrating the CLI's advantage in processing large Next-Generation Sequencing (NGS) files (using `grep`, `wc` for statistics).
- `demo.csv` / `metadata.csv`: Used for practicing advanced command line data filtering with `sed`, `awk`, etc.
- Various Shell script examples (`.sh`): Such as `generate_csv.sh`, `input_name.sh`, used to demonstrate the power of automation.

## Getting Started

We recommend opening the `.ipynb` files using **Jupyter Notebook** or **VS Code**.
Before starting the technical instruction, instructors can demonstrate the "Pain Point Scenarios" included at the top of each notebook. This helps students experience the urgency and necessity of learning the Command Line, making them more engaged as they dive into the specific commands.
