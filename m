Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B1C2C6CFA3
	for <lists+nouveau@lfdr.de>; Wed, 19 Nov 2025 07:48:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7311B10E580;
	Wed, 19 Nov 2025 06:47:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="nE7xN5ST";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from BN1PR04CU002.outbound.protection.outlook.com
 (mail-eastus2azon11010061.outbound.protection.outlook.com [52.101.56.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02BE710E580;
 Wed, 19 Nov 2025 06:47:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bWWQlJaDHyZO53RbLJLpWH1Kww7SZ+02DuWBdDAx0tWQh8TJ9nkTEf1Kh0xDiRGpqAs+HBdosepQGtbR9el2PbiM88dhClQsLmvjZpYTOkiZ+WB5Y20dE3IbLoPKr+i68FQzHO48cB9X9WUA/UrvpnUBCumgsT9uvHxNCwkQxr4rPyLSDot/pHj+O0Y4e6S1q6Kk6QDUSMHN83sZvhb7gLW6+uGHL3UPd6Fw4RAEiOJk1tjM8N7IjODbM1v2GZg4iEfBPAC00Q/GF2JejPuV7+4xuEz4BhZdekQRcZ91lEzZ7jj6lYXZIt3EeQXqUexuN2j7dyzSalwzKSkAzuwy2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lvu5zjjeqBP+bj2JB19Ov8aWwI9+Ch8MszjNbE9JxfU=;
 b=UtjDRYgI9hKQ8bFFRdtwtLx9WjA1rja2Qd1JF44uhQYau/quBj0EwwgNNyMpEM3OUKQuexQ3Xd3fPCFZTpw/xcRuHWVPFqCEmbpfEIgh3mUBIos9CfJjpmPtJ1IUAKuWXKURB9mQWZSnK/AhSk1p3y2Ef4usZDYFHJEBInQFbMrjKz58A3qEI5lvi4DIMmc4aDM0+cwgvM+ni8BFaTeGdobPEYRqOfB8iJ0QJSQK6+iDDKEUYGgLCdx8805aWHaDKtZ/mTJwThtDlYMB5ZxlCj9pWY0wDFi7l3+8hg0f0BI9p/K5a5Vrntf54LbKqcrnJ+aEL7uv+OeIdOIm5FL6MQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lvu5zjjeqBP+bj2JB19Ov8aWwI9+Ch8MszjNbE9JxfU=;
 b=nE7xN5STs5XArvGv2rqB7B1ADVT4y9PdX0DoM2NjQit5B4TA06ikNoea0CGAKi5GdGc+017PJpVQ0eS8TrzgObC9Izuc48KLTms/hAmLGbZIUfchxVYnoBPocaHgrYRxIAJpeZ9lg9h37lF/p/kXWymsW4H+W3gpEMsIHHqGGLr2JQBm0IEHSIXIGQyUjBcbIiY5VnEvCryuuKdlHL1D06qb7BOrugv8PfrCNeWuMHQesBmH5KGFWX8d+LgfzlHT/8yyvMtDHSv3DKnouox8YgP9utm11aJRhBX+ItH5v6V/onDfUmM/zgySgw93NbVphvO8fT7eC2GmFD6EPXw53Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by SA0PR12MB4400.namprd12.prod.outlook.com (2603:10b6:806:95::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Wed, 19 Nov
 2025 06:47:50 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9343.009; Wed, 19 Nov 2025
 06:47:50 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 19 Nov 2025 15:47:47 +0900
Message-Id: <DECGXPKLO95J.Z6NF92ZEXY27@nvidia.com>
Subject: Re: [PATCH 06/11] gpu: nova-core: add Turing boot registers
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "John Hubbard" <jhubbard@nvidia.com>, "Alexandre Courbot"
 <acourbot@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>, "Danilo Krummrich"
 <dakr@kernel.org>, "Lyude Paul" <lyude@redhat.com>,
 <nouveau@lists.freedesktop.org>, <rust-for-linux@vger.kernel.org>, "Joel
 Fernandes" <joelagnelf@nvidia.com>
Cc: "Nouveau" <nouveau-bounces@lists.freedesktop.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20251114233045.2512853-1-ttabi@nvidia.com>
 <20251114233045.2512853-7-ttabi@nvidia.com>
 <DECB6G2JZJJ4.33UGI1U98JQJA@nvidia.com>
 <76f2ab5b-e2f3-4abc-943e-251afefaac96@nvidia.com>
In-Reply-To: <76f2ab5b-e2f3-4abc-943e-251afefaac96@nvidia.com>
X-ClientProxiedBy: OS3PR01CA0079.jpnprd01.prod.outlook.com
 (2603:1096:604:da::12) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|SA0PR12MB4400:EE_
X-MS-Office365-Filtering-Correlation-Id: bfceac9e-dab2-486f-9a68-08de27378ea8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|1800799024|10070799003|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dVovaUExSHNFNFk5d1FlK05Ba3lzMTd4b3NFQUpYaGlvWThjWHBWd3VxclFU?=
 =?utf-8?B?eHVEcDZnazdJUGx0dnp0aUxmRTdtSXNyYVFmUWVzZHpreURsd1pxN1A5eEJu?=
 =?utf-8?B?Wk0vejdKZnFJWmNkTldjTU5OL28yaUJjNkp2d244ZTNrNTZTckdzNVZvWXNP?=
 =?utf-8?B?RU9tUDZOMkZNZ0J1ZmRERHpGQTR4UFJGTXptdmppZ0FMTitpVldPZ093UTI2?=
 =?utf-8?B?ZXpOaU1OM0RhZDJTdWFnWnBQQisyZ0ZZQkVQbGJmT1RPV0dXTEladVp3Yk9D?=
 =?utf-8?B?VHJmMVJTUUZRWFljODdiTFFWbUpPdFFubmZobEFyZVlHV2VyekI1RjNNYldq?=
 =?utf-8?B?dkVjZXpwSnpEVlU1MWtRSWFpWTZKMmJUY3htazZmczhYbmJidFZXeG5HYzRB?=
 =?utf-8?B?MzNCWnZLSE4rSHIzcmVuVW9rN0xCOEEyeGd3bWFGWlBkbGNKdmxOZ0tHWGoy?=
 =?utf-8?B?L3BMcU5wZHVOb1gwWGw4dW5CbXExZFNKYWcxbEZMWmNubkwwRHV1T1RkWGlW?=
 =?utf-8?B?bW9jRkVER2FPU0kvMElXMkt3NHBIZ05xNkowVytOdWpaUFJsanhrWDNMNC9u?=
 =?utf-8?B?RDhzSi8yakUyaExnUTN3clk5M2x0N1h0S0EwKzFIUE9GWnhTSkgvQ1h5dFdx?=
 =?utf-8?B?TUxFVGFsbmFOblZTamlLZ2RRUzRZYm1xUkNoeHgwRWZtWmI3emR6TmdJZnJR?=
 =?utf-8?B?akVrYXlvUjBLS0FLRkI3Skd4SHVxNUgySS9tTzU1QncwRUdIYWNMQy9WZ0l4?=
 =?utf-8?B?UWtyTkkvY3FoTERTbmJiUm04REp0dG1wNE5BNEkrYnp6M1FjeFBWczgrdWVD?=
 =?utf-8?B?SWJRbmRFZzZlQVN3eG8zME9mOUh1SmUzNVRvZVY2OGxsYXhxNllSZUx2Q0Ns?=
 =?utf-8?B?RnRQTnI1TkpIWU4wUzYyQS91cWExTm9Sb2doU25OeklISnl5T2svcmJMSStZ?=
 =?utf-8?B?MUFFVE5aSVFWOEYrQ2dMVXVRRHF3WGw5bTVWNjJVbkU1RzlncmFOSDZDNDlk?=
 =?utf-8?B?Mis1dUxQTVBGYjhmNGE0RmQzWnkxZHZLMzdsMzRYUFFCcS81a2lvRzJ5clNq?=
 =?utf-8?B?MnZUU1RBSG43RnRxWTYvRU1TYi8rUGxJZDNyRmtoamZtMkxRK3VaWlZkYk90?=
 =?utf-8?B?VFd0UU5URlR5d2VZUCtKWDZ3LzR1by94SkxIazVWcnQ2SUFFcTRHVDdnTlRN?=
 =?utf-8?B?Z1R5djFJeUVKd0Y2T1VYZVNZazRlT1FGamIxeU9rZU1pYjkwUzNvSzdxWDZ2?=
 =?utf-8?B?VVQyVnFMVHYwRktHRTZ6S3RJTWtOeGlTUllCZTFSNjg3dEJyRTU0MllCSVdP?=
 =?utf-8?B?YlpJcktsOTkvS3M2ekhweDF3U0E0a0ZuUkQ3M3JQU1pDY2lkSFFMS2ZRZFdB?=
 =?utf-8?B?b0sxa3oxRUFTNGQ3VUZGa2EyYiswVVBIaFQ3Zk1xNGNPZ2JDcnBNdHBhdkNY?=
 =?utf-8?B?TjgyL1dBUUJoRi9jaEVucWJPQUtPUDJQTXJpS01Jalh4Tk11eHdENlA3T1Rm?=
 =?utf-8?B?VmhlcnJoQVpnUm12M2NQeElOcUx4eWowQ2F6NVdXYlZqREdCd01lN2ZJQUVX?=
 =?utf-8?B?Z21oNFNzcTJFcVZIV2NRMkpWcmRzY2sxRXhaSTFMemRvYncrTWs5bWZpTGhX?=
 =?utf-8?B?aTNBeUgyUXZoVG05RlAvNnBPNGt4RHA4a0djZWNZanczMnpoRzVWV3pJTEoy?=
 =?utf-8?B?cWZpYkxiYmZubnlHOFFLWGFPSFNKenJWcTdOOG9iaFpINzg3cExtTDB0eFFV?=
 =?utf-8?B?UDdEbU1VVE9NMS9RV2tyeEtLSnd1UjJwZmdaTTZVTVNHSXhqYXdtSlZNZEl4?=
 =?utf-8?B?SFhoelI0V1FCK1krVWF4dWpPNE9KNkZTQ2xWNlg3Q21MVkVoaVBQallDQ0Zp?=
 =?utf-8?B?QWVCU21yaGhubXlodFZPNk9TcGg1ZVhidmQ2RDAvVWZrYzh3YWZBMG5pc1BI?=
 =?utf-8?Q?boMfQe4AKKs0x6kVx7QE3wWXMt1rC5CU?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(10070799003)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L2s3aFlRRnpxYWQ5SFVXaElpL09PYzdqWXgzaG9JaFFtblg3YXZ5bHpRYW1k?=
 =?utf-8?B?V0J2c1NCbUU0Y1JmaHBnbk84TXZzczJjcHdSUDVLVUpFNy93VTc3U2FldGNu?=
 =?utf-8?B?MVJ3Rmc1OVVmSml1dTBLWEdCNUVjRGM2U1B0UWFkUUVtNEpOM2dpWU90M01Z?=
 =?utf-8?B?amxLZmtTY2tSUGFDY1VkWWVhM2NNbVNhTjFjNWh6Y0tmMDNwcUo4NXFITVU1?=
 =?utf-8?B?WU1GYmVEa3Z1bFU2S2JRanRQUTJ6SDJVTGVabjFsOTQyOW5ycERVSmx1ZlJv?=
 =?utf-8?B?SUVmTktPYTFzSGlqSVNEbFZVR3h4K0ROWHo3TzNuYmNOcWJ2V0V0MnVMWmc0?=
 =?utf-8?B?dklzQkhoTWdaaGtTMy9MaFJmblQ3ZW5Hb1ZVZ3VMTDZTZkJjc3pOV1Q5clNK?=
 =?utf-8?B?cHl3dU1zNE9kN3c1K0hMQS8yVS9PSEtpZU9xeEJ0R0xLRS94ZTdHTVFKL3Rr?=
 =?utf-8?B?QS9jNVExbnpWZzNPemM4WSs5dWIyblEzOGpmckdOV1lHUDJNVzBqV25qelZE?=
 =?utf-8?B?Z0dNYW9PWUZwbTZ5SG5XZVFRMVdyZFRYV1FJZkw4QmVVVFh6U3pER0xoQzdk?=
 =?utf-8?B?OW0wMmZsaEd2OGFEdnNsUEVDbFNxRnM3cnk1eTBycDg1QTZwOEFiRjVNQWZk?=
 =?utf-8?B?a2MzUmtoWlAzVy92VXF3TjJxT1hNcmJwTGdkSFg2cVBCb1ozVXd2YkZ4bllT?=
 =?utf-8?B?K3hCa1VmWFV5Nk5waW5yY2YydHBVODF5MWNrUXBKZVZvbmFzelRIaDZMRDl6?=
 =?utf-8?B?WnlGRGpBK0poSk1VbW5RNEJ1RFdRby8yRHE4WXNMUG1PQ0FTejFPY1lPYVF3?=
 =?utf-8?B?V1lQTHZGNE1pWFV4OGxoZ2lySmxuYjFXY1JkMHRkT2hIcHVSNjJVdW9uY1Y1?=
 =?utf-8?B?SFQ0ZS9ianBtbCtTeFJEL09SeUk1dzF2UHhsaXBiU2Z0QVY5V0lpOVJOYm1r?=
 =?utf-8?B?VDgwT3g3eUgrbSswTVZiaGZhQ01IdFZNYlAyQWZHaFJsWGlmdTI4ejlVMFB3?=
 =?utf-8?B?K2RqZ2pYTnAzRldaeGg4bm5RNmUvZEZFVmYwZEpsR0NMRjNET0NWejhuZjVT?=
 =?utf-8?B?KzQyTm10dHdjSG5xMkx6ZGloSjdWMHdueVNPOWt6aHpPZFkyaW9SRFFpemoy?=
 =?utf-8?B?bnF2d0RuLzJOZTUrc2ZXMFJkQlgyLzJ0M3hQWHFxM09UTXIzSmdBeDcwRTJ2?=
 =?utf-8?B?c1grdlRrcDQveE00dHFqbDhrMkFzZW1BM05laWRsNTJrVVN6cHNuclZENkFz?=
 =?utf-8?B?dkEzaW1RM1REUkIrYWU4TCs3bXFJRkg3UXYwQzVzK25yVnBXT1VBaDdvN3JS?=
 =?utf-8?B?MFFPRzZyTnQwUXBhODNOOVZUeG1kT0VJcUVwdlh0SnlsQWlkQS9nN3B5Mmhn?=
 =?utf-8?B?d2hpbGVEbjlWRVJjVHFSNlBDMkRNV2FQNm54V2JzaXZDa0FieE1HOW4wbEJH?=
 =?utf-8?B?TTVUUWQrcWdreXNEUWlkZmFQbjVNdzIrVnM2bkI1ZVB3TjAyTUFoNENhUnVy?=
 =?utf-8?B?bk1TQnVtU1prYVV6MXVDUVpiMXVVRE5GWllvTmwrazBXRjdLeTdHOXNhay8z?=
 =?utf-8?B?andFandVQ1o5VlVsU1BFV0VZamhZV1NjcUZmTUhCTDJhSG9JcGh5SFZNSVZs?=
 =?utf-8?B?aUxKZ0N2MDM1NVJQR2ZRNXNBNEVYYmlhTExMdHkrNFF2WUd0NE53a0JPaU5o?=
 =?utf-8?B?a3IxZk9LeDUvZkdXbWhyRUxYRkF1dnBFTGF0TzZaTSt2KzB4Tk0xZlJkRWcz?=
 =?utf-8?B?eXNZQ3FsVDRITXZYVVVVRFNFc3V6bjVNNG1pVXZYNHN1QmhJaWJodGl5Mko3?=
 =?utf-8?B?czRVM2d3T0w3SFlRSkYvS0grVzZuK2owdzZIVzRqTFJKT0M5ck1KbHBzNzRQ?=
 =?utf-8?B?SE1NT1lzWitneWdsWStKR0pVdURjeXEyYi9yTklBUXIxeUkrVHorcUY5anRO?=
 =?utf-8?B?OXg4L1ZsdkNuWjNZOUdBNzRDR3ZoQURsdWpXcjZ2MUI4YnNCMm8zZ2VIeGRs?=
 =?utf-8?B?VldDU0E4YXZmTGIyS1pRUUpRTXUzYnBXdlpWU0tkRDBUaFNCOHpMSlg4TjlC?=
 =?utf-8?B?aEN6d1RQMEpXQnA5bjNTUXZodTU1a2dkN01pelZHbk9ueU1DNHZOSy9VWDdv?=
 =?utf-8?B?SVp2c3hhZFkxNGxxYTVXZnVRUTFlUm1wbWVGZkVVOXIwZU5FSmlEOHVzMWNY?=
 =?utf-8?Q?jvOFA1hP9JUKSr4geB7qeIhc00YxUSFM9D5nRXzA27V2?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bfceac9e-dab2-486f-9a68-08de27378ea8
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2025 06:47:50.4943 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dxKO6ubkMxWKm055N83zy1LtPbeUq5HV6u9ZjQmHJdscM+nDwGrrJ2BM2GKN+3Z0wFTbuXU96XgXkLtWr8vSOA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4400
X-BeenThere: nouveau@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request@lists.freedesktop.org?subject=subscribe>
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Wed Nov 19, 2025 at 3:34 PM JST, John Hubbard wrote:
> On 11/18/25 6:17 PM, Alexandre Courbot wrote:
>> On Sat Nov 15, 2025 at 8:30 AM JST, Timur Tabi wrote:
>>> Define some more GPU registers used to boot GSP-RM on Turing and GA100.
>>=20
>> Nit (for the patch title): these are falcon registers, we just happen to
>> use them for booting the GSP. Also IIUC most of them also exist outside
>> of Turing.
>
> hmmm, falcon registers are *also* GPU registers, though. You arrive here
> via the GPU's PCIe BAR0. So I'm not sure there is anything wrong with
> Timur's patch title, right?

I was referring to the email subject (which I should have quoted for
clarity): "gpu: nova-core: add Turing boot registers"
