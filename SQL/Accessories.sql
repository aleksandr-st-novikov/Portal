﻿IF object_id(N'[dbo].[FK_dbo.StationeryDepartment_dbo.Department_DepartmentId]', N'F') IS NOT NULL
    ALTER TABLE [dbo].[StationeryDepartment] DROP CONSTRAINT [FK_dbo.StationeryDepartment_dbo.Department_DepartmentId]
IF object_id(N'[dbo].[FK_dbo.StationeryDepartment_dbo.Employee_EmployeeId]', N'F') IS NOT NULL
    ALTER TABLE [dbo].[StationeryDepartment] DROP CONSTRAINT [FK_dbo.StationeryDepartment_dbo.Employee_EmployeeId]
IF object_id(N'[dbo].[FK_dbo.Stationery_dbo.StationeryDepartment_StationeryDepartmentId]', N'F') IS NOT NULL
    ALTER TABLE [dbo].[Stationery] DROP CONSTRAINT [FK_dbo.Stationery_dbo.StationeryDepartment_StationeryDepartmentId]
IF object_id(N'[dbo].[FK_dbo.StationeryTable_dbo.Stationery_StationeryId]', N'F') IS NOT NULL
    ALTER TABLE [dbo].[StationeryTable] DROP CONSTRAINT [FK_dbo.StationeryTable_dbo.Stationery_StationeryId]
IF object_id(N'[dbo].[FK_dbo.StationeryTable_dbo.StationeryProduct_StationeryProductId]', N'F') IS NOT NULL
    ALTER TABLE [dbo].[StationeryTable] DROP CONSTRAINT [FK_dbo.StationeryTable_dbo.StationeryProduct_StationeryProductId]
IF object_id(N'[dbo].[FK_dbo.StationeryDepartment_dbo.StationeryType_StationeryTypeId]', N'F') IS NOT NULL
    ALTER TABLE [dbo].[StationeryDepartment] DROP CONSTRAINT [FK_dbo.StationeryDepartment_dbo.StationeryType_StationeryTypeId]
IF object_id(N'[dbo].[FK_dbo.StationeryProduct_dbo.StationeryType_StationeryType_Id]', N'F') IS NOT NULL
    ALTER TABLE [dbo].[StationeryProduct] DROP CONSTRAINT [FK_dbo.StationeryProduct_dbo.StationeryType_StationeryType_Id]
IF object_id(N'[dbo].[FK_dbo.Stationery_dbo.StationeryType_StationeryType_Id]', N'F') IS NOT NULL
    ALTER TABLE [dbo].[Stationery] DROP CONSTRAINT [FK_dbo.Stationery_dbo.StationeryType_StationeryType_Id]
IF EXISTS (SELECT name FROM sys.indexes WHERE name = N'IX_DepartmentId' AND object_id = object_id(N'[dbo].[StationeryDepartment]', N'U'))
    DROP INDEX [IX_DepartmentId] ON [dbo].[StationeryDepartment]
IF EXISTS (SELECT name FROM sys.indexes WHERE name = N'IX_EmployeeId' AND object_id = object_id(N'[dbo].[StationeryDepartment]', N'U'))
    DROP INDEX [IX_EmployeeId] ON [dbo].[StationeryDepartment]
IF EXISTS (SELECT name FROM sys.indexes WHERE name = N'IX_StationeryTypeId' AND object_id = object_id(N'[dbo].[StationeryDepartment]', N'U'))
    DROP INDEX [IX_StationeryTypeId] ON [dbo].[StationeryDepartment]
IF EXISTS (SELECT name FROM sys.indexes WHERE name = N'IX_StationeryDepartmentId' AND object_id = object_id(N'[dbo].[Stationery]', N'U'))
    DROP INDEX [IX_StationeryDepartmentId] ON [dbo].[Stationery]
IF EXISTS (SELECT name FROM sys.indexes WHERE name = N'IX_StationeryType_Id' AND object_id = object_id(N'[dbo].[Stationery]', N'U'))
    DROP INDEX [IX_StationeryType_Id] ON [dbo].[Stationery]
IF EXISTS (SELECT name FROM sys.indexes WHERE name = N'IX_StationeryId' AND object_id = object_id(N'[dbo].[StationeryTable]', N'U'))
    DROP INDEX [IX_StationeryId] ON [dbo].[StationeryTable]
IF EXISTS (SELECT name FROM sys.indexes WHERE name = N'IX_StationeryProductId' AND object_id = object_id(N'[dbo].[StationeryTable]', N'U'))
    DROP INDEX [IX_StationeryProductId] ON [dbo].[StationeryTable]
IF EXISTS (SELECT name FROM sys.indexes WHERE name = N'IX_StationeryType_Id' AND object_id = object_id(N'[dbo].[StationeryProduct]', N'U'))
    DROP INDEX [IX_StationeryType_Id] ON [dbo].[StationeryProduct]
CREATE TABLE [dbo].[Accessories] (
    [Id] [int] NOT NULL IDENTITY,
    [DateDocument] [datetime] NOT NULL,
    [StationeyTypeId] [int] NOT NULL,
    [AccessoriesDepartmentId] [int] NOT NULL,
    [Status] [int] NOT NULL,
    [AccessoriesType_Id] [int],
    CONSTRAINT [PK_dbo.Accessories] PRIMARY KEY ([Id])
)
CREATE INDEX [IX_AccessoriesDepartmentId] ON [dbo].[Accessories]([AccessoriesDepartmentId])
CREATE INDEX [IX_AccessoriesType_Id] ON [dbo].[Accessories]([AccessoriesType_Id])
CREATE TABLE [dbo].[AccessoriesDepartment] (
    [Id] [int] NOT NULL IDENTITY,
    [DepartmentId] [int] NOT NULL,
    [EmployeeId] [int] NOT NULL,
    [Description] [nvarchar](150),
    [AccessoriesTypeId] [int] NOT NULL,
    CONSTRAINT [PK_dbo.AccessoriesDepartment] PRIMARY KEY ([Id])
)
CREATE INDEX [IX_DepartmentId] ON [dbo].[AccessoriesDepartment]([DepartmentId])
CREATE INDEX [IX_EmployeeId] ON [dbo].[AccessoriesDepartment]([EmployeeId])
CREATE INDEX [IX_AccessoriesTypeId] ON [dbo].[AccessoriesDepartment]([AccessoriesTypeId])
CREATE TABLE [dbo].[AccessoriesType] (
    [Id] [int] NOT NULL IDENTITY,
    [Name] [nvarchar](20) NOT NULL,
    CONSTRAINT [PK_dbo.AccessoriesType] PRIMARY KEY ([Id])
)
CREATE TABLE [dbo].[AccessoriesProduct] (
    [Id] [int] NOT NULL IDENTITY,
    [Name] [nvarchar](150) NOT NULL,
    [Unit] [nvarchar](20),
    [QuantityPerOne] [decimal](18, 2) NOT NULL,
    [Price] [float] NOT NULL,
    [IsActive] [bit] NOT NULL,
    [AccessoriesId] [int] NOT NULL,
    [AccessoriesType_Id] [int],
    CONSTRAINT [PK_dbo.AccessoriesProduct] PRIMARY KEY ([Id])
)
CREATE INDEX [IX_AccessoriesType_Id] ON [dbo].[AccessoriesProduct]([AccessoriesType_Id])
CREATE TABLE [dbo].[AccessoriesTable] (
    [Id] [int] NOT NULL IDENTITY,
    [AccessoriesId] [int] NOT NULL,
    [AccessoriesProductId] [int] NOT NULL,
    [Quantity] [int] NOT NULL,
    CONSTRAINT [PK_dbo.AccessoriesTable] PRIMARY KEY ([Id])
)
CREATE INDEX [IX_AccessoriesId] ON [dbo].[AccessoriesTable]([AccessoriesId])
CREATE INDEX [IX_AccessoriesProductId] ON [dbo].[AccessoriesTable]([AccessoriesProductId])
DROP TABLE [dbo].[StationeryDepartment]
DROP TABLE [dbo].[Stationery]
DROP TABLE [dbo].[StationeryTable]
DROP TABLE [dbo].[StationeryProduct]
DROP TABLE [dbo].[StationeryType]
ALTER TABLE [dbo].[Accessories] ADD CONSTRAINT [FK_dbo.Accessories_dbo.AccessoriesDepartment_AccessoriesDepartmentId] FOREIGN KEY ([AccessoriesDepartmentId]) REFERENCES [dbo].[AccessoriesDepartment] ([Id]) ON DELETE CASCADE
ALTER TABLE [dbo].[Accessories] ADD CONSTRAINT [FK_dbo.Accessories_dbo.AccessoriesType_AccessoriesType_Id] FOREIGN KEY ([AccessoriesType_Id]) REFERENCES [dbo].[AccessoriesType] ([Id])
ALTER TABLE [dbo].[AccessoriesDepartment] ADD CONSTRAINT [FK_dbo.AccessoriesDepartment_dbo.AccessoriesType_AccessoriesTypeId] FOREIGN KEY ([AccessoriesTypeId]) REFERENCES [dbo].[AccessoriesType] ([Id]) ON DELETE CASCADE
ALTER TABLE [dbo].[AccessoriesDepartment] ADD CONSTRAINT [FK_dbo.AccessoriesDepartment_dbo.Department_DepartmentId] FOREIGN KEY ([DepartmentId]) REFERENCES [dbo].[Department] ([Id]) ON DELETE CASCADE
ALTER TABLE [dbo].[AccessoriesDepartment] ADD CONSTRAINT [FK_dbo.AccessoriesDepartment_dbo.Employee_EmployeeId] FOREIGN KEY ([EmployeeId]) REFERENCES [dbo].[Employee] ([Id]) ON DELETE CASCADE
ALTER TABLE [dbo].[AccessoriesProduct] ADD CONSTRAINT [FK_dbo.AccessoriesProduct_dbo.AccessoriesType_AccessoriesType_Id] FOREIGN KEY ([AccessoriesType_Id]) REFERENCES [dbo].[AccessoriesType] ([Id])
ALTER TABLE [dbo].[AccessoriesTable] ADD CONSTRAINT [FK_dbo.AccessoriesTable_dbo.Accessories_AccessoriesId] FOREIGN KEY ([AccessoriesId]) REFERENCES [dbo].[Accessories] ([Id]) ON DELETE CASCADE
ALTER TABLE [dbo].[AccessoriesTable] ADD CONSTRAINT [FK_dbo.AccessoriesTable_dbo.AccessoriesProduct_AccessoriesProductId] FOREIGN KEY ([AccessoriesProductId]) REFERENCES [dbo].[AccessoriesProduct] ([Id]) ON DELETE CASCADE
INSERT [dbo].[__MigrationHistory]([MigrationId], [ContextKey], [Model], [ProductVersion])
VALUES (N'201704150908580_Accessories', N'Portal.Models.ApplicationDbContext',  0x1F8B0800000000000400ED5D596F1C3B767E0F90FFD0E8A724F0A8B5C4171E439A81AF96B9426C49735B9EC99B51AAA2A4826BE9A9C5D742905F9687FCA4FC8590B571DFAA584BFB0A060C75913C3CE7F0E3E1E172C8FFFB9FFF3DFDF3F7385A7D03591EA6C9D9FAE8E070BD02899F0661F274B62E8BC73FBC5BFFF94FFFFC4FA79741FC7DF5B736DF09CA074B26F9D9FAB92876EF379BDC7F06B1971FC4A19FA579FA581CF869BCF18274737C78F8C7CDD1D10640126B486BB53AFDB54C8A3006D50FF8F33C4D7CB02B4A2FFA940620CA9BEF30655B515DDD7831C8779E0FCED677695678D1419D71BDFA10851E64620BA2C7F5CA4B92B4F00AC8E2FBCF39D816599A3C6D77F08317DDBFEC00CCF7E8453968587F8FB39B4A71788CA4D8E0822D29BFCC8B34B6247874D2A865C316EFA5DC75A736A8B84BA8E0E205495D29EF6CFDC1F7419EA75908A0D6D8FADE9F4719CACBA8F7A0A2024B1C10A5DFACEA3C6F3A3840D4A07F6F56E765549419384B40596428C75DF91085FE7F8097FBF42B48CE92328A482E219F308DFA003FDD65E90E64C5CBAFE0B1E1FD3A58AF3674B90D5BB02B4694A945BA4E8A93E3F5EA0656EE3D44A0030121FEB64833F0179080CC2B4070E71505C8124403546AE46A67EABA80A52E52BF8C61F6B656F4ED1E625C50B19AD8B6E609548DA797424D8C68B70BB0F3B202B1389428E2B0CC2D69DC78DFC2A74A321316D7AB5F4154E5CE9FC35DDDBF0F8439BF50C0BECAD2F8D734929125337FB9F7B22780DA2B352DB14DCBCCEF27DA3DD28D4EAA2A9381405C3E952C7CE62162C026D749F185CB2F1482CDD6B1259081CBDBCA4B8A70BAC146CFD41492881B6214319D57F3C89B476796E732DE45E90B186C162F40EE67E1AE1E6A6B42D05B803ECF7AF5C9FBFE11244FC533F486DE422FE72AFC0E82F64B43FC7312421709162AB2D2C604F7B2E826DD720A73A9E89E1A033B929DA90C81A42F8BCDA6B480D27ECA4BD91A52CDF82656A3582C5D5E4E226D015B61DABE2814A54DD40BA2CEC989A1C92E12A2CFB850E36FC88880F2BD8E055C5DE87F85C93D36B3B8D33A9B2E0D8DC28A1A98A71E62C294A0F4B53236D90C7D37496E9519951571D5633B398774DA86C86BBFB5EDB7A6AE92A59F064B17C3AD85BA8EBF965EA5813B90DD269D8C17C00F632F5AAFEE32F857B33AF66EBDDAFA1EE2DEDEE5BCCB421F534FCB6A3A6849E33AFFE017E1B78ECCCF29EC655E326455601477B4DF64B7EBC16673DED6A0D84C7DDB3223CF80DD1853C550A1B3BF83DD9FBA0107F93F88C4AB2175DAF7B4A3FC508AAD2D9C618ADA7FED4BE5524917CAC6F3A45CD9351BB1585BD8ABFF0F5A0B7B5D00538DFD5E265AFC42DB5E650693FC974F95BB52F9323A62BF002FE048D93B6FB2CA09F7EAE47014A76EFB0CF1D193A52343967AFA51320E26986F3A5DFC616D87F16A91EDE28FD8AC1384898C42FEBB7415CF38932D9FA8B3E858ACF308B943492AC6AAF4414617AFA2599BDCB6E8ABC1E5EA8203E48D72B6EAC0887CF4F22271332B565774156613D504F59CA5C94B1CFAE35795E6216A69CB914CB195A4DFA2BFEE367BF0E6BCBED4CF61563CDB163C87F99ED2EC45A147F8A793A1ECEF69F6D57A41C0C180E56C899FB5AF863B028E365DBADA34BC9B303C80CBB63F08796C13C5A3299FCAAD8908B20C5A77C5DC5A8F5A6DD1D7516BE16E7AEFC5C69E4EA335C8D96EA8E807FDD6C38238CCF37E28EFCABEC25C38A85E45A5ED907A53C644A9B176032ED25D997FB5E56DEB259F426BEFE213086EF3D8DAB5486334C2784AE7C2D4268CE25C981EDA19C9D533752DFB7A0C5DDF96B80CA2747E354F94A9EF2C5CC326CE2662B2F35EE42C76599C7A35983ECE2662B0B3EB7206BB2C830C7E6BC0107595CDFFD49DC2FE90EF6E4071D016ACEDFFCB5506C9FD067BCE0149F1CDCAB81C1E2C8E4D078B93A387C793776F7FF282939FFE1D9CBC9D7EE0104D158FDF8DE199E8CE90BCFD69DC43249F73D83A424893EDFDA5C98621CDA77290166471026944CA3DAC5BAACB8736E29487B7302B12A84F4F68AB98BA37B4FC8E5BAF31E2EE332FC977D0E7EDE13577655FBD667EB337083290E7A3FB7C951B8ADB706030CBE8BE5F5F27AE1351E2C489D2396B2DCCE4D489C335889C383E55C1A2D289339F14EF76B0B7556C228367DEC999827BD7C3A733E83DFBCC65EC859103B7C8A096F334790CB3180443A786775E9E43AF20F8C5CB9F15ACBB592ADF02BFCC209AB78517EF46AFEDEE394DC04D193FA04E325D5DCE9AE6FEB7F4CAF3E1987599A05283E97D4CFDAF69595C26011A4C3E17BEEDBA4747C0093BF5DEC215043308CED312C76DF63B38854CDADCD392F3C80B63C9392BDAF87E69B312D36D610E7ECA2DCEE676E182A943B87C21C9A365B8F752C6C7F4294CCCB4DB6695B35BE7D032DB64B365151133E3B4C92967B4CAA0E5B3CEE56CA25A81CAFD4CB522BBFCA9EAD2272273CD73ABE6AB8F518F3C9C5635FDCD8B4AD755F5EA0D951170DF1B2AB2CBEF0D159BF0F3B730408E94C1FA4D9B199237CA2F5E1AD2F73986B3A9BB0325E6D4954F630364DDE5439EA77E58F502D5A915EA30392D0EF44257D671CFB5ACD2C86A283FEC0F211A1921CF50056B167BB7C9058840015668631D05149D7BB9EF05BCB6A1DC417F86BBC31F42865936FF8DAB1D760D80CE2B871E9AE8E5B06B8749C1F7A330F1C39D17D9EA912164380422A57455B229B0429020B365AB22135EA437A8F00C767C30ADA953E8E98640B431D01551A906D831095115E2A71E81A786BA416CAC6DFF740F7CBD4EA705BF5E69961D00115C04F4B958211308C90387C440AF63E074A031ACCBCE283BED5083612D13666234CBDACF12C48B04701B23D6075B5CC0D8F870E6626F855576816FFB046E46B49931CEB4AD25D489A8D0B9112F0B8936409F363EDA067C8688D705589BFB4687070747ECB4C65881DAA0309928E611625890C9A732E67718CDE3DA992A71021B61AA2A135616308DD1C48EC800631A4882E182F70E2641B4E96556F3E0D94C7D13A0D94C4D268C907BE5F322D906BEFD30AB1ABA54214846269E1FA606A3AC5F8BBA82563F602FC0360AE26064ADAE0A8AC18D8E4F571B34B992B80051E660ED0526B984136049AE0193CAC930845980248CC237F0C59460B2B4209A0AFA03AA9F1EAA507F030EE9B87F13E955C65976618081D4EECCB28489697D5752AF2635B7779DCC3D7BED336DB59CAFF69CA8CE3D4315064349F9564646110CE3C84B0BA5A822AA26F68154BC4CB1A2A4D0F39E784182E8357DC3F3A7C09C618A3B3736A9F196F331299A58FDEEC50C4D1066A86F6E3EE6D01992B858C5BEAEFA4024B17C4C8A2456BF7BE1500BA2FB64CDAD0AF5C3CD4D079C4EB242A50830143086C3064799DDC9B5340118E59A30A95C1C2538111085C14BB216574732E1362782BECCCD9A32026A62A74BC5CB047852E9794F9C2E41B499BEE1554ED7404CCDEB74C9F998144DFBE97489034EA4DE9126FA8470BED8F8C3694EA2A9C35E24236713C730CEB133A5C6A6F0E5942A3161401A933F0740F5B34C6DC491314895F3045DBCD2B4F34E0D3733E0EC8730874D84982908D870B1A59943264E4D620E9B409649CC21ADB119604AAB64EFCC611D1868DAFE4C94E0D2E04987274E3FCD55AA6B066C52FA5818342FAB0681650A5802643C3C2F1E5022F82EBA5F06F2D944C5E54D80110B11447C0B0A7E8767BDBAEC628D449B33DC802DA5444E755534C97CE6D4EB0D1C15DD3A8739C5EEA0A48A6897C982D3FAC0B192D53A8B86A652A1165AC4EE124705276968E0055A8E064ED2E908AF1FF3CAC1691A2A4DE83647815E53D410610DA08A2036921AA2C4A49F2346A469A834B7A7F11A6287140B11DB6B0F943236B3360BB26DBCBF926CE3FD3064092BA83126F4D3384439E3D75E59E3DD2708B25383D4E47163449FD0457135BC1340ABCF4EB58AF839B57A4D03EF64B21B84DE89E51759F61E95A895AC30A8C3D4CDBFEFA4D6B23AC64B2AB734CA4BA253D110644E7C52C04A1F96B253A430D6C8586436DA680CB5B2E145E23A643EC92025CBE254D43A368A6E9189AF8B6FB192DEB612B58A85BEA4BD7EB5612C02EDDA85BE50621B07BF10421B0E61C6212B131857DD031CBC4E6DC22E28B10D032F08A1651EB50DD9397469A8403BADB954955A3F4E95227A9181D789EEBC3A2586E2C43A21856C2AA523255088746637C88A2915A23F772D33294AA5D85BA8191453BFA5A6D4097F065BC63F750A7B9026A863D7E32841755A58ED3CF4F31A2CDD05533F611E0741FCA482406BDAD3C6B45CAAF3C6A440B255173DB5B16DB0E81507955EC4FB981239B83DCC013AE1362A47EA6682472354FA109FF994C8C09DFA1CA00FEE98A7C1F8D6431FA21707787DE84E2E523228CE2E123234CB850A5D288E1A1274044B90839522BEDC9B578BFE1C1D2590F2241D21927491534F6D6C7322BA4F5CA5170373A23809364027539913C9C5B802936270A249B90BC99C6922E469BAADCAACA8CF1F49BA532B8C732D298722A383354AE95438B2D7D54C486A3705F41A121D06B1390E32483BCCD10D09925A619C6BA9B1F87A25090E24581C4918A422FAF880A3A1ABBDDBB2DBE9EED24E375BFF19C45EF3E174839E8004BBA2F4A2FA298536E193B7DB85C9538E4B365F56DB9DE74341CEFFB05DAFBEC751929FAD9F8B62F77EB3C92BD2F941DC5DFBEAA7F1C60BD2CDF1E1E11F3747479BB8A6B1F1296DB3FBF25D4D459A794F8049458FD405A07AB7F8C22BBC070FDDEC791EC45C36E1BEBE64E3ADAD92DFBAE79BB2DD876BCBA0BFDB350DEA510A3915ACCE2B28211A7E2B6181647AC59586E5B7BE177999E0AAE6F3342AE3447EB6435E1A5D967F91FA65ED0E9074E814738ADBFAEC0478692FF723897289E674852B752C7D69263BFECB9C67BB147472D49B9846E54EB470E0617A348B475BB42A3DCD1EB895D3B343B08ACE485896C2A22F16C8739E243DD5F94F157FB99F85BB7AA246B34724F4EA11A2BE26485E227E252B543D902BA2648759318571D08AFEA7CBD75F96D846F21DDE1ECD242166D75252227337968CC2E7246406D8FA8B3985BF965EA58A3B90DD260C376C9A39D5BB2CF41962CD27731AF8656F4AC3DDD75E264D61CE166BCAAA430A6E6C998894A531139318A7830C6938039AC4C5A312D28AAB49E535B4DD46DC99160432274EDE20CF6E7A77EECECB04AE1CFE6A4EA9BDF587A423BB09484E65F818B07D86EDC193213E8F69736782AE62BDCE14B8321206B095171D07B4D0E8DED0E5EB2FE6143E7A79917018C15FCD2955EB253C29E2B34D672CB2347989439FED8EF8BB0535E2E60D8A9AE2460E3935F7F33EB4F671CD4ED29A6F76547E0EB3E29927D47C36A7750E0B3DA5193352E1AF3686E3EF69F695351BF5B7C5180DC52EABA9D1909130301AF2A24B9D5DECCD688077BD07B8C9321A26FEB1BCEC780BAC5751C99B80EAA30546CA9823D37EB3E026DD9539D3F9DB6F167E8C977C0A19F3D87E33A7F20904B7794C5369BF5918C634460DED71A691F83E96719C6AD9D0F5F0D66FF89DC962C836EA4CAD0515BF666F30D4C5E71E0F666A137EA37278FB74E180FDDB484E42BA2AD7042253EB7292E0643995F6EE2E928AEC3EAFD9DA0C1F98E9DF56521A068DA4283BD292541064206776F2BA8F76233871DA881DC7150791E434973242CC8445D98941630F9089D9EDE107EA288C8349B7ED7E197B61C412AA3E59D2384F93C7308B01C7159D66B35C90E7BFA559F08B9733B35F3AC5C2E7047E99A1D62BBC78C7B89E74920597CF6902A013FD80C2BE2926C9845EF4241A15E7B0585EFA2DBDF27C88E5CB04ADEE33D4F9548B65A7D4FF9A96C5651220A3F6B960D67904C93D680B7866D36CB707AE204441709E96ECF91541B2C56E1DB409BC1786BF2EC6920A8E67BA71C5EA5B0B86F962121AE3985637AE1CF1283C359BC49F2D6935CFBE73C49AEF8B0492F400691F20D5F7540C03928486DCDE502FA9D3E646F9FCBB9CE61DF93C3ABD5BAE781E5E4ECF0EAE6383823E56AA3B07C2C7A3991FFBE0CBDA9FF240676BB57BC5B2C0335EB746C688A526BEBE8A60CC09CFD23BBD7A1B50258FD02709AA15A0D5757E5346D1D9FAD18B7260AB09F698B235E4C491B1FA7D6D32B7E94EA0A0615411B43D9B8220E90039AA98DC45614529F660982843640D4C92952DB233427B657D7E3766870B9260B374E36CF3A5FBDD054934010A54E444A51814075129246F8225D888853ACB7AD53A0C70E2FA9217203E40190EB6FF88CEA3101DAFE9327CF292F011E4C57DFA152467EBE3C3A3E3F5EA43147A791DD3D2C462BC67AF2D340ACE383A41C1192088376C71FB100F4425CF834810E0819A4A1761710A5D2716122D545477569E6ED882A70264D6D7A78548B155EFFE0B80ED0EE7B0C19D5714204BB0A7B95E21F0A1796807C08D923C1D22515714C06F4588E68896C4B8D00882714B52D22808822477D7E5751280EF67EBFFAA68BC5F5DFFA7F81295EBE0CDEA3683E87CBF3A5CFD772F29CBDC91709D1DE82D574341265275E527C50FE9689BA25DFAA6C6DEE27E00A89C21895C32B56301971CC40015B55173907CF332FFD943F7127BDF3F82E4A9783E5B1FBD3D54634A8BF1C110B792B40FC4F9C089BD0577BDC0A768CFE3C31114289CE9FEB83A64FA8411D13A5EC2B8614CFA191B36D10CE1C00F632F428E18FC2BAF3CAAA377504BD0F985C9C7D69C37011535F5C728F5EC473D7C94ABA6F2100E1A399DF9177B32040B6221F6B673C99BD14EF103873F71EC456F6E3A1A8398C2A11BA6E83646D30FE7C5E1480AA1AE4CEC671B4461D7EA7529F30EDF637C3939B41F5F88300CD5C875683DCAD8DB6E63504A5E19DA5748D6B1124ABFC156F93870C2AD8B4E4451B8254C465438A64C1CEFB4EBB1B8E4905E3BF6B4D18887268A43BE58634AA509E11846080770D04DFD2FB1F7FD5FEDED4C7D50B9BF87C82CD7F76DA271DC39C96BCBFB6AEB4619C3461C6A2491137BABFF2E0663580F6E63309CCE4BDB908C61ACB52119C3A8B42119030D1D118E618EF969ACDE982B89FB322E4EEB1B181B1D79F4C5147647EC781DBF7364EB75CA4542A3BFAACF6F56D7F9E724FC470913EEA142918A491BF3F62757865E1D4D61A677E9036F7C5671A084BE99DA2A6CB50A215B17A5E13AB0855B297A7053171DC08D71CB4A4230F67608EF8239DC8E284C54C7C07DDDDFDFE862EE52AA8230F6CAC0CFDDC84DD887CA09A5070863A24498427F0F8B0EFA7030D565423E1C50A4423EDCD273A2423EB6A33F2D4130C730EF9E0DE218BA4745456DF4DFA7C2F11AB6C3725B7246D74B103CB1B703F5B27C352298C3414727A339ACC9F54286201AC20C199AE00741893B557083B1DFAFC71FC399E3D19992C231ED39A12D438FE03976E17B68F213999A3756E937D9C539A679999D7C9048CCD3586FB01BDE986C629F57568FAF2BAF18E7AB33BE127B84C7D79540AC0E7E981C9394BE472B6BF23A6D6A000EE91EEE41C99FC81B1D8E96FDC0E07EEAC921A97E237898E1191F81CD23B9924E51278E8DBB893127BB275709B745424D7C0254F5F6AEACA5BBE4DF23FE846A5C260CEFE457164F8DC63B93F7A6DD0CC4870707475CAB3B84F90F3194DAA0D82C3670023CD9BDB02D7C58956AEB3967130B70E6669B565856BC805985CD3BE48237B0A926C61F7F879853DCB4BD20C4A96ECB9A166F631837CD006905DABD344556205C80F5D13D582F78639E6A3CFC71F140505CAA3D2F0C5457D74EEDFCE861F06A13460583F6B29569F180E25DDCF8201A1858C36A0FBD064BD8C99E79997A82BDAC99F57C7B2533CCA5F76B12DD1DB39FC3B7C467FC2980E0AF3FC048A27A3D6291EE25468424DA6F9CC1641E2C4C3A01B542C2EC934E8C034924D438D38C797030E544C30E07B3CF34C898882F829BD489B6A3C227C8E6A3132659E8E2C20A44FCE0C45150A5790BC439B20CDEB6300D8898085CDDB9F739DC0FEED07D458EF8FA03B81FAA273416E97E60444CEA7ECC838529DD0F3B24CCEF7ED0C11A5F44B7CD936E0313DB41390F6CDAE403507DB85A360235A9E3CC85B54F978C3A0AC9AEF5B708E19B036CD3CE7CFA43770FCD501F402ECE18895E2CD81B63549FE79719A326F5473446B2A721166E8C042FDEED0DD6E69A79CD8C34E3C9D78440BBA4AF22EF2ECA60AE0DE780D65C4ECF2F5CAF57975D3888686DBFBE80FC6C1D3CA4100275540995811B11A55591533C55A5643E4DF564567346EA7D10150B750E4DE57526F36ABBB387AA9ABB4C9ACABB7C1662D787699572D7597482D7B934352B9B5BD7C6160D8B1D36AE169C24AA03A76A6AC08BA05C0D384954034ED5B5125E19E59B07A709DB05276B2AA1D7EFB87AE8646155F9EE0614F548665A191E22A415E22CF24AF1A3B1BA8A89D93E57239126AA4AFA2A27DF5EEC98CCB71A9B432D9B9D429BB9A652A34D1E75B5CD7CDCA6EEC6B554D6DDE451D7DDB8DF6CDDF4731CC6A1882BA29C6A489107EAD00E996AD8625F79911B2B194D1925DE45A3D561A72A45B09C5A5DA6517632F1C801961551346A8EA1FA81AAE382BA341A5307810DC58154D1E490CE695A384CBB554BE786D8694712AAA009E9108B29F18496A23259948C5A6346B1356377BF7E8AEFA12E6D10884059768123D22D2842347B333EB17DD2442C08946413E320591A25E49239CC4B538FA14E26C08A951A7B882C38452E905877D69C62999DEC542CCB2632930A2B3C2DADB60C26022FBB85D923C16A79F953C38E7AB5B592860D9A96A3E5BCC3E498CEBCE860A74817DA03A02E074076B1A2165CBA0E31446C0C4E95D0AA675A870F68138A8BEDAC4A5CD9393727567C7C710567D104E2EA4EAC09772BC89526EA41F03A4121B66CBD8A7B565C44A987128467A6046AD09FAD72D8B3B9B5B3AAB07C596C88D8AA9EAD3B3EE4A8678F2FAEE4FC8BA8771B9C94516F1992BD954D33043EB5AEC821BF4975AE14A58D373AD3E1CAD2F757A90335B4EBA17A25880E2E8C8E0D6ADD97C34693EA5C29CD9ABF5E2782FDF5D155E2729CE05E99EED24E37F53A7AF301FEE45E933EDDFC5A26E80ED6FAD705C8C3274C023D959D009FDA4AEEF25C278F69BBA3CD70D466E1DE7628BCC02BBC0F59113E7A7E019391CB1B264FEB5575A525EA6D0F20B84E6ECB6257165064103F44D45D9068675C55FFE986E3F9F4B67A3535772102643344D7D6DE263F976114747C5F09AE4B9490405BEECD65A7A82D0B74E9E9D34B47E9264D0C0935EAEB4E0ADC0368AA20B1FC36D97AE851167BDE20FC3E8227CF7FC19763CA88E81B8256FBE945E83D655E9C37347079F813623888BFFFE9FF0114245EF9D2470100 , N'6.1.3-40302')

