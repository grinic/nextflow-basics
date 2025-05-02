/* 
 * HERE YOU HAVE THE COMMMENTS
 * NextFlow example from their website 
 */
 
// projectDir is a nextflow variable that contains the info about where the script is located
// inputfile is a pipeline parameter that can be overridden by using --inputfile OTHERFILENAME
// in the command line

nextflow.enable.dsl = 2

// create a channel with one path and check the existence of that file
tif_pairs = channel.fromFilePairs(
                    "${params.tifs_dir}/*{Hoechst,FM4-64}*.tif", 
                    checkIfExists:true,
                    // flat:true
)	

tif_pairs.view()

process process_file {

    // conda params.condaEnvPath

    input:
    tuple val (tp_id), file (tif_files) // nextflow creates links to the original files in a temporary folder
 
    output:
    // path "*.txt"    // send output files to a new output channel (in this case is a collection)
    stdout
 
    script:
    """
    echo "$tp_id : $tif_files"
    // process_list.py --file_paths "${tif_files}"
    """ 
}


// MAIN WORKFLOW

workflow {
    output = process_file(tif_pairs)
    
    // Here you have the output channel as a collection
    output.view()
    output.collect().view()
    
}
