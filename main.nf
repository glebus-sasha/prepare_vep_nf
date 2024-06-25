#!/usr/bin/env nextflow

// Include processes
include { DOWNLOAD_VEP_CACHE }  from './processes/download_vep_cache.nf'

// Logging pipeline information
log.info """\
\033[0;36m    ==========================================  \033[0m
\033[0;36m            P R E P A R E   V E P               \033[0m
\033[0;36m    ==========================================  \033[0m

    vepcache:  ${params.vepcache}
    """
    .stripIndent(true)

// Define help
if (params.help) {
    help = """\
            |main.nf: This repository contains a Nextflow pipeline 
            |for downloading the VEP cache.
            |
            |Required arguments:
            |   --vepcache      VEP cache directory
            |                   [default: ${params.vepcache}]
            |
            |Optional arguments:
            |   -profile        <docker/singularity>
            |
            """.stripMargin()
    // Print the help with the stripped margin and exit
    println(help)
    exit(0)
}

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