/* 
 * HERE YOU HAVE THE COMMMENTS
 * NextFlow example from their website 
 */
 
// projectDir is a nextflow variable that contains the info about where the script is located
// inputfile is a pipeline parameter that can be overridden by using --inputfile OTHERFILENAME
// in the command line

// create a channel with one path and check the existence of that file
tif_files = channel.fromFilePairs("${params.tifs_dir}/*{${params.channels}}*.tif", checkIfExists:true)	

tif_files.collect().view()

process extract_meta {

    conda params.condaEnvPath

    input:
    val tif_files // nextflow creates links to the original files in a temporary folder
 
    output:
    path "*.csv"    // send output files to a new output channel (in this case is a collection)
    // stdout
 
    script:
    """
    chmod -R 750 ${projectDir}
    save_meta_as_pandas.py --tp "${tif_files[0]}" --file_paths "${tif_files[1]}" --channels "${params.channels}"
    """ 
}

process combine_meta {
    publishDir "${projectDir}/output_ex5", mode: 'copy'

    conda params.condaEnvPath

    input:
    val csv_files

    output:
    path "*.csv"

    script:
    """
    python ${projectDir}/bin/combine_meta.py --file_paths "${csv_files}"
    """
}

// MAIN WORKFLOW

workflow {

    csv_files	= extract_meta(tif_files)
    // Here you have the output channel as a collection
    csv_files.collect().view()

    meta_file = combine_meta(csv_files.collect())
    meta_file.view()
    
}
