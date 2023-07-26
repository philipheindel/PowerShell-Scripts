Add-Type -AssemblyName System.Windows.Forms
Add-Type -Name Window -Namespace Console -MemberDefinition '
[DllImport("Kernel32.dll")]
public static extern IntPtr GetConsoleWindow();
[DllImport("user32.dll")]
public static extern bool ShowWindow(IntPtr hWnd, Int32 nCmdShow);
'

function Initialize-Form
{
    [CmdletBinding()]
    [OutputType([System.Windows.Forms.Form])]
    [alias("frm")]
    param(
        [Bool]$AllowDrop = $false,
        [Parameter(Mandatory = $true)]
        [String]$Name,
        [String]$Text,
        [Int]$Width = 300,
        [Int]$Height = 300
    )
    begin {
        if (-not $Text) {
            $Text = $Name
        }
        $Properties = @{
            AllowDrop = $AllowDrop
            AutoScaleMode = [System.Windows.Forms.AutoScaleMode]::Font
            ClientSize = New-Object System.Drawing.Size($Width, $Height)
            Name = $Name
            Text = $Text
        }
    }
    process {
        [System.Windows.Forms.Application]::EnableVisualStyles()

        New-Object -TypeName System.Windows.Forms.Form -Property $Properties
    }
}

function Initialize-Control {
    [CmdletBinding()]
    [OutputType([System.Windows.Forms.Control])]
    param(
        [Parameter(Mandatory = $true)]
        [String]$Name,
        [String]$Text,
        [Int]$Width = 300,
        [Int]$Height = 300,
        [Int]$Xpos = 0,
        [Int]$Ypos = 0,
        [scriptblock]$Click
    )
}

function Initialize-Button {
    [CmdletBinding()]
    [OutputType([System.Windows.Forms.Button])]
    param(
        [Parameter(Mandatory = $true)]
        [System.Windows.Forms.Form]$Form,
        [Parameter(Mandatory = $true)]
        [String]$Name,
        [String]$Text,
        [Int]$Width = 300,
        [Int]$Height = 300,
        [Int]$Xpos = 0,
        [Int]$Ypos = 0,
        [scriptblock]$Click
    )
    begin {
        $Properties = @{
            Name = $Name
            Text = "$($Text)"
            ClientSize = New-Object System.Drawing.Size($Width, $Height)
            Location = New-Object -TypeName System.Drawing.Point($Xpos, $Ypos)
            Add_Click = $Click
        }
    }
    process {
        $NewButton = New-Object -TypeName System.Windows.Forms.Button -Property $Properties
        $Form.Controls.Add($NewButton)
        $NewButton
    }
}

function Show-Form {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory = $true)]
        [System.Windows.Forms.Form]$Form,
        [scriptblock]$Click
    )
    process {
        $Form.ShowDialog()
    }
}

Export-ModuleMember -Function Initialize-Form
Export-ModuleMember -Function Initialize-Button
Export-ModuleMember -Function Show-Form
