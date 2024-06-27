Sub DataCleaning()

    ' Declare variables
    Dim ws As Worksheet
    Dim lastRow As Long
    Dim currentRow As Long
    Dim N As Long

    ' "TEST" will be the name of the Excel worksheet
    Set ws = ThisWorkbook.Sheets("TEST")

    ' Find the last row with data in column 1
    lastRow = ws.Cells(ws.Rows.Count, 1).End(xlUp).Row

    ' Initialize the variable "N" that will be used as a counter to track the distance 
    ' between "currentRow" and the previous non-empty row
    N = 0
   
    ' First loop to go through each row in column 1, find empty cells, and copy the data from column 2 in that row
    ' Data starts in row 2 because of the table headers
    For currentRow = 2 To lastRow
        ' Check if cell is empty
        If ws.Cells(currentRow, 1).Value = "" Then
            ' Increase the "N" counter
            N = N + 1
            ' Copy the value from column 2 in "currentRow" to the column (2 + N) and the row (currentRow - N)
            ws.Cells(currentRow - N, 2 + N).Value = ws.Cells(currentRow, 2).Value
        Else
            ' If the cell is not empty, reset the "N" counter to 0
            N = 0
        End If
    Next currentRow

    ' Second loop to delete rows if the cell in column 1 is empty, starting from the bottom to prevent errors
    For currentRow = lastRow To 1 Step -1
        ' Check if cell is empty
        If ws.Cells(currentRow, 1).Value = "" Then
            ' Delete that row
            ws.Rows(currentRow).Delete
        End If
    Next currentRow

    ' Display a message when the process is finished
    MsgBox "Data cleaning finished"

End Sub
