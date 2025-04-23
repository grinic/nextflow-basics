/*
* Let's create the channel `my_files`
* using the method fromPath
*/
params.inputdir = "${projectDir}/../../test_data/txts"	

Channel
    .fromPath( "${params.inputdir}/*.txt" )
    .set {my_files}

my_files.view()

my_files.collect().view()

/*
* Let's create the channel `my_words`
* using the method from
*/

Channel
    .from('hello', 'hola', 'bonjour')
    .set {my_words}


/*
* Let's mix them using the operator mix
*/

my_files
    .mix(my_words)
    .toSortedList()
    .flatten()
    .view()
