#!/usr/bin/env nextflow

// Include processes
include { DOWNLOAD_VEP_CACHE }  from './processes/download_vep_cache.nf'

// Logging pipeline information
log.info """\
    ==========================================
            P R E P A R E   V E P
    ==========================================

    reference:  ${params.reference}
    bwaidx:     ${params.bwaidx}
    faidx:      ${params.faidx}
    """
    .stripIndent(true)

// Define help
if ( params.help ) {
    help = """main.nf: This repository contains a Nextflow pipeline for pipeline 
            |for BWA index and samtools (fai) index
            |
            |Required arguments:
            |   --reference     Location of the reference file.
            |                   [default: ${params.reference}]
            |   --bwaidx        Location of the output file file.
            |                   [default: ${params.bwaidx}]
            |   --faidx         Location of the output file file.
            |                   [default: ${params.faidx}]
            |
            |Optional arguments:
            |   -profile        <docker/singularity>
            |
""".stripMargin()
    // Print the help with the stripped margin and exit
    println(help)
    exit(0)
}

reference = params.reference ? Channel.fromPath("${params.reference}", checkIfExists: true) : null

// Define the workflow
workflow {
    DOWNLOAD_VEP_CACHE(params.vepcache)
}

// Log pipeline execution summary on completion
workflow.onComplete {
    log.info """\
        Pipeline execution summary
        ---------------------------
        Completed at: ${workflow.complete}
        Duration    : ${workflow.duration}
        Success     : ${workflow.success}
        workDir     : ${workflow.workDir}
        exit status : ${workflow.exitStatus}
        """
        .stripIndent()
        
    log.info ( workflow.success ? "\nDone" : "\nOops" )
}




