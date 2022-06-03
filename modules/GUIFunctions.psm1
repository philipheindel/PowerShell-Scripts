Add-Type -assembly System.Windows.Forms

Function New-Component {
    Param(
        [String] $type,
        [String] $text,
        [int] $x,
        [int] $y,
        [int] $W,
        [int] $h,
        [System.Windows.Forms.Form] $parent
    )
    switch ($type.ToLower()) {
        ("button") {
            $newComponent = New-Object System.Windows.Forms.Button
        }
        ("label") {
            $newComponent = New-Object System.Windows.Forms.Label
        }
        ("textbox") {
            $newComponent = New-Object System.Windows.Forms.TextBox
        }
        ("checkbox") {
            $newComponent = New-Object System.Windows.Forms.CheckBox
        }
        ("combobox") {
            $newComponent = New-Object System.Windows.Forms.ComboBox
        }
        Default {
            Write-Host "it broke"
        }
    }

    if ($w -And $h) {
        $newSize = New-Object System.Drawing.Point($w, $h)
        $newComponent.Size = $newSize
    }

    if ($x -And $y) {
        $newLocation = New-Object System.Drawing.Point($x, $y)
        $newComponent.Location = $newLocation
    }
    
    if ($text) {
        $newComponent.Text = $text
    }
    
    if ($parent) {
        $parent.Controls.Add($newComponent)
    }

    Return $newComponent
}

Export-ModuleMember -Function New-Component
