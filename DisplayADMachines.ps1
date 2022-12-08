# Import the Active Directory module
Import-Module ActiveDirectory

# Query Active Directory for all connected computers
$computers = Get-ADComputer -Filter {OperatingSystem -like "*"} -Properties OperatingSystem

# Create a table to display the results
$table = New-Object System.Data.DataTable
$table.Columns.Add("Name")
$table.Columns.Add("Operating System")

# Loop through the list of computers and add them to the table
foreach ($computer in $computers)
{
    $row = $table.NewRow()
    $row["Name"] = $computer.Name
    $row["Operating System"] = $computer.OperatingSystem
    $table.Rows.Add($row)
}

# Display the table
$table | Format-Table
