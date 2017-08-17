﻿CREATE TABLE [dbo].[Exit] (
    [Id] [int] NOT NULL IDENTITY,
    [RunType] [int] NOT NULL,
    [DateFrom] [datetime] NOT NULL,
    [DateFromCheck] [datetime],
    [DateTo] [datetime],
    [DateToCheck] [datetime],
    [EmployeeId] [int],
    [DepartmentId] [int],
    [PetmitEmployeeId] [int],
    [ExitPurposeId] [int],
    [DescriptionOne] [nvarchar](500),
    [DescriptionTwo] [nvarchar](500),
    CONSTRAINT [PK_dbo.Exit] PRIMARY KEY ([Id])
)
CREATE INDEX [IX_EmployeeId] ON [dbo].[Exit]([EmployeeId])
CREATE INDEX [IX_DepartmentId] ON [dbo].[Exit]([DepartmentId])
CREATE INDEX [IX_ExitPurposeId] ON [dbo].[Exit]([ExitPurposeId])
CREATE TABLE [dbo].[ExitPurpose] (
    [Id] [int] NOT NULL IDENTITY,
    [Name] [nvarchar](max),
    [Description] [nvarchar](max),
    CONSTRAINT [PK_dbo.ExitPurpose] PRIMARY KEY ([Id])
)
ALTER TABLE [dbo].[Exit] ADD CONSTRAINT [FK_dbo.Exit_dbo.Department_DepartmentId] FOREIGN KEY ([DepartmentId]) REFERENCES [dbo].[Department] ([Id])
ALTER TABLE [dbo].[Exit] ADD CONSTRAINT [FK_dbo.Exit_dbo.Employee_EmployeeId] FOREIGN KEY ([EmployeeId]) REFERENCES [dbo].[Employee] ([Id])
ALTER TABLE [dbo].[Exit] ADD CONSTRAINT [FK_dbo.Exit_dbo.ExitPurpose_ExitPurposeId] FOREIGN KEY ([ExitPurposeId]) REFERENCES [dbo].[ExitPurpose] ([Id])
INSERT [dbo].[__MigrationHistory]([MigrationId], [ContextKey], [Model], [ProductVersion])
VALUES (N'201708060702341_Exit', N'Portal.Models.ApplicationDbContext',  0x1F8B0800000000000400ED5DCB721C3976DD3BC2FF50512B7BDCC32229ABDDA32067424D8A33F4881447A466BC53A4AA40324355993599596A311C5E7AE59DBFC53B47D8BF30F325FE0503F9C4E35E3C32918F52333A42CD4A0017C0C5C1C5C5EBE0FFFEFB7F4F7EF375B39E7D21491AC6D1E9FCE8E0703E23D1325E85D1C3E97C97DDFFF287F96F7EFDB77F73F266B5F93AFB6315EF058B475346E9E9FC31CBB6AF168B74F94836417AB00997499CC6F7D9C132DE2C8255BC383E3CFCD5E2E86841A8883995359B9DBCDF4559B821F90FFAF32C8E96649BED82F555BC22EBB4FC4E436E73A9B3EB6043D26DB024A7F39B38C982F54111713E7BBD0E035A885BB2BE9FCF82288AB320A3457CF52125B75912470FB75BFA2158DF3D6D098D771FAC535216FD5513DDB61687C7AC168B2661256AB94BB378E328F0E845A996859CBC9572E7B5DAA8E2DE5005674FACD6B9F24EE7AF974B92A6711212AA3539BF5767EB84C595D47B904BA1290EB8D4DFCD8A38DFD570383AF8FEE0E5C1D13F7D373BDBADB35D424E23B2CB1216E566F7691D2E7F4F9EEEE2CF243A8D76EB355F4C5A501A267CA09F6E92784B92ECE93DB92F0B7FB99ACF1662BA859CB04EC6A529EA7419652F8EE7B36B9A79F0694D6A1470F5BFCDE284FC9644240932B2BA09B28C24119341723D2AB94B799DD354E7F172B7A1D1AB5CD9B73B0A722063BD304ED74C92B91ED6E2CEC936483256C8AE426FA9DE76A9A38CEBE04BF890EBDBA688F3D97BB2CE63A78FE1B6E8E20760CC8F02B62F9278F33E5E6362F9C81FEF82E481B0168B6D53DCC6BB64D9AE6A774C37A65AE5912C2AA4C4D3D5458DDCA51AB4C98DB5A0716C2A2145D3D6418E0B55E164D1D83D5B6BC823AE8B5D6CE43C5B48C0427A333D6F36DB75FC443ADBC573922E93705B0CB78520EA3150BF673EBB0ABEBE25D143F6483DA297D4D3B908BF9255F5A514FE210AA99B441365C9AE77936ED32F87B097559FB3B797558F1EC8D0F09DD9CAE470C576303E5C2A574B6A18E06035C2D532C5556A644CE05A99AA2F8255A902CD15D1C754AA6188EE6B6028F0D7654860F19E0703352FF6AFC6E61EDB99DC218C665B4746632851A7A7576FD9A7A174A81CD08B5B549386AC764B631DCB681F953E0C561089AD1B06B024BE2C4E5DCF2E46A714F26C779CED8EADAFE7E868D2D459776BA7CFE30FBB20D7C00D49DE45751DCFC932DC04EBF9EC26A17F954B7C3FCC67B7CB8095DEDD67BE49C265233DDEE5135A471997E9EB65167EA9C5FC18D36E1644832F93F43765AFBBB1DDCCBDB22A2E13F82A4DCFF3783F1655335E988C70671FAE68C04E4E1C13F16C4DB51DD0E31A658988AE122B832849B14BF4FA2121442E401FDE65EBC53E9D0B86AE0CF6E779F932812ED592CD662B53D169F1EF79C54FEB2B0409B4DAC7F6FA76090D5A3E5DE5EE4DEEFB9884FD8E042B4594BBB38765CEB9632F0E7B71026F1F29405A16E9C8B2482DFD2EAC048E35BC8EB3B3C7207A20ACAD944CFC4F6EBDAE94C986C77A69CD75A50C1E1338C15C44B0FC75B8AECC4D24D772168DA72F6211072C1D0BD2152C0FEF64B19B2547677B5D257DB6D66A5E7478BDD64E8D3D58A0B7419A457EA6E0FA8C2EC264A09CA89E93387ADA84CBFEB38AD390B5B4E330A8D978339F69B8ACB7C69AD30CE6543F8649F6E89AF08CC67B8893278D1EE99F5EC6C13FC5C967E7D5070F2396B70D11D9C05AEE9F78DAA2AA733394DDA6C01D4A59F507B08C55203C9CAAA1CAE20B10A5D32A6F535AE761AB4AFA3C6C4DDDC96FBDB4D9D26D7446B9DC0F351DA1DDCADB6A13A6693B98D7699F710E0FAB17EB9DEBA07ABDDB70A9FADA7C388FB7BBF4B36BD96E83E82A74F62FAEC8EA5DBA71762EE20D1B6302AD7B616B147A712F6C0F39F5E4ECD93A976D7D86BA73234E0314AEAE064291DA4EC40DC56CA24185ACFD17BC887514AF7E4D23BF890615B036EC7801EB289D2C3E1D6CD32C68B57C5A257DB6F783FB35FACCFF18AC77DAA9F3A1976C3407302DAAFAB245195C509D05AD0E6294299F31ED7CFAA24D83423B89D401E7F6FD7ACBA86CE8D4F37A458B9DABC2DFE8B07BC5043C0356CDEB3D7908539AE4434A9226DFDE16A6AAEC5AFA7E5572E6133BFBC7EB38256D1232DFE34F8FF146375A7859FDAC6B67756AFFA59F112A57CB40AD9FE7D5B2E98BE6B3D28C9FC276B8CDD1FD603C3357C834028DA4D993926376DB9DFA1AB6F11A58B2670B0CF4FA5D549C372BF1CC80507F73BDEFC396509218583B6829E8EC912C9D573DF27871BB54AD321C7C2581649B306B992BEB0737BB644BCD9973796BEBC71D80EDCDFBE3B2BBFB29F69F5DEBBD19AA406C5F460C52F764A470AF0B2BB970684D450880CBD47A25854393A6507C24B95C4D1852342E42E771A32E45ABE1A34CFD3C8A384F3C7DB9447DB95FD620FAE7F8530BF0D054CFA0810EC4A49FDFD22947D783C867491C311693D56EAD03A19F953B9196213772D5A7916E695039AB557396BAAD989B20A1FFA72D38DA7A0BED26EF494A3B43BB2E56A47DEE686A5E54399DAFF2D38CE9B4A0B3675F35303FDB283FF5422ED072E4411D9E7C00001C9D1A7F1FF3188D972304282E8E18DAC9BFB90AA21DBB88E6DC758A84CFFD063489EEB3B3CB543E67879DD0F6338D1C64CDFF2A08A33BF25577C9D28F8FF73ACB82E5234FF2D49F3B499BE92C21364BB2ED666445C702E76452906217E4F04E96E1DDFD5D1244E996F6EF16E6814BFD6C236014751E15CFF2462149EFDEEBFB7897E9AC85A77DE77A9EDD7746D45C90681568AD851FCDB5E6446A673BB85E071A10285CB12260A44EA6A4EA154CBECE965CD52C8AAFD3ED35C90EAA84855D79BA60738D9FE2E4F3012FF1BB9975BAC6041D1F1CB2FFCC16E8C5D1A7FB173FBCFC3E58BDF8FE1FC98B97C35B23A81F1CFFD0C73159835370FCF2FB7EF95FD88E1E7CA0966FEF8F65B406D66AA8026A208A17483351FE615D499D3EB4AB4DD885392AAB509B9E60DCE7EDA93754E5ED375F6BC4E51E470B4F2C4FF7EC83416B723479D7150E83C9F4E345BC5EAD1292EA56D87CAD52528DF450236B8C7799713CCF372680A07C2ED33462C7094EEF5BE46D77731B0719DED285C21597048CE47573573F19B0980AF89E08BCDE6E696FCB8BC94675FB5E2E25DCBF2E3E9CDBD2F684C72608D71E9C7F8B5CCEE2E83E4C363E369FD294FABEABDF05E963EF0B7FB764B94B289C6FB360B3ED3DB79BC73822D7BBCD27EDF28EF7BCBC35CDDD4FF145B0A483D69B88A5EA2CEF6DBCFC1CEFB237D18A8D261FB2A53AB8580AF0529CE23EF7050533599DC5BB6625A99D17C96CDAD893EFB375106E10662CD1FA7EACA272179CC018EA2527389ADFAB62521EE08531248EB1C0AD8F3CBD8D1FC2C84EBB5554BCB8450C6361CB68AE4565C2EC4A5AC6C40B9A473096B388E56D39260795FFF5985CECF41764A63E13196B35276F3EE1CC727F1706684EA6AB7ABD1E89E1619B1B01FFBD21173BFDDE9017937EFE12AE982365B14A5945A6E2ADE2C30BA0E63E27956CE8EE205473E8CC87B1017877D96DB8CE525F5BB84C2FD6C143F31699716EFAE3DB83336A0B0F98C0F41F4A39D5D49486F2B3534BCCE793535A4BDA32EB27AA15DE2A8B2ABD22CC5F2FEBF097FFFCEB7FFCF5DFFFF23F7FF9AFF92CB73CA7F343A511E41462FC235579859A34AAAB8E3076D45C216614C5BD27C1EAC95667B485A31CA91D54561D5BEB0A36E1D4E2A02AA3ADC596F6EC5476BBCB274A98CAE4E86F92244EEAC8C736FA7D9DA6F132CC7526CCCD744FEB8825A073CA99F33B3BCD41448433EC8A6A3F647E2EB540ACDEF248F22E3A276B9291193BCECBF8DFCF827419AC54DB496BBD6A5FE09A3E0B2CB05CCC5F28B9D3818EB0E36C61B0CE692192208C3275540CA365B80DD6AE7A9404593AB44C2975967208CD9044CC097155914D59D027FBD402D6E5905AD3A4D0930587686BA0B3E67585B89CC600EE62901C1AD64A21C70634A6B561A18CA9C511C44CCC14E1CB19D2161881F65C260C69E8412DC7E1A57F98AB3A1D17F0AAD2F615FACA53033610C2DF1D80815EBCB661028D655E6E26D86B87EA0C6BAC3203A3196B3F47104F12C037E513136DB07523BF37D13F9C6FE4577EC02CAB4AED15B8A5AA8D8C71A96D1DA17ED33C3F3336E26F90C7972CD0872435E01D019F25E2B13CF580EFDD37EA8A7643B58605BBA15DF7C937313EDF8141CEFE2D8F067083AF98D83FCD3B8E0B6EABC401E06DAB2A9BA24C60B5C440F28F01C696F1BF814B73E0601044DBBED13C0E9EEDD437009AEDD4645310FE80DDB84876816F3BCCEA5C0CDD5B115626FEF0E040DD0FE886B2762DEA0B5AED803D01DB08BC5780B5BAEEF182A6D11B126C8B26D70A0710650FD65660C26B380096700DD864CEB3C58FED3C9AA1A47F3CADB5053164D01E50EDF4903FCA665142F185369BDAEB8C33F6B49B45ADFD9965A410C3FAAEBC5E6D72AE5EB41C6795017A8E019DE36BDF66E0FCBDE6F117870504DD9B0E030FEFBAB20C31CFD7E8794F0678E0FD0C73C3ABA7A2BD614A39473DA85DC2CB31289A64FDEEC5E40378E8C4DCDCEAAB27DE90A4BC96D2D60BED8824B91C832249D6EF9EF98A3271B8D9A94159C4A181A97887A18DEF8451900FBF82D9D1FF422A32A82786B4D99E8CA0328133BA2A82B13973035CCE45EFB0D08210400FBDC802176388051658A7FB841CA3DB85F06D7744CDB87E165884A1F0B297DE95C27CAE6F5D8806BD2B6200E6744966CDD3D62F6ED4820C061D55AF56E8111F4918054022A32CD6D208BD6CD3CC1CA9B23D7E605A5A51EAF49C24B0D403200D6C039B7C4B5EE651E0259393625040994A1B3054CCC3F6F8C2E84D071DD390420C001844A77B31AE81C494583BEB592A9BC616186AED61A4E5B71C7A1FBF15067535180088BAF6D90B34026C92185874D4920D544482D3418E7D68082D8182353495BD6C99E25A1A008EB8266C32875929070222C82386B5B89E54AC69F35646514B4636F04283AE2C03E049A7E73D597270186CED86DA8E981AD7651B75B0DCF3A112A17EC29ADCC403C56DFBC85480C35CC3D31350212367C928D4CF9D3BADC60600A85E2536054039A0C700A8797FDBC8FD650D52ED0EA589396CD81D6F436946C0D937610E4BAE365B10C8C46D53338712631C620E4B4AA941CCA1A8B111602AAA64EFCC6141D167DBFE125FDFD4E02912050E3FCDD5AA6B046C0AFA981834DFE40D42D36434454DF0C3D5E0FC130BCC5F0753C88F68394BFEA3B4A4FA9221C284DF924CBD3B379FBDA959BFA0CBE9CA808D4AE2A7BA3A997C3C7BE9C5FD4A9DDC2286BDC4FA96A84E681DC9A1A4C56D6B6D518B2806995A853A68B1719714294D90414673344C91D1049974D49C5C5395D38419A4E4DD2A0075D20499656401D8F4758875DB14A7A534ED534430B551BEF7ACB64FFED9226DBDC70C8AA8430D92F20D474542FED59CB2DA0085D257610629D51E9722A20A30A4177638142142A84152E107A832C4956B83107998D5096C866283D0F25D1B4550F9DD905AA71F7BED942F4AA9BD58767B1C145491646B3554AE2C3888ADD8A1B5624B0F5D12CB8DD486014FE0A39971E974A31F4E62233A75D6247BB51AD06159F163DA50E3C1D9A88EAAA83E37D52AFC6C7AA5EAE9DCB07AA2846E700D21FFC25AF498CAE311E0A4466C93C5B6D6C0BE8B7FD502FB2FAE1DA1A3BA15462A8396F50C5668BD510E2B44A7908F692F7C50C06294488E8A049994ACAB2C7329F5A156993C09CE039B74745232C6C2A3D7B115770F567D137B8F53ED5D33D1AB189C2CBAEBD7C4F90169D79806AFB62DDB095F69CBF1DF96BD6408E36AA01E0174EA42562254DB92AE84AB34366576113B862E2D15E8A6359FAAD2EBC7AB5200FE064027269607A11A1A9E07AE16D85A894914A01074E9A69315D32AC4CC56809914AD52DC2DD4088AC96909F43A51990BB0F20BDC059D34219015F4A304F08E3DE43518EFE28B43B8EE363E6F18B19541B3B4BECD08704B5CAB1778AF1DA987B2CFDE4127CA667ADF4869EC9C4E1FF08D68A40ECA9DE80EFA502E415B98E84EE643BEB1AB3524DAEBBD8821C02EF882D08756A42DE5F6DDA5E46BA390ABA2BB592ABA16C8DD521EFDC002BB56C6200AD09913CDF548B5E03A236257F5814C8772910FAD3976D90F283A70DDCFBDFEC0FD3E4908B6BBE2AE05F1361AA002CD7535A1E8F08535AEDCE89E8C460C507D686BC8BDDAF22D29A0E2DA8B544299B1AB545CA9E1DD24AD947ED10F5EF701B460BE162454427B3188AB896663CC2CAF5FCD00574F00BD982EA808B5D05C51E1EA50EED769B4A1B951C2C901F6003B2B057E4E5D558BF9BA845021ED8509AE4A7660D1DE90E86BF4B4EB464E9DC8AE0BB9EA64288F1C798918F0CA2D0EAE8BDEB4FEE83A579FB2DBEA3C73FD3173A43B5595F1AE25ED6CCEEAFCB4B6763A1CB9EB6A242455FBEA660D41677EB535924EFD76D28E74421741525519EF5A2A2DBE5949C0B9536DBDC493A79D54249E12F53474558F89D6071AEBB093C5EDF2916C82F2C3C9824659926D46DDADAB7845D6691570156CB761F4903629CB2FB3DB6DB064A7B87E793B9F7DDDACA3F474FE9865DB578B459A8B4E0F36F53BBBCB78B30856F1E2F8F0F0578BA3A3C5A690B1580ADA968F5FD6396571123C1029941D205B918B3049B3F3200B3E05CCF93F5B6D9468E0F14DE4EC4A95A57A42536DCAEA284B9586FD5DAD6CE70F5C169A3CD04869D479416BC886DFBCB204D9EF5552D3F4B7CB601D24C0DBD867F17AB789F023BC786AAA4E721E2F77853BC0CB1143EC2502CF44F0622D5E91B0922D5E624472D0DF74C4F3A9DE8DE5C556DF5429270BA96165FC2C140049BD5AC6A42B62B5DE660BECE2F2DC50AC93D3139E5158B4C5027FA58797A7BBEAA32B5FBA4CC26DB1DE29168F0B18B6B78D8F5FE484430BE44292DC300B4BE807ADEC5F317DF1658A6D849FF569D14C8830B79642858CDD5898840F51280DB2C5177B097FD805B92A6E48F22E924A2387D94BBD49C2A524ACFC642FE3326517A9BE48629AAF3F3B93961F5BF363D320518E460D16D14F47E1F2D5345E6B99DC437B8868CD537C780E55F7813B551B49AF1F124256B0BC2A6C32D0F5E24276F21B8777166F820470149BAFF692AA37197839D83B0DB894EE23CCED236D0F550CF7790C8B7E1D67678F41F4408A333D4205C5A0C97407CD2AA36D67C0445874053C693F1D810E0FD762FAE28BBD84B7419A450AEE9AAFF692F2551E5514F7D9A58367491C3D6DC2A5DCC59BEF0ED238427A419A86A81E97E67FA6CA566C2EE56965F9CD4DCA8F61923DAA82CACFF6B2CE68A2873891C6D4E6AB8B312ACED088A6083E57339AD1D01CAFB2351A98080BA381279DEA7CC87D8419CBAFAF8FBB7570E83119369E3C9EB6BF65E18BF54E3501F947078CEC368A98EA9B4369E2ED2E953A7FF5CDC1370AA2AB50328FD5377B295764F52EDD8852AA6F0E8631DEB0860E14D3C87DEFCB380EB5D0E97B786B37FC8E64316A6684F606031361612FF0A4531D0AFE18AC779288F253FF6BEBE3412467BEE8841048821D40E09453C547EE1228AB33CD5717D39B573D950D6FF57532F8908E8FFB5895810439ADCCC002FA01CD7BF210A619492A4E285E921CE62E151BEDA07077E9CC5582E516210E705DC72951C5719F1DA6D649BCF9D3632C792FCDD716F5C44C2E18C1B1D650C30B018EF2B02657025D5B0753821A3A84FF34D68A193BDDDF61B50C486EB3520626EBC920EDA2E216BB00F4EAA3E3E42A91BB61F3D55DD2D92359CAF32331C84DE65DAC0A63DF5CA520E5AA03BEA1C909C936618695520D75A8B9F868935079FD7B4EBAFAD73649D94696C35A49BDFB494690143629B3855F6F72B15E88144B2386A69EAA47BE67B32DF8FA966DFB02A92DDA154CD5D70E4EFAF92DF5B86429FC7707B7268923766878B55BCB7EA710D2D789CAFEB724699AD54ADE9CAF3F3A6D21D3FF67F911706913B9FE3EA53E50DE41ECD413601976FD014BDB4FAF285FA2E305208FD3E13298C3429D3CD58BC93FBA4C998ADB9FE22C09BE11AA29CD7E59DDF2E2677BB8C1022CB08625EC0768FE4E925CA6F0A629FF7D2CB7B9BBD3701584D15D4EA92DEC9FD45F1D1604B32C583EAAD716F8EF6E9DFC2C21CA320BFF7D329D8ABF3DDCBE6769A458742F6DEAFEF624D5D671726B721A7746932BB834F55707631EEF9405BEE29383CDA8580C049301531BE8E450C4936815001DA1FADCB7BD18A91F6057F86C7B80402DEDDE05F4C9C79EB68DD426EA15C6EEED533375B76F235C04A66968F1B9C56E43F978A36828E0071D476BB382C8BC7D3B81E92D1A0749D74FCFC9339345D41F07DDCA5CAD12924AF3C5FAA3638DD4E2709F2783301FFE4A176F65705FC5571BE7ABE50DD385B2908E9360E032A7B2943E121631B61AEB737CD2930BEE68344AE807937EDBFDCD2608D7B2A0FC93A38CB338BA0F938DBC162787B9CCC5D3F4A73859FD2E481FE5F9381FE26069C97297B0D6CB82CD56B2B6629043291FE3885CEF369FE4E98810D04A1EA2513886C312F34FF145B0A4587E13B1DB64F242B312EA7079205E7EA6B3A737D18A19B50F99745A1F086E211B28B31CE67A1DED824294ACCEE29D32F75283ED65339BA00EEBCDD7C95852801AC88FB35F3C3AD3CDDB4764F4635AFD4C16F222AB270CB8CF8EB2804395FCF7490209252F6A03A4E299A16E404264E0F68646A7DFBE842BD9B24B410EB6BD4CF37B222D0A0B017DC1B56F50889446D819489E28DD7CD0918F6D7BB98E3136A1CEAD4AA8AEEAC9CAB07022E1872EB952B42C20FADE666BCBA72D15752656F901FCD9657ABD5BAF4FE7F7C15A5ED7D4565BA6B55261A2B05BC9516A90965FEADF35BB55C92C25505EE53A610456B92ED292E54AA69A2AA2CC67556FA35EDF539A91CD018B7070FBE7F5D93ACCF71BAA08574114DE9334BB8B3F93E8747E7C78743C9FBD5E87415A909195245AAFE46745AD58B58E5E30562DB2DA2CE4E4EEDC5C4C4A9AAE846D32CED40ACE0E404B7542ED8E8C860A25BA37654F1672C2130094C5D37121536CDE857F4B68BB5307707513641949A2C64CCF670C77CC89ABB1B7D08A17B9AD8A8C56F45B163207CB51184048C1155D793AF6325A91AFA7F37FCD53BF9A5DFE8BFC90CEE5EABBD9BB84C2E8D5EC70F66F5D8A23CEC05B178A17D3A968D5810FAE245A09FCC8628B508C45607FB1DAA111BDB51CBF46E056842665A70208C71B8A12445F8264F918B0B7BE83AF6F49F4903D9ECE8F5E1EF2B2F3A799A7DC7FDB405C65A8DA5B7017335A4D7B1E1FF6A0C01B8838EADBD5A1D427AC8416C454D60D63D3CF647EAA72D825CB70C3B8E16F12FA579A7B41473F502D515F95061F3B97BC64AE2AA4DFAFE3C034CA000D561F282CA47C0ADD65EC9F555129A2F6B64B483453AD15EFCF15BB6928A95A97A696D1A9500DA315E886B9F4E48AC4CA5290352ABF391FAE3908D85AE7159B941B7A8A54185E6CF2358E2E2F0EDD47178E8F4A376E1D3A8F313E2CB74449050AEA006E78F9696FA15D104569BD0FD7466C58A3FC3AFA1C85945FC13C9D9467C91CB7855BCF6F5276E9FD7D4F3EADCA505258E1CB34B6524AFEAA6E829A63D86253FFDD26F8FAF7EEF6AA6069696FADA485D5B64DF4D1A58DAC6D1D4C49B5B7B6AE97B1D07DC8B2F7EE61DAA8BDD57F4D40D5AD075704545E67B7151F55B7A2557C54DDA4547C541D0D1DC745658FF961AC5E9FEB91FB322E0EEB1B581B1D987B6A6F6D8EABCDB769B9F2FC857EEAE36E812C97C85F9A44BB34B5CA22F5EDB6B45171D00A504550E5576E4357E5EC84B6588551599FF6B69165E2280F3E3CC418D57A9947A489EA3880371C51DD04350C517E67B720499487161148A27CC9F3D2BC2A239487E28DB0436CBFDAA5F033EDAFE9A8989E6C8F2F20139824D6BAE64E824A1EA5EE4B238CDDC987142F057AF6EE21CAA8D64647A28972D4289FB89B52455E29BF0E91CC2F3588FF8BF236EDAD8D837CE09663529731CEBA051486A5BDD53C4FD4D47E8011E999FCCE5A5D4FEFF5B33B577334B517C17333F50A4D88EC686F015A1227B98D1E79A26E07FF2AA6A58E1E5345B5D4C1791BC6A441C4457B0B1A0F071F78E223CBBDF8E979947DAC2D35AC491EC66B9E36C9C7F0CFF126B9CC05AC7B09CA3FB4B75DC5B4506337FED75C467EC7FE92DCC8F38A754D76E4592E477DE4570D031F83B7EE0D3815D110DD016EB7E31F3CADC09BB4CB2ACDFECA3F7F37BB4C3F44E19F7734E08EB628D331BFAFFBF27BDF3A87A985ECF48E5DBA04A2C2AC41E666829741AD305B2415F1DAB185AB5AB4284D91B44369AC5B16E025DADB51A566386AEFF7F6B1035A53E1F89EA2D6DC475D045B23E55BF3417A6A1689AAA8A38F33B62F3FFCEAB0FD812F1DB3D05EB902633772C965A43B2226BA12D64239EE9D2E4B583C939187099BC463E441A2C063E4579E1715AA8445ED65010C45DD76C06466A2F64503A888DABB020D0991AB0357A51CD149071881F676A09E9657CF311479396DD15014F5B7CC6AA0F8B1438681D1074871A363ECB19E219AF12795CCF3E82CD4C2B3EC31A18DA187A3A711CCAAC438F111674AA14343BE5081715594D565EC3007488CABDD3A0B997F470B482BA3D017BD8BCEC99A6464C636D9D835EAB3205D062B55E18CCCC7A2745899E492FC42C980C297B075FF3058E7A78193205459A36E92305A86DB60ADD58B94CAD23EB34AD6F2E5102A9D44ACF70355B6C90E255851CB5067253580494102219235105973B94290B7DA724317613F1FD8E5F59D36E05811A70835F4C6F69E80AE8B25FE2680E86872A7084936AABB9A3F5B63D33F020BFA0DAC5314817DE36E60CC018C2366B84D126A3720A110D8CE5554A4A5EBE09F23FE40354E1386370D9FCBD8682C8B221306EDE740DCAE7B7C1343B00BFAA732FEC2735F0B6F1071B8C69CEF4EC0071C6DE2EB98F104E6BDD5368F23EE6AF61DBE899B8F3F43CC6174D8D3429CEE919261F1D687713B3C3838525AB32568F7D21439817002D6A76250E078E6B1C6AB3970F8C66B3E4E1E083087CF0460C0F35F8CEDFC9861F06C137A0583F1598561F19053077A693A030C9C61B5875E8323EC2AA6CC71E6E515E5D6187E42C3F7253893CDD76FC02A209C6648661370151A4420CC9FFD188671B030E864C20909A34F201A1C20AC88FDB88CE3E06048A7D10D0713F21A19AD522FC3444FEB161221145C9622E81B186874F457488E13186D1825C5284B145F435152F1E11BC081CA6034F1D61FD4CD18B2DD87742EAC5B7D74BFA268739489466C2AE9C66DDD62F5F7E9363E56C3B1DB5F24571A050235D5C847950FA7692D16C63756FE7B10C7A1A14291F2AFBEF682184517FD2005E17941322B5954468149C12C32ECF850B299F092AA4F7B3F46404C2D484EA38F121C5F866700F4643378820FBE18C2F7BD87104A6332551CF14C13F97D0B7CC74320A5E09B500C18044D0A5903549E26B0175CE1241DFD604B4F5081E409D34C0C04AEC6448D308385CD4DDFC666D8B9AC9BB199C084B6AF416B92581872E0D9B361472236F898DF11D59CF097781084A56F396CF001A8B8888C8D4065683F075C75FC10FD00CD70031BC91425461A036CC3EEDBB587EE1E9AA136809C9C31CAEF5AEFAB312AEEBE63C6A80CFD168D1170E91FC97452C68855645FB136D6CC6B64A4594FBE0604DA9BBC74F933426144928A7A235E91FC95D4F3200B3E05C066024B754B32F51ACA7CF6A6A64E80EE533256F24D703A5F7D62ECFC05038310411911D1ACF8299E2E533E9E217B3EAA7D418A2B52BA2214310C991791ECB3AD2F41E972AE231932AFE33954BBB80DA8AD7711C554F1229621676D739BDAD8A1611B874DC9A50982F268420D39344778941C9A20288726D4D44ACDB91EB5799A30B05D9A604326F50B7F6A1E4D109445136ACE217F580ECCA00841E41781D6882A4EAB68505544D023AB88634257BE35AA222BFF0CA22A0FB1905AEFDD82C2EB502C8F3A8221AB7CBB50C922FF0A89CE03CC22AB1D404870158688AF820D9954DB4D4A0E550024BE0A33C8163623940C845028172182212B71D15CC94B0C06FB77BABD2659E13EDA66D6F86568864D143CD32A8E39E3827A57CDADFC0E6551061904EBDAC9D04AF66DA478D8AA0D9663E895E6D652E5CA91B6A9CA38FA6CCBD53597BCCB89A236EF328E3EEF72322DE7CDB9B1069F50A0009971E9740E22CE1B224EAF744E282D97A54F89C9C424A9132E511D6EAA5268A2F44AD2B34A6155E15D63B93A90BF3B2D95F04DE7A41C7C3BA75F3575416347D529B43B068DE9697ABAE20055343F6751340DCE43FCAAA59E67B969072185309067C0D544A67A535119C663A2D79815FB49DFDDAF9DE25BA8CBC8B70128CB8DA303DD63E7AAE63EB20D6C9F0CE41080925CE82490BD1FAE5ED88AC0D4D463A99301B0E2A4C61655062EEC0335365DEB178A2CAFE6E445C6566A06AD2C78315D6F196C2A3CED16966F5FEBEBAB5ED0F6D4AB9D95D466D0842E1943C3A4F132B24F6B2F2F3D16260C5D55EC52EDA6257495C636B2FD58EF01ABDB18155D75B13B975E4C56FFD5C5EF456A7BB2F612A54778C36BC692047025B8C5F82C5DE283C666DD3D3F9F569B5BB62E3A07B42CDDB28ABA6EACB9CAE6A907F75B357E651DAB1D7EA509BBB625951659BB1FA49AE2A523A08E9A5B494201B98D85BC7CC0CE811C5FDC35A852211B02EE55932FCA0095D3DEA5F1045071E7224F87EC4BB85711BC0F02D4D37C6FC4536581AD943CB16E8FC4BDDAC0F505A0D2A64B0EE001177E9F242FB918A0A93AB6DB224869023B2B013C660FA8C17C1CDFE34003B7BECFB6B703FC4070EFBFBAC89169C885B4385C2D3A83F03E57E112CA6196C01736AF14E497A1DE95A29D48581D03F6359D68AF520F6AA836DDCC4A80CEBAF68E0D617351C14619EA5D29E58EB55927C091CCDE55E2739CA85E3DAA4F03D661278B62B3B6FC407F6671123C90AB7845D669FEF564F17E17B127EE8A5FE7240D1F1A112754664496C2E9C33ACE65741F578720A5125551A4B7A1AE4816AC822C789D64E17DB0CC68305B210DA387F92C7F318CF5B64F647519BDDB65DB5D46AB4C369FD6C2535BEC30A52EFF938552E693775BF62BF551055ACC90BD0AF82EFA7117AE5775B92F80D7A81011EC9466F9961C6BCB8CBD29F7F0544BBA8E234B41A5FAEAC3A577849A2A2A2C7D17DD065F489BB251F8BD250FC1F2A9797B0C13626E0851ED27E761F090049BB494D1A4A73F2986579BAFBFFE7FB654B63699DE0100 , N'6.1.3-40302')
