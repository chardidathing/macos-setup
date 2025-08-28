#!/bin/zsh

# First read
echo "Reading current defaults..."
defaults read > /tmp/defaults_before.txt

echo "Make your changes, then press Enter to compare..."
read

# Second read after changes
echo "Reading new defaults..."
defaults read > /tmp/defaults_after.txt

# Compare and show differences
echo "\nChanges detected:"
diff /tmp/defaults_before.txt /tmp/defaults_after.txt

# Show changes by domain
echo "\nChanges by domain:"
diff /tmp/defaults_before.txt /tmp/defaults_after.txt | awk '
    # Store the before and after files to map line numbers to content
    BEGIN {
        # Read the before file into an array
        while (getline line < "/tmp/defaults_before.txt") {
            before_lines[++line_count] = line
        }
        close("/tmp/defaults_before.txt")
        
        # Read the after file into an array  
        line_count = 0
        while (getline line < "/tmp/defaults_after.txt") {
            after_lines[++line_count] = line
        }
        close("/tmp/defaults_after.txt")
    }
    
    # Process diff output
    /^[0-9]+c[0-9]+/ {
        # Extract line numbers from diff (e.g., "66c66")
        split($1, parts, "c")
        before_line = parts[1]
        after_line = parts[2]
        
        # Find the domain for the before line
        domain = find_domain(before_lines, before_line)
        if (domain == "") domain = find_domain(after_lines, after_line)
        
        if (domain != last_domain) {
            print "\n" domain ":"
            last_domain = domain
        }
        
        # Show the actual change
        print "  Before: " before_lines[before_line]
        print "  After:  " after_lines[after_line]
    }
    
    /^[0-9]+a[0-9]+/ {
        # Handle additions
        split($1, parts, "a")
        before_line = parts[1]
        after_line = parts[2]
        
        domain = find_domain(after_lines, after_line)
        if (domain != last_domain) {
            print "\n" domain ":"
            last_domain = domain
        }
        
        print "  Added: " after_lines[after_line]
    }
    
    /^[0-9]+d[0-9]+/ {
        # Handle deletions
        split($1, parts, "d")
        before_line = parts[1]
        after_line = parts[2]
        
        domain = find_domain(before_lines, before_line)
        if (domain != last_domain) {
            print "\n" domain ":"
            last_domain = domain
        }
        
        print "  Deleted: " before_lines[before_line]
    }
    
    # Function to find the domain for a given line number
    function find_domain(lines, target_line, i, line) {
        for (i = target_line; i >= 1; i--) {
            line = lines[i]
            # Look for lines that start with a domain (quoted string followed by =)
            if (line ~ /^[[:space:]]*"[^"]+"[[:space:]]*=[[:space:]]*\{/) {
                # Extract the domain name
                gsub(/^[[:space:]]*"/, "", line)
                gsub(/"[[:space:]]*=[[:space:]]*\{.*$/, "", line)
                return line
            }
        }
        return "Unknown"
    }'

# Cleanup
rm /tmp/defaults_before.txt /tmp/defaults_after.txt
