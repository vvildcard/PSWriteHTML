﻿Import-Module .\PSWriteHTML.psd1 -Force

$Test = Get-Process | Select-Object -First 2 -Property Name, Id, PriorityClass, HandleCount, WorkingSet
New-HTML -TitleText 'My title' -UseCssLinks:$true -UseJavaScriptLinks:$true -FilePath $PSScriptRoot\Example-Tabs03.html -Show {
    #New-HTMLTabOptions -SlimTabs -Transition -LinearGradient -SelectorColor Gold -SelectorColorTarget AliceBlue
    New-HTMLTab -Name 'First Level Tab - Test 1' -IconBrands acquisitions-incorporated {
        New-HTMLTable -ArrayOfObjects $Test -HideFooter
        New-HTMLTab -Name '2nd Level Tab - Test 1' -IconRegular address-card {
            New-HTMLTable -ArrayOfObjects $Test -HideFooter
        }
    }
    New-HTMLTab -Name 'First Level Tab - Test 4' -IconSolid bezier-curve {
        New-HTMLTab -Name '2nd Level Tab - Test 4/1' -IconBrands app-store {
            New-HTMLTable -ArrayOfObjects $Test -HideFooter {
                New-HTMLTableHeader -Names 'ID', 'HandleCount' -ResponsiveOperations none
            }
        }
        New-HTMLTab -Name '2nd Level Tab - Test 4/2' {
            New-HTMLTable -ArrayOfObjects $Test -HideFooter {
                New-HTMLTableHeader -Names 'ID', 'HandleCount' -ResponsiveOperations none
            }
        }
    }

}