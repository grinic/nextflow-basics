/* 
 * HERE YOU HAVE THE COMMMENTS
 * NextFlow example from their website 
 */
 
// projectDir is a nextflow variable that contains the info about where the script is located
// inputfile is a pipeline parameter that can be overridden by using --inputfile OTHERFILENAME
// in the command line

nextflow.enable.dsl = 2

// create a channel with one path and check the existence of that file
tif_pairs = channel.fromFilePairs("${params.tifs_dir}/*{${params.channels}}*.tif", checkIfExists:true)	

tif_pairs.collect().view()

process extract_meta {

    // conda params.condaEnvPath

    input:
    tuple val (tp_id), path (tif_files) // nextflow creates links to the original files in a temporary folder
 
    output:
    path "*.csv"    // send output files to a new output channel (in this case is a collection)
    // stdout
 
    script:
    def tif_tuple = tif_files.collect()
    """
    save_meta_as_pandas.py --tp "${tp_id}" --file_paths "${tif_tuple}" --channels "${params.channels}"
    """ 
}

process combine_meta {
    publishDir "${projectDir}/output_ex5", mode: 'copy'

    conda params.condaEnvPath

    input:
    path (csv_files)

    output:
    path "*.csv"

    script:
    """
    python ${projectDir}/bin/combine_meta.py --file_paths "${csv_files}"
    """
}

// MAIN WORKFLOW

workflow {

    csv_files	= extract_meta(tif_pairs)
    // Here you have the output channel as a collection
    csv_files.collect().view()

    meta_file = combine_meta(csv_files.collect())
    meta_file.view()
    
}
