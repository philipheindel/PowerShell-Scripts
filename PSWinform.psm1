Add-Type -AssemblyName System.Windows.Forms
Add-Type -Name Window -Namespace Console -MemberDefinition '
[DllImport("Kernel32.dll")]
public static extern IntPtr GetConsoleWindow();

[DllImport("user32.dll")]
public static extern bool ShowWindow(IntPtr hWnd, Int32 nCmdShow);
'

function New-Form {
    <#
    .SYNOPSIS
        Initializes a new form object.

    .DESCRIPTION

    .PARAMETER Text
        The window text displayed at the top of the form. Default = Form1.

    .PARAMETER Width
        The width of the new form. Also affects the width of the controls within. Default = 200.

    .PARAMETER DisableVisualStyles
        Causes EnableVisualStyles() to not be called which is called by default.

    .INPUTS
        This function does not accept any piped inputs.

    .OUTPUTS
        
    #>
    [Alias("Initialize-Form", "frm")]
    [CmdletBinding(DefaultParameterSetName = "Form")]
    [OutputType([System.Windows.Forms.Form])]
    Param(
        [Parameter(ParameterSetName = "Form", Position = 0)]
        [System.String]$Text = "Form1",
        [Parameter(ParameterSetName = "Form", Position = 1)]
        [System.Int32]$Width = 200,
        [Parameter(ParameterSetName = "Form", Position = 2)]
        [System.Management.Automation.SwitchParameter]$DisableVisualStyles
    )
    process {
        if (-not $DisableVisualStyles) {
            [System.Windows.Forms.Application]::EnableVisualStyles()
        }

        [System.Windows.Forms.Form]$newForm = New-Object -TypeName System.Windows.Forms.Form

        Write-Output -InputObject $newForm
    }
}