main = interact lineCount
	where lineCount input = show (length (words input)) ++ "\n"
