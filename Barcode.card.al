page 50302 "Barcode Card"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "BL Barcode List";

    layout
    {
        area(Content)
        {
            group("Barcode Details")
            {
                field("Barcode No."; rec."Barcode No.")
                {
                    ApplicationArea = All;
                }

                field("Barcode Picture"; rec."Barcode Picture")
                {
                    ShowCaption = false;
                    ApplicationArea = All;
                }
                field(Description; rec.Description)
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
    }

    var
        myInt: Integer;
}