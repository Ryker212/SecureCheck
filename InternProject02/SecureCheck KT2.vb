Imports System.Reflection.Emit
Imports MySql.Data.MySqlClient
Public Class SecureCheck

    Private Sub TextBox1_TextChanged(ByVal sender As Object, ByVal e As System.Windows.Forms.KeyPressEventArgs) Handles TextBox1.KeyPress
        Dim mysqlcon As New MySqlConnection("host=127.0.0.1; user=root; password=; database=officer_kt2")
        Dim PrefixName, FirstName, LastName, PrefixName2, FirstName2, LastName2,
            UnitCodeName, ParentUnitCodeName, PositionName, Empcode As String


        If e.KeyChar = ChrW(Keys.Enter) Then
            Try
                Label13.Text = ""
                Dim id As String = CheckInput(TextBox1.Text)
                mysqlcon.Open()
                Dim stm As String = "SELECT * FROM employee WHERE employee.EmpCode = '" + id + "'"
                Dim cmd As MySqlCommand = New MySqlCommand(stm, mysqlcon)
                Dim reader As MySqlDataReader = cmd.ExecuteReader()
                Dim currentDate As DateTime = DateTime.Now.ToString("yyyy/MM/dd")
                Dim currentTimeOfDay As DateTime = DateTime.Now.ToString("HH:mm:ss")
                If (reader.HasRows) Then
                    While reader.Read()
                        Empcode = reader.GetString("Empcode")
                        PrefixName = reader.GetString("PrefixName")
                        FirstName = reader.GetString("FirstName")
                        LastName = reader.GetString("LastName")
                        PrefixName2 = reader.GetString("PrefixName2")
                        FirstName2 = reader.GetString("FirstName2")
                        LastName2 = reader.GetString("LastName2")
                        UnitCodeName = reader.GetString("UnitCodeName")
                        ParentUnitCodeName = reader.GetString("ParentUnitCodeName")
                        PositionName = reader.GetString("PositionName")
                    End While


                    reader.Close()

                    'insert
                    Dim insert As String = "INSERT INTO timestamp(date, time, id_emp) VALUES (@date, @time, @id_emp)"
                    Dim cmd2 As MySqlCommand = New MySqlCommand(insert, mysqlcon)
                    cmd2.Parameters.AddWithValue("@date", currentDate)
                    cmd2.Parameters.AddWithValue("@time", currentTimeOfDay)
                    cmd2.Parameters.AddWithValue("@id_emp", id)
                    cmd2.ExecuteNonQuery()

                    'show data
                    Label12.Text = Empcode
                    Label7.Text = PrefixName + " " + FirstName + " " + LastName
                    Label8.Text = PrefixName2 + " " + FirstName2 + " " + LastName2
                    Label9.Text = UnitCodeName
                    Label10.Text = ParentUnitCodeName
                    Label11.Text = PositionName
                    Label16.Text = currentDate.ToString("yyyy/MM/dd") + " " + currentTimeOfDay.ToString("HH:mm")
                    'show pic
                    Dim filePath As String = "C:\Users\Best_ryker\Desktop\src\" + id + ".jpg" ' 
                    OpenPNGFileByPath(filePath)
                Else

                    Label13.Text = "not found"
                    Label12.Text = ""
                    Label7.Text = ""
                    Label8.Text = ""
                    Label9.Text = ""
                    Label10.Text = ""
                    Label11.Text = ""
                    Label16.Text = ""
                    PictureBox1.Image = Nothing
                End If
                TextBox1.Clear()
            Catch ex As Exception
                Label13.Text = (ex.Message + " connected fail")
            Finally
                If mysqlcon.State = ConnectionState.Open Then
                    mysqlcon.Close()
                End If
            End Try

        End If

    End Sub

    Private Sub OpenPNGFileByPath(ByVal filePath As String)
        ' โหลดภาพเข้า PictureBox
        PictureBox1.Image = Image.FromFile(filePath)
    End Sub

    Private Sub Form1_Load(sender As Object, e As EventArgs) Handles MyBase.Shown
        TextBox1.Visible = False
        TextBox1.TabStop = False
        Me.ActiveControl = TextBox1
        TextBox1.Focus()
        Me.WindowState = FormWindowState.Maximized


    End Sub
    Function CheckInput(ByVal input As String) As String
        Dim result As String = ""
        Dim thaiCharacters As String = "ๅ/-ภถุึคตจ"
        Dim engCharacters As String = "1234567890"
        For Each ch As Char In input
            Dim index As Integer = thaiCharacters.IndexOf(ch)
            If index <> -1 Then
                result &= engCharacters.Chars(index)
            Else
                result &= ch
            End If
        Next
        Return result
    End Function



End Class