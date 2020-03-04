#!/bin/bash

usage() {
  echo "Generate a report from the Dryad analysis pipeline."
  echo "Usage:"
  echo "      run_report.sh <options>"
  echo "Options:"
  echo "      Required"
  echo "      -s      Geneous and Species eg. \"Escherichia coli\""
  echo "      Optional"
  echo "      -p      SNP matrix file name: defaults to snp_distance_matrix.tsv"
  echo "      -c      Core-geneome newick tree file: defaults to core_genome_tree.tree"
  echo "      -o      Output path: defaults to /data/"
  echo "      -a      Output of abricate: defaults to none"
}

species = ""
snp_table = "snp_distance_matrix.tsv"
nwk_tree = "core_genome_tree.tree"
output_path = "/data/"
ar_tsv = "none"

while (( "$#" )); do
  case "$1" in
    -s|--species)
      species = $2
      shift 2
      ;;
    -p|--snp-matrix)
      snp_table = $2
      shift 2
      ;;
    -c|--core-genome-tree)
      cg_tree = $2
      shift 2
      ;;
    -o|--output-path)
      output_path = $2
      shift 2
      ;;
    -a|--anitbiotic-resistance)
      ar_tsv = $2
      shift 2
      ;;
    --) # end argument parsing
      shift
      break
      ;;
    -*|--*=|*) # unsupported flags
      echo "Error: Unsupported flag $1" >&2
      usage
      exit 1
      ;;
  esac
done

if [ -z $species ] || [ -z $n_isolates ]; then
  usage
  exit 1
fi

cp -u /scripts/analysis_report.Rmd $output_path

Rscript /scripts/render_report.R "$species" "$snp_table" "$nwk_tree" "$output_path" "$ar_tsv"
