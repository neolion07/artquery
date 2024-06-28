function help()
	io.write("- Available commands -\n\n");
	
	io.write(
		"# .delete\n"
		.."#\tdescription: given a filter, deletes rows from the database.\n"
		.."#\n"
	);
	
	io.write(
		"# .help\n"
		.."#\tdescription: shows this list.\n"
		.."#\n"
	);
	
	io.write(
		"# .show\n"
		.."#\tdescription: prints a table from the database to the console, "
		.."with an optional filter.\n"
		.."#\n"
	);
	
	io.write(
		"# .reset\n"
		.."#\tdescription: resets all tables in the database "
		.."and feeds them data from the API again.\n"
		.."#\n"
	);
	
	io.write(
		"# .update\n"
		.."#\tdescription: not implemented yet.\n"
		.."#\n"
	);
	
	io.write(
		"# .quit\n"
		.."#\tdescription: closes all connections and terminates the program.\n"
		.."#\n"
	);
	return;
end
