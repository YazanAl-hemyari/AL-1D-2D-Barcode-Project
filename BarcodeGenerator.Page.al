page 50300 "BG Barcode Generator"
{

    ApplicationArea = All;
    Caption = 'Barcode Generator';
    PageType = List;
    SourceTable = "BL Barcode List";
    UsageCategory = Lists;
    CardPageId = 50302;
    Editable = false;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Barcode No."; rec."Barcode No.")
                {
                    ToolTip = 'Specifies the value of the Barcode';
                    ApplicationArea = All;
                }
                field(Description; rec.Description)
                {
                    ToolTip = 'Specifies the Description of the Barcode.';
                    ApplicationArea = All;
                }
                field("Barcode Picture"; rec."Barcode Picture")
                {

                    ApplicationArea = All;
                }

            }
        }
    }
    actions
    {
        area(Processing)
        {
            action(CreateBar)
            {
                Caption = 'Create Barcode';
                ApplicationArea = all;
                trigger OnAction()
                var
                    B: Codeunit "Barcode 3 of 9";
                    OutS: OutStream;
                begin
                    rec.CalcFields("BarCode Picture");
                    rec."BarCode Picture".CreateOutStream(OutS);
                    B.SetDPI(48, 9600, 900);
                    B.AddQuiet(true);
                    B.MkBarcode(rec."BarCode No.", OutS, true);
                    Modify();
                end;
            }
        }
        area(Reporting)
        {
            action("1D Barecode Report")
            {
                ApplicationArea = All;
                Caption = '1D Barecode Report';
                Image = Report;
                ToolTip = '1D Barecode Report';
                RunPageMode = View;
                RunObject = report "1D Item BarCodes";
            }
            action("2D Barecode Report")
            {
                ApplicationArea = All;
                Caption = '2D Barecode Report';
                Image = Report;
                ToolTip = '2D Barecode Report';
                RunPageMode = View;
                RunObject = report "2D Barcode Item";
            }
        }
    }

}
