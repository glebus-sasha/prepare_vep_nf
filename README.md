# prepare_vep_nf
Nextflow-based pipeline for preparing data for the Variant Effect Predictor (VEP).

This pipeline is designed to download and prepare the necessary data for running the VEP tool on genetic variants.

This pipeline is prepared for:
- [glebus-sasha/deepvariant_nf](https://github.com/glebus-sasha/deepvariant_nf)
- [glebus-sasha/octopus_nf](https://github.com/glebus-sasha/octopus_nf)

1. **DOWNLOAD_VEP_CACHE:** Downloaling or updating VEP cache and data bases.

## Usage

### Quick Start

To quickly run the pipeline, use the following command:

```bash
nextflow run glebus-sasha/prepare_vep_nf \
    -profile <docker/singularity> \
    --vepcache <vepcache-directory>
```

### Requirements

- Nextflow (https://www.nextflow.io/docs/latest/install.html)
- Docker (https://docs.docker.com/engine/install/) or
- Singularity (https://github.com/sylabs/singularity/blob/main/INSTALL.md)

### Running the Pipeline

1. Install all the necessary dependencies such as Nextflow, Singularity.
2. Clone this repository: `git clone https://github.com/glebus-sasha/prepare_vep_nf.git`
3. Navigate to the pipeline directory: `cd prepare_vep_nf`
4. Edit the `nextflow.config` file to set the required parameters, if necessary.
5. Run the pipeline, setting the required parameters, for example:

```bash
nextflow run main.nf
```

## License

This project is licensed under the [MIT License](LICENSE).
