/* 
 * HERE YOU HAVE THE COMMMENTS
 * NextFlow example from their website 
 * nextflow run ex0.nf -params_file params.yaml -with-docker
 * https://github.com/nextflow-io/crg-course-nov16
 */
 
// projectDir is a nextflow variable that contains the info about where the script is located
// inputfile is a pipeline parameter that can be overridden by using --inputfile OTHERFILENAME
// in the command line

// create a channel with one path and check the existence of that file
tif_pairs = channel.fromFilePairs("${params.tifs_dir}/*{Hoechst,FM4-64}*.tif", checkIfExists:true)	

tif_pairs.view()

process process_file {

    input:
    tuple val (tp_id), path (tif_files) // nextflow creates links to the original files in a temporary folder
 
    output:
    stdout
 
    script:
    def tif_tuple = tif_files.collect()
    """
    echo "Ciao"
    """ 
}

// MAIN WORKFLOW

workflow {
    output	= process_file(tif_pairs)
    
    // Here you have the output channel as a collection
    output.view()
    output.collect().view()
    
}
