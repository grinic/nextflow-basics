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
tif_files = channel.fromFilePairs("${params.tifs_dir}/*{Hoechst,FM4-64}*.tif", checkIfExists:true)	

tif_files.view()

process process_file {

    // containerOptions { "-u 24080:24080 -v ${params.tifs_dir}:${params.tifs_dir}" }
    // containerOptions { workflow.containerEngine == "docker" ? '-u $(id -u):$(id -g)': null}

    input:
    tuple path(tif_files)
    // file files from tif_files // nextflow creates links to the original files in a temporary folder
 
    output:
    // path "*.txt"    // send output files to a new output channel (in this case is a collection)
    stdout
 
    script:
    """
    echo ${tif_files}
    """
    // image_mean_with_numpy.py --file_paths "${tif_files[1]}"
    // """ 
}

// MAIN WORKFLOW

workflow {
    output	= process_file(tif_files)
    
    // Here you have the output channel as a collection
    output.view()
    output.collect().view()
    
}
