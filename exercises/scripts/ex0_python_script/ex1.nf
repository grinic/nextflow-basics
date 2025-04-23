/* 
 * HERE YOU HAVE THE COMMMENTS
 * NextFlow example from their website 
 */
 
// projectDir is a nextflow variable that contains the info about where the script is located
// inputfile is a pipeline parameter that can be overridden by using --inputfile OTHERFILENAME
// in the command line
params.inputdir = "${projectDir}/../../test_data/txts"	

// create a channel with one path and check the existence of that file
sequences_file = channel.fromPath("${params.inputdir}/*.txt", checkIfExists:true)	

sequences_file.view()

/*
 * split a fasta file in multiple files
 */
 
process process_file {

    input:
    path sequencesFile // nextflow creates links to the original files in a temporary folder
 
    output:
    path "*.txt"    // send output files to a new output channel (in this case is a collection)
 
    script:
    """
    python ${projectDir}/bin/create_file.py
    """ 
}


// MAIN WORKFLOW

workflow {
    output	= process_file(sequences_file)
    
    // Here you have the output channel as a collection
    output.view()
    
}
