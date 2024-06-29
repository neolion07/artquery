function help()
	io.write("- Available commands -\n\n");
	
	io.write(
		"$ .delete\n"
		.."#\tdescription: given an ID, deletes a row from a table.\n"
		.."#\texample:\n"
		.."#\t> .delete\n"
		.."#\t> artworks\n"
		.."#\t> 183184\n"
		.."#\t< Deleted row ID 183184\n"
		.."#\n"
	);
	
	io.write(
		"$ .help\n"
		.."#\tdescription: shows this list.\n"
		.."#\texample:\n"
		.."#\t> .help\n"
		.."#\n"
	);
	
	io.write(
		"$ .show\n"
		.."#\tdescription: prints a table from the database to the console, "
		.."with an optional filter.\n"
		.."#\texample:\n"
		.."#\t> .show\n"
		.."#\t> artworks\n"
		.."#\t> id,title,year\n"
		.."#\t> year\n"
		.."#\t> 1958\n"
		.."#\t< ----- [RESULT #1] -----\n"
		.."#\t< id: 24680\n"
		.."#\t< title: Art1\n"
		.."#\t< year: 1958\n"
		.."#\t< ----- [RESULT #2] -----\n"
		.."#\t< id: 13579\n"
		.."#\t< title: Art2\n"
		.."#\t< year: 1958\n"
		.."#\n"
	);
	
	io.write(
		"$ .reset\n"
		.."#\tdescription: resets all tables in the database "
		.."and feeds them data from the API again.\n"
		.."#\texample:\n"
		.."#\t> .reset\n"
		.."#\t< Resetting database...\n"
		.."#\n"
	);
	
	io.write(
		"$ .update\n"
		.."#\tdescription: updates one or more columns for a given row ID.\n"
		.."#\texample:\n"
		.."#\t> .update\n"
		.."#\t> artworks\n"
		.."#\t> 98765\n"
		.."#\t> title='Mars',year=1979\n"
		.."#\t< Updated row ID 98765\n"
		.."#\n"
	);
	
	io.write(
		"$ .quit\n"
		.."#\tdescription: closes all connections and terminates the program.\n"
		.."#\texample:\n"
		.."#\t> .quit\n"
		.."#\t< Stopping...\n"
		.."#\n"
	);
	return;
end
