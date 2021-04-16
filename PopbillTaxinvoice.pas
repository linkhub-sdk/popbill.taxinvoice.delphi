(*
*=================================================================================
* Unit for base module for Popbill API SDK. It include base functionality for
* RESTful web service request and parse json result. It uses Linkhub module
* to accomplish authentication APIs.
*
* http://www.popbill.com
* Author : Kim Seongjun (pallet027@gmail.com)
* Written : 2015-06-10
* Contributor : Jeong Yohan (code@linkhub.co.kr)
* Updated : 2021-04-16
* Thanks for your interest.
*=================================================================================
*)
unit PopbillTaxinvoice;

interface

uses
        TypInfo,SysUtils,Classes,
        Popbill,
        Linkhub;
type

        EnumMgtKeyType = (SELL,BUY,TRUSTEE);
        
        TIssueResponse = Record
                code : LongInt;
                message : string;
                ntsConfirmNum : string;
        end;
                
        TTaxinvoiceChargeInfo = class
        public
                unitCost : string;
                chargeMethod : string;
                rateSystem : string;
        end;

        TTaxinvoiceDetail = class
        public
                serialNum       : Integer;
                purchaseDT      : string;
                itemName        : string;
                spec            : string;
                qty             : string;
                unitCost        : string;
                supplyCost      : string;
                tax             : string;
                remark          : string;
        end;
        TDetailList     = Array of TTaxinvoiceDetail;

        TTaxinvoiceAddContact = class
        public
                serialNum       : Integer;
                email           : string;
                contactName     : string;
        end;

        TContactList    =       Array of TTaxinvoiceAddContact;
        
        TTaxinvoice = class
        public
                closeDownState       : Integer;
                closeDownStateDate   : string;
                writeDate            : string;
                chargeDirection      : string;
                issueType            : string;
                issueTiming          : string;
                taxType              : string;

                invoicerCorpNum      : string;
                invoicerMgtKey       : string;
                invoicerTaxRegID     : string;
                invoicerCorpName     : string;
                invoicerCEOName      : string;
                invoicerAddr         : string;
                invoicerBizClass     : string;
                invoicerBizType      : string;
                invoicerContactName  : string;
                invoicerDeptName     : string;
                invoicerTEL          : string;
                invoicerHP           : string;
                invoicerEmail        : string;
                invoicerSMSSendYN    : Boolean;

                invoiceeType         : string;
                invoiceeCorpNum      : string;
                invoiceeMgtKey       : string;
                invoiceeTaxRegID     : string;
                invoiceeCorpName     : string;
                invoiceeCEOName      : string;
                invoiceeAddr         : string;
                invoiceeBizClass     : string;
                invoiceeBizType      : string;
                invoiceeContactName1 : string;
                invoiceeDeptName1    : string;
                invoiceeTEL1         : string;
                invoiceeHP1          : string;
                invoiceeEmail1       : string;
                invoiceeContactName2 : string;
                invoiceeDeptName2    : string;
                invoiceeTEL2         : string;
                invoiceeHP2          : string;
                invoiceeEmail2       : string;
                invoiceeSMSSendYN    : Boolean;

                trusteeCorpNum       : string;
                trusteeMgtKey        : string;
                trusteeTaxRegID      : string;
                trusteeCorpName      : string;
                trusteeCEOName       : string;
                trusteeAddr          : string;
                trusteeBizClass      : string;
                trusteeBizType       : string;
                trusteeContactName   : string;
                trusteeDeptName      : string;
                trusteeTEL           : string;
                trusteeHP            : string;
                trusteeEmail         : string;
                trusteeSMSSendYN     : Boolean;

                taxTotal             : string;
                supplyCostTotal      : string;
                totalAmount          : string;
                modifyCode           : string;
                orgNTSConfirmNum     : string;
                purposeType          : string;
                serialNum            : string;
                cash                 : string;
                chkBill              : string;
                credit               : string;
                note                 : string;
                remark1              : string;
                remark2              : string;
                remark3              : string;
                kwon                 : string;
                ho                   : string;
                businessLicenseYN    : Boolean;
                bankBookYN           : Boolean;
                faxsendYN            : Boolean;
                faxreceiveNum        : string;
                ntsconfirmNum        : string;
                originalTaxinvoiceKey : string;
                detailList              : TDetailList;
                addContactList          : TContactList;
                destructor Destroy; override;

        end;



        TTaxinvoiceInfo = class
        public
                closeDownState       : Integer;
                closeDownStateDate   : string;
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
                lateIssueYN             : boolean;
                interOPYN               : boolean;                
                IssueDT                 : string;
                PreIssueDT              : string;
                StateDT                 : string;
                OpenYN                  : boolean;
                OpenDT                  : string;
                InvoicerPrintYN         : boolean;
                InvoiceePrintYN         : boolean;
                TrusteePrintYN          : boolean;

                NTSResult               : string;
                NTSConfirmNum           : string;
                NTSSendDT               : string;
                NTSResultDT             : string;
                NTSSendErrCode          : string;

                StateMemo               : string;

                RegDT                   : string;

        end;

        TTaxinvoiceInfoList = Array of TTaxinvoiceInfo;

        TSearchList = class
        public
                code                    : Integer;
                total                   : Integer;
                perPage                 : Integer;
                pageNum                 : Integer;
                pageCount               : Integer;
                message                 : String;
                list                    : TTaxinvoiceInfoList;
                destructor Destroy; override;
        end;

        TTaxinvoiceLog = class
        public
                docLogType      : Integer;
                log             : string;
                procType        : string;
                procCorpName    : string;
                procContactName : string;
                procMemo        : string;
                regDT           : string;
                ip              : string;
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

        TEmailConfig = class
        public
                EmailType : String;
                SendYN    : Boolean;
        end;

        TEmailConfigList = Array of TEmailConfig;

        TTaxinvoiceService = class(TPopbillBaseService)
        private
                
                function jsonToTTaxinvoiceInfo(json : String) : TTaxinvoiceInfo;
                function jsonToTTaxinvoice(json : String) : TTaxinvoice;
                function TTaxinvoiceTojson(Taxinvoice : TTaxinvoice; writeSpecification : boolean; forceIssue : boolean; memo : String; emailSubject : String; dealInvoiceMgtKey : String) : String;
        public
                constructor Create(LinkID : String; SecretKey : String);

                //팝빌 세금계산서 연결 url.
                function GetURL(CorpNum : String; UserID : String; TOGO : String) : String; overload;

                //팝빌 세금계산서 연결 url. overload
                function GetURL(CorpNum : String; TOGO : String) : String; overload;

                //팝빌 인감 및 첨부문서 등록 URL
                function GetSealURL(CorpNum : String; UserID : String) : String;

                //공인인증서 등록 URL
                function GetTaxCertURL(CorpNum : String; UserID : String) : String;

                //문서번호 사용여부 확인
                function CheckMgtKeyInUse(CorpNum : String; MgtKeyType:EnumMgtKeyType; MgtKey : String) : boolean;

                //즉시발행
                function RegistIssue(CorpNum : String; Taxinvoice : TTaxinvoice; writeSpecification : boolean = false; forceIssue : boolean = false; memo : String = ''; emailSubject : String = ''; dealInvoiceMgtKey : String = ''; UserID : String = '') : TIssueResponse;

                //임시저장.
                function Register(CorpNum : String; Taxinvoice : TTaxinvoice; UserID : String = ''; writeSpecification : boolean = false) : TResponse;

                //수정.
                function Update(CorpNum : String; MgtKeyType:EnumMgtKeyType; MgtKey : String; Taxinvoice : TTaxinvoice; UserID : String = ''; writeSpecification : boolean = false) : TResponse;


                //발행예정.
                function Send(CorpNum : String; MgtKeyType:EnumMgtKeyType; MgtKey : String; Memo : String) : TResponse; overload;

                //발행예정.
                function Send(CorpNum : String; MgtKeyType:EnumMgtKeyType; MgtKey : String; Memo : String; UserID : String) : TResponse; overload;

                //발행예정.
                function Send(CorpNum : String; MgtKeyType:EnumMgtKeyType; MgtKey : String; Memo : String; EmailSubject : String; UserID : String) : TResponse;overload;


                //발행예정 취소.
                function CancelSend(CorpNum : String; MgtKeyType:EnumMgtKeyType; MgtKey : String; Memo : String; UserID : String = '') : TResponse;

                //발행예정 승인.
                function Accept(CorpNum : String; MgtKeyType:EnumMgtKeyType; MgtKey : String; Memo : String; UserID : String = '') : TResponse;

                //발행예정 거부.
                function Deny(CorpNum : String; MgtKeyType:EnumMgtKeyType; MgtKey : String; Memo : String; UserID : String = '') : TResponse;

                //발행.
                function Issue(CorpNum : String; MgtKeyType:EnumMgtKeyType; MgtKey : String; Memo : String; EmailSubject : String; ForceIssue : Boolean; UserID : String = '') : TIssueResponse;

                //발행취소.
                function CancelIssue(CorpNum : String; MgtKeyType:EnumMgtKeyType; MgtKey : String; Memo : String; UserID : String = '') : TResponse;

                //역)즉시요청.
                function RegistRequest(CorpNum : String; Taxinvoice : TTaxinvoice; Memo : String =''; UserID : String = '') : TResponse;

                //역)발행요청.
                function Request(CorpNum : String; MgtKeyType:EnumMgtKeyType; MgtKey : String; Memo : String; UserID : String = '') : TResponse;

                //역)발행요청 거부.
                function Refuse(CorpNum : String; MgtKeyType:EnumMgtKeyType; MgtKey : String; Memo : String; UserID : String = '') : TResponse;

                //역)발행요청 취소.
                function CancelRequest(CorpNum : String; MgtKeyType:EnumMgtKeyType; MgtKey : String; Memo : String; UserID : String = '') : TResponse;


                //삭제.
                function Delete(CorpNum : String; MgtKeyType:EnumMgtKeyType;  MgtKey: String; UserID : String = '') : TResponse;

                //국세청 전송.
                function SendToNTS(CorpNum : String; MgtKeyType:EnumMgtKeyType; MgtKey :String; UserID : String = '') : TResponse;

                // 발행즉시전송 설정여부 확인
                function GetSendToNTSConfig(CorpNum: string; UserID: String = '') : Boolean;

                //이메일재전송.
                function SendEmail(CorpNum : String; MgtKeyType:EnumMgtKeyType; MgtKey :String; Receiver:String; UserID : String = '') : TResponse;

                //문자재전송.
                function SendSMS(CorpNum : String; MgtKeyType:EnumMgtKeyType; MgtKey :String; Sender:String; Receiver:String; Contents : String; UserID : String = '') : TResponse;

                // 팩스 재전송.
                function SendFAX(CorpNum : String; MgtKeyType:EnumMgtKeyType; MgtKey :String; Sender:String; Receiver:String; UserID : String = '') : TResponse;

                // 세금계산서 목록조회
                function search(CorpNum : string; MgtKeyType:EnumMgtKeyType; DType:String; SDate: String; EDate:String; State : Array Of String; TType:Array Of String; TaxType : Array Of String;LateOnly : String; Page : Integer; PerPage : Integer; Order : String) : TSearchList; overload;

                // 세금계산서 목록조회
                function search(CorpNum : string; MgtKeyType:EnumMgtKeyType; DType:String; SDate: String; EDate:String; State : Array Of String; TType:Array Of String; TaxType : Array Of String;LateOnly : String; Page : Integer; PerPage : Integer; Order : String; UserID:string) : TSearchList; overload;

                // 세금계산서 목록조회
                function search(CorpNum : string; MgtKeyType:EnumMgtKeyType; DType:String; SDate: String; EDate:String; State : Array Of String; TType:Array Of String; TaxType : Array Of String;LateOnly : String; TaxRegIDType : String; TaxRegID: String; TaxRegIDYN : string; Page : Integer; PerPage : Integer; Order : String) : TSearchList; overload;

                // 세금계산서 목록조회
                function search(CorpNum : string; MgtKeyType:EnumMgtKeyType; DType:String; SDate: String; EDate:String; State : Array Of String; TType:Array Of String; TaxType : Array Of String;LateOnly : String; TaxRegIDType : String; TaxRegID: String; TaxRegIDYN : string; Page : Integer; PerPage : Integer; Order : String; UserID : String) : TSearchList; overload;

                // 세금계산서 목록조회
                function search(CorpNum : string; MgtKeyType:EnumMgtKeyType; DType:String; SDate: String; EDate:String; State : Array Of String; TType:Array Of String; TaxType : Array Of String;LateOnly : String; TaxRegIDType : String; TaxRegID: String; TaxRegIDYN : string; QString : String; Page : Integer; PerPage : Integer; Order : String; UserID : String) : TSearchList; overload;

                function search(CorpNum : string; MgtKeyType:EnumMgtKeyType; DType:String; SDate: String; EDate:String; State : Array Of String; TType:Array Of String; TaxType : Array Of String;LateOnly : String; TaxRegIDType : String; TaxRegID: String; TaxRegIDYN : string; QString : String; Page : Integer; PerPage : Integer; Order : String; InterOPYN : String; UserID : String) : TSearchList; overload;

                function search(CorpNum : string; MgtKeyType:EnumMgtKeyType; DType:String; SDate: String; EDate:String; State : Array Of String; TType:Array Of String; TaxType : Array Of String; IssueType : Array Of String; LateOnly : String; TaxRegIDType : String; TaxRegID: String; TaxRegIDYN : string; QString : String; Page : Integer; PerPage : Integer; Order : String; InterOPYN : String; UserID : String) : TSearchList; overload;

                function search(CorpNum : string; MgtKeyType:EnumMgtKeyType; DType:String; SDate: String; EDate:String; State : Array Of String; TType:Array Of String; TaxType : Array Of String; IssueType : Array Of String; LateOnly : String; TaxRegIDType : String; TaxRegID: String; TaxRegIDYN : string; QString : String; Page : Integer; PerPage : Integer; Order : String; InterOPYN : String; UserID : String; RegType : Array Of String) : TSearchList; overload;

                function search(CorpNum : string; MgtKeyType:EnumMgtKeyType; DType:String; SDate: String; EDate:String; State : Array Of String; TType:Array Of String; TaxType : Array Of String; IssueType : Array Of String; LateOnly : String; TaxRegIDType : String; TaxRegID: String; TaxRegIDYN : string; QString : String; Page : Integer; PerPage : Integer; Order : String; InterOPYN : String; UserID : String; RegType : Array Of String; CloseDownState : Array Of String; MgtKey : String) : TSearchList; overload;


                //세금계산서 요약정보 및 상태정보 확인.
                function GetInfo(CorpNum : string; MgtKeyType:EnumMgtKeyType; MgtKey: string) : TTaxinvoiceInfo;

                //세금계산서 상세정보 확인
                function GetDetailInfo(CorpNum : string; MgtKeyType:EnumMgtKeyType; MgtKey: string) : TTaxinvoice;

                //세금계산서 요약정보 및 상태 다량 확인.
                function GetInfos(CorpNum : string; MgtKeyType:EnumMgtKeyType; MgtKeyList: Array Of String) : TTaxinvoiceInfoList;

                //문서이력 확인.
                function GetLogs(CorpNum : string; MgtKeyType:EnumMgtKeyType; MgtKey: string) : TTaxinvoiceLogList;

                //파일 첨부.
                function AttachFile(CorpNum : String; MgtKeyType:EnumMgtKeyType; MgtKey : String; FilePath : String; UserID : String = '') : TResponse;

                //첨부파일 목록 확인.
                function GetFiles(CorpNum: String; MgtKeyType : EnumMgtKeyType; MgtKey : String) : TAttachedFileList;

                //첨부파일 삭제.
                function DeleteFile(CorpNum: string; MgtKeyType : EnumMgtKeyType; MgtKey : String; FileID : String; UserID : String = '') : TResponse;

                //세금계산서 팝업URL
                function GetPopUpURL(CorpNum: string; MgtKeyType : EnumMgtKeyType; MgtKey : String; UserID: String = '') : string;

                //세금계산서 팝업URL - 메뉴/버튼 제외
                function GetViewURL(CorpNum: string; MgtKeyType : EnumMgtKeyType; MgtKey : String; UserID: String = '') : string;                

                //인쇄URL
                function GetPrintURL(CorpNum: string; MgtKeyType : EnumMgtKeyType; MgtKey : String; UserID: String = '') : string;

                // PDF 다운로드 URL
                function GetPDFURL(CorpNum: string; MgtKeyType : EnumMgtKeyType; MgtKey : String; UserID: String = '') : string;

                //공급받는자 인쇄URL
                function GetEPrintURL(CorpNum: string; MgtKeyType : EnumMgtKeyType; MgtKey : String; UserID: String = '') : string;

                //다량인쇄URL
                function GetMassPrintURL(CorpNum: string; MgtKeyType : EnumMgtKeyType; MgtKeyList: Array Of String; UserID: String = '') : string;

                //Mail URL
                function GetMailURL(CorpNum: string; MgtKeyType : EnumMgtKeyType; MgtKey : String; UserID: String = '') : string;

                //회원 등록인증서 만료일 확인.
                function GetCertificateExpireDate(CorpNum : String) : string;

                //회원별 세금계산서 발행단가 확인.
                function GetUnitCost(CorpNum : String) : Single;

                //ASP 사업자 유통메일목록 확인.
                function GetEmailPublicKeys(CorpNum : String) : TEmailPublicKeyList;

                // 세금계산서에 전자명세서 첨부
                function AttachStatement(CorpNum : String; MgtKeyType: EnumMgtKeyType; MgtKey : String; SubItemCode : Integer; SubMgtKey : String) : TResponse;
                
                // 세금계산서에 전자명세서 해제
                function DetachStatement(CorpNum : String; MgtKeyType: EnumMgtKeyType; MgtKey : String; SubItemCode : Integer; SubMgtKey : String) : TResponse;

                // 과금정보 확인
                function GetChargeInfo (CorpNum : String) : TTaxinvoiceChargeInfo; overload;

                // 과금정보 확인
                function GetChargeInfo (CorpNum : String; UserID:string) : TTaxinvoiceChargeInfo; overload;

                // 문서관리번호 할당
                function AssignMgtKey(CorpNum : String; MgtKeyType: EnumMgtKeyType; ItemKey : String; MgtKey : String; UserID: String = '') : TResponse;

                // 공인인증서 유효성 확인
                function CheckCertValidation(CorpNum : String; UserID : String = '') : TResponse;

                // 알림메일 전송목록 조회
                function ListEmailConfig(CorpNum : String; UserID : String = '') : TEmailConfigList;

                // 알림메일 전송설정 수정
                function UpdateEmailConfig(CorpNum : String; EmailType : String; SendYN : Boolean; UserID : String = '') : TResponse;
        end;

implementation
destructor TTaxinvoice.Destroy;
var
  I: Integer;
begin
  for I := 0 to Length(detailList)-1 do
    if Assigned(detailList[I]) then
      detailList[I].Free;
  SetLength(detailList, 0);
  for I := 0 to Length(addContactList)-1 do
    if Assigned(addContactList[I]) then
      addContactList[I].Free;
  SetLength(addContactList, 0);
  inherited Destroy;
end;

destructor TSearchList.Destroy;
var
  I: Integer;
begin
  for I := 0 to Length(list)-1 do
    if Assigned(list[I]) then
      list[I].Free;
  SetLength(list, 0);
  inherited Destroy;
end;

constructor TTaxinvoiceService.Create(LinkID : String; SecretKey : String);
begin
       inherited Create(LinkID,SecretKey);
       AddScope('110');
end;


function TTaxinvoiceService.GetChargeInfo (CorpNum : string) : TTaxinvoiceChargeInfo;
begin
        result := GetChargeInfo(CorpNum, '');
end;

function TTaxinvoiceService.GetChargeInfo (CorpNum : string; UserID :string) : TTaxinvoiceChargeInfo;
var
        responseJson : String;
begin
        
        try
                responseJson := httpget('/Taxinvoice/ChargeInfo',CorpNum,UserID);

        except
                on le : EPopbillException do begin
                        if FIsThrowException then
                        begin
                                raise EPopbillException.Create(le.code,le.Message);
                                exit;
                        end;
                end;
        end;

        try
                result := TTaxinvoiceChargeInfo.Create;

                result.unitCost := getJSonString(responseJson, 'unitCost');
                result.chargeMethod := getJSonString(responseJson, 'chargeMethod');
                result.rateSystem := getJSonString(responseJson, 'rateSystem');

        except on E:Exception do
                if FIsThrowException then
                begin
                        raise EPopbillException.Create(-99999999,'결과처리 실패.[Malformed Json]');
                        exit;
                end
                else
                begin
                        result := TTaxinvoiceChargeInfo.Create;
                        setLastErrCode(-99999999);
                        setLastErrMessage('결과처리 실패.[Malformed Json]');
                        exit;
                end;
        end;
end;

function TTaxinvoiceService.GetURL(CorpNum : String; TOGO : String) : String;
begin
        result := GetURL(CorpNum, '', TOGO);

end;

function TTaxinvoiceService.GetURL(CorpNum : String; UserID : String; TOGO : String) : String;
var
        responseJson : String;
begin

        try
                responseJson := httpget('/Taxinvoice/?TG='+ TOGO,CorpNum,UserID);
                result := getJSonString(responseJson,'url');
        except
                on le: EPopbillException do begin
                        if FIsThrowException then
                        begin
                                raise EPopbillException.Create(le.code, le.Message);
                                exit;
                        end;
                end;

        end;
end;

function TTaxinvoiceService.GetSealURL(CorpNum : String; UserID : String) : String;
var
        responseJson : String;
begin
        try
                responseJson := httpget('/?TG=SEAL', CorpNum, UserID);
                result := getJSonString(responseJson,'url');
        except
                on le: EPopbillException do begin
                        if FIsThrowException then
                        begin
                                raise EPopbillException.Create(le.code, le.Message);
                                exit;
                        end;
                end;
        end;
end;

function TTaxinvoiceService.GetTaxCertURL(CorpNum : String; UserID : String) : String;
var
        responseJson : String;
begin
        try
                responseJson := httpget('/?TG=CERT', CorpNum, UserID);
                result := getJSonString(responseJson,'url');
        except
                on le: EPopbillException do begin
                        if FIsThrowException then
                        begin
                                raise EPopbillException.Create(le.code, le.Message);
                                exit;
                        end;
                end;
        end;
end;

function TTaxinvoiceService.CheckMgtKeyInUse(CorpNum : String; MgtKeyType:EnumMgtKeyType; MgtKey : String): boolean;
var
        responseJson : string;
        taxinvoiceInfo : TTaxinvoiceInfo;
begin
        if MgtKey = '' then
        begin
                if FIsThrowException then
                begin
                        raise EPopbillException.Create(-99999999,'관리번호가 입력되지 않았습니다.');
                        Exit;                
                end;
                result := false;
                setLastErrCode(-99999999);
                setLastErrMessage('관리번호가 입력되지 않았습니다.'); 
                exit;
        end;

        try
                responseJson := httpget('/Taxinvoice/'+ GetEnumName(TypeInfo(EnumMgtKeyType),integer(MgtKeyType)) + '/'+MgtKey , CorpNum,'');
                taxinvoiceInfo := jsonToTTaxinvoiceInfo(responseJson);
                result:= taxinvoiceInfo.ItemKey <> '';
                
        except
                on E : EPopbillException do
                begin
                        if E.code = -11000005 then
                        begin
                                result := false;
                                Exit;
                        end;
                end;
        end;


end;

function UrlEncodeUTF8(stInput : widestring) : string;
  const
    hex : array[0..255] of string = (
     '%00', '%01', '%02', '%03', '%04', '%05', '%06', '%07',
     '%08', '%09', '%0a', '%0b', '%0c', '%0d', '%0e', '%0f',
     '%10', '%11', '%12', '%13', '%14', '%15', '%16', '%17',
     '%18', '%19', '%1a', '%1b', '%1c', '%1d', '%1e', '%1f',
     '%20', '%21', '%22', '%23', '%24', '%25', '%26', '%27',
     '%28', '%29', '%2a', '%2b', '%2c', '%2d', '%2e', '%2f',
     '%30', '%31', '%32', '%33', '%34', '%35', '%36', '%37',
     '%38', '%39', '%3a', '%3b', '%3c', '%3d', '%3e', '%3f',
     '%40', '%41', '%42', '%43', '%44', '%45', '%46', '%47',
     '%48', '%49', '%4a', '%4b', '%4c', '%4d', '%4e', '%4f',
     '%50', '%51', '%52', '%53', '%54', '%55', '%56', '%57',
     '%58', '%59', '%5a', '%5b', '%5c', '%5d', '%5e', '%5f',
     '%60', '%61', '%62', '%63', '%64', '%65', '%66', '%67',
     '%68', '%69', '%6a', '%6b', '%6c', '%6d', '%6e', '%6f',
     '%70', '%71', '%72', '%73', '%74', '%75', '%76', '%77',
     '%78', '%79', '%7a', '%7b', '%7c', '%7d', '%7e', '%7f',
     '%80', '%81', '%82', '%83', '%84', '%85', '%86', '%87',
     '%88', '%89', '%8a', '%8b', '%8c', '%8d', '%8e', '%8f',
     '%90', '%91', '%92', '%93', '%94', '%95', '%96', '%97',
     '%98', '%99', '%9a', '%9b', '%9c', '%9d', '%9e', '%9f',
     '%a0', '%a1', '%a2', '%a3', '%a4', '%a5', '%a6', '%a7',
     '%a8', '%a9', '%aa', '%ab', '%ac', '%ad', '%ae', '%af',
     '%b0', '%b1', '%b2', '%b3', '%b4', '%b5', '%b6', '%b7',
     '%b8', '%b9', '%ba', '%bb', '%bc', '%bd', '%be', '%bf',
     '%c0', '%c1', '%c2', '%c3', '%c4', '%c5', '%c6', '%c7',
     '%c8', '%c9', '%ca', '%cb', '%cc', '%cd', '%ce', '%cf',
     '%d0', '%d1', '%d2', '%d3', '%d4', '%d5', '%d6', '%d7',
     '%d8', '%d9', '%da', '%db', '%dc', '%dd', '%de', '%df',
     '%e0', '%e1', '%e2', '%e3', '%e4', '%e5', '%e6', '%e7',
     '%e8', '%e9', '%ea', '%eb', '%ec', '%ed', '%ee', '%ef',
     '%f0', '%f1', '%f2', '%f3', '%f4', '%f5', '%f6', '%f7',
     '%f8', '%f9', '%fa', '%fb', '%fc', '%fd', '%fe', '%ff');
 var
   iLen,iIndex : integer;
   stEncoded : string;
   ch : widechar;
 begin
   iLen := Length(stInput);
   stEncoded := '';
   for iIndex := 1 to iLen do
   begin
     ch := stInput[iIndex];
     if (ch >= 'A') and (ch <= 'Z') then
       stEncoded := stEncoded + ch
     else if (ch >= 'a') and (ch <= 'z') then
       stEncoded := stEncoded + ch
     else if (ch >= '0') and (ch <= '9') then
       stEncoded := stEncoded + ch
     else if (ch = ' ') then
       stEncoded := stEncoded + '+'
     else if ((ch = '-') or (ch = '_') or (ch = '.') or (ch = '!') or (ch = '*')
       or (ch = '~') or (ch = '\')  or (ch = '(') or (ch = ')')) then
       stEncoded := stEncoded + ch
     else if (Ord(ch) <= $07F) then
       stEncoded := stEncoded + hex[Ord(ch)]
     else if (Ord(ch) <= $7FF) then
     begin
        stEncoded := stEncoded + hex[$c0 or (Ord(ch) shr 6)];
        stEncoded := stEncoded + hex[$80 or (Ord(ch) and $3F)];
     end
     else
     begin
        stEncoded := stEncoded + hex[$e0 or (Ord(ch) shr 12)];
        stEncoded := stEncoded + hex[$80 or ((Ord(ch) shr 6) and ($3F))];
        stEncoded := stEncoded + hex[$80 or ((Ord(ch)) and ($3F))];
     end;
   end;
   result := (stEncoded);
 end;

function TTaxinvoiceService.TTaxinvoiceTojson(Taxinvoice : TTaxinvoice; writeSpecification : boolean; forceIssue : boolean; memo : string; emailSubject : String; dealInvoiceMgtKey: STring) : String;
var
        requestJson : string;
        i : integer;
begin
       requestJson := '{';
        
        if writeSpecification then
        requestJson := requestJson + '"writeSpecification":true,';
        if forceIssue then
        requestJson := requestJson + '"forceIssue":true,';

        requestJson := requestJson + '"memo":"'+ memo +'",';
        requestJson := requestJson + '"emailSubject":"'+ emailSubject +'",';
        requestJson := requestJson + '"dealInvoiceMgtKey":"'+ dealInvoiceMgtKey +'",';

        requestJson := requestJson + '"writeDate":"'+ EscapeString(Taxinvoice.WriteDate) +'",';

        requestJson := requestJson + '"chargeDirection":"'+ EscapeString(Taxinvoice.ChargeDirection) +'",';
        requestJson := requestJson + '"issueType":"'+ EscapeString(Taxinvoice.IssueType) +'",';
        requestJson := requestJson + '"taxType":"'+ EscapeString(Taxinvoice.TaxType) +'",';
        requestJson := requestJson + '"invoicerCorpNum":"'+ EscapeString(Taxinvoice.InvoicerCorpNum) +'",';
        requestJson := requestJson + '"invoicerMgtKey":"'+ EscapeString(Taxinvoice.InvoicerMgtKey) +'",';
        requestJson := requestJson + '"invoicerTaxRegID":"'+ EscapeString(Taxinvoice.InvoicerTaxRegID) +'",';
        requestJson := requestJson + '"invoicerCorpName":"'+ EscapeString(Taxinvoice.InvoicerCorpName) +'",';
        requestJson := requestJson + '"invoicerCEOName":"'+ EscapeString(Taxinvoice.InvoicerCEOName) +'",';
        requestJson := requestJson + '"invoicerAddr":"'+ EscapeString(Taxinvoice.InvoicerAddr) +'",';
        requestJson := requestJson + '"invoicerBizClass":"'+ EscapeString(Taxinvoice.InvoicerBizClass) +'",';
        requestJson := requestJson + '"invoicerBizType":"'+ EscapeString(Taxinvoice.InvoicerBizType) +'",';
        requestJson := requestJson + '"invoicerContactName":"'+ EscapeString(Taxinvoice.InvoicerContactName) +'",';
        requestJson := requestJson + '"invoicerDeptName":"'+ EscapeString(Taxinvoice.InvoicerDeptName) +'",';
        requestJson := requestJson + '"invoicerTEL":"'+ EscapeString(Taxinvoice.InvoicerTEL) +'",';
        requestJson := requestJson + '"invoicerHP":"'+ EscapeString(Taxinvoice.InvoicerHP) +'",';
        requestJson := requestJson + '"invoicerEmail":"'+ EscapeString(Taxinvoice.InvoicerEmail) +'",';

        if Taxinvoice.InvoicerSMSSendYN then
        requestJson := requestJson + '"invoicerSMSSendYN":true,';

        requestJson := requestJson + '"invoiceeCorpNum":"'+ EscapeString(Taxinvoice.InvoiceeCorpNum) +'",';
        requestJson := requestJson + '"invoiceeType":"'+ EscapeString(Taxinvoice.InvoiceeType) +'",';
        requestJson := requestJson + '"invoiceeMgtKey":"'+ EscapeString(Taxinvoice.InvoiceeMgtKey) +'",';
        requestJson := requestJson + '"invoiceeTaxRegID":"'+ EscapeString(Taxinvoice.InvoiceeTaxRegID) +'",';
        requestJson := requestJson + '"invoiceeCorpName":"'+ EscapeString(Taxinvoice.InvoiceeCorpName) +'",';
        requestJson := requestJson + '"invoiceeCEOName":"'+ EscapeString(Taxinvoice.InvoiceeCEOName) +'",';
        requestJson := requestJson + '"invoiceeAddr":"'+ EscapeString(Taxinvoice.InvoiceeAddr) +'",';
        requestJson := requestJson + '"invoiceeBizType":"'+ EscapeString(Taxinvoice.InvoiceeBizType) +'",';
        requestJson := requestJson + '"invoiceeBizClass":"'+ EscapeString(Taxinvoice.InvoiceeBizClass) +'",';
        requestJson := requestJson + '"invoiceeContactName1":"'+ EscapeString(Taxinvoice.InvoiceeContactName1) +'",';
        requestJson := requestJson + '"invoiceeDeptName1":"'+ EscapeString(Taxinvoice.InvoiceeDeptName1) +'",';
        requestJson := requestJson + '"invoiceeTEL1":"'+ EscapeString(Taxinvoice.InvoiceeTEL1) +'",';
        requestJson := requestJson + '"invoiceeHP1":"'+ EscapeString(Taxinvoice.InvoiceeHP1) +'",';
        requestJson := requestJson + '"invoiceeEmail1":"'+ EscapeString(Taxinvoice.InvoiceeEmail1) +'",';
        requestJson := requestJson + '"invoiceeContactName2":"'+ EscapeString(Taxinvoice.InvoiceeContactName2) +'",';
        requestJson := requestJson + '"invoiceeDeptName2":"'+ EscapeString(Taxinvoice.InvoiceeDeptName2) +'",';
        requestJson := requestJson + '"invoiceeTEL2":"'+ EscapeString(Taxinvoice.InvoiceeTEL2) +'",';
        requestJson := requestJson + '"invoiceeEmail2":"'+ EscapeString(Taxinvoice.InvoiceeEmail2) +'",';

        if Taxinvoice.InvoiceeSMSSendYN then
        requestJson := requestJson + '"invoiceeSMSSendYN":true,';

        requestJson := requestJson + '"trusteeCorpNum":"'+ EscapeString(Taxinvoice.TrusteeCorpNum) +'",';
        requestJson := requestJson + '"trusteeMgtKey":"'+ EscapeString(Taxinvoice.TrusteeMgtKey) +'",';
        requestJson := requestJson + '"trusteeTaxRegID":"'+ EscapeString(Taxinvoice.TrusteeTaxRegID) +'",';
        requestJson := requestJson + '"trusteeCorpName":"'+ EscapeString(Taxinvoice.TrusteeCorpName) +'",';
        requestJson := requestJson + '"trusteeCEOName":"'+ EscapeString(Taxinvoice.TrusteeCEOName) +'",';
        requestJson := requestJson + '"trusteeAddr":"'+ EscapeString(Taxinvoice.TrusteeAddr) +'",';
        requestJson := requestJson + '"trusteeBizType":"'+ EscapeString(Taxinvoice.TrusteeBizType) +'",';
        requestJson := requestJson + '"trusteeBizClass":"'+ EscapeString(Taxinvoice.TrusteeBizClass) +'",';
        requestJson := requestJson + '"trusteeContactName":"'+ EscapeString(Taxinvoice.TrusteeContactName) +'",';
        requestJson := requestJson + '"trusteeDeptName":"'+ EscapeString(Taxinvoice.TrusteeDeptName) +'",';
        requestJson := requestJson + '"trusteeTEL":"'+ EscapeString(Taxinvoice.TrusteeTEL) +'",';
        requestJson := requestJson + '"trusteeHP":"'+ EscapeString(Taxinvoice.TrusteeHP) +'",';
        requestJson := requestJson + '"trusteeEmail":"'+ EscapeString(Taxinvoice.TrusteeEmail) +'",';

        if Taxinvoice.TrusteeSMSSendYN then
        requestJson := requestJson + '"trusteeSMSSendYN":true,';

        requestJson := requestJson + '"taxTotal":"'+ EscapeString(Taxinvoice.TaxTotal) +'",';
        requestJson := requestJson + '"supplyCostTotal":"'+ EscapeString(Taxinvoice.SupplyCostTotal) +'",';
        requestJson := requestJson + '"totalAmount":"'+ EscapeString(Taxinvoice.TotalAmount) +'",';
        if Taxinvoice.ModifyCode <> '' then
        requestJson := requestJson + '"modifyCode":'+ EscapeString(Taxinvoice.ModifyCode) +',';

        requestJson := requestJson + '"orgNTSConfirmNum":"'+ EscapeString(Taxinvoice.OrgNTSConfirmNum) +'",';
        requestJson := requestJson + '"purposeType":"'+ EscapeString(Taxinvoice.PurposeType) +'",';
        requestJson := requestJson + '"serialNum":"'+ EscapeString(Taxinvoice.SerialNum) +'",';
        requestJson := requestJson + '"cash":"'+ EscapeString(Taxinvoice.Cash) +'",';
        requestJson := requestJson + '"chkBill":"'+ EscapeString(Taxinvoice.ChkBill) +'",';
        requestJson := requestJson + '"credit":"'+ EscapeString(Taxinvoice.Credit) +'",';
        requestJson := requestJson + '"note":"'+ EscapeString(Taxinvoice.Note) +'",';
        if Taxinvoice.Kwon <> '' then
        requestJson := requestJson + '"kwon":'+ EscapeString(Taxinvoice.Kwon) +',';
        if Taxinvoice.HO <> '' then
        requestJson := requestJson + '"ho":'+ EscapeString(Taxinvoice.Ho) +',';

        if Taxinvoice.BusinessLicenseYN then
        requestJson := requestJson + '"businessLicenseYN":true,';

        if Taxinvoice.BankBookYN then
        requestJson := requestJson + '"bankBookYN":true,';

        if Taxinvoice.FAXSendYN then
        requestJson := requestJson + '"faxsendYN":true,';

        requestJson := requestJson + '"faxreceiveNum":"'+ EscapeString(Taxinvoice.FAXReceiveNum) +'",';
        requestJson := requestJson + '"ntsconfirmNum":"'+ EscapeString(Taxinvoice.NTSConfirmNum) +'",';
        requestJson := requestJson + '"originalTaxinvoiceKey":"'+ EscapeString(Taxinvoice.OriginalTaxinvoiceKey) +'",';

        if Length(Taxinvoice.detailList) > 0 then
        begin
                requestJson := requestJson + '"detailList":[';

                for i := 0 to Length(Taxinvoice.detailList)-1 do
                begin
                        requestJson := requestJson + '{';
                        requestJson := requestJson + '"serialNum":"' + IntToStr(Taxinvoice.detailList[i].SerialNum) + '",';
                        requestJson := requestJson + '"purchaseDT":"' + EscapeString(Taxinvoice.detailList[i].PurchaseDT) + '",';
                        requestJson := requestJson + '"itemName":"' +EscapeString(Taxinvoice.detailList[i].ItemName) + '",';
                        requestJson := requestJson + '"spec":"' + EscapeString(Taxinvoice.detailList[i].Spec) + '",';
                        requestJson := requestJson + '"qty":"' + EscapeString(Taxinvoice.detailList[i].Qty) + '",';
                        requestJson := requestJson + '"unitCost":"' + EscapeString(Taxinvoice.detailList[i].UnitCost) + '",';
                        requestJson := requestJson + '"supplyCost":"' + EscapeString(Taxinvoice.detailList[i].SupplyCost) + '",';
                        requestJson := requestJson + '"tax":"' + EscapeString(Taxinvoice.detailList[i].Tax) + '",';
                        requestJson := requestJson + '"remark":"' + EscapeString(Taxinvoice.detailList[i].Remark) + '"';
                        requestJson := requestJson + '}';
                        if i < Length(Taxinvoice.detailList) - 1 then
                                 requestJson := requestJson + ',';

                end;

                requestJson := requestJson + '],';

        end;

        if Length(Taxinvoice.AddContactList) > 0 then
        begin
                requestJson := requestJson + '"addContactList":[';

                for i := 0 to Length(Taxinvoice.AddContactList)-1 do
                begin
                        requestJson := requestJson + '{';
                        requestJson := requestJson + '"serialNum":"' + IntToStr(Taxinvoice.AddContactList[i].SerialNum) + '",';
                        requestJson := requestJson + '"email":"' + EscapeString(Taxinvoice.AddContactList[i].Email) + '",';
                        requestJson := requestJson + '"contactName":"' + EscapeString(Taxinvoice.AddContactList[i].ContactName) + '"';
                        requestJson := requestJson + '}';
                        if i < Length(Taxinvoice.AddContactList) - 1 then
                                 requestJson := requestJson + ',';

                end;

                requestJson := requestJson + '],';

        end;

        requestJson := requestJson + '"remark1":"'+ EscapeString(Taxinvoice.Remark1) +'",';
        requestJson := requestJson + '"remark2":"'+ EscapeString(Taxinvoice.Remark2) +'",';
        requestJson := requestJson + '"remark3":"'+ EscapeString(Taxinvoice.Remark3) +'"';
        requestJson := requestJson + '}';

        result := requestJson;
end;

function TTaxinvoiceService.RegistIssue(CorpNum : String; Taxinvoice : TTaxinvoice; writeSpecification : boolean = false; forceIssue : boolean = false; memo : String = ''; emailSubject : String = ''; dealInvoiceMgtKey : String = ''; UserId : String = '') : TIssueResponse;
var
        requestJson : string;
        responseJson : string;
begin
        
        try
                requestJson := TTaxinvoiceTojson(Taxinvoice,writeSpecification,forceIssue,memo,emailSubject,dealInvoiceMgtKey);
                responseJson := httppost('/Taxinvoice',CorpNum,UserID,requestJson,'ISSUE');

        except
                on le : EPopbillException do begin
                        if FIsThrowException then
                        begin
                                raise EPopbillException.Create(le.code,le.Message);
                                exit;
                        end
                        else
                        begin
                                result.code := le.code;
                                result.message := le.Message;
                        end;
                end;
        end;

        if LastErrCode <> 0 then
        begin
                result.code := LastErrCode;
                result.message := LastErrMessage;
                result.ntsConfirmNum := '';
        end
        else
        begin
                result.code := getJSonInteger(responseJson,'code');
                result.message := getJSonString(responseJson,'message');
                result.ntsConfirmNum := getJSonString(responseJson,'ntsConfirmNum');                
        end;

end;

function TTaxinvoiceService.Register(CorpNum : String; Taxinvoice : TTaxinvoice; UserID : String = ''; writeSpecification : boolean = false) : TResponse;
var
        requestJson : string;
        responseJson : string;
begin
        try
                requestJson := TTaxinvoiceTojson(Taxinvoice,writeSpecification,false,'','','');
                responseJson := httppost('/Taxinvoice',CorpNum,UserID,requestJson);

        except
                on le : EPopbillException do begin
                        if FIsThrowException then
                        begin
                                raise EPopbillException.Create(le.code,le.Message);
                                exit;
                        end
                        else
                        begin
                                result.code := le.code;
                                result.Message := le.Message;
                        end;
                end;
        end;

        if LastErrCode <> 0 then
        begin
                result.code := LastErrCode;
                result.message := LastErrMessage;
        end
        else
        begin
                result.code := getJSonInteger(responseJson,'code');
                result.message := getJSonString(responseJson,'message');                
        end;        
end;

function TTaxinvoiceService.Update(CorpNum : String; MgtKeyType:EnumMgtKeyType; MgtKey : String; Taxinvoice : TTaxinvoice; UserID : String = ''; writeSpecification : boolean = false) : TResponse;
var
        requestJson : string;
        responseJson : string;
begin
        if MgtKey = '' then
        begin
                if FIsThrowException then
                begin
                        raise EPopbillException.Create(-99999999,'관리번호가 입력되지 않았습니다.');
                        Exit;                
                end
                else
                begin
                        result.code := -99999999;
                        result.message := '관리번호가 입력되지 않았습니다.';
                        Exit;                
                end;

        end;

        try
                requestJson := TTaxinvoiceTojson(Taxinvoice,writeSpecification,false,'','','');
                responseJson := httppost('/Taxinvoice/'+ GetEnumName(TypeInfo(EnumMgtKeyType),integer(MgtKeyType)) + '/'+MgtKey,
                                        CorpNum,UserID,requestJson,'PATCH');
        except
                on le : EPopbillException do begin
                        if FIsThrowException then
                        begin
                                raise EPopbillException.Create(le.code,le.Message);
                                exit;
                        end
                        else
                        begin
                                result.code := le.code;
                                result.message := le.Message;
                        end;
                end;
        end;

        if LastErrCode <> 0 then
        begin
                result.code := LastErrCode;
                result.message := LastErrMessage;
        end
        else
        begin
                result.code := getJSonInteger(responseJson,'code');
                result.message := getJSonString(responseJson,'message');                
        end;        
end;

function TTaxinvoiceService.Send(CorpNum : String; MgtKeyType:EnumMgtKeyType; MgtKey : String; Memo : String) : TResponse;
begin
    Result := Send(CorpNum,MgtKeyType,MgtKey,Memo,'','');
end;

function TTaxinvoiceService.Send(CorpNum : String; MgtKeyType:EnumMgtKeyType; MgtKey : String; Memo : String; UserID : String) : TResponse;
begin
    Result := Send(CorpNum,MgtKeyType,MgtKey,Memo,'',UserID);
end;

function TTaxinvoiceService.Send(CorpNum : String; MgtKeyType:EnumMgtKeyType; MgtKey : String; Memo : String; EmailSubject : String; UserID : String) : TResponse;
var
        requestJson : string;
        responseJson : string;
begin

        if MgtKey = '' then
        begin
                if FIsThrowException then
                begin
                        raise EPopbillException.Create(-99999999,'관리번호가 입력되지 않았습니다.');
                        Exit;                
                end
                else
                begin
                        result.code := -99999999;
                        result.message := '관리번호가 입력되지 않았습니다.';
                        Exit;                
                end;

        end;

        try
                requestJson := '{"memo":"'+EscapeString(Memo)+'","emailSubject":"'+EscapeString(EmailSubject)+'"}';

                responseJson := httppost('/Taxinvoice/'+ GetEnumName(TypeInfo(EnumMgtKeyType),integer(MgtKeyType)) + '/'+MgtKey,
                                        CorpNum,UserID,requestJson,'SEND');
        except
                on le : EPopbillException do begin
                        if FIsThrowException then
                        begin
                                raise EPopbillException.Create(le.code,le.Message);
                                exit;
                        end
                        else
                        begin
                                result.code := le.code;
                                result.message := le.message;
                        end;
                end;
        end;
        
        if LastErrCode <> 0 then
        begin
                result.code := LastErrCode;
                result.message := LastErrMessage;
        end
        else
        begin
                result.code := getJSonInteger(responseJson,'code');
                result.message := getJSonString(responseJson,'message');                
        end;

end;

function TTaxinvoiceService.CancelSend(CorpNum : String; MgtKeyType:EnumMgtKeyType; MgtKey : String; Memo : String; UserID : String = '') : TResponse;
var
        requestJson : string;
        responseJson : string;
begin

        if MgtKey = '' then
        begin
                if FIsThrowException then
                begin
                        raise EPopbillException.Create(-99999999, '관리번호가 입력되지 않았습니다.');
                        Exit;                              
                end
                else
                begin
                        result.code := -99999999;
                        result.message := '관리번호가 입력되지 않았습니다.';
                        Exit;                
                end;

        end;

        try
                requestJson := '{"memo":"'+EscapeString(Memo)+'"}';

                responseJson := httppost('/Taxinvoice/'+ GetEnumName(TypeInfo(EnumMgtKeyType),integer(MgtKeyType)) + '/'+MgtKey,
                                CorpNum,UserID,requestJson,'CANCELSEND');
        except
                on le : EPopbillException do begin
                        if FIsThrowException then
                        begin
                                raise EPopbillException.Create(le.code,le.Message);
                                exit;
                        end
                        else
                        begin
                                result.code := le.code;
                                result.message := le.Message;
                        end;
                end;
        end;
        
        if LastErrCode <> 0 then
        begin
                result.code := LastErrCode;
                result.message := LastErrMessage;
        end
        else
        begin
                result.code := getJSonInteger(responseJson,'code');
                result.message := getJSonString(responseJson,'message');                
        end;        

end;

function TTaxinvoiceService.Accept(CorpNum : String; MgtKeyType:EnumMgtKeyType; MgtKey : String; Memo : String; UserID : String = '') : TResponse;
var
        requestJson : string;
        responseJson : string;
begin

        if MgtKey = '' then
        begin
                if FIsThrowException then
                begin
                        raise EPopbillException.Create(-99999999, '관리번호가 입력되지 않았습니다.');
                        Exit;                
                end
                else
                begin
                        result.code := -99999999;
                        result.message := '관리번호가 입력되지 않았습니다.';
                        Exit;                
                end;
        end;

        try
                requestJson := '{"memo":"'+EscapeString(Memo)+'"}';

                responseJson := httppost('/Taxinvoice/'+ GetEnumName(TypeInfo(EnumMgtKeyType),integer(MgtKeyType)) + '/'+MgtKey,
                                        CorpNum,UserID,requestJson,'ACCEPT');
        except
                on le : EPopbillException do begin
                        if FIsThrowException then
                        begin
                                raise EPopbillException.Create(le.code,le.Message);
                                exit;
                        end
                        else
                        begin
                                result.code := le.code;
                                result.message := le.Message;
                        end;

                end;
        end;
        
        if LastErrCode <> 0 then
        begin
                result.code := LastErrCode;
                result.message := LastErrMessage;
        end
        else
        begin
                result.code := getJSonInteger(responseJson,'code');
                result.message := getJSonString(responseJson,'message');                
        end;        
end;

function TTaxinvoiceService.Deny(CorpNum : String; MgtKeyType:EnumMgtKeyType; MgtKey : String; Memo : String; UserID : String = '') : TResponse;
var
        requestJson : string;
        responseJson : string;
begin

        if MgtKey = '' then
        begin
                if FIsThrowException then
                begin
                        raise EPopbillException.Create(-99999999, '관리번호가 입력되지 않았습니다.');
                        Exit;                
                end
                else
                begin
                        result.code := -99999999;
                        result.message := '관리번호가 입력되지 않았습니다.';
                        Exit;                
                end;
        end;

        try
                requestJson := '{"memo":"'+EscapeString(Memo)+'"}';

                responseJson := httppost('/Taxinvoice/'+ GetEnumName(TypeInfo(EnumMgtKeyType),integer(MgtKeyType)) + '/'+MgtKey,
                                        CorpNum,UserID,requestJson,'DENY');
        except
                on le : EPopbillException do begin
                        if FIsThrowException then
                        begin
                                raise EPopbillException.Create(le.code,le.Message);
                                exit;
                        end
                        else
                        begin
                                result.code := le.code;
                                result.message := le.Message;
                        end;

                end;
        end;

        if LastErrCode <> 0 then
        begin
                result.code := LastErrCode;
                result.message := LastErrMessage;
        end
        else
        begin
                result.code := getJSonInteger(responseJson,'code');
                result.message := getJSonString(responseJson,'message');                
        end;        


end;
function TTaxinvoiceService.Issue(CorpNum : String; MgtKeyType:EnumMgtKeyType; MgtKey : String; Memo : String; EmailSubject : String; ForceIssue : Boolean; UserID : String) : TIssueResponse;
var
        requestJson : string;
        responseJson : string;
        forIssue : string;
begin

        if MgtKey = '' then
        begin
                if FIsThrowException then
                begin
                        raise EPopbillException.Create(-99999999, '관리번호가 입력되지 않았습니다.');
                        Exit;                
                end
                else
                begin
                        result.code := -99999999;
                        result.message := '관리번호가 입력되지 않았습니다.';
                        result.ntsConfirmNum := '';
                        Exit;                
                end;
        end;

        try
                if ForceIssue then forIssue := 'true' else forIssue := 'false';

                requestJson := '{"memo":"'+EscapeString(Memo)+'","emailSubject":"'+EscapeString(EmailSubject)+'","forceIssue":'+forIssue+'}';

                responseJson := httppost('/Taxinvoice/'+ GetEnumName(TypeInfo(EnumMgtKeyType),integer(MgtKeyType)) + '/'+MgtKey,CorpNum,UserID,requestJson,'ISSUE');
                               
        except
                on le : EPopbillException do begin
                        if FIsThrowException then
                        begin
                                raise EPopbillException.Create(le.code,le.Message);
                        end
                        else
                        begin
                                result.code := le.code;
                                result.message := le.Message;
                                result.ntsConfirmNum := '';
                        end;

                end;
        end;

        if LastErrCode <> 0 then
        begin
                result.code := LastErrCode;
                result.message := LastErrMessage;
                result.ntsConfirmNum := '';
        end
        else
        begin
                result.code := getJSonInteger(responseJson,'code');
                result.message := getJSonString(responseJson,'message');
                result.ntsConfirmNum := getJSonString(responseJson,'ntsConfirmNum');                                
        end;         
end;

function TTaxinvoiceService.CancelIssue(CorpNum : String; MgtKeyType:EnumMgtKeyType; MgtKey : String; Memo : String; UserID : String) : TResponse;
var
        requestJson : string;
        responseJson : string;
begin

        if MgtKey = '' then
        begin
                if FIsThrowException then
                begin
                        raise EPopbillException.Create(-99999999, '관리번호가 입력되지 않았습니다.');
                        Exit;                
                end
                else
                begin
                        result.code := -99999999;
                        result.message := '관리번호가 입력되지 않았습니다.';
                        Exit;                
                end;
        end;

        try
                requestJson := '{"memo":"'+EscapeString(Memo)+'"}';

                responseJson := httppost('/Taxinvoice/'+ GetEnumName(TypeInfo(EnumMgtKeyType),integer(MgtKeyType)) + '/'+MgtKey,
                                        CorpNum,UserID,requestJson,'CANCELISSUE');
        except
                on le : EPopbillException do begin
                        if FIsThrowException then
                        begin
                                raise EPopbillException.Create(le.code,le.Message);
                                exit;
                        end
                        else
                        begin
                                result.code := le.code;
                                result.message := le.Message;
                        end;
                end;
        end;

        if LastErrCode <> 0 then
        begin
                result.code := LastErrCode;
                result.message := LastErrMessage;
        end
        else
        begin
                result.code := getJSonInteger(responseJson,'code');
                result.message := getJSonString(responseJson,'message');                
        end;        
end;

function TTaxinvoiceService.RegistRequest(CorpNum : String; Taxinvoice : TTaxinvoice; memo : String=''; UserID : String = '') : TResponse;
var
        requestJson : string;
        responseJson : string;
begin

        try
                requestJson := TTaxinvoiceTojson(Taxinvoice,false,false,memo,'','');
                responseJson := httppost('/Taxinvoice',CorpNum,UserID,requestJson,'REQUEST');
        except
                on le : EPopbillException do begin
                        if FIsThrowException then
                        begin
                                raise EPopbillException.Create(le.code,le.Message);
                                exit;
                        end
                        else
                        begin
                                result.code := le.code;
                                result.message := le.Message;
                        end;

                end;
        end;

        if LastErrCode <> 0 then
        begin
                result.code := LastErrCode;
                result.message := LastErrMessage;
        end
        else
        begin
                result.code := getJSonInteger(responseJson,'code');
                result.message := getJSonString(responseJson,'message');
        end;
                
end;

function TTaxinvoiceService.Request(CorpNum : String; MgtKeyType:EnumMgtKeyType; MgtKey : String; Memo : String; UserID : String = '') : TResponse;
var
        requestJson : string;
        responseJson : string;
begin

        if MgtKey = '' then
        begin
                if FIsThrowException then
                begin
                        raise EPopbillException.Create(-99999999, '관리번호가 입력되지 않았습니다.');
                        Exit;                         
                end
                else
                begin
                        result.code := -99999999;
                        result.message := '관리번호가 입력되지 않았습니다.';
                        Exit;                
                end;
        end;

        try
                requestJson := '{"memo":"'+EscapeString(Memo)+'"}';
                responseJson := httppost('/Taxinvoice/'+ GetEnumName(TypeInfo(EnumMgtKeyType),integer(MgtKeyType)) + '/'+MgtKey,
                                        CorpNum,UserID,requestJson,'REQUEST');
        except
                on le : EPopbillException do begin
                        if FIsThrowException then
                        begin
                                raise EPopbillException.Create(le.code,le.Message);
                                exit;
                        end
                        else
                        begin
                                result.code := le.code;
                                result.message := le.Message;
                        end;

                end;
        end;

        if LastErrCode <> 0 then
        begin
                result.code := LastErrCode;
                result.message := LastErrMessage;
        end
        else
        begin
                result.code := getJSonInteger(responseJson,'code');
                result.message := getJSonString(responseJson,'message');
        end;
                
end;

function TTaxinvoiceService.Refuse(CorpNum : String; MgtKeyType:EnumMgtKeyType; MgtKey : String; Memo : String; UserID : String = '') : TResponse;
var
        requestJson : string;
        responseJson : string;
begin

        if MgtKey = '' then
        begin
                if FIsThrowException then
                begin
                        raise EPopbillException.Create(-99999999, '관리번호가 입력되지 않았습니다.');
                        Exit;                 
                end
                else
                begin
                        result.code := -99999999;
                        result.message := '관리번호가 입력되지 않았습니다.';
                        Exit;                
                end;
        end;

        try
                requestJson := '{"memo":"'+EscapeString(Memo)+'"}';
                responseJson := httppost('/Taxinvoice/'+ GetEnumName(TypeInfo(EnumMgtKeyType),integer(MgtKeyType)) + '/'+MgtKey,
                                        CorpNum,UserID,requestJson,'REFUSE');
        except
                on le : EPopbillException do begin
                        if FIsThrowException then
                        begin
                                raise EPopbillException.Create(le.code,le.Message);
                                exit;
                        end
                        else
                        begin
                                result.code := le.code;
                                result.message := le.Message;
                        end;
                end;
        end;

        if LastErrCode <> 0 then
        begin
                result.code := LastErrCode;
                result.message := LastErrMessage;
        end
        else
        begin
                result.code := getJSonInteger(responseJson,'code');
                result.message := getJSonString(responseJson,'message');
        end;        

end;

function TTaxinvoiceService.CancelRequest(CorpNum : String; MgtKeyType:EnumMgtKeyType; MgtKey : String; Memo : String; UserID : String = '') : TResponse;
var
        requestJson : string;
        responseJson : string;
begin

        if MgtKey = '' then
        begin
                if FIsThrowException then
                begin
                        raise EPopbillException.Create(-99999999, '관리번호가 입력되지 않았습니다.');
                        Exit;                 
                end
                else
                begin
                        result.code := -99999999;
                        result.message := '관리번호가 입력되지 않았습니다.';
                        Exit;                
                end;
        end;

        try
                requestJson := '{"memo":"'+EscapeString(Memo)+'"}';

                responseJson := httppost('/Taxinvoice/'+ GetEnumName(TypeInfo(EnumMgtKeyType),integer(MgtKeyType)) + '/'+MgtKey,
                                        CorpNum,UserID,requestJson,'CANCELREQUEST');
        except
                on le : EPopbillException do begin
                        if FIsThrowException then
                        begin
                                raise EPopbillException.Create(le.code,le.Message);
                                exit;
                        end
                        else
                        begin
                                result.code := le.code;
                                result.message := le.Message;
                        end;
                end;
        end;

        if LastErrCode <> 0 then
        begin
                result.code := LastErrCode;
                result.message := LastErrMessage;
        end
        else
        begin
                result.code := getJSonInteger(responseJson,'code');
                result.message := getJSonString(responseJson,'message');
        end;        

end;

function TTaxinvoiceService.GetSendToNTSConfig(CorpNum: string; UserID : String = '') : Boolean;
var
        responseJson : string;
begin


        try
                responseJson := httpget('/Taxinvoice/SendToNTSConfig',CorpNum,UserID);
                result := getJSonBoolean(responseJson,'sendToNTS');
        except
                on le : EPopbillException do begin
                        if FIsThrowException then
                        begin
                                raise EPopbillException.Create(le.code, le.Message);
                                exit;
                        end;
                end;

        end;
end;

function TTaxinvoiceService.SendToNTS(CorpNum : String; MgtKeyType:EnumMgtKeyType; MgtKey : String; UserID : String = '') : TResponse;
var
        responseJson : string;
begin

        if MgtKey = '' then
        begin
                if FIsThrowException then
                begin
                        raise EPopbillException.Create(-99999999, '관리번호가 입력되지 않았습니다.');
                        Exit;                 
                end
                else
                begin
                        result.code := -99999999;
                        result.message := '관리번호가 입력되지 않았습니다.';
                        Exit;                
                end;
        end;

        try
                responseJson := httppost('/Taxinvoice/'+ GetEnumName(TypeInfo(EnumMgtKeyType),integer(MgtKeyType)) + '/'+MgtKey,
                                        CorpNum,UserID,'','NTS');
        except
                on le : EPopbillException do begin
                        if FIsThrowException then
                        begin
                                raise EPopbillException.Create(le.code,le.Message);
                                exit;
                        end
                        else
                        begin
                                result.code := le.code;
                                result.message := le.Message;
                        end;
                end;
                
        end;
        
        if LastErrCode <> 0 then
        begin
                result.code := LastErrCode;
                result.message := LastErrMessage;
        end
        else
        begin
                result.code := getJSonInteger(responseJson,'code');
                result.message := getJSonString(responseJson,'message');
        end;        
end;

function TTaxinvoiceService.SendEmail(CorpNum : String; MgtKeyType:EnumMgtKeyType; MgtKey :String; Receiver:String; UserID : String = '') : TResponse;
var
        requestJson : string;
        responseJson : string;
begin

        if MgtKey = '' then
        begin
                if FIsThrowException then
                begin
                        raise EPopbillException.Create(-99999999, '관리번호가 입력되지 않았습니다.');
                        Exit;                 
                end
                else
                begin
                        result.code := -99999999;
                        result.message := '관리번호가 입력되지 않았습니다.';
                        Exit;                
                end;
        end;

        try
                requestJson := '{"receiver":"'+EscapeString(Receiver)+'"}';

                responseJson := httppost('/Taxinvoice/'+ GetEnumName(TypeInfo(EnumMgtKeyType),integer(MgtKeyType)) + '/'+MgtKey,
                                        CorpNum,UserID,requestJson,'EMAIL');
        except
                on le : EPopbillException do begin
                        if FIsThrowException then
                        begin
                                raise EPopbillException.Create(le.code,le.Message);
                                exit;
                        end
                        else
                        begin
                                result.code := le.code;
                                result.message := le.Message;
                        end;

                end;
        end;
        
        if LastErrCode <> 0 then
        begin
                result.code := LastErrCode;
                result.message := LastErrMessage;
        end
        else
        begin
                result.code := getJSonInteger(responseJson,'code');
                result.message := getJSonString(responseJson,'message');
        end;         

end;

function TTaxinvoiceService.SendSMS(CorpNum : String; MgtKeyType:EnumMgtKeyType; MgtKey :String; Sender:String; Receiver:String; Contents : String; UserID : String = '') : TResponse;
var
        requestJson : string;
        responseJson : string;
begin

        if MgtKey = '' then
        begin
                if FIsThrowException then
                begin
                        raise EPopbillException.Create(-99999999, '관리번호가 입력되지 않았습니다.');
                        Exit;                 
                end
                else
                begin
                        result.code := -99999999;
                        result.message := '관리번호가 입력되지 않았습니다.';
                        Exit;                
                end;
        end;
        try
                requestJson := '{"sender":"'+EscapeString(Sender)+'","receiver":"'+EscapeString(Receiver)+'","contents":"'+EscapeString(Contents)+'"}';

                responseJson := httppost('/Taxinvoice/'+ GetEnumName(TypeInfo(EnumMgtKeyType),integer(MgtKeyType)) + '/'+MgtKey,
                                        CorpNum,UserID,requestJson,'SMS');
        except
                on le : EPopbillException do begin
                        if FIsThrowException then
                        begin
                                raise EPopbillException.Create(le.code,le.Message);
                                exit;
                        end
                        else
                        begin
                                result.code := le.code;
                                result.message := le.Message;
                        end;
                end;
        end;
        
        if LastErrCode <> 0 then
        begin
                result.code := LastErrCode;
                result.message := LastErrMessage;
        end
        else
        begin
                result.code := getJSonInteger(responseJson,'code');
                result.message := getJSonString(responseJson,'message');
        end;
end;

function TTaxinvoiceService.SendFAX(CorpNum : String; MgtKeyType:EnumMgtKeyType; MgtKey :String; Sender:String; Receiver:String; UserID : String = '') : TResponse;
var
        requestJson : string;
        responseJson : string;
begin

        if MgtKey = '' then
        begin
                if FIsThrowException then
                begin
                        raise EPopbillException.Create(-99999999, '관리번호가 입력되지 않았습니다.');
                        Exit;                 
                end
                else
                begin
                        result.code := -99999999;
                        result.message := '관리번호가 입력되지 않았습니다.';
                        Exit;                
                end;
        end;

        try
                requestJson := '{"sender":"'+EscapeString(Sender)+'","receiver":"'+EscapeString(Receiver)+'"}';

                responseJson := httppost('/Taxinvoice/'+ GetEnumName(TypeInfo(EnumMgtKeyType),integer(MgtKeyType)) + '/'+MgtKey,
                                        CorpNum,UserID,requestJson,'FAX');
        except
                on le : EPopbillException do begin
                        if FIsThrowException then
                        begin
                                raise EPopbillException.Create(le.code,le.Message);
                                exit;
                        end
                        else
                        begin
                                result.code := le.code;
                                result.message := le.Message;
                        end;

                end;
        end;

        if LastErrCode <> 0 then
        begin
                result.code := LastErrCode;
                result.message := LastErrMessage;
        end
        else
        begin
                result.code := getJSonInteger(responseJson,'code');
                result.message := getJSonString(responseJson,'message');
        end;        
end;


function TTaxinvoiceService.jsonToTTaxinvoiceInfo(json : String) : TTaxinvoiceInfo;
begin
        result := TTaxinvoiceInfo.Create;
        result.closeDownState := getJSonInteger(json,'closeDownState');
        result.closeDownStateDate := getJSonString(json,'closeDownStateDate');

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
        result.modifyCode := IntToStr(getJSonInteger(json,'modifyCode'));
        result.issueType := getJSonString(json,'issueType');

        result.interOPYN := getJsonBoolean(json,'interOPYN');        
        result.lateIssueYN := getJsonBoolean(json,'lateIssueYN');
        result.issueDT := getJSonString(json,'issueDT');
        result.preIssueDT := getJSonString(json,'preIssueDT');

        result.stateCode := getJSonInteger(json,'stateCode');
        result.stateDT := getJSonString(json,'stateDT');


        result.openYN := getJSonBoolean(json,'openYN');

        result.openDT := getJSonString(json,'openDT');
        result.nTSResult := getJSonString(json,'ntsresult');
        result.nTSConfirmNum := getJSonString(json,'ntsconfirmNum');
        result.nTSSendDT := getJSonString(json,'ntssendDT');
        result.nTSResultDT := getJSonString(json,'ntsresultDT');
        result.nTSSendErrCode := getJSonString(json,'ntssendErrCode');

        result.stateMemo := getJSonString(json,'stateMemo');

        result.InvoicerPrintYN := getJSonBoolean(json,'invoicerPrintYN');
        result.InvoiceePrintYN := getJSonBoolean(json,'invoiceePrintYN');
        result.TrusteePrintYN := getJSonBoolean(json,'irusteePrintYN');

end;

function TTaxinvoiceService.getInfo(CorpNum : string; MgtKeyType:EnumMgtKeyType; MgtKey: string) : TTaxinvoiceInfo;
var
        responseJson : string;
begin
        
        if MgtKey = '' then
        begin
                if FIsThrowException then
                begin
                        raise EPopbillException.Create(-99999999,'관리번호가 입력되지 않았습니다.');
                        Exit;
                end
                else
                begin
                        result := TTaxinvoiceInfo.Create;
                        setLastErrCode(-99999999);
                        setLastErrMessage('관리번호가 입력되지 않았습니다.');
                        Exit;
                end;

        end;

        try
                responseJson := httpget('/Taxinvoice/'+ GetEnumName(TypeInfo(EnumMgtKeyType),integer(MgtKeyType)) + '/'+MgtKey , CorpNum,'');
                result := jsonToTTaxinvoiceInfo(responseJson);
        except
                on le : EPopbillException do begin
                        if FIsThrowException then
                        begin
                                raise EPopbillException.Create(le.code,le.Message);
                                exit;
                        end;
                        result := TTaxinvoiceInfo.Create;
                        exit;
                end;

        end;
end;

function TTaxinvoiceService.search(CorpNum : string; MgtKeyType:EnumMgtKeyType; DType:String; SDate: String; EDate:String; State : Array Of String; TType:Array Of String; TaxType : Array Of String; LateOnly : String; Page : Integer; PerPage : Integer; Order : String) : TSearchList;
begin
        Result := search(CorpNum, MgtKeyType, DType, SDate, EDate, State, TType, TaxType, LateOnly, '', '', '', '', Page, PerPage, Order, '', '');
end;

function TTaxinvoiceService.search(CorpNum : string; MgtKeyType:EnumMgtKeyType; DType:String; SDate: String; EDate:String; State : Array Of String; TType:Array Of String; TaxType : Array Of String; LateOnly : String; Page : Integer; PerPage : Integer; Order : String; UserID:string) : TSearchList;
begin
        Result := search(CorpNum, MgtKeyType, DType, SDate, EDate, State, TType, TaxType, LateOnly, '', '', '', Page, PerPage, Order, UserID);
end;

function TTaxinvoiceService.search(CorpNum : string; MgtKeyType:EnumMgtKeyType; DType:String; SDate: String; EDate:String; State : Array Of String; TType:Array Of String; TaxType : Array Of String; LateOnly : String; TaxRegIDType :String; TaxRegID: String; TaxRegIDYN : string; Page : Integer; PerPage : Integer; Order : String) : TSearchList;
begin
        Result := search(CorpNum, MgtKeyType, DType, SDate, EDate, State, TType, TaxType, LateOnly, TaxRegIDType, TaxRegID, TaxRegIDYN, Page, PerPage, Order, '');
end;

function TTaxinvoiceService.search(CorpNum : string; MgtKeyType:EnumMgtKeyType; DType:String; SDate: String; EDate:String; State : Array Of String; TType:Array Of String; TaxType : Array Of String; LateOnly : String; TaxRegIDType :String; TaxRegID: String; TaxRegIDYN : string; Page : Integer; PerPage : Integer; Order : String; UserID : String) : TSearchList;
begin
        Result := search(CorpNum, MgtKeyType, DType, SDate, EDate, State, TType, TaxType, LateOnly, TaxRegIDType, TaxRegID, TaxRegIDYN, '', Page, PerPage, Order, '');
end;

function TTaxinvoiceService.search(CorpNum : string; MgtKeyType:EnumMgtKeyType; DType:String; SDate: String; EDate:String; State : Array Of String; TType:Array Of String; TaxType : Array Of String; LateOnly : String; TaxRegIDType :String; TaxRegID: String; TaxRegIDYN : string; QString : string; Page : Integer; PerPage : Integer; Order : String; UserID:String) : TSearchList;
begin
        Result := search(CorpNum, MgtKeyType, DType, SDate, EDate, State, TType, TaxType, LateOnly, TaxRegIDType, TaxRegID, TaxRegIDYN, QString, Page, PerPage, Order, '', UserID);
end;

function TTaxinvoiceService.search(CorpNum : string; MgtKeyType:EnumMgtKeyType; DType:String; SDate: String; EDate:String; State : Array Of String; TType:Array Of String; TaxType : Array Of String; LateOnly : String; TaxRegIDType :String; TaxRegID: String; TaxRegIDYN : string; QString : string; Page : Integer; PerPage : Integer; Order : String; InterOPYN : String; UserID:String) : TSearchList;
var
        emptyList : Array of String;
begin
        SetLength(emptyList, 0);
        Result := search(CorpNum, MgtKeyType, DType, SDate, EDate, State, TType, TaxType, emptyList , LateOnly, TaxRegIDType, TaxRegID, TaxRegIDYN, QString, Page, PerPage, Order, InterOPYN, UserID);
end;

function TTaxinvoiceService.search(CorpNum : string; MgtKeyType:EnumMgtKeyType; DType:String; SDate: String; EDate:String; State : Array Of String; TType:Array Of String; TaxType : Array Of String; IssueType : Array Of String; LateOnly : String; TaxRegIDType :String; TaxRegID: String; TaxRegIDYN : string; QString : string; Page : Integer; PerPage : Integer; Order : String; InterOPYN : String; UserID:String) : TSearchList;
var
        emptyList : Array of String;
begin
        SetLength(emptyList, 0);
        Result := search(CorpNum, MgtKeyType, DType, SDate, EDate, State, TType, TaxType, IssueType , LateOnly, TaxRegIDType, TaxRegID, TaxRegIDYN, QString, Page, PerPage, Order, InterOPYN, UserID, emptyList);
end;
function TTaxinvoiceService.search(CorpNum : string; MgtKeyType:EnumMgtKeyType; DType:String; SDate: String; EDate:String; State : Array Of String; TType:Array Of String; TaxType : Array Of String; IssueType : Array Of String; LateOnly : String; TaxRegIDType :String; TaxRegID: String; TaxRegIDYN : string; QString : string; Page : Integer; PerPage : Integer; Order : String; InterOPYN : String; UserID:String; RegType : Array Of String) : TSearchList;
var
        emptyList : Array of String;
begin
        SetLength(emptyList, 0);
        Result := search(CorpNum, MgtKeyType, DType, SDate, EDate, State, TType, TaxType, IssueType , LateOnly, TaxRegIDType, TaxRegID, TaxRegIDYN, QString, Page, PerPage, Order, InterOPYN, UserID, RegType, emptyList, '');
end;
function TTaxinvoiceService.search(CorpNum : string; MgtKeyType:EnumMgtKeyType; DType:String; SDate: String; EDate:String; State : Array Of String; TType:Array Of String; TaxType : Array Of String; IssueType : Array Of String; LateOnly : String; TaxRegIDType :String; TaxRegID: String; TaxRegIDYN : string; QString : string; Page : Integer; PerPage : Integer; Order : String; InterOPYN : String; UserID:String; RegType : Array Of String; CloseDownState : Array Of String; MgtKey : String) : TSearchList;
var
        responseJson : string;
        uri : String;
        StateList : String;
        TypeList : String;
        TaxTypeList : String;
        IssueTypeList : String;
        RegTypeList : String;
        CloseDownStateList : String;
        i : Integer;
        jsons : ArrayOfString;
begin

        if DType = '' then
        begin
                if FIsThrowException then
                begin
                        raise EPopbillException.Create(-99999999,'검색일자 유형이 입력되지 않았습니다.');
                        Exit;                
                end
                else
                begin
                        result := TSearchList.Create;
                        result.code := -99999999;
                        result.message := '검색일자 유형이 입력되지 않았습니다.';
                        exit;                
                end;

        end;

        if SDate = '' then
        begin
                if FIsThrowException then
                begin
                        raise EPopbillException.Create(-99999999,'검색 시작일자가 입력되지 않았습니다.');
                        Exit;                
                end
                else
                begin
                        result := TSearchList.Create;
                        result.code := -99999999;
                        result.message := '검색 시작일자가 입력되지 않았습니다.';
                        exit;                
                end;
        end;

        if EDate = '' then
        begin
                if FIsThrowException then
                begin
                        raise EPopbillException.Create(-99999999,'검색 종료일자가 입력되지 않았습니다.');
                        Exit;                
                end
                else
                begin
                        result := TSearchList.Create;
                        result.code := -99999999;
                        result.message := '검색 종료일자가 입력되지 않았습니다.';
                        exit;
                end;
        end;

        for i := 0 to High(State) do
        begin
                if State[i] <> '' Then
                StateList := StateList + State[i];

                if i <> High(State) then
                StateList := StateList + ',';
        end;

        for i := 0 to High(TType) do
        begin
                if TType[i] <> '' Then
                TypeList := TypeList + TType[i];

                if i <> High(TType) then
                TypeList := TypeList + ',';
        end;

        for i := 0 to High(TaxType) do
        begin
                if TaxType[i] <> '' Then
                TaxTypeList := TaxTypeList + TaxType[i];

                if i <> High(TaxType) then
                TaxTypeList := TaxTypeList + ',';
        end;

        if Page < 1 then Page := 1;
        if PerPage < 1 then PerPage := 500;
        if PerPage > 1000 then PerPage := 500;

        uri := '/Taxinvoice/'+ GetEnumName(TypeInfo(EnumMgtKeyType),integer(MgtKeyType));
        uri := uri + '?DType='+ DType + '&&SDate=' + SDate + '&&EDate=' + EDate;
        uri := uri + '&&State=' + StateList + '&&Type=' + TypeList +'&&TaxType=' + TaxTypeList;
        uri := uri + '&&LateOnly='+ LateOnly + '&&Page=' +IntToStr(Page) + '&&PerPage=' + IntToStr(PerPage);
        uri := uri + '&&Order=' + Order;


        if Length(IssueType) > 0 Then
        begin
                for i := 0 to High(IssueType) do
                begin
                        if IssueType[i] <> '' Then
                        IssueTypeList := IssueTypeList + IssueType[i];

                        if i <> High(IssueType) then
                        IssueTypeList := IssueTypeList + ',';
                end;

                uri := uri + '&&IssueType=' + IssueTypeList; 
        end;


        if Length(RegType) > 0 Then
        begin
                for i := 0 to High(RegType) do
                begin
                        if RegType[i] <> '' Then
                        RegTypeList := RegTypeList + RegType[i];

                        if i <> High(RegType) then
                        RegTypeList := RegTypeList + ',';
                end;

                uri := uri + '&&RegType=' + RegTypeList;
        end;

        if Length(CloseDownState) > 0 Then
        begin
                for i := 0 to High(CloseDownState) do
                begin
                        if CloseDownState[i] <> '' Then
                        CloseDownStateList := CloseDownStateList + CloseDownState[i];

                        if i <> High(CloseDownState) then
                        CloseDownStateList := CloseDownStateList + ',';
                end;

                uri := uri + '&&CloseDownState=' + CloseDownStateList;
        end;
                
        if TaxRegIDYN <> '' then
        begin
                uri := uri + '&&TaxRegIDYN='+TaxRegIDYN;
        end;
        if TaxRegID <> '' then
        begin
                uri := uri + '&&TaxRegID='+TaxRegID;
        end;

        uri := uri + '&&TaxRegIDType=' +TaxRegIDType;

        if QString <> '' Then
        begin
                uri := uri + '&&QString=' + UrlEncodeUTF8(QString);
        end;

        if MgtKey <> '' Then
        begin
                uri := uri + '&&MgtKey=' + UrlEncodeUTF8(MgtKey);
        end;

        if InterOPYN <> '' Then
        begin
                uri := uri + '&&InterOPYN=' + InterOPYN;
        end;

        try
                responseJson := httpget(uri, CorpNum, UserID);
        except
               on le : EPopbillException do begin
                        if FIsThrowException then
                        begin
                                raise EPopbillException.Create(le.code,le.Message);
                                exit;                                
                        end;
                        result := TSearchList.Create;
                        result.code := le.code;
                        result.message := le.message;
                        exit;
                end;
        end;

        if LastErrCode <> 0 then
        begin
                result := TSearchList.Create;
                result.code := LastErrCode;
                result.message := LastErrMessage;
                exit;
        end
        else
        begin

        result := TSearchList.Create;

        result.code             := getJSonInteger(responseJson,'code');
        result.total            := getJSonInteger(responseJson,'total');
        result.perPage          := getJSonInteger(responseJson,'perPage');
        result.pageNum          := getJSonInteger(responseJson,'pageNum');
        result.pageCount        := getJSonInteger(responseJson,'pageCount');
        result.message          := getJSonString(responseJson,'message');

        try
                jSons := getJSonList(responseJson,'list');
                SetLength(result.list, Length(jSons));
                for i:=0 to Length(jSons)-1 do
                begin
                        result.list[i] := TTaxinvoiceInfo.Create;
                        result.list[i].closeDownState := getJSonInteger(jSons[i],'closeDownState');
                        result.list[i].closeDownStateDate := getJSonString(jSons[i],'closeDownStateDate');
                        result.list[i].ItemKey := getJSonString(jSons[i],'itemKey');
                        result.list[i].taxType := getJSonString(jSons[i],'taxType');
                        result.list[i].writeDate := getJSonString(jSons[i],'writeDate');
                        result.list[i].RegDT := getJSonString(jSons[i],'regDT');

                        result.list[i].invoicerCorpName := getJSonString(jSons[i],'invoicerCorpName');
                        result.list[i].invoicerCorpNum := getJSonString(jSons[i],'invoicerCorpNum');
                        result.list[i].invoicerMgtKey := getJSonString(jSons[i],'invoicerMgtKey');
                        result.list[i].invoicerPrintYN := getJSonBoolean(jSons[i],'invoicerPrintYN');
                                                
                        result.list[i].invoiceeCorpName := getJSonString(jSons[i],'invoiceeCorpName');
                        result.list[i].invoiceeCorpNum := getJSonString(jSons[i],'invoiceeCorpNum');
                        result.list[i].invoiceeMgtKey := getJSonString(jSons[i],'invoiceeMgtKey');
                        result.list[i].invoiceePrintYN := getJSonBoolean(jSons[i],'invoiceePrintYN');
                                                
                        result.list[i].trusteeCorpName := getJSonString(jSons[i],'trusteeCorpName');
                        result.list[i].trusteeCorpNum := getJSonString(jSons[i],'trusteeCorpNum');
                        result.list[i].trusteeMgtKey := getJSonString(jSons[i],'trusteeMgtKey');
                        result.list[i].trusteePrintYN := getJSonBoolean(jSons[i],'trusteePrintYN');

                        result.list[i].supplyCostTotal := getJSonString(jSons[i],'supplyCostTotal');
                        result.list[i].taxTotal := getJSonString(jSons[i],'taxTotal');
                        result.list[i].purposeType := getJSonString(jSons[i],'purposeType');
                        result.list[i].modifyCode := getJSonString(jSons[i],'modifyCode');
                        result.list[i].issueType := getJSonString(jSons[i],'issueType');

                        result.list[i].interOPYN := getJsonBoolean(jSons[i],'interOPYN');
                        result.list[i].lateIssueYN := getJsonBoolean(jSons[i],'lateIssueYN');
                        result.list[i].issueDT := getJSonString(jSons[i],'issueDT');
                        result.list[i].preIssueDT := getJSonString(jSons[i],'preIssueDT');

                        result.list[i].stateCode := getJSonInteger(jSons[i],'stateCode');
                        result.list[i].stateDT := getJSonString(jSons[i],'stateDT');


                        result.list[i].openYN := getJSonBoolean(jSons[i],'openYN');

                        result.list[i].openDT := getJSonString(jSons[i],'openDT');
                        result.list[i].nTSResult := getJSonString(jSons[i],'ntsresult');
                        result.list[i].nTSConfirmNum := getJSonString(jSons[i],'ntsconfirmNum');
                        result.list[i].nTSSendDT := getJSonString(jSons[i],'ntssendDT');
                        result.list[i].nTSResultDT := getJSonString(jSons[i],'ntsresultDT');
                        result.list[i].nTSSendErrCode := getJSonString(jSons[i],'ntssendErrCode');
                        result.list[i].stateMemo := getJSonString(jSons[i],'stateMemo');

                end;
        except
                on E:Exception do begin
                        if FIsThrowException then
                        begin
                                raise EPopbillException.Create(-99999999,'결과처리 실패.[Malformed Json]');
                                exit;
                        end
                        else
                        begin
                                result := TSearchList.Create;
                                result.code := -99999999;
                                result.message := '결과처리 실패.[Malformed Json]';
                                exit;
                        end;
                end;
        end;
        end;
end;


function TTaxinvoiceService.jsonToTTaxinvoice(json : String) : TTaxinvoice;
var
        jSons : ArrayOfString;
        i : Integer;
begin

        result := TTaxinvoice.Create;
        result.closeDownState           := getJSonInteger(json,'closeDownState');
        result.closeDownStateDate       := getJSonString(json,'closeDownStateDate');

        result.WriteDate                := getJSonString(json,'writeDate');
        result.ChargeDirection          := getJSonString(json,'chargeDirection');
        result.IssueType                := getJSonString(json,'issueType');
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
        result.invoicerSMSSendYN        := getJSonBoolean(json,'invoicerSMSSendYN');

        result.invoiceeCorpNum          := getJSonString(json,'invoiceeCorpNum');
        result.invoiceeType             := getJSonString(json,'invoiceeType');
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
        result.invoiceeSMSSendYN        := getJSonBoolean(json,'invoiceeSMSSendYN');

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
        result.trusteeSMSSendYN        := getJSonBoolean(json,'trusteeSMSSendYN');

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

        result.businessLicenseYN        := getJSonBoolean(json,'businessLicenseYN');
        result.bankBookYN               := getJSonBoolean(json,'bankBookYN');
        result.fAXSendYN                := getJSonBoolean(json,'faxsendYN');

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

        except
                on E:Exception do begin
                        if FIsThrowException then
                        begin
                                raise EPopbillException.Create(-99999999,'결과처리 실패.[Malformed Json]');
                                exit;
                        end
                        else
                        begin
                                result := TTaxinvoice.Create;
                                SetLength(result.AddContactList, 0);
                                SetLength(result.detailList, 0);
                                setLastErrCode(-99999999);
                                setLastErrMessage('결과처리 실패.[Malformed Json]');
                                exit;
                        end;
                end;
        end;

        //Contacts.
        try
                jSons :=  getJSonList(json,'addContactList');
                SetLength(result.AddContactList,Length(jSons));

                for i := 0 to Length(jSons)-1 do
                begin
                        result.AddContactList[i] := TTaxinvoiceAddContact.Create;

                        result.AddContactList[i].serialNum      := getJSonInteger(jSons[i],'serialNum');
                        result.AddContactList[i].email          := getJSonString(jSons[i],'email');
                        result.AddContactList[i].ContactName    := getJSonString(jSons[i],'contactName');
                end;

        except
                on E:Exception do begin
                        if FIsThrowException then
                        begin
                                raise EPopbillException.Create(-99999999,'결과처리 실패.[Malformed Json]');
                                exit;
                        end
                        else
                        begin                        
                                result := TTaxinvoice.Create;
                                SetLength(result.AddContactList, 0);
                                SetLength(result.detailList, 0);
                                setLastErrCode(-99999999);
                                setLastErrMessage('결과처리 실패.[Malformed Json]');
                                exit;
                        end;
                end;
        end;

end;
function TTaxinvoiceService.GetDetailInfo(CorpNum : string; MgtKeyType:EnumMgtKeyType; MgtKey: string) : TTaxinvoice;
var
        responseJson : string;
begin

        if MgtKey = '' then
        begin
                if FIsThrowException then
                begin
                        raise EPopbillException.Create(-99999999,'관리번호가 입력되지 않았습니다.');
                        Exit;
                end
                else
                begin
                        result := TTaxinvoice.Create();
                        setLastErrCode(-99999999);
                        setLastErrMessage('관리번호가 입력되지 않았습니다.');
                        Exit;
                end;

        end;

        try
                responseJson := httpget('/Taxinvoice/'+ GetEnumName(TypeInfo(EnumMgtKeyType),integer(MgtKeyType)) + '/'+MgtKey + '?Detail' , CorpNum,'');
                result := jsonToTTaxinvoice(responseJson);
        except
               on le : EPopbillException do begin
                        if FIsThrowException then
                        begin
                                raise EPopbillException.Create(le.code,le.Message);
                        end
                        else
                        begin
                                result := TTaxinvoice.Create();
                                exit;
                        end;
                end;
        end;
end;

function TTaxinvoiceService.getLogs(CorpNum : string; MgtKeyType:EnumMgtKeyType; MgtKey: string) : TTaxinvoiceLogList;
var
        responseJson : string;
        jSons : ArrayOfString;
        i : Integer;
begin

        if MgtKey = '' then
        begin
                if FIsThrowException then
                begin
                        raise EPopbillException.Create(-99999999,'관리번호가 입력되지 않았습니다.');
                        Exit;
                end
                else
                begin
                        SetLength(result,0);
                        setLastErrCode(-99999999);
                        setLastErrMessage('관리번호가 입력되지 않았습니다.');
                        Exit;
                end;
        end;


        try
                responseJson := httpget('/Taxinvoice/'+ GetEnumName(TypeInfo(EnumMgtKeyType),integer(MgtKeyType)) + '/'+MgtKey + '/Logs', CorpNum, '');
                
        except
               on le : EPopbillException do begin
                        if FIsThrowException then
                        begin
                                raise EPopbillException.Create(le.code,le.Message);
                                exit;
                        end
                        else
                        begin
                                SetLength(result,0);
                                SetLength(jSons, 0);
                                exit;
                        end;
                end;
                on E:Exception do begin
                        if FIsThrowException then
                        begin
                                raise EPopbillException.Create(-99999999,'결과처리 실패.[Malformed Json]');
                                exit;
                        end;
                        SetLength(result,0);
                        SetLength(jSons, 0);
                        setLastErrCode(-99999999);
                        setLastErrMessage('결과처리 실패.[Malformed Json]');
                        exit;
                end;                
        end;

        if LastErrCode <> 0 then
        begin
                exit;        
        end
        else
        begin
                jSons := ParseJsonList(responseJson);
                SetLength(result,Length(jSons));

                for i := 0 to Length(jSons)-1 do
                begin
                        result[i] := TTaxinvoiceLog.Create;

                        result[i].docLogType            := getJSonInteger(jSons[i],'docLogType');
                        result[i].Log                   := getJSonString(jSons[i],'log');
                        result[i].procType              := getJSonString(jSons[i],'procType');
                        result[i].procCorpName          := getJSonString(jSons[i],'procCorpName');
                        result[i].procContactName       := getJSonString(jSons[i],'procContactName');
                        result[i].procMemo              := getJSonString(jSons[i],'procMemo');
                        result[i].regDT                 := getJSonString(jSons[i],'regDT');
                        result[i].iP                    := getJSonString(jSons[i],'ip');
                end;
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
                if FIsThrowException then
                begin
                        raise EPopbillException.Create(-99999999,'관리번호가 입력되지 않았습니다.');
                        Exit;
                end
                else
                begin
                        SetLength(result, 0);
                        setLastErrCode(-99999999);
                        setLastErrMessage('관리번호가 입력되지 않았습니다.');
                        Exit; 
                end;
        end;

        requestJson := '[';
        for i:=0 to Length(MgtKeyList) -1 do
        begin
                requestJson := requestJson + '"' + MgtKeyList[i] + '"';
                if (i + 1) < Length(MgtKeyList) then requestJson := requestJson + ',';
        end;

        requestJson := requestJson + ']';

        try
                responseJson := httppost('/Taxinvoice/'+ GetEnumName(TypeInfo(EnumMgtKeyType),integer(MgtKeyType)),CorpNum,'',requestJson);
               
        except
               on le : EPopbillException do begin
                        if FIsThrowException then
                        begin
                                raise EPopbillException.Create(le.code,le.Message);
                                exit;
                        end
                        else
                        begin
                                SetLength(result, 0);
                                exit;                        
                        end;
                end;
                on E:Exception do begin
                        if FIsThrowException then
                        begin
                                raise EPopbillException.Create(-99999999,'결과처리 실패.[Malformed Json]');
                                exit;
                        end
                        else
                        begin
                                SetLength(result, 0);
                                SetLength(jSons, 0);
                                setLastErrCode(-99999999);
                                setLastErrMessage('결과처리 실패.[Malformed Json]');
                                exit;
                        end;
                end;
        end;
        
        if LastErrCode <> 0 then
        begin
                SetLength(result, 0);
                SetLength(jSons, 0);
                setLastErrCode(LastErrCode);
                setLastErrMessage(LastErrMessage);
                exit;
        end
        else
        begin
                jSons := ParseJsonList(responseJson);
                SetLength(result,Length(jSons));

                for i := 0 to Length(jSons)-1 do
                begin
                        result[i] := jsonToTTaxinvoiceInfo(jSons[i]);
                end; 
        end;
        
end;


function TTaxinvoiceService.Delete(CorpNum : String; MgtKeyType:EnumMgtKeyType;  MgtKey: String; UserID : String = '') : TResponse;
var
        responseJson : string;
begin

        if MgtKey = '' then
        begin
                if FIsThrowException then
                begin
                        raise EPopbillException.Create(-99999999,'관리번호가 입력되지 않았습니다.');
                        Exit;
                end
                else
                begin
                        result.code := -99999999;
                        result.message := '관리번호가 입력되지 않았습니다.';
                        Exit;
                end;
        end;
        

        try
                responseJson := httppost('/Taxinvoice/'+ GetEnumName(TypeInfo(EnumMgtKeyType),integer(MgtKeyType)) + '/'+MgtKey,CorpNum,UserID,'','DELETE');
        except
                on le : EPopbillException do begin
                        if FIsThrowException then
                        begin
                                raise EPopbillException.Create(le.code,le.Message);
                                exit;
                        end
                        else
                        begin
                                result.code := le.code;
                                result.message := le.Message;
                                exit;
                        end;
                end;
        end;

        if LastErrCode <> 0 then
        begin
                result.code := LastErrCode;
                result.message := LastErrMessage;
        end
        else
        begin
                result.code := getJSonInteger(responseJson,'code');
                result.message := getJSonString(responseJson,'message');                
        end;    
end;

function TTaxinvoiceService.AttachFile(CorpNum : String; MgtKeyType:EnumMgtKeyType; MgtKey : String; FilePath : String; UserID : String = '') : TResponse;
var
        responseJson : string;
        fileName : string;
        fileData : TFileStream;
begin

        if MgtKey = '' then
        begin
                if FIsThrowException then
                begin
                        raise EPopbillException.Create(-99999999,'관리번호가 입력되지 않았습니다.');
                        Exit;
                end
                else
                begin
                        result.code := -99999999;
                        result.message := '관리번호가 입력되지 않았습니다.';
                        Exit;
                end;
        end;

        fileName := ExtractFileName(FilePath);
        fileData := TFileStream.Create(FilePath,fmOpenRead);

        try
                try
                        responseJson := httppost('/Taxinvoice/'+ GetEnumName(TypeInfo(EnumMgtKeyType),integer(MgtKeyType)) + '/'+MgtKey + '/Files',CorpNum,UserID,'Filedata',fileName,fileData);
                except
                        on le : EPopbillException do begin
                                if FIsThrowException then
                                begin
                                        raise EPopbillException.Create(le.code,le.Message);
                                        exit;
                                end
                                else
                                begin
                                        result.code := le.code;
                                        result.message := le.Message;
                                        exit;
                                end;
                        end;
                end;
        finally
                fileData.Free;
        end;

        if LastErrCode <> 0 then
        begin
                result.code := LastErrCode;
                result.message := LastErrMessage;
        end
        else
        begin
                result.code := getJSonInteger(responseJson,'code');
                result.message := getJSonString(responseJson,'message');                
        end;         
end;

function TTaxinvoiceService.GetFiles(CorpNum: String; MgtKeyType : EnumMgtKeyType; MgtKey : String) : TAttachedFileList;
var
        responseJson : string;
        jSons : ArrayOfString;
        i : integer;
begin

        try        
                responseJson := httpget('/Taxinvoice/'+ GetEnumName(TypeInfo(EnumMgtKeyType),integer(MgtKeyType)) + '/'+MgtKey + '/Files',CorpNum,'');
        except
                on le : EPopbillException do begin
                        if FIsThrowException then
                        begin
                                raise EPopbillException.Create(le.code, le.Message);
                                exit;
                        end;
                end;
                
        end;

        if LastErrCode <> 0 then
        begin
               exit;
        end
        else
        begin
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
                except
                        on E:Exception do begin
                                if FIsThrowException then
                                begin
                                        raise EPopbillException.Create(-99999999,'결과처리 실패.[Malformed Json]');
                                        exit;
                                end
                                else
                                begin
                                        SetLength(result, 0);
                                        SetLength(jSons, 0);
                                        setLastErrCode(-99999999);
                                        setLastErrMessage('결과처리 실패.[Malformed Json]');
                                end;
                        end;
                end;

        end;        
end;

function TTaxinvoiceService.DeleteFile(CorpNum : String; MgtKeyType:EnumMgtKeyType;  MgtKey: String; FileID : String; UserID : String = '') : TResponse;
var
        responseJson : string;
begin

        if MgtKey = '' then
        begin
                if FIsThrowException then
                begin
                        raise EPopbillException.Create(-99999999, '관리번호가 입력되지 않았습니다.');
                        exit;
                end;
                result.code := -99999999;
                result.message := '관리번호가 입력되지 않았습니다.';
                Exit;
        end;

        if FileID = '' then
        begin
                if FIsThrowException then
                begin
                        raise EPopbillException.Create(-99999999, '파일 아이디가 입력되지 않았습니다.');
                        exit;
                end;
                result.code := -99999999;
                result.message := '파일 아이디가 입력되지 않았습니다.';
                Exit;
        end;

        try
                responseJson := httppost('/Taxinvoice/'+ GetEnumName(TypeInfo(EnumMgtKeyType),integer(MgtKeyType)) + '/'+MgtKey + '/Files/' + FileID,CorpNum,UserID,'','DELETE');
        except
                on le : EPopbillException do begin
                        if FIsThrowException then
                        begin
                                raise EPopbillException.Create(le.code,le.Message);
                                exit;
                        end
                        else
                        begin
                                result.code := le.code;
                                result.message := le.Message;
                                exit;
                        end;
                end;
        end;
        
        if LastErrCode <> 0 then
        begin
                result.code := LastErrCode;
                result.message := LastErrMessage;
        end
        else
        begin
                result.code := getJSonInteger(responseJson,'code');
                result.message := getJSonString(responseJson,'message');                
        end;
                
end;


function TTaxinvoiceService.GetPopUpURL(CorpNum: string; MgtKeyType : EnumMgtKeyType; MgtKey : String;UserID : String = '') : string;
var
        responseJson : String;
begin

        if MgtKey = '' then
        begin
                if FIsThrowException then
                begin
                        raise EPopbillException.Create(-99999999,'관리번호가 입력되지 않았습니다.');
                        Exit;                
                end
                else
                begin                
                        result := '';
                        setLastErrCode(-99999999);
                        setLastErrMessage('관리번호가 입력되지 않았습니다.');
                        exit;
                end;

        end;

        try
                responseJson := httpget('/Taxinvoice/'+ GetEnumName(TypeInfo(EnumMgtKeyType),integer(MgtKeyType)) + '/'+MgtKey +'?TG=POPUP',CorpNum,UserID);
                result := getJSonString(responseJson,'url');                
        except
                on le : EPopbillException do begin
                        if FIsThrowException then
                        begin
                                raise EPopbillException.Create(le.code, le.Message);
                                exit;
                        end;
                end;

        end;
end;

function TTaxinvoiceService.GetViewURL(CorpNum: string; MgtKeyType : EnumMgtKeyType; MgtKey : String;UserID : String = '') : string;
var
        responseJson : String;
begin
 
        if MgtKey = '' then
        begin
                if FIsThrowException then
                begin
                        raise EPopbillException.Create(-99999999,'관리번호가 입력되지 않았습니다.');
                        Exit;
                end
                else
                begin
                        result := '';
                        setLastErrCode(-99999999);
                        setLastErrMessage('관리번호가 입력되지 않았습니다.');
                        exit;
                end;

        end;


        try
                responseJson := httpget('/Taxinvoice/'+ GetEnumName(TypeInfo(EnumMgtKeyType),integer(MgtKeyType)) + '/'+MgtKey +'?TG=VIEW',CorpNum,UserID);
                result := getJSonString(responseJson,'url');
        except
                on le : EPopbillException do begin
                        if FIsThrowException then
                        begin
                                raise EPopbillException.Create(le.code, le.Message);
                                exit;
                        end;
                end;
        end;
end;

function TTaxinvoiceService.GetPDFURL(CorpNum: string; MgtKeyType : EnumMgtKeyType; MgtKey : String;UserID : String = '') : string;
var
        responseJson : String;
begin

        if MgtKey = '' then
        begin
                if FIsThrowException then
                begin
                        raise EPopbillException.Create(-99999999,'관리번호가 입력되지 않았습니다.');
                        Exit;
                end
                else
                begin
                        result := '';
                        setLastErrCode(-99999999);
                        setLastErrMessage('관리번호가 입력되지 않았습니다.');
                        exit;
                end;

        end;

        try
                responseJson := httpget('/Taxinvoice/'+ GetEnumName(TypeInfo(EnumMgtKeyType),integer(MgtKeyType)) + '/'+MgtKey +'?TG=PDF',CorpNum,UserID);

                result := getJSonString(responseJson,'url');
        except
                on le : EPopbillException do begin
                        if FIsThrowException then
                        begin
                                raise EPopbillException.Create(le.code, le.Message);
                                exit;
                        end;
                end;
        end;        
end;

function TTaxinvoiceService.GetPrintURL(CorpNum: string; MgtKeyType : EnumMgtKeyType; MgtKey : String;UserID : String = '') : string;
var
        responseJson : String;
begin

        if MgtKey = '' then
        begin
                if FIsThrowException then
                begin
                        raise EPopbillException.Create(-99999999,'관리번호가 입력되지 않았습니다.');
                        Exit;
                end
                else
                begin
                        result := '';
                        setLastErrCode(-99999999);
                        setLastErrMessage('관리번호가 입력되지 않았습니다.');
                        exit;
                end;

        end;

        try
                responseJson := httpget('/Taxinvoice/'+ GetEnumName(TypeInfo(EnumMgtKeyType),integer(MgtKeyType)) + '/'+MgtKey +'?TG=PRINT',CorpNum,UserID);

                result := getJSonString(responseJson,'url');
        except
                on le : EPopbillException do begin
                        if FIsThrowException then
                        begin
                                raise EPopbillException.Create(le.code, le.Message);
                                exit;
                        end;
                end;
        end;        
end;

function TTaxinvoiceService.GetEPrintURL(CorpNum: string; MgtKeyType : EnumMgtKeyType; MgtKey : String;UserID : String = '') : string;
var
        responseJson : String;
begin

        if MgtKey = '' then
        begin
                if FIsThrowException then
                begin
                        raise EPopbillException.Create(-99999999,'관리번호가 입력되지 않았습니다.');
                        Exit;
                end
                else
                begin
                        result := '';
                        setLastErrCode(-99999999);
                        setLastErrMessage('관리번호가 입력되지 않았습니다.');
                        exit;
                end;

        end;

        try
                responseJson := httpget('/Taxinvoice/'+ GetEnumName(TypeInfo(EnumMgtKeyType),integer(MgtKeyType)) + '/'+MgtKey +'?TG=EPRINT',CorpNum,UserID);
                result := getJSonString(responseJson,'url');
        except
                on le : EPopbillException do begin
                        if FIsThrowException then
                        begin
                                raise EPopbillException.Create(le.code, le.Message);
                                exit;
                        end;
                end;
        end;                 
                
end;

function TTaxinvoiceService.GetMassPrintURL(CorpNum: string; MgtKeyType : EnumMgtKeyType; MgtKeyList: Array Of String; UserID: String = '') : string;
var
        requestJson,responseJson:string;
        i : integer;
begin
        
        if Length(MgtKeyList) = 0 then
        begin
                if FIsThrowException then
                begin
                        raise EPopbillException.Create(-99999999,'관리번호가 입력되지 않았습니다.');
                        Exit;
                end
                else
                begin
                        result := '';
                        setLastErrCode(-99999999);
                        setLastErrMessage('관리번호가 입력되지 않았습니다.');
                        exit;
                end;

        end;

        requestJson := '[';
        for i:=0 to Length(MgtKeyList) -1 do
        begin
                requestJson := requestJson + '"' + EscapeString(MgtKeyList[i]) + '"';
                if (i + 1) < Length(MgtKeyList) then requestJson := requestJson + ',';
        end;

        requestJson := requestJson + ']';

        try
                responseJson := httppost('/Taxinvoice/'+ GetEnumName(TypeInfo(EnumMgtKeyType),integer(MgtKeyType)) + '?Print',
                                CorpNum,
                                UserID,
                                requestJson);

                result := getJSonString(responseJson,'url');
        except
                on le : EPopbillException do begin
                        if FIsThrowException then
                        begin
                                raise EPopbillException.Create(le.code, le.Message);
                                exit;
                        end;
                end;
        end;                

end;

function TTaxinvoiceService.GetMailURL(CorpNum: string; MgtKeyType : EnumMgtKeyType; MgtKey : String;UserID : String = '') : string;
var
        responseJson : String;
begin

        if MgtKey = '' then
        begin
                if FIsThrowException then
                begin
                        raise EPopbillException.Create(-99999999,'관리번호가 입력되지 않았습니다.');
                        Exit;
                end
                else
                begin
                        result := '';
                        setLastErrCode(-99999999);
                        setLastErrMessage('관리번호가 입력되지 않았습니다.');
                        exit;
                end;

        end;

        try
                responseJson := httpget('/Taxinvoice/'+ GetEnumName(TypeInfo(EnumMgtKeyType),integer(MgtKeyType)) + '/'+MgtKey +'?TG=MAIL',CorpNum,UserID);

                result := getJSonString(responseJson,'url');
        except
                on le : EPopbillException do begin
                        if FIsThrowException then
                        begin
                                raise EPopbillException.Create(le.code, le.Message);
                                exit;
                        end;
                end;
        end;         
end;

function TTaxinvoiceService.GetCertificateExpireDate(CorpNum : String) : string;
var
        responseJson : string;
begin

        try        
                responseJson := httpget('/Taxinvoice?cfg=CERT',CorpNum,'');

                result := getJSonString( responseJson,'certificateExpiration');
        except
                on le : EPopbillException do begin
                        if FIsThrowException then
                        begin
                                raise EPopbillException.Create(le.code, le.Message);
                                exit;
                        end;
                end;
        end;                

end;

function TTaxinvoiceService.GetUnitCost(CorpNum : String) : Single;
var
        responseJson : string;
begin
        
        try  
                responseJson := httpget('/Taxinvoice?cfg=UNITCOST',CorpNum,'');
        except
                on le : EPopbillException do begin
                        if FIsThrowException then
                        begin
                                raise EPopbillException.Create(le.code, le.Message);
                                exit;
                        end
                        else
                        begin
                                result := 0.0;
                                exit;
                        end;

                end;
        end;

        if LastErrCode <> 0 then
        begin
                exit;
        end
        else
        begin
                result := strToFloat(getJSonString( responseJson,'unitCost'));
        end;
end;

function TTaxinvoiceService.GetEmailPublicKeys(CorpNum : String) : TEmailPublicKeyList;
var
        responseJson : string;
        jSons : ArrayOfString;
        i : integer;
begin

        try 
                responseJson := httpget('/Taxinvoice/EmailPublicKeys',CorpNum,'');
        except
                on le : EPopbillException do begin
                        if FIsThrowException then
                        begin
                                raise EPopbillException.Create(le.code, le.Message);
                                exit;
                        end;
                end;
        end;

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

        except
                on E:Exception do begin
                        if FIsThrowException then
                        begin
                                raise EPopbillException.Create(-99999999,'결과처리 실패.[Malformed Json]');
                                exit;
                        end;
                        SetLength(result, 0);
                        setLastErrCode(-99999999);
                        setLastErrMessage('결과처리 실패.[Malformed Json]');
                        exit;
                end;
        end;

end;

function TTaxinvoiceService.AttachStatement(CorpNum : String; MgtKeyType:EnumMgtKeyType; MgtKey : String; SubItemCode : Integer; SubMgtKey : String) : TResponse;
var
        requestJson : string;
        responseJson : string;
begin

        if MgtKey = '' then
        begin
                if FIsThrowException then
                begin
                        raise EPopbillException.Create(-99999999,'관리번호가 입력되지 않았습니다.');
                        Exit;
                end
                else
                begin
                        result.code := -99999999;
                        result.message := '관리번호가 입력되지 않았습니다.';
                        exit;
                end;

        end;
        
        try
                requestJson := '{"ItemCode":"'+EscapeString(IntToStr(SubItemCode))+'","MgtKey":"'+EscapeString(SubMgtKey)+'"}';

                responseJson := httppost('/Taxinvoice/'+ GetEnumName(TypeInfo(EnumMgtKeyType),integer(MgtKeyType)) + '/'+MgtKey+'/AttachStmt',
                                CorpNum,'',requestJson,'');
        except
                on le : EPopbillException do begin
                        if FIsThrowException then
                        begin
                                raise EPopbillException.Create(le.code,le.Message);
                        end;
                        
                        result.code := le.code;
                        result.message := le.Message;
                        exit;
                end;
        end;

        if LastErrCode <> 0 then
        begin
                result.code := LastErrCode;
                result.message := LastErrMessage;
        end
        else
        begin
                result.code := getJSonInteger(responseJson,'code');
                result.message := getJSonString(responseJson,'message');                
        end;        

end;

function TTaxinvoiceService.DetachStatement(CorpNum : String; MgtKeyType:EnumMgtKeyType; MgtKey : String; SubItemCode : Integer; SubMgtKey : String) : TResponse;
var
        requestJson : string;
        responseJson : string;
begin

        if MgtKey = '' then
        begin
                if FIsThrowException then
                begin
                        raise EPopbillException.Create(-99999999,'관리번호가 입력되지 않았습니다.');
                        Exit;
                end
                else
                begin
                        result.code := -99999999;
                        result.message := '관리번호가 입력되지 않았습니다.';
                        exit;
                end;

        end;
        
        try
                requestJson := '{"ItemCode":"'+EscapeString(IntToStr(SubItemCode))+'","MgtKey":"'+EscapeString(SubMgtKey)+'"}';

                responseJson := httppost('/Taxinvoice/'+ GetEnumName(TypeInfo(EnumMgtKeyType),integer(MgtKeyType)) + '/'+MgtKey+'/DetachStmt',
                                CorpNum,'',requestJson,'');
        except
                on le : EPopbillException do begin
                        if FIsThrowException then
                        begin
                                raise EPopbillException.Create(le.code,le.Message);
                        end;
                        
                        result.code := le.code;
                        result.message := le.Message;
                end;
        end;
        
        if LastErrCode <> 0 then
        begin
                result.code := LastErrCode;
                result.message := LastErrMessage;
        end
        else
        begin
                result.code := getJSonInteger(responseJson,'code');
                result.message := getJSonString(responseJson,'message');                
        end;        
end;

function TTaxinvoiceService.AssignMgtKey(CorpNum : String; MgtKeyType:EnumMgtKeyType; ItemKey : String; MgtKey : String; UserID : String = '') : TResponse;
var
        requestJson : string;
        responseJson : string;
begin

        if MgtKey = '' then
        begin
                if FIsThrowException then
                begin
                        raise EPopbillException.Create(-99999999,'관리번호가 입력되지 않았습니다.');
                        Exit;
                end
                else
                begin
                        result.code := -99999999;
                        result.message := '관리번호가 입력되지 않았습니다.';
                        exit;
                end;

        end;

        try
                requestJson := 'MgtKey='+EscapeString(MgtKey);

                responseJson := httppost('/Taxinvoice/'+ItemKey+'/'+ GetEnumName(TypeInfo(EnumMgtKeyType),integer(MgtKeyType)),
                                        CorpNum,UserID,requestJson,'','application/x-www-form-urlencoded; charset=utf-8');
        except
                on le : EPopbillException do begin
                        if FIsThrowException then
                        begin
                                raise EPopbillException.Create(le.code,le.Message);
                        end;

                        result.code := le.code;
                        result.message := le.Message;
                end;
        end;
        
        if LastErrCode <> 0 then
        begin
                result.code := LastErrCode;
                result.message := LastErrMessage;
        end
        else
        begin
                result.code := getJSonInteger(responseJson,'code');
                result.message := getJSonString(responseJson,'message');                
        end;        
end;

function TTaxinvoiceService.CheckCertValidation(CorpNum, UserID: String): TResponse;
var
        responseJson : string;
begin

        try
                responseJson := httpget('/Taxinvoice/CertCheck',CorpNum, UserID);

        except
                on le : EPopbillException do begin
                        if FIsThrowException then
                        begin
                                raise EPopbillException.Create(le.code,le.Message);
                        end;
                end;
        end;

        if LastErrCode <> 0 then
        begin
                result.code := LastErrCode;
                result.message := LastErrMessage;
        end
        else
        begin
                result.code := getJSonInteger(responseJson,'code');
                result.message := getJSonString(responseJson,'message');
        end;
end;

function TTaxinvoiceService.ListEmailConfig(CorpNum, UserID: String): TEmailConfigList;
var
        responseJson : string;
        jSons : ArrayOfString;
        i : integer;
begin

        try
                responseJson := httpget('/Taxinvoice/EmailSendConfig',CorpNum,UserID);
        except
                on le : EPopbillException do begin
                        if FIsThrowException then
                        begin
                                raise EPopbillException.Create(le.code, le.message);
                                exit;
                        end;
                end;
        end;

        if LastErrCode <> 0 then
        begin
                exit;
        end
        else
        begin
                try
                        jSons := ParseJsonList(responseJson);
                        SetLength(result,Length(jSons));

                        for i := 0 to Length(jSons)-1 do
                        begin
                                result[i] := TEmailConfig.Create;

                                result[i].EmailType := getJSonString (jSons[i],'emailType');
                                result[i].SendYN    := getJSonBoolean(jSons[i],'sendYN');
                        end;
                except
                        on E:Exception do begin
                                if FIsThrowException then
                                begin
                                        raise EPopbillException.Create(-99999999,'결과처리 실패.[Malformed Json]');
                                        exit;
                                end;
                                SetLength(result, 0);
                                SetLength(jSons, 0);
                                setLastErrCode(-99999999);
                                setLastErrMessage('결과처리 실패.[Malformed Json]');
                                exit;
                        end;
                end;
        end;
end;

Function BoolToStr(b:Boolean):String;
begin
    if b = true then BoolToStr:='True';
    if b = false then BoolToStr:='False';
end;

function TTaxinvoiceService.UpdateEmailConfig(CorpNum, EmailType: String; SendYN: Boolean; UserID: String): TResponse;
var
        requestJson : string;
        responseJson : string;
begin
        
        if Trim(EmailType) = '' then
        begin
                if FIsThrowException then
                begin
                        raise EPopbillException.Create(-99999999, '메일전송유형이 입력되지 않았습니다.');
                        exit;
                end;

                result.code := -99999999;
                result.message := '메일전송유형이 입력되지 않았습니다.';
                Exit;
        end;

        try
                requestJson := '{"EmailType":"'+EscapeString(EmailType)+'","SendYN":"'+EscapeString(BoolToStr(SendYN))+'"}';

                responseJson := httppost('/Taxinvoice/EmailSendConfig?EmailType=' + EmailType + '&SendYN=' + BoolToStr(SendYN),
                                        CorpNum,UserID,requestJson,'');
        except
                on le : EPopbillException do begin
                        if FIsThrowException then
                        begin
                                raise EPopbillException.Create(le.code,le.Message);
                        end;

                        result.code := le.code;
                        result.message := le.Message;
                end;
        end;

        if LastErrCode <> 0 then
        begin
                result.code := LastErrCode;
                result.message := LastErrMessage;
        end
        else
        begin
                result.code := getJSonInteger(responseJson,'code');
                result.message := getJSonString(responseJson,'message');                
        end;         
end;

//End Of Unit.
end.
