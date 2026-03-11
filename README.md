# 🐧 Linux Command Line Basics for Data Science & AI

Welcome to this comprehensive Linux Command Line course repository! This material is designed for researchers, analysts, and students to master the Linux Command Line—a fundamental skill in the era of AI and High-Performance Computing (HPC).

## 🚀 Core Teaching Material

The core content is centralized in a single, comprehensive Master Notebook:

- **[linux_master.ipynb](file:///Users/yngong/git-my-repo/linux_basics/linux_master.ipynb)**: A step-by-step guide covering:
    - **Why CLI?**: The "Lego Logic" of tools and the necessity of text interfaces for remote power.
    - **Environment Setup**: Quick start for Mac (Terminal) and PC (WSL).
    - **Foundations**: Directory structures, absolute/relative paths, and file permissions.
    - **Data Streams (I/O Redirection)**: Mastering `ls`, `cat`, `>`, and `>>`.
    - **The Unix Philosophy**: Chaining commands with Pipes `|`.
    - **Text Processing**: Using `grep`, `awk`, `sed`, `sort`, and `uniq` to handle massive datasets.

## 🎨 Premium Slides Workflow

This repository includes a professional presentation layer powered by **Reveal.js**.

- **[convert.sh](file:///Users/yngong/git-my-repo/linux_basics/convert.sh)**: A custom script to transform the Jupyter Notebook into a stunning HTML slideshow.
- **[premium_slides.css](file:///Users/yngong/git-my-repo/linux_basics/premium_slides.css)**: Custom styling for a polished, high-end look.

**How to generate slides:**
```bash
./convert.sh linux_master.ipynb
```
This generates `linux_master.slides.html`, which you can open in any web browser.

## 📂 Practice Workspace

To facilitate hands-on practice, all example data and scripts are located in the `workspace/` directory:

- **Data Files**: `demo.fas` (NGS sequence data), `demo.csv`, and `metadata.csv` for practicing text filtering and processing.
- **Automation Scripts**: Examples like `generate_csv.sh` and `input_name.sh` to demonstrate shell scripting and decision-making logic.

## 🎓 Teaching Methodology

This course follows an **Engagement-First** approach:
1. **Pain Point Scenarios**: Each section begins with a scenario where GUI methods fail (e.g., opening a 10GB file or repeating a task 1,000 times).
2. **The "Flash-Forward"**: Demonstrating how a single line of code solves complex problems before diving into the syntax.
3. **Live Practice**: Students are encouraged to run commands directly in the notebook or terminal to see immediate results.

---
*Maintained for teaching and research training. Open the notebook in VS Code or Jupyter to get started!*
