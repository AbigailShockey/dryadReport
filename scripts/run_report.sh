#!/bin/bash

usage() {
  echo "Generate a report from the Dryad analysis pipeline."
  echo "Usage:"
  echo "      run_report.sh <options>"
  echo "Options:"
  echo "      Required"
  echo "      -s      Geneous and Species eg. \"Escherichia coli\""
  echo "      -n      Number of isolates"
  echo "      Optional"
  echo "      -o      Output path: defaults to /data/"
  echo "      -p      SNP matrix file name: defaults to snp_distance_matrix.tsv"
  echo "      -c      Core-geneome newick tree file: defaults to core_genome_tree.tree"
}

output_path="/data/"
species=""
n_isolates=""
snp_table="snp_distance_matrix.tsv"
nwk_tree="core_genome_tree.tree"

while (( "$#" )); do
  case "$1" in
    -o|--output-path)
      output_path=$2
      shift 2
      ;;
    -s|--species)
      species=$2
      shift 2
      ;;
    -n|--num-isolates)
      n_isolates=$2
      shift 2
      ;;
    -p|--snp-matrix)
      snp_table=$2
      shift 2
      ;;
    -c|--core-genome-tree)
      cg_tree=$2
      shift 2
      ;;
    --) # end argument parsing
      shift
      break
      ;;
    -*|--*=) # unsupported flags
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

cp -u /scripts/anlaysis_report.Rmd $output_path
Rscript /scripts/render_report.R $output_path $species $n_isolates $snp_table $nwk_tree
