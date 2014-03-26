unit PopbillTaxinvoice;

interface

uses
        TypInfo,SysUtils,Classes,
        Popbill,
        Linkhub;
type

        EnumMgtKeyType = (SELL,BUY,TRUSTEE);

        TTaxinvoiceDetail = class
        public
                SerialNum       : Integer;
                PurchaseDT      : string;
                ItemName        : string;
                Spec            : string;
                Qty             : string;
                UnitCost        : string;
                SupplyCost      : string;
                Tax             : string;
                Remark          : string;
        end;
        TDetailList     = Array of TTaxinvoiceDetail;

        TTaxinvoiceAddContact = class
        public
                serialNum       : Integer;
                Email           : string;
                ContactName     : string;
        end;

        TContactList    =       Array of TTaxinvoiceAddContact;
        
        TTaxinvoice = class
        public
                WriteDate            : string;
                ChargeDirection      : string;
                IssueType            : string;
                IssueTiming          : string;
                TaxType              : string;
               
                InvoicerCorpNum      : string;
                InvoicerMgtKey       : string;
                InvoicerTaxRegID     : string;
                InvoicerCorpName     : string;
                InvoicerCEOName      : string;
                InvoicerAddr         : string;
                InvoicerBizClass     : string;
                InvoicerBizType      : string;
                InvoicerContactName  : string;
                InvoicerDeptName     : string;
                InvoicerTEL          : string;
                InvoicerHP           : string;
                InvoicerEmail        : string;
                InvoicerSMSSendYN    : Boolean;

                InvoiceeType         : string;
                InvoiceeCorpNum      : string;
                InvoiceeMgtKey       : string;
                InvoiceeTaxRegID     : string;
                InvoiceeCorpName     : string;
                InvoiceeCEOName      : string;
                InvoiceeAddr         : string;
                InvoiceeBizClass     : string;
                InvoiceeBizType      : string;
                InvoiceeContactName1 : string;
                InvoiceeDeptName1    : string;
                InvoiceeTEL1         : string;
                InvoiceeHP1          : string;
                InvoiceeEmail1       : string;
                InvoiceeContactName2 : string;
                InvoiceeDeptName2    : string;
                InvoiceeTEL2         : string;
                InvoiceeHP2          : string;
                InvoiceeEmail2       : string;
                InvoiceeSMSSendYN    : Boolean;

                TrusteeCorpNum       : string;
                TrusteeMgtKey        : string;
                TrusteeTaxRegID      : string;
                TrusteeCorpName      : string;
                TrusteeCEOName       : string;
                TrusteeAddr          : string;
                TrusteeBizClass      : string;
                TrusteeBizType       : string;
                TrusteeContactName   : string;
                TrusteeDeptName      : string;
                TrusteeTEL           : string;
                TrusteeHP            : string;
                TrusteeEmail         : string;
                TrusteeSMSSendYN     : Boolean;

                TaxTotal             : string;
                SupplyCostTotal      : string;
                TotalAmount          : string;
                ModifyCode           : string;
                OrgNTSConfirmNum     : string;
                PurposeType          : string;
                SerialNum            : string;
                Cash                 : string;
                ChkBill              : string;
                Credit               : string;
                Note                 : string;
                Remark1              : string;
                Remark2              : string;
                Remark3              : string;
                Kwon                 : string;
                Ho                   : string;
                BusinessLicenseYN    : Boolean;
                BankBookYN           : Boolean;
                FaxSendYN            : Boolean;
                FaxReceiveNum        : string;
                NTSConfirmNum        : string;
                OriginalTaxinvoiceKey : string;
                DetailList              : TDetailList;
                AddContactList          : TContactList;

        end;

        TTaxinvoiceInfo = class
        public
                ItemKey                 : string;
                StateCode               : Integer;
                TaxType                 : string;
                PurposeType             : string;
                ModifyCode              : string;
                IssueType               : string;

                WriteDate               : string;

                InvoicerCorpName        : string;
                InvoicerCorpNum         : string;
                InvoicerMgtKey          : string;
                InvoiceeCorpName        : string;
                InvoiceeCorpNum         : string;
                InvoiceeMgtKey          : string;
                TrusteeCorpName         : string;
                TrusteeCorpNum          : string;
                TrusteeMgtKey           : string;

                SupplyCostTotal         : string;
                TaxTotal                : string;

                IssueDT                 : string;
                PreIssueDT              : string;
                StateDT                 : string;
                OpenYN                  : boolean;
                OpenDT                  : string;

                NTSResult               : string;
                NTSConfirmNum           : string;
                NTSSendDT               : string;
                NTSResultDT             : string;
                NTSSendErrCode          : string;

                StateMemo               : string;

                RegDT                   : string;

        end;

        TTaxinvoiceInfoList = Array of TTaxinvoiceInfo;

        TTaxinvoiceLog = class
        public
                DocLogType      : Integer;
                Log             : string;
                ProcType        : string;
                ProcCorpName    : string;
                ProcContactName : string;
                ProcMemo        : string;
                RegDT           : string;
                IP              : string;
        end;

        TTaxinvoiceLogList = Array Of TTaxinvoiceLog;


        TAttachedFile = class
        public
                SerialNum       : Integer;
                AttachedFile    : String;
                DisplayName     : String;
                RegDT           : string;
        end;

        TAttachedFileList = Array of TAttachedFile;

        TEmailPublicKey = class
        public
                confirmNum      : string;
                email           : string;
                regDT           : string;
        end;

        TEmailPublicKeyList = Array of TEmailPublicKey;


        TTaxinvoiceService = class(TPopbillBaseService)
        private                                  
                
                function jsonToTTaxinvoiceInfo(json : String) : TTaxinvoiceInfo;
                function jsonToTTaxinvoice(json : String) : TTaxinvoice;
                function TTaxinvoiceTojson(Taxinvoice : TTaxinvoice; writeSpecification : boolean) : String;
                
        public

                //팝빌 세금계산서 연결 url.
                function GetTaxinvoiceURL(CorpNum : String; UserID : String; TOGO : String) : String;

                //관리번호 사용여부 확인
                function CheckMgtKeyInUse(CorpNum : String; MgtKeyType:EnumMgtKeyType; MgtKey : String) : boolean;
                
                //임시저장.
                function Register(CorpNum : String; Taxinvoice : TTaxinvoice; UserID : String; writeSpecification : boolean = false) : TResponse;
                //수정.
                function Update(CorpNum : String; MgtKeyType:EnumMgtKeyType; MgtKey : String; Taxinvoice : TTaxinvoice; UserID : String; writeSpecification : boolean = false) : TResponse;

                //발행예정.
                function Send(CorpNum : String; MgtKeyType:EnumMgtKeyType; MgtKey : String; Memo : String; UserID : String) : TResponse;
                //발행예정 취소.
                function CancelSend(CorpNum : String; MgtKeyType:EnumMgtKeyType; MgtKey : String; Memo : String; UserID : String) : TResponse;
                //발행예정 승인.
                function Accept(CorpNum : String; MgtKeyType:EnumMgtKeyType; MgtKey : String; Memo : String; UserID : String) : TResponse;
                //발행예정 거부.
                function Deny(CorpNum : String; MgtKeyType:EnumMgtKeyType; MgtKey : String; Memo : String; UserID : String) : TResponse;

                //발행.
                function Issue(CorpNum : String; MgtKeyType:EnumMgtKeyType; MgtKey : String; Memo : String; EmailSubject : String; ForceIssue : Boolean; UserID : String) : TResponse;
                //발행취소.
                function CancelIssue(CorpNum : String; MgtKeyType:EnumMgtKeyType; MgtKey : String; Memo : String; UserID : String) : TResponse;

                //역)발행요청.
                function Request(CorpNum : String; MgtKeyType:EnumMgtKeyType; MgtKey : String; Memo : String; UserID : String) : TResponse;
                //역)발행요청 거부.
                function Refuse(CorpNum : String; MgtKeyType:EnumMgtKeyType; MgtKey : String; Memo : String; UserID : String) : TResponse;
                //역)발행요청 취소.
                function CancelRequest(CorpNum : String; MgtKeyType:EnumMgtKeyType; MgtKey : String; Memo : String; UserID : String) : TResponse;

                //삭제.
                function Delete(CorpNum : String; MgtKeyType:EnumMgtKeyType;  MgtKey: String; UserID : String) : TResponse;

                //국세청 전송.
                function SendToNTS(CorpNum : String; MgtKeyType:EnumMgtKeyType; MgtKey :String; UserID : String) : TResponse;

                //이메일재전송.
                function SendEmail(CorpNum : String; MgtKeyType:EnumMgtKeyType; MgtKey :String; Receiver:String; UserID : String) : TResponse;
                //문자재전송.
                function SendSMS(CorpNum : String; MgtKeyType:EnumMgtKeyType; MgtKey :String; Sender:String; Receiver:String; Contents : String; UserID : String) : TResponse;
                // 팩스 재전송.
                function SendFAX(CorpNum : String; MgtKeyType:EnumMgtKeyType; MgtKey :String; Sender:String; Receiver:String; UserID : String) : TResponse;

                //세금계산서 요약정보 및 상태정보 확인.
                function GetInfo(CorpNum : string; MgtKeyType:EnumMgtKeyType; MgtKey: string) : TTaxinvoiceInfo;
                //세금계산서 상세정보 확인
                function GetDetailInfo(CorpNum : string; MgtKeyType:EnumMgtKeyType; MgtKey: string) : TTaxinvoice;

                //세금계산서 요약정보 및 상태 다량 확인.
                function GetInfos(CorpNum : string; MgtKeyType:EnumMgtKeyType; MgtKeyList: Array Of String) : TTaxinvoiceInfoList;
                //문서이력 확인.
                function GetLogs(CorpNum : string; MgtKeyType:EnumMgtKeyType; MgtKey: string) : TTaxinvoiceLogList;
                //파일 첨부.
                function AttachFile(CorpNum : String; MgtKeyType:EnumMgtKeyType; MgtKey : String; FilePath : String; UserID : String) : TResponse;
                //첨부파일 목록 확인.
                function GetFiles(CorpNum: String; MgtKeyType : EnumMgtKeyType; MgtKey : String) : TAttachedFileList;
                //첨부파일 삭제.
                function DeleteFile(CorpNum: string; MgtKeyType : EnumMgtKeyType; MgtKey : String; FileID : String; UserID : String) : TResponse;
                //팝업URL
                function GetPopUpURL(CorpNum: string; MgtKeyType : EnumMgtKeyType; MgtKey : String; UserID: String) : string;
                //인쇄URL
                function GetPrintURL(CorpNum: string; MgtKeyType : EnumMgtKeyType; MgtKey : String; UserID: String) : string;
                //다량인쇄URL
                function GetMassPrintURL(CorpNum: string; MgtKeyType : EnumMgtKeyType; MgtKeyList: Array Of String; UserID: String) : string;

                //Mail URL
                function GetMailURL(CorpNum: string; MgtKeyType : EnumMgtKeyType; MgtKey : String; UserID: String) : string;

                //회원 등록인증서 만료일 확인.
                function GetCertificateExpireDate(CorpNum : String) : string;
                
                //회원별 세금계산서 발행단가 확인.
                function GetUnitCost(CorpNum : String) : Single;

                //ASP 사업자 유통메일목록 확인.
                function GetEmailPublicKeys(CorpNum : String) : TEmailPublicKeyList;
        end;



implementation

function TTaxinvoiceService.GetTaxinvoiceURL(CorpNum : String; UserID : String; TOGO : String) : String;
var
        responseJson : String;
begin
        responseJson := httpget('/Taxinvoice/?TG='+ TOGO,CorpNum,UserID);
        result := getJSonString(responseJson,'url');
end;

function TTaxinvoiceService.CheckMgtKeyInUse(CorpNum : String; MgtKeyType:EnumMgtKeyType; MgtKey : String): boolean;
var
        responseJson : string;
        taxinvoiceInfo : TTaxinvoiceInfo;
begin
        if MgtKey = '' then
        begin
                raise EPopbillException.Create(-99999999,'관리번호가 입력되지 않았습니다.');
                Exit;
        end;

        try
                responseJson := httpget('/Taxinvoice/'+ GetEnumName(TypeInfo(EnumMgtKeyType),integer(MgtKeyType)) + '/'+MgtKey , CorpNum,'');
        except
                on E : EPopbillException do
                begin
                        if E.code = -11000005 then begin
                                result := false;
                                Exit;
                        end;
                        Raise E;
                end;
        end;
        taxinvoiceInfo := jsonToTTaxinvoiceInfo(responseJson);

        result:= taxinvoiceInfo.ItemKey <> '';
end;

function TTaxinvoiceService.TTaxinvoiceTojson(Taxinvoice : TTaxinvoice; writeSpecification : boolean) : String;
var
        requestJson : string;
        i : integer;
begin
       requestJson := '{';
        
        if writeSpecification then
        requestJson := requestJson + '"writeSpecification":true,';

        requestJson := requestJson + '"WriteDate":"'+ Taxinvoice.WriteDate +'",';

        requestJson := requestJson + '"ChargeDirection":"'+ Taxinvoice.ChargeDirection +'",';
        requestJson := requestJson + '"IssueType":"'+ Taxinvoice.IssueType +'",';
        requestJson := requestJson + '"IssueTiming":"'+ Taxinvoice.IssueTiming +'",';
        requestJson := requestJson + '"TaxType":"'+ Taxinvoice.TaxType +'",';
        requestJson := requestJson + '"InvoicerCorpNum":"'+ Taxinvoice.InvoicerCorpNum +'",';
        requestJson := requestJson + '"InvoicerMgtKey":"'+ Taxinvoice.InvoicerMgtKey +'",';
        requestJson := requestJson + '"InvoicerTaxRegID":"'+ Taxinvoice.InvoicerTaxRegID +'",';
        requestJson := requestJson + '"InvoicerCorpName":"'+ Taxinvoice.InvoicerCorpName +'",';
        requestJson := requestJson + '"InvoicerCEOName":"'+ Taxinvoice.InvoicerCEOName +'",';
        requestJson := requestJson + '"InvoicerAddr":"'+ Taxinvoice.InvoicerAddr +'",';
        requestJson := requestJson + '"InvoicerBizClass":"'+ Taxinvoice.InvoicerBizClass +'",';
        requestJson := requestJson + '"InvoicerBizType":"'+ Taxinvoice.InvoicerBizType +'",';
        requestJson := requestJson + '"InvoicerContactName":"'+ Taxinvoice.InvoicerContactName +'",';
        requestJson := requestJson + '"InvoicerDeptName":"'+ Taxinvoice.InvoicerDeptName +'",';
        requestJson := requestJson + '"InvoicerTEL":"'+ Taxinvoice.InvoicerTEL +'",';
        requestJson := requestJson + '"InvoicerHP":"'+ Taxinvoice.InvoicerHP +'",';
        requestJson := requestJson + '"InvoicerEmail":"'+ Taxinvoice.InvoicerEmail +'",';

        if Taxinvoice.InvoicerSMSSendYN then
        requestJson := requestJson + '"InvoicerSMSSendYN":true,';

        requestJson := requestJson + '"InvoiceeCorpNum":"'+ Taxinvoice.InvoiceeCorpNum +'",';
        requestJson := requestJson + '"InvoiceeType":"'+ Taxinvoice.InvoiceeType +'",';
        requestJson := requestJson + '"InvoiceeMgtKey":"'+ Taxinvoice.InvoiceeMgtKey +'",';
        requestJson := requestJson + '"InvoiceeTaxRegID":"'+ Taxinvoice.InvoiceeTaxRegID +'",';
        requestJson := requestJson + '"InvoiceeCorpName":"'+ Taxinvoice.InvoiceeCorpName +'",';
        requestJson := requestJson + '"InvoiceeCEOName":"'+ Taxinvoice.InvoiceeCEOName +'",';
        requestJson := requestJson + '"InvoiceeAddr":"'+ Taxinvoice.InvoiceeAddr +'",';
        requestJson := requestJson + '"InvoiceeBizType":"'+ Taxinvoice.InvoiceeBizType +'",';
        requestJson := requestJson + '"InvoiceeBizClass":"'+ Taxinvoice.InvoiceeBizClass +'",';
        requestJson := requestJson + '"InvoiceeContactName1":"'+ Taxinvoice.InvoiceeContactName1 +'",';
        requestJson := requestJson + '"InvoiceeDeptName1":"'+ Taxinvoice.InvoiceeDeptName1 +'",';
        requestJson := requestJson + '"InvoiceeTEL1":"'+ Taxinvoice.InvoiceeTEL1 +'",';
        requestJson := requestJson + '"InvoiceeHP1":"'+ Taxinvoice.InvoiceeHP1 +'",';
        requestJson := requestJson + '"InvoiceeEmail1":"'+ Taxinvoice.InvoiceeEmail1 +'",';
        requestJson := requestJson + '"InvoiceeContactName2":"'+ Taxinvoice.InvoiceeContactName2 +'",';
        requestJson := requestJson + '"InvoiceeDeptName2":"'+ Taxinvoice.InvoiceeDeptName2 +'",';
        requestJson := requestJson + '"InvoiceeTEL2":"'+ Taxinvoice.InvoiceeTEL2 +'",';
        requestJson := requestJson + '"InvoiceeEmail2":"'+ Taxinvoice.InvoiceeEmail2 +'",';

        if Taxinvoice.InvoiceeSMSSendYN then
        requestJson := requestJson + '"InvoiceeSMSSendYN":true,';

        requestJson := requestJson + '"TrusteeCorpNum":"'+ Taxinvoice.TrusteeCorpNum +'",';
        requestJson := requestJson + '"TrusteeMgtKey":"'+ Taxinvoice.TrusteeMgtKey +'",';
        requestJson := requestJson + '"TrusteeTaxRegID":"'+ Taxinvoice.TrusteeTaxRegID +'",';
        requestJson := requestJson + '"TrusteeCorpName":"'+ Taxinvoice.TrusteeCorpName +'",';
        requestJson := requestJson + '"TrusteeCEOName":"'+ Taxinvoice.TrusteeCEOName +'",';
        requestJson := requestJson + '"TrusteeAddr":"'+ Taxinvoice.TrusteeAddr +'",';
        requestJson := requestJson + '"TrusteeBizType":"'+ Taxinvoice.TrusteeBizType +'",';
        requestJson := requestJson + '"TrusteeBizClass":"'+ Taxinvoice.TrusteeBizClass +'",';
        requestJson := requestJson + '"TrusteeContactName":"'+ Taxinvoice.TrusteeContactName +'",';
        requestJson := requestJson + '"TrusteeDeptName":"'+ Taxinvoice.TrusteeDeptName +'",';
        requestJson := requestJson + '"TrusteeTEL":"'+ Taxinvoice.TrusteeTEL +'",';
        requestJson := requestJson + '"TrusteeHP":"'+ Taxinvoice.TrusteeHP +'",';
        requestJson := requestJson + '"TrusteeEmail":"'+ Taxinvoice.TrusteeEmail +'",';

        if Taxinvoice.TrusteeSMSSendYN then
        requestJson := requestJson + '"TrusteeSMSSendYN":true,';

        requestJson := requestJson + '"TaxTotal":"'+ Taxinvoice.TaxTotal +'",';
        requestJson := requestJson + '"SupplyCostTotal":"'+ Taxinvoice.SupplyCostTotal +'",';
        requestJson := requestJson + '"TotalAmount":"'+ Taxinvoice.TotalAmount +'",';
        if Taxinvoice.ModifyCode <> '' then
        requestJson := requestJson + '"ModifyCode":'+ Taxinvoice.ModifyCode +',';
        
        requestJson := requestJson + '"OrgNTSConfirmNum":"'+ Taxinvoice.OrgNTSConfirmNum +'",';
        requestJson := requestJson + '"PurposeType":"'+ Taxinvoice.PurposeType +'",';
        requestJson := requestJson + '"SerialNum":"'+ Taxinvoice.SerialNum +'",';
        requestJson := requestJson + '"Cash":"'+ Taxinvoice.Cash +'",';
        requestJson := requestJson + '"ChkBill":"'+ Taxinvoice.ChkBill +'",';
        requestJson := requestJson + '"Credit":"'+ Taxinvoice.Credit +'",';
        requestJson := requestJson + '"Note":"'+ Taxinvoice.Note +'",';
        if Taxinvoice.Kwon <> '' then
        requestJson := requestJson + '"Kwon":'+ Taxinvoice.Kwon +',';
        if Taxinvoice.HO <> '' then
        requestJson := requestJson + '"Ho":'+ Taxinvoice.Ho +',';

        if Taxinvoice.BusinessLicenseYN then
        requestJson := requestJson + '"BusinessLicenseYN":true,';

        if Taxinvoice.BankBookYN then
        requestJson := requestJson + '"BankBookYN":true,';

        if Taxinvoice.FAXSendYN then
        requestJson := requestJson + '"FAXSendYN":true,';

        requestJson := requestJson + '"FAXReceiveNum":"'+ Taxinvoice.FAXReceiveNum +'",';
        requestJson := requestJson + '"NTSConfirmNum":"'+ Taxinvoice.NTSConfirmNum +'",';
        requestJson := requestJson + '"OriginalTaxinvoiceKey":"'+ Taxinvoice.OriginalTaxinvoiceKey +'",';

        if Length(Taxinvoice.detailList) > 0 then
        begin
                requestJson := requestJson + '"DetailList":[';

                for i := 0 to Length(Taxinvoice.detailList)-1 do
                begin
                        requestJson := requestJson + '{';
                        requestJson := requestJson + '"SerialNum":"' + IntToStr(Taxinvoice.detailList[i].SerialNum) + '",';
                        requestJson := requestJson + '"PurchaseDT":"' +Taxinvoice.detailList[i].PurchaseDT + '",';
                        requestJson := requestJson + '"ItemName":"' +Taxinvoice.detailList[i].ItemName + '",';
                        requestJson := requestJson + '"Spec":"' +Taxinvoice.detailList[i].Spec + '",';
                        requestJson := requestJson + '"Qty":"' +Taxinvoice.detailList[i].Qty + '",';
                        requestJson := requestJson + '"UnitCost":"' +Taxinvoice.detailList[i].UnitCost + '",';
                        requestJson := requestJson + '"SupplyCost":"' +Taxinvoice.detailList[i].SupplyCost + '",';
                        requestJson := requestJson + '"Tax":"' +Taxinvoice.detailList[i].Tax + '",';
                        requestJson := requestJson + '"Remark":"' +Taxinvoice.detailList[i].Remark + '"';
                        requestJson := requestJson + '}';
                        if i < Length(Taxinvoice.detailList) - 1 then
                                 requestJson := requestJson + ',';

                end;

                requestJson := requestJson + '],';

        end;

        if Length(Taxinvoice.AddContactList) > 0 then
        begin
                requestJson := requestJson + '"AddContactList":[';

                for i := 0 to Length(Taxinvoice.AddContactList)-1 do
                begin
                        requestJson := requestJson + '{';
                        requestJson := requestJson + '"Email":"' +Taxinvoice.AddContactList[i].Email + '",';
                        requestJson := requestJson + '"ContactName":"' +Taxinvoice.AddContactList[i].ContactName + '"';
                        requestJson := requestJson + '}';
                        if i < Length(Taxinvoice.AddContactList) - 1 then
                                 requestJson := requestJson + ',';

                end;

                requestJson := requestJson + '],';

        end;

        requestJson := requestJson + '"Remark1":"'+ Taxinvoice.Remark1 +'",';
        requestJson := requestJson + '"Remark2":"'+ Taxinvoice.Remark2 +'",';
        requestJson := requestJson + '"Remark3":"'+ Taxinvoice.Remark3 +'"';
        requestJson := requestJson + '}';

        result := requestJson;
end;

function TTaxinvoiceService.Register(CorpNum : String; Taxinvoice : TTaxinvoice; UserID : String; writeSpecification : boolean = false) : TResponse;
var
        requestJson : string;
        responseJson : string;
begin
        requestJson := TTaxinvoiceTojson(Taxinvoice,writeSpecification);

        responseJson := httppost('/Taxinvoice',CorpNum,UserID,requestJson);

        result.code := getJSonInteger(responseJson,'code');
        result.message := getJSonString(responseJson,'message');

end;

function TTaxinvoiceService.Update(CorpNum : String; MgtKeyType:EnumMgtKeyType; MgtKey : String; Taxinvoice : TTaxinvoice; UserID : String; writeSpecification : boolean = false) : TResponse;
var
        requestJson : string;
        responseJson : string;
begin
        if MgtKey = '' then
        begin
                raise EPopbillException.Create(-99999999,'관리번호가 입력되지 않았습니다.');
                Exit;
        end;
        
        requestJson := TTaxinvoiceTojson(Taxinvoice,writeSpecification);

        responseJson := httppost('/Taxinvoice/'+ GetEnumName(TypeInfo(EnumMgtKeyType),integer(MgtKeyType)) + '/'+MgtKey,
                                CorpNum,UserID,requestJson,'PATCH');

        result.code := getJSonInteger(responseJson,'code');
        result.message := getJSonString(responseJson,'message');

end;

function TTaxinvoiceService.Send(CorpNum : String; MgtKeyType:EnumMgtKeyType; MgtKey : String; Memo : String; UserID : String) : TResponse;
var
        requestJson : string;
        responseJson : string;
begin
        if MgtKey = '' then
        begin
                raise EPopbillException.Create(-99999999,'관리번호가 입력되지 않았습니다.');
                Exit;
        end;

        requestJson := '{"memo":"'+Memo+'"}';

        responseJson := httppost('/Taxinvoice/'+ GetEnumName(TypeInfo(EnumMgtKeyType),integer(MgtKeyType)) + '/'+MgtKey,
                                CorpNum,UserID,requestJson,'SEND');

        result.code := getJSonInteger(responseJson,'code');
        result.message := getJSonString(responseJson,'message');
end;

function TTaxinvoiceService.CancelSend(CorpNum : String; MgtKeyType:EnumMgtKeyType; MgtKey : String; Memo : String; UserID : String) : TResponse;
var
        requestJson : string;
        responseJson : string;
begin
        if MgtKey = '' then
        begin
                raise EPopbillException.Create(-99999999,'관리번호가 입력되지 않았습니다.');
                Exit;
        end;
        requestJson := '{"memo":"'+Memo+'"}';

        responseJson := httppost('/Taxinvoice/'+ GetEnumName(TypeInfo(EnumMgtKeyType),integer(MgtKeyType)) + '/'+MgtKey,
                                CorpNum,UserID,requestJson,'CANCELSEND');

        result.code := getJSonInteger(responseJson,'code');
        result.message := getJSonString(responseJson,'message');
end;

function TTaxinvoiceService.Accept(CorpNum : String; MgtKeyType:EnumMgtKeyType; MgtKey : String; Memo : String; UserID : String) : TResponse;
var
        requestJson : string;
        responseJson : string;
begin
        if MgtKey = '' then
        begin
                raise EPopbillException.Create(-99999999,'관리번호가 입력되지 않았습니다.');
                Exit;
        end;
        requestJson := '{"memo":"'+Memo+'"}';

        responseJson := httppost('/Taxinvoice/'+ GetEnumName(TypeInfo(EnumMgtKeyType),integer(MgtKeyType)) + '/'+MgtKey,
                                CorpNum,UserID,requestJson,'ACCEPT');

        result.code := getJSonInteger(responseJson,'code');
        result.message := getJSonString(responseJson,'message');
end;

function TTaxinvoiceService.Deny(CorpNum : String; MgtKeyType:EnumMgtKeyType; MgtKey : String; Memo : String; UserID : String) : TResponse;
var
        requestJson : string;
        responseJson : string;
begin
        if MgtKey = '' then
        begin
                raise EPopbillException.Create(-99999999,'관리번호가 입력되지 않았습니다.');
                Exit;
        end;
        requestJson := '{"memo":"'+Memo+'"}';

        responseJson := httppost('/Taxinvoice/'+ GetEnumName(TypeInfo(EnumMgtKeyType),integer(MgtKeyType)) + '/'+MgtKey,
                                CorpNum,UserID,requestJson,'DENY');

        result.code := getJSonInteger(responseJson,'code');
        result.message := getJSonString(responseJson,'message');
end;
function TTaxinvoiceService.Issue(CorpNum : String; MgtKeyType:EnumMgtKeyType; MgtKey : String; Memo : String; EmailSubject : String; ForceIssue : Boolean; UserID : String) : TResponse;
var
        requestJson : string;
        responseJson : string;
        forIssue : string;
begin
        if MgtKey = '' then
        begin
                raise EPopbillException.Create(-99999999,'관리번호가 입력되지 않았습니다.');
                Exit;
        end;

        if ForceIssue then forIssue := 'true' else forIssue := 'false';

        requestJson := '{"memo":"'+Memo+'","emailSubject":"'+EmailSubject+'","forceIssue":'+forIssue+'}';

        responseJson := httppost('/Taxinvoice/'+ GetEnumName(TypeInfo(EnumMgtKeyType),integer(MgtKeyType)) + '/'+MgtKey,
                                CorpNum,UserID,requestJson,'ISSUE');

        result.code := getJSonInteger(responseJson,'code');
        result.message := getJSonString(responseJson,'message');
end;

function TTaxinvoiceService.CancelIssue(CorpNum : String; MgtKeyType:EnumMgtKeyType; MgtKey : String; Memo : String; UserID : String) : TResponse;
var
        requestJson : string;
        responseJson : string;
begin
        if MgtKey = '' then
        begin
                raise EPopbillException.Create(-99999999,'관리번호가 입력되지 않았습니다.');
                Exit;
        end;
        requestJson := '{"memo":"'+Memo+'"}';

        responseJson := httppost('/Taxinvoice/'+ GetEnumName(TypeInfo(EnumMgtKeyType),integer(MgtKeyType)) + '/'+MgtKey,
                                CorpNum,UserID,requestJson,'CANCELISSUE');

        result.code := getJSonInteger(responseJson,'code');
        result.message := getJSonString(responseJson,'message');
end;

function TTaxinvoiceService.Request(CorpNum : String; MgtKeyType:EnumMgtKeyType; MgtKey : String; Memo : String; UserID : String) : TResponse;
var
        requestJson : string;
        responseJson : string;
begin
        if MgtKey = '' then
        begin
                raise EPopbillException.Create(-99999999,'관리번호가 입력되지 않았습니다.');
                Exit;
        end;
        requestJson := '{"memo":"'+Memo+'"}';

        responseJson := httppost('/Taxinvoice/'+ GetEnumName(TypeInfo(EnumMgtKeyType),integer(MgtKeyType)) + '/'+MgtKey,
                                CorpNum,UserID,requestJson,'REQUEST');

        result.code := getJSonInteger(responseJson,'code');
        result.message := getJSonString(responseJson,'message');
end;

function TTaxinvoiceService.Refuse(CorpNum : String; MgtKeyType:EnumMgtKeyType; MgtKey : String; Memo : String; UserID : String) : TResponse;
var
        requestJson : string;
        responseJson : string;
begin
        if MgtKey = '' then
        begin
                raise EPopbillException.Create(-99999999,'관리번호가 입력되지 않았습니다.');
                Exit;
        end;
        requestJson := '{"memo":"'+Memo+'"}';

        responseJson := httppost('/Taxinvoice/'+ GetEnumName(TypeInfo(EnumMgtKeyType),integer(MgtKeyType)) + '/'+MgtKey,
                                CorpNum,UserID,requestJson,'REFUSE');

        result.code := getJSonInteger(responseJson,'code');
        result.message := getJSonString(responseJson,'message');
end;

function TTaxinvoiceService.CancelRequest(CorpNum : String; MgtKeyType:EnumMgtKeyType; MgtKey : String; Memo : String; UserID : String) : TResponse;
var
        requestJson : string;
        responseJson : string;
begin
        if MgtKey = '' then
        begin
                raise EPopbillException.Create(-99999999,'관리번호가 입력되지 않았습니다.');
                Exit;
        end;
        requestJson := '{"memo":"'+Memo+'"}';

        responseJson := httppost('/Taxinvoice/'+ GetEnumName(TypeInfo(EnumMgtKeyType),integer(MgtKeyType)) + '/'+MgtKey,
                                CorpNum,UserID,requestJson,'CANCELREQUEST');

        result.code := getJSonInteger(responseJson,'code');
        result.message := getJSonString(responseJson,'message');
end;

function TTaxinvoiceService.SendToNTS(CorpNum : String; MgtKeyType:EnumMgtKeyType; MgtKey : String; UserID : String) : TResponse;
var
        responseJson : string;
begin
        if MgtKey = '' then
        begin
                raise EPopbillException.Create(-99999999,'관리번호가 입력되지 않았습니다.');
                Exit;
        end;

        responseJson := httppost('/Taxinvoice/'+ GetEnumName(TypeInfo(EnumMgtKeyType),integer(MgtKeyType)) + '/'+MgtKey,
                                CorpNum,UserID,'','NTS');

        result.code := getJSonInteger(responseJson,'code');
        result.message := getJSonString(responseJson,'message');
end;

function TTaxinvoiceService.SendEmail(CorpNum : String; MgtKeyType:EnumMgtKeyType; MgtKey :String; Receiver:String; UserID : String) : TResponse;
var
        requestJson : string;
        responseJson : string;
begin
        if MgtKey = '' then
        begin
                raise EPopbillException.Create(-99999999,'관리번호가 입력되지 않았습니다.');
                Exit;                                                             
        end;
        requestJson := '{"receiver":"'+Receiver+'"}';

        responseJson := httppost('/Taxinvoice/'+ GetEnumName(TypeInfo(EnumMgtKeyType),integer(MgtKeyType)) + '/'+MgtKey,
                                CorpNum,UserID,requestJson,'EMAIL');

        result.code := getJSonInteger(responseJson,'code');
        result.message := getJSonString(responseJson,'message');
end;

function TTaxinvoiceService.SendSMS(CorpNum : String; MgtKeyType:EnumMgtKeyType; MgtKey :String; Sender:String; Receiver:String; Contents : String; UserID : String) : TResponse;
var
        requestJson : string;
        responseJson : string;
begin
        if MgtKey = '' then
        begin
                raise EPopbillException.Create(-99999999,'관리번호가 입력되지 않았습니다.');
                Exit;
        end;
        requestJson := '{"sender":"'+Sender+'","receiver":"'+Receiver+'","contents":"'+Contents+'"}';

        responseJson := httppost('/Taxinvoice/'+ GetEnumName(TypeInfo(EnumMgtKeyType),integer(MgtKeyType)) + '/'+MgtKey,
                                CorpNum,UserID,requestJson,'SMS');

        result.code := getJSonInteger(responseJson,'code');
        result.message := getJSonString(responseJson,'message');
end;

function TTaxinvoiceService.SendFAX(CorpNum : String; MgtKeyType:EnumMgtKeyType; MgtKey :String; Sender:String; Receiver:String; UserID : String) : TResponse;
var
        requestJson : string;
        responseJson : string;
begin
        if MgtKey = '' then
        begin
                raise EPopbillException.Create(-99999999,'관리번호가 입력되지 않았습니다.');
                Exit;
        end;
        requestJson := '{"sender":"'+Sender+'","receiver":"'+Receiver+'"}';

        responseJson := httppost('/Taxinvoice/'+ GetEnumName(TypeInfo(EnumMgtKeyType),integer(MgtKeyType)) + '/'+MgtKey,
                                CorpNum,UserID,requestJson,'FAX');

        result.code := getJSonInteger(responseJson,'code');
        result.message := getJSonString(responseJson,'message');
end;


function TTaxinvoiceService.jsonToTTaxinvoiceInfo(json : String) : TTaxinvoiceInfo;
begin
        result := TTaxinvoiceInfo.Create;

        result.ItemKey := getJSonString(json,'itemKey');
        result.taxType := getJSonString(json,'taxType');
        result.writeDate := getJSonString(json,'writeDate');
        result.RegDT := getJSonString(json,'regDT');

        result.invoicerCorpName := getJSonString(json,'invoicerCorpName');
        result.invoicerCorpNum := getJSonString(json,'invoicerCorpNum');
        result.invoicerMgtKey := getJSonString(json,'invoicerMgtKey');
        result.invoiceeCorpName := getJSonString(json,'invoiceeCorpName');
        result.invoiceeCorpNum := getJSonString(json,'invoiceeCorpNum');
        result.invoiceeMgtKey := getJSonString(json,'invoiceeMgtKey');
        result.trusteeCorpName := getJSonString(json,'trusteeCorpName');
        result.trusteeCorpNum := getJSonString(json,'trusteeCorpNum');
        result.trusteeMgtKey := getJSonString(json,'trusteeMgtKey');

        result.supplyCostTotal := getJSonString(json,'supplyCostTotal');
        result.taxTotal := getJSonString(json,'taxTotal');
        result.purposeType := getJSonString(json,'purposeType');
        result.modifyCode := getJSonString(json,'modifyCode');
        result.issueType := getJSonString(json,'issueType');

        result.issueDT := getJSonString(json,'issueDT');
        result.preIssueDT := getJSonString(json,'preIssueDT');

        result.stateCode := getJSonInteger(json,'stateCode');
        result.stateDT := getJSonString(json,'stateDT');


        result.openYN := getJSonString(json,'openYN') = 'true';

        result.openDT := getJSonString(json,'openDT');
        result.nTSResult := getJSonString(json,'nTSResult');
        result.nTSConfirmNum := getJSonString(json,'nTSConfirmNum');
        result.nTSSendDT := getJSonString(json,'nTSSendDT');
        result.nTSResultDT := getJSonString(json,'nTSResultDT');
        result.nTSSendErrCode := getJSonString(json,'nTSSendErrCode');

        result.stateMemo := getJSonString(json,'stateMemo');

end;

function TTaxinvoiceService.getInfo(CorpNum : string; MgtKeyType:EnumMgtKeyType; MgtKey: string) : TTaxinvoiceInfo;
var
        responseJson : string;
begin
        if MgtKey = '' then
        begin
                raise EPopbillException.Create(-99999999,'관리번호가 입력되지 않았습니다.');
                Exit;
        end;

        responseJson := httpget('/Taxinvoice/'+ GetEnumName(TypeInfo(EnumMgtKeyType),integer(MgtKeyType)) + '/'+MgtKey , CorpNum,'');

        result := jsonToTTaxinvoiceInfo(responseJson);

end;


function TTaxinvoiceService.jsonToTTaxinvoice(json : String) : TTaxinvoice;
var
        jSons : ArrayOfString;
        i : Integer;
begin
        result := TTaxinvoice.Create;

        result.WriteDate                := getJSonString(json,'writeDate');
        result.ChargeDirection          := getJSonString(json,'chargeDirection');
        result.IssueType                := getJSonString(json,'issueType');
        result.IssueTiming              := getJSonString(json,'issueTiming');
        result.TaxType                  := getJSonString(json,'taxType');

        result.invoicerCorpNum          := getJSonString(json,'invoicerCorpNum');
        result.invoicerMgtKey           := getJSonString(json,'invoicerMgtKey');
        result.invoicerTaxRegID         := getJSonString(json,'invoicerTaxRegID');
        result.invoicerCorpName         := getJSonString(json,'invoicerCorpName');
        result.invoicerCEOName          := getJSonString(json,'invoicerCEOName');
        result.invoicerAddr             := getJSonString(json,'invoicerAddr');
        result.invoicerBizClass         := getJSonString(json,'invoicerBizClass');
        result.invoicerBizType          := getJSonString(json,'invoicerBizType');
        result.invoicerContactName      := getJSonString(json,'invoicerContactName');
        result.invoicerDeptName         := getJSonString(json,'invoicerDeptName');
        result.invoicerTEL              := getJSonString(json,'invoicerTEL');
        result.invoicerHP               := getJSonString(json,'invoicerHP');
        result.invoicerEmail            := getJSonString(json,'invoicerEmail');
        result.invoicerSMSSendYN        := getJSonString(json,'invoicerSMSSendYN') = 'true';

        result.invoiceeCorpNum          := getJSonString(json,'invoiceeCorpNum');
        result.invoiceeMgtKey           := getJSonString(json,'invoiceeMgtKey');
        result.invoiceeTaxRegID         := getJSonString(json,'invoiceeTaxRegID');
        result.invoiceeCorpName         := getJSonString(json,'invoiceeCorpName');
        result.invoiceeCEOName          := getJSonString(json,'invoiceeCEOName');
        result.invoiceeAddr             := getJSonString(json,'invoiceeAddr');
        result.invoiceeBizClass         := getJSonString(json,'invoiceeBizClass');
        result.invoiceeBizType          := getJSonString(json,'invoiceeBizType');
        result.invoiceeContactName1     := getJSonString(json,'invoiceeContactName1');
        result.invoiceeDeptName1        := getJSonString(json,'invoiceeDeptName1');
        result.invoiceeTEL1             := getJSonString(json,'invoiceeTEL1');
        result.invoiceeHP1              := getJSonString(json,'invoiceeHP1');
        result.invoiceeEmail1           := getJSonString(json,'invoiceeEmail1');
        result.invoiceeContactName2     := getJSonString(json,'invoiceeContactName2');
        result.invoiceeDeptName2        := getJSonString(json,'invoiceeDeptName2');
        result.invoiceeTEL2             := getJSonString(json,'invoiceeTEL2');
        result.invoiceeHP2              := getJSonString(json,'invoiceeHP2');
        result.invoiceeEmail2           := getJSonString(json,'invoiceeEmail2');
        result.invoiceeSMSSendYN        := getJSonString(json,'invoiceeSMSSendYN') = 'true';

        result.trusteeCorpNum          := getJSonString(json,'trusteeCorpNum');
        result.trusteeMgtKey           := getJSonString(json,'trusteeMgtKey');
        result.trusteeTaxRegID         := getJSonString(json,'trusteeTaxRegID');
        result.trusteeCorpName         := getJSonString(json,'trusteeCorpName');
        result.trusteeCEOName          := getJSonString(json,'trusteeCEOName');
        result.trusteeAddr             := getJSonString(json,'trusteeAddr');
        result.trusteeBizClass         := getJSonString(json,'trusteeBizClass');
        result.trusteeBizType          := getJSonString(json,'trusteeBizType');
        result.trusteeContactName      := getJSonString(json,'trusteeContactName');
        result.trusteeDeptName         := getJSonString(json,'trusteeDeptName');
        result.trusteeTEL              := getJSonString(json,'trusteeTEL');
        result.trusteeHP               := getJSonString(json,'trusteeHP');
        result.trusteeEmail            := getJSonString(json,'trusteeEmail');
        result.trusteeSMSSendYN        := getJSonString(json,'trusteeSMSSendYN') = 'true';

        result.taxTotal                := getJSonString(json,'taxTotal');
        result.supplyCostTotal         := getJSonString(json,'supplyCostTotal');
        result.totalAmount             := getJSonString(json,'totalAmount');

        result.modifyCode              := getJSonString(json,'modifyCode');

        result.orgNTSConfirmNum        := getJSonString(json,'orgNTSConfirmNum');
        result.purposeType             := getJSonString(json,'purposeType');
        result.serialNum               := getJSonString(json,'serialNum');

        result.cash                    := getJSonString(json,'cash');
        result.chkBill                 := getJSonString(json,'chkBill');
        result.credit                  := getJSonString(json,'credit');
        result.note                    := getJSonString(json,'note');

        result.remark1                 := getJSonString(json,'remark1');
        result.remark2                 := getJSonString(json,'remark2');
        result.remark3                 := getJSonString(json,'remark3');

        result.kwon                    := getJSonString(json,'kwon');
        result.ho                      := getJSonString(json,'ho');

        result.businessLicenseYN        := getJSonString(json,'businessLicenseYN') = 'true';
        result.bankBookYN               := getJSonString(json,'bankBookYN') = 'true';
        result.fAXSendYN                := getJSonString(json,'faxsendYN') = 'true';

        result.fAXReceiveNum            := getJSonString(json,'faxreceiveNum');
        result.nTSConfirmNum            := getJSonString(json,'ntsconfirmNum');
        result.originalTaxinvoiceKey    := getJSonString(json,'originalTaxinvoiceKey');

        //details.
        try
                jSons :=  getJSonList(json,'detailList');
                SetLength(result.detailList ,Length(jSons));

                for i := 0 to Length(jSons)-1 do
                begin
                        result.detailList[i] := TTaxinvoiceDetail.Create;

                        result.detailList[i].SerialNum             := getJSonInteger(jSons[i],'serialNum');
                        result.detailList[i].purchaseDT            := getJSonString(jSons[i],'purchaseDT');
                        result.detailList[i].ItemName              := getJSonString(jSons[i],'itemName');
                        result.detailList[i].spec                  := getJSonString(jSons[i],'spec');
                        result.detailList[i].qty                   := getJSonString(jSons[i],'qty');
                        result.detailList[i].unitCost              := getJSonString(jSons[i],'unitCost');
                        result.detailList[i].supplyCost            := getJSonString(jSons[i],'supplyCost');
                        result.detailList[i].tax                   := getJSonString(jSons[i],'tax');
                        result.detailList[i].remark                := getJSonString(jSons[i],'remark');
                end;

        except on E:Exception do
                raise EPopbillException.Create(-99999999,'결과처리 실패.[Malformed Json]');
        end;

        //Contacts.
        try
                jSons :=  getJSonList(json,'addContactList');
                SetLength(result.AddContactList ,Length(jSons));

                for i := 0 to Length(jSons)-1 do
                begin
                        result.AddContactList[i] := TTaxinvoiceAddContact.Create;

                        result.AddContactList[i].serialNum      := getJSonInteger(jSons[i],'serialNum');
                        result.AddContactList[i].email          := getJSonString(jSons[i],'email');
                        result.AddContactList[i].ContactName    := getJSonString(jSons[i],'contactName');
                end;

        except on E:Exception do
                raise EPopbillException.Create(-99999999,'결과처리 실패.[Malformed Json]');
        end;

end;
function TTaxinvoiceService.GetDetailInfo(CorpNum : string; MgtKeyType:EnumMgtKeyType; MgtKey: string) : TTaxinvoice;
var
        responseJson : string;
begin
        if MgtKey = '' then
        begin
                raise EPopbillException.Create(-99999999,'관리번호가 입력되지 않았습니다.');
                Exit;
        end;

        responseJson := httpget('/Taxinvoice/'+ GetEnumName(TypeInfo(EnumMgtKeyType),integer(MgtKeyType)) + '/'+MgtKey + '?Detail' , CorpNum,'');

        result := jsonToTTaxinvoice(responseJson);

end;

function TTaxinvoiceService.getLogs(CorpNum : string; MgtKeyType:EnumMgtKeyType; MgtKey: string) : TTaxinvoiceLogList;
var
        responseJson : string;
        jSons : ArrayOfString;
        i : Integer;
begin
        if MgtKey = '' then
        begin
                raise EPopbillException.Create(-99999999,'관리번호가 입력되지 않았습니다.');
                Exit;
        end;

        responseJson := httpget('/Taxinvoice/'+ GetEnumName(TypeInfo(EnumMgtKeyType),integer(MgtKeyType)) + '/'+MgtKey + '/Logs' ,
                                 CorpNum,
                                 '');

        try
                jSons := ParseJsonList(responseJson);
                SetLength(result,Length(jSons));

                for i := 0 to Length(jSons)-1 do
                begin
                        result[i] := TTaxinvoiceLog.Create;

                        result[i].DocLogType            := getJSonInteger(jSons[i],'docLogType');
                        result[i].Log                   := getJSonString(jSons[i],'log');
                        result[i].procType              := getJSonString(jSons[i],'procType');
                        result[i].procCorpName          := getJSonString(jSons[i],'procCorpName');
                        result[i].procContactName       := getJSonString(jSons[i],'procContactName');
                        result[i].procMemo              := getJSonString(jSons[i],'procMemo');
                        result[i].regDT                 := getJSonString(jSons[i],'regDT');
                        result[i].iP                    := getJSonString(jSons[i],'ip');
                end;

        except on E:Exception do
                raise EPopbillException.Create(-99999999,'결과처리 실패.[Malformed Json]');
        end;
        
        
end;

function TTaxinvoiceService.getInfos(CorpNum : string; MgtKeyType:EnumMgtKeyType; MgtKeyList: Array Of String) : TTaxinvoiceInfoList;
var
        requestJson : string;
        responseJson : string;
        jSons : ArrayOfString;
        i : Integer;
begin
        if Length(MgtKeyList) = 0 then
        begin
                raise EPopbillException.Create(-99999999,'관리번호가 입력되지 않았습니다.');
                Exit;
        end;

        requestJson := '[';
        for i:=0 to Length(MgtKeyList) -1 do
        begin
                requestJson := requestJson + '"' + MgtKeyList[i] + '"';
                if (i + 1) < Length(MgtKeyList) then requestJson := requestJson + ',';
        end;

        requestJson := requestJson + ']';

        responseJson := httppost('/Taxinvoice/'+ GetEnumName(TypeInfo(EnumMgtKeyType),integer(MgtKeyType)),CorpNum,'',requestJson);

        try
                jSons := ParseJsonList(responseJson);
                SetLength(result,Length(jSons));

                for i := 0 to Length(jSons)-1 do
                begin
                        result[i] := jsonToTTaxinvoiceInfo(jSons[i]);
                end;

        except on E:Exception do
                raise EPopbillException.Create(-99999999,'결과처리 실패.[Malformed Json]');
        end;
        
end;


function TTaxinvoiceService.Delete(CorpNum : String; MgtKeyType:EnumMgtKeyType;  MgtKey: String; UserID : String) : TResponse;
var
        responseJson : string;
begin
        if MgtKey = '' then
        begin
                raise EPopbillException.Create(-99999999,'관리번호가 입력되지 않았습니다.');
                Exit;
        end;
        responseJson := httppost('/Taxinvoice/'+ GetEnumName(TypeInfo(EnumMgtKeyType),integer(MgtKeyType)) + '/'+MgtKey,CorpNum,UserID,'','DELETE');

        result.code := getJSonInteger(responseJson,'code');
        result.message := getJSonString(responseJson,'message');
end;

function TTaxinvoiceService.AttachFile(CorpNum : String; MgtKeyType:EnumMgtKeyType; MgtKey : String; FilePath : String; UserID : String) : TResponse;
var
        responseJson : string;
        fileName : string;
        fileData : TFileStream;
begin

       if MgtKey = '' then
       begin
                raise EPopbillException.Create(-99999999,'관리번호가 입력되지 않았습니다.');
                Exit;
       end;

       fileName := ExtractFileName(FilePath);
       fileData := TFileStream.Create(FilePath,fmOpenRead);

       try
                responseJson := httppost('/Taxinvoice/'+ GetEnumName(TypeInfo(EnumMgtKeyType),integer(MgtKeyType)) + '/'+MgtKey + '/Files',CorpNum,UserID,'Filedata',fileName,fileData);
       finally
        fileData.Free;
       end;
       result.code := getJSonInteger(responseJson,'code');
       result.message := getJSonString(responseJson,'message');

end;

function TTaxinvoiceService.GetFiles(CorpNum: String; MgtKeyType : EnumMgtKeyType; MgtKey : String) : TAttachedFileList;
var
        responseJson : string;
        jSons : ArrayOfString;
        i : integer;
begin
        responseJson := httpget('/Taxinvoice/'+ GetEnumName(TypeInfo(EnumMgtKeyType),integer(MgtKeyType)) + '/'+MgtKey + '/Files',CorpNum,'');

        try
                jSons := ParseJsonList(responseJson);
                SetLength(result,Length(jSons));

                for i := 0 to Length(jSons)-1 do
                begin
                        result[i] := TAttachedFile.Create;

                        result[i].SerialNum :=  getJSonInteger(jSons[i],'serialNum');
                        result[i].AttachedFile := getJSonString(jSons[i],'attachedFile');
                        result[i].DisplayName := getJSonString(jSons[i],'displayName');
                        result[i].RegDT := getJSonString(jSons[i],'regDT');

                end;

        except on E:Exception do
                raise EPopbillException.Create(-99999999,'결과처리 실패.[Malformed Json]');
        end;
end;

function TTaxinvoiceService.DeleteFile(CorpNum : String; MgtKeyType:EnumMgtKeyType;  MgtKey: String; FileID : String; UserID : String) : TResponse;
var
        responseJson : string;
begin
        if MgtKey = '' then
        begin
                raise EPopbillException.Create(-99999999,'관리번호가 입력되지 않았습니다.');
                Exit;
        end;

        if FileID = '' then
        begin
                raise EPopbillException.Create(-99999999,'파일 아이디가 입력되지 않았습니다.');
                Exit;
        end;

        responseJson := httppost('/Taxinvoice/'+ GetEnumName(TypeInfo(EnumMgtKeyType),integer(MgtKeyType)) + '/'+MgtKey + '/Files/' + FileID,CorpNum,UserID,'','DELETE');

        result.code := getJSonInteger(responseJson,'code');
        result.message := getJSonString(responseJson,'message');
end;

function TTaxinvoiceService.GetPopUpURL(CorpNum: string; MgtKeyType : EnumMgtKeyType; MgtKey : String;UserID : String) : string;
var
        responseJson : String;
begin
        if MgtKey = '' then
        begin
                raise EPopbillException.Create(-99999999,'관리번호가 입력되지 않았습니다.');
                Exit;
        end;
        
        responseJson := httpget('/Taxinvoice/'+ GetEnumName(TypeInfo(EnumMgtKeyType),integer(MgtKeyType)) + '/'+MgtKey +'?TG=POPUP',CorpNum,UserID);

        result := getJSonString(responseJson,'url');
end;

function TTaxinvoiceService.GetPrintURL(CorpNum: string; MgtKeyType : EnumMgtKeyType; MgtKey : String;UserID : String) : string;
var
        responseJson : String;
begin
        if MgtKey = '' then
        begin
                raise EPopbillException.Create(-99999999,'관리번호가 입력되지 않았습니다.');
                Exit;
        end;
        
        responseJson := httpget('/Taxinvoice/'+ GetEnumName(TypeInfo(EnumMgtKeyType),integer(MgtKeyType)) + '/'+MgtKey +'?TG=PRINT',CorpNum,UserID);

        result := getJSonString(responseJson,'url');
end;

function TTaxinvoiceService.GetMassPrintURL(CorpNum: string; MgtKeyType : EnumMgtKeyType; MgtKeyList: Array Of String; UserID: String) : string;
var
        requestJson,responseJson:string;
        i : integer;
begin
        if Length(MgtKeyList) = 0 then
        begin
                raise EPopbillException.Create(-99999999,'관리번호가 입력되지 않았습니다.');
                Exit;
        end;

        requestJson := '[';
        for i:=0 to Length(MgtKeyList) -1 do
        begin
                requestJson := requestJson + '"' + MgtKeyList[i] + '"';
                if (i + 1) < Length(MgtKeyList) then requestJson := requestJson + ',';
        end;

        requestJson := requestJson + ']';

        responseJson := httppost('/Taxinvoice/'+ GetEnumName(TypeInfo(EnumMgtKeyType),integer(MgtKeyType)) + '?Print',
                                CorpNum,
                                UserID,
                                requestJson);

        result := getJSonString(responseJson,'url');

end;

function TTaxinvoiceService.GetMailURL(CorpNum: string; MgtKeyType : EnumMgtKeyType; MgtKey : String;UserID : String) : string;
var
        responseJson : String;
begin
        if MgtKey = '' then
        begin
                raise EPopbillException.Create(-99999999,'관리번호가 입력되지 않았습니다.');
                Exit;
        end;
        
        responseJson := httpget('/Taxinvoice/'+ GetEnumName(TypeInfo(EnumMgtKeyType),integer(MgtKeyType)) + '/'+MgtKey +'?TG=MAIL',CorpNum,UserID);

        result := getJSonString(responseJson,'url');
end;

function TTaxinvoiceService.GetCertificateExpireDate(CorpNum : String) : string;
var
        responseJson : string;
begin
        responseJson := httpget('/Taxinvoice?cfg=CERT',CorpNum,'');

        result := getJSonString( responseJson,'certificateExpiration');

end;

function TTaxinvoiceService.GetUnitCost(CorpNum : String) : Single;
var
        responseJson : string;
begin
        responseJson := httpget('/Taxinvoice?cfg=UNITCOST',CorpNum,'');

        result := strToFloat(getJSonString( responseJson,'unitCost'));

end;

function TTaxinvoiceService.GetEmailPublicKeys(CorpNum : String) : TEmailPublicKeyList;
var
        responseJson : string;
        jSons : ArrayOfString;
        i : integer;
begin
        responseJson := httpget('/Taxinvoice/EmailPublicKeys',CorpNum,'');

        try
                jSons := ParseJsonList(responseJson);
                SetLength(result,Length(jSons));

                for i := 0 to Length(jSons)-1 do
                begin
                        result[i] := TEmailPublicKey.Create;

                        result[i].confirmNum :=  getJSonString(jSons[i],'confirmNum');
                        result[i].email := getJSonString(jSons[i],'email');
                        result[i].regDT := getJSonString(jSons[i],'regDT');

                end;

        except on E:Exception do
                raise EPopbillException.Create(-99999999,'결과처리 실패.[Malformed Json]');
        end;

end;
//End Of Unit.
end.
