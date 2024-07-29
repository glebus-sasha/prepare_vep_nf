// Define the `DOWNLOAD_VEP_CACHE` process that download VEP cache
process DOWNLOAD_VEP_CACHE {
    container = 'ensemblorg/ensembl-vep:latest'
    tag "${params.vepcache}"
    publishDir "${params.vepcache}", mode: "copy"
//    cpus params.cpus
    debug true
//    errorStrategy 'ignore'

    script:
    """
    INSTALL.pl \
    -c . \
    -a cf \
    -s homo_sapiens \
    -y GRCh38
    """
}