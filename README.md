# Dryad Sequencing Analysis Report
These scripts generate a sequencing analysis report using R Markdown and the outputs of [Dryad](https://github.com/k-florek/dryad)

Usage:

```
Generate a report from the Dryad analysis pipeline.
Usage:
      run_report.sh <options>
Options:
      Required
      -s      Genus and Species eg. "Escherichia coli"
      -n      Number of isolates
      Optional
      -o      Output path: defaults to /data/
      -p      SNP matrix file name: defaults to snp_distance_matrix.tsv
      -c      Core-geneome newick tree file: defaults to core_genome_tree.tree
```
