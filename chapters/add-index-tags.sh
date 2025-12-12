#!/bin/bash
# add-index-tags.sh - Add \index{} tags to LaTeX files for Common Lisp terms
# This script is IDEMPOTENT - safe to run multiple times

# Backup original files
echo "Creating backups..."
for file in chapter*.tex appendix*.tex afterword.tex; do
    [ -f "$file" ] && cp "$file" "$file.bak"
done

# Function to add index tag after first occurrence in file (IDEMPOTENT)
add_index() {
    local file=$1
    local pattern=$2
    local index_entry=$3
    
    # Check if this exact pattern already has an index tag
    if grep -q "\\\\texttt{$pattern}\\\\index{" "$file"; then
        return 0  # Already indexed, skip
    fi
    
    # Use sed to add index tag after FIRST occurrence only
    sed -i "0,/\\\\texttt{$pattern}/{s/\\\\texttt{$pattern}/\\\\texttt{$pattern}\\\\index{$index_entry}/}" "$file"
}

# Function to add index for non-code terms (IDEMPOTENT)
add_concept_index() {
    local file=$1
    local pattern=$2
    local index_entry=$3
    
    # Check if index already exists
    if grep -q "\\\\index{$index_entry}" "$file"; then
        return 0  # Already indexed, skip
    fi
    
    # Add index after first occurrence
    sed -i "0,/$pattern/{s/$pattern/$pattern\\\\index{$index_entry}/}" "$file"
}

echo "Adding index entries to chapter files..."

# Process each chapter and appendix
for chapter in chapter*.tex appendix*.tex afterword.tex; do
    [ ! -f "$chapter" ] && continue
    echo "Processing $chapter..."
    
    # Add indexes for Lisp functions/forms (in texttt)
    add_index "$chapter" "defun" "defun@\\\\texttt{defun}"
    add_index "$chapter" "defparameter" "defparameter@\\\\texttt{defparameter}"
    add_index "$chapter" "defvar" "defvar@\\\\texttt{defvar}"
    add_index "$chapter" "let" "let@\\\\texttt{let}"
    add_index "$chapter" "setq" "setq@\\\\texttt{setq}"
    add_index "$chapter" "setf" "setf@\\\\texttt{setf}"
    add_index "$chapter" "if" "if@\\\\texttt{if}"
    add_index "$chapter" "when" "when@\\\\texttt{when}"
    add_index "$chapter" "unless" "unless@\\\\texttt{unless}"
    add_index "$chapter" "cond" "cond@\\\\texttt{cond}"
    add_index "$chapter" "case" "case@\\\\texttt{case}"
    add_index "$chapter" "ecase" "ecase@\\\\texttt{ecase}"
    add_index "$chapter" "ccase" "ccase@\\\\texttt{ccase}"
    add_index "$chapter" "lambda" "lambda@\\\\texttt{lambda}"
    add_index "$chapter" "cons" "cons@\\\\texttt{cons}"
    add_index "$chapter" "car" "car@\\\\texttt{car}"
    add_index "$chapter" "cdr" "cdr@\\\\texttt{cdr}"
    add_index "$chapter" "append" "append@\\\\texttt{append}"
    add_index "$chapter" "member" "member@\\\\texttt{member}"
    add_index "$chapter" "remove" "remove@\\\\texttt{remove}"
    add_index "$chapter" "mapcar" "mapcar@\\\\texttt{mapcar}"
    add_index "$chapter" "subseq" "subseq@\\\\texttt{subseq}"
    add_index "$chapter" "sort" "sort@\\\\texttt{sort}"
    add_index "$chapter" "dolist" "dolist@\\\\texttt{dolist}"
    add_index "$chapter" "dotimes" "dotimes@\\\\texttt{dotimes}"
    add_index "$chapter" "do" "do@\\\\texttt{do}"
    add_index "$chapter" "read" "read@\\\\texttt{read}"
    add_index "$chapter" "print" "print@\\\\texttt{print}"
    add_index "$chapter" "princ" "princ@\\\\texttt{princ}"
    add_index "$chapter" "format" "format@\\\\texttt{format}"
    add_index "$chapter" "null" "null@\\\\texttt{null}"
    add_index "$chapter" "eql" "eql@\\\\texttt{eql}"
    add_index "$chapter" "equal" "equal@\\\\texttt{equal}"
    add_index "$chapter" "and" "and@\\\\texttt{and}"
    add_index "$chapter" "or" "or@\\\\texttt{or}"
    add_index "$chapter" "not" "not@\\\\texttt{not}"
    add_index "$chapter" "defclass" "defclass@\\\\texttt{defclass}"
    add_index "$chapter" "defmethod" "defmethod@\\\\texttt{defmethod}"
    add_index "$chapter" "make-instance" "make-instance@\\\\texttt{make-instance}"
    add_index "$chapter" "make-array" "make-array@\\\\texttt{make-array}"
    add_index "$chapter" "aref" "aref@\\\\texttt{aref}"
    add_index "$chapter" "defstruct" "defstruct@\\\\texttt{defstruct}"
done

# Add concept indexes (not in texttt) - IDEMPOTENT
for chapter in chapter*.tex appendix*.tex afterword.tex; do
    [ ! -f "$chapter" ] && continue
    
    # Core concepts
    add_concept_index "$chapter" "Common Lisp" "Common Lisp"
    add_concept_index "$chapter" "ANSI Common Lisp" "ANSI Common Lisp"
    add_concept_index "$chapter" "CLOS" "CLOS"
    add_concept_index "$chapter" "Common Lisp Object System" "Common Lisp Object System"
    add_concept_index "$chapter" "Emacs" "Emacs"
    add_concept_index "$chapter" "SLIME" "SLIME"
    
    # Organizations and standards
    add_concept_index "$chapter" "American National Standards Institute" "American National Standards Institute"
    add_concept_index "$chapter" "Association of Lisp Users" "Association of Lisp Users"
    
    # Programming concepts
    add_concept_index "$chapter" "Dynamic Typing" "Dynamic Typing"
    add_concept_index "$chapter" "Dynamic Redefinition" "Dynamic Redefinition"
    add_concept_index "$chapter" "Automatic Memory Management" "Automatic Memory Management"
    add_concept_index "$chapter" "dynamic scope" "dynamic scope"
    add_concept_index "$chapter" "lexical scope" "lexical scope"
    
    # Data structures
    add_concept_index "$chapter" "arrays" "arrays"
    add_concept_index "$chapter" "hash tables" "hash tables"
    add_concept_index "$chapter" "associative array" "associative array"
    add_concept_index "$chapter" "character arrays" "character arrays"
    
    # Functions and arguments
    add_concept_index "$chapter" "anonymous functions" "anonymous functions"
    add_concept_index "$chapter" "optional arguments" "optional arguments"
    add_concept_index "$chapter" "argument lists" "argument lists"
    
    # Other terms
    add_concept_index "$chapter" "destructive operators" "destructive operators"
    add_concept_index "$chapter" "consing" "consing"
    add_concept_index "$chapter" "code generation" "code generation"
    add_concept_index "$chapter" "batch mode" "batch mode"
    add_concept_index "$chapter" "CGI scripts" "CGI scripts"
    
    # Commercial implementations
    add_concept_index "$chapter" "Allegro CL" "Allegro CL"
    add_concept_index "$chapter" "LispWorks" "LispWorks"
    
    # Application domains
    add_concept_index "$chapter" "bioinformatics" "bioinformatics"
    add_concept_index "$chapter" "data mining" "data mining"
    add_concept_index "$chapter" "E-commerce" "E-commerce"
    add_concept_index "$chapter" "document management" "document management"
    
    # Technologies
    add_concept_index "$chapter" "CORBA" "CORBA"
    add_concept_index "$chapter" "Computer-aided Software Engineering" "Computer-aided Software Engineering"
done

echo "Index entries added!"
echo "To restore original files, use: cp *.tex.bak (original-name).tex"
