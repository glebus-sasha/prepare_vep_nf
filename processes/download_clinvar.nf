// Define the `DOWNLOAD_CLINVAR` process that download VEP cache
process DOWNLOAD_CLINVAR {
    container = 'glebusasha/wget_bash'
    tag "$params.vepcache"
    publishDir "${params.vepcache}", mode: "copy"
//    cpus params.cpus
    debug true
//    errorStrategy 'ignore'
	
    output:
    path "clinvar.vcf.gz"
    path "clinvar.vcf.gz.tbi"

    script:
    """
    wget https://ftp.ncbi.nlm.nih.gov/pub/clinvar/vcf_GRCh38/clinvar.vcf.gz 
    wget https://ftp.ncbi.nlm.nih.gov/pub/clinvar/vcf_GRCh38/clinvar.vcf.gz.tbi
    """
}