Add-Type -AssemblyName System.Windows.Forms
Add-Type -Name Window -Namespace Console -MemberDefinition '
[DllImport("Kernel32.dll")]
public static extern IntPtr GetConsoleWindow();

[DllImport("user32.dll")]
public static extern bool ShowWindow(IntPtr hWnd, Int32 nCmdShow);
'

[System.Windows.Forms.Form]$private:FormSingleton = $null

function New-Form {
    <#
    .SYNOPSIS
        Initializes a new form object.

    .DESCRIPTION

    .PARAMETER Name
        The name used to identify the form object. Default = Form1.

    .PARAMETER Text
        The window text displayed at the top of the form. Default = Form1.

    .PARAMETER Width
        The width of the new form. Also affects the width of the controls within. Default = 200.

    .PARAMETER DisableVisualStyles
        Causes EnableVisualStyles() to not be called which is called by default.

    .PARAMETER AutoScaleMode
        Sets the AutoScaleMode of the form. Default = Font.

    .INPUTS
        This function does not accept any piped inputs.

    .OUTPUTS
        
    #>
    [Alias("Initialize-Form", "frm")]
    [CmdletBinding(DefaultParameterSetName = "Form")]
    [OutputType([System.Windows.Forms.Form])]
    Param(
        [Parameter(ParameterSetName = "Form", 
                   Position = 0,
                   Mandatory)]
        [System.String]$Name = "Form1",
        [Parameter(ParameterSetName = "Form", 
                   Position = 0)]
        [System.String]$Text = "Form1",
        [Parameter(ParameterSetName = "Form", 
                   Position = 1)]
        [Alias("ClientWidth")]
        [System.Int32]$Width = 200,
        [Parameter(ParameterSetName = "Form", 
                   Position = 2)]
        [System.Windows.Forms.AutoScaleMode]$AutoScaleMode = [System.Windows.Forms.AutoScaleMode]::Font,
        [Parameter(ParameterSetName = "Form", 
                   Position = 3)]
        [System.Management.Automation.SwitchParameter]$AutoScroll,
        [Parameter(ParameterSetName = "Form", 
                   Position = 100)]
        [System.Management.Automation.SwitchParameter]$DisableVisualStyles
    )
    begin {
        if (-not $DisableVisualStyles) {
            [System.Windows.Forms.Application]::EnableVisualStyles()
        }

        if ($Name -ne "Form1" -and $Text -eq "Form1") {
            $formText = $Name
        } else {
            $formText = $Text
        }


    }
    process {
        

        [System.Windows.Forms.Form]$newForm = New-Object -TypeName System.Windows.Forms.Form

        $newForm.Name = $Name
        $newForm.Text = $formText
        $newForm.ClientSize = New-Object -TypeName System.Drawing.Size($Width, 0)
        $newForm.AutoScaleMode = $AutoScaleMode
        
        

        Write-Output -InputObject $newForm
    }
    end {
        Write-Output
    }
}

function Show-Form {
    <#
    .SYNOPSIS
        Shows the provided form as a dialog window.

    .DESCRIPTION

    .PARAMETER Form
        The form to show.

    .INPUTS
        The Form parameter can be passed as a pipeline input. 
    #>
    [Alias("sfrm")]
    [CmdletBinding()]
    Param(
        [Parameter(ParameterSetName = "a", 
                   Position = 0, 
                   Mandatory, 
                   ValueFromPipeline)]
        [System.Windows.Forms.Form]$Form
    )

    $Form.ShowDialog()
}

Export-ModuleMember -Function New-Form -Alias @("Initialize-Form", "frm")
Export-ModuleMember -Function Show-Form -Alias @("sfrm")