// Define the `DOWNLOAD_VEP_CACHE` process that download VEP cache
process DOWNLOAD_VEP_CACHE {
    container = 'ensemblorg/ensembl-vep:latest'
    tag "$cache_dir"
    publishDir "$cache_dir"
    cpus params.cpus
    debug true
//    errorStrategy 'ignore'
	
    input:
    path cache_dir

    output:
    path "clinvar.vcf.gz"
    path "clinvar.vcf.gz.tbi"

    script:
    """
    INSTALL.pl \
    -c $cache_dir \
    -a cf \
    -s homo_sapiens \
    -y GRCh38
    wget https://ftp.ncbi.nlm.nih.gov/pub/clinvar/vcf_GRCh38/clinvar.vcf.gz -o clinvar.vcf.gz
    wget https://ftp.ncbi.nlm.nih.gov/pub/clinvar/vcf_GRCh38/clinvar.vcf.gz.tbi -o clinvar.vcf.gz.tbi
    """
}