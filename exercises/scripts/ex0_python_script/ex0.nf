/* 
 * HERE YOU HAVE THE COMMMENTS
 * NextFlow example from their website 
 */
 
// projectDir is a nextflow variable that contains the info about where the script is located
// inputfile is a pipeline parameter that can be overridden by using --inputfile OTHERFILENAME
// in the command line

// create a channel with one path and check the existence of that file
txt_files = channel.fromPath("${params.txts_dir}/*.txt", checkIfExists:true)	

txt_files.view()

/*
 * split a fasta file in multiple files
 */
 
process process_file {

    input:
    path txt_files // nextflow creates links to the original files in a temporary folder
 
    output:
    stdout    // send output files to a new output channel (in this case is a collection)
 
    script:
    """
    python ${projectDir}/bin/print_something.py
    """ 
}


// MAIN WORKFLOW

workflow {
    output	= process_file(txt_files)
    
    // Here you have the output channel as a collection
    output.view()
    
}
