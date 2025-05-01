/* 
 * HERE YOU HAVE THE COMMMENTS
 * NextFlow example from their website 
 */
 
// projectDir is a nextflow variable that contains the info about where the script is located
// inputfile is a pipeline parameter that can be overridden by using --inputfile OTHERFILENAME
// in the command line

// create a channel with one path and check the existence of that file
tif_files = Channel.fromPath("${params.tifs_dir}/*.tif", checkIfExists:true)	

tif_files.view()

process process_file {

    publishDir "${projectDir}/output_ex6", mode: 'copy'

    input:
    path tif_file // nextflow creates links to the original files in a temporary folder
 
    output:
    path "*/*.txt"    // send output files to a new output channel (in this case is a collection)
    // stdout
 
    script:
    """
    process_input_in_folders.py --file_path ${tif_file}
    """ 
}


// MAIN WORKFLOW

workflow {
    output	= process_file(tif_files)
    
    // Here you have the output channel as a collection
    output.view()
    
}
