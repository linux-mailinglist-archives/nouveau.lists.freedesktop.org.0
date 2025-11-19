Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B97C7C6C83D
	for <lists+nouveau@lfdr.de>; Wed, 19 Nov 2025 04:04:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C10F510E559;
	Wed, 19 Nov 2025 03:04:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="k0YwyLrr";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from SA9PR02CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11013012.outbound.protection.outlook.com
 [40.93.196.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 425A210E559;
 Wed, 19 Nov 2025 03:04:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AONvip2IJ222jG5WTkymuyQB/GmLHotXVJXOVNyghH1ycKgKx4vkzMOos/dPAp1CoZusstqg/q/QEOD4LzDxZp6nxngYhTRgYMPQySrwWdat7ozB+vMhfD1+dX/PK7mV39vAB+h7cS5TvxX5kcdK5UYGZQSsVB8nfgkcMlDAM6l6YBLGt9vLFYKbB8QM6/GzhZ+Fv3bKII3cF5Yqk9zdqra1YXrATHv0gGAq7OSxexuna4jKVWjqduZ5LP8CwOuKC4duBcCNribrUmNiMQTc4AxPgjRY4J9cU8FlXqo8qEQlc+X1qmmSPbHMnptnjW3Tr3bccLIhIrEqBE4Cos7s8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CSZNr3wbllZiE/bd2SPOrJHAlvGGyJxwN3OvqEMJETU=;
 b=GGiDBn6Riw1nuV8wD9EfsPhF5KyG4m6AcLhWPOWZ4kSo0JCUBpOi7GUx05urTsYodq5JWUguLDIP8fT7/pZFRgU38pjv4rp4gRgRrWRMnwA2wIb/SPKLcL1FZUDgkjBvcotf91upD/c1xhjS4JJdkT9+jlsJw8g+UbYX4TyyBOydHMcGW5RGQDldIIEIThDfp8bWATOKf70QoqHnur/hTANqPQOhRXft2cOc+GLSjJje6YvMCKqVawXlqIAai6yQou5lRkyqFfJc+OCOKoIMwIKxIJxOZ2CodKmYDcBmFy7H6HgUdTxkWxDg5eOsI9wstwSftHTINPzLePpfj1C0ZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CSZNr3wbllZiE/bd2SPOrJHAlvGGyJxwN3OvqEMJETU=;
 b=k0YwyLrrvRBF1rO8qr0C5rlXNrP8XMz3nuVftCMqyC6XhsrwOd4YQCGhSnLF3uIqmHErv/hbBIl98s/twoHzxBHMvX5jiP7aOXOJjUt4aWnCvOSsDQx0GmGelI8TeroEcLknrmPIgWuGZGw7Co3zQowtU4SZS4y4qcENYYYv8PeRP/onrBe3Ei55DozNZskjQVkg79IlNWdL3cYAWkkjlPhnbmsC7lsS/cnoptFtX4fq3fyGx8i2G4Ftc5MtOozPl6AEM7TfPmmFY56U11dxpI393zohqcZLU/Ov9ugW0ZlOm7qfTmg+W+6wytUQhR1j68nLcwQmTuYfqaRjQKnsOg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by PH0PR12MB7839.namprd12.prod.outlook.com (2603:10b6:510:286::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Wed, 19 Nov
 2025 03:04:34 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9343.009; Wed, 19 Nov 2025
 03:04:34 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 19 Nov 2025 12:04:30 +0900
Message-Id: <DECC6RG6POV3.32454JPX1CK8E@nvidia.com>
Cc: "Nouveau" <nouveau-bounces@lists.freedesktop.org>
Subject: Re: [PATCH 05/11] gpu: nova-core: add
 NV_PFALCON_FALCON_DMATRFCMD::with_falcon_mem()
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Timur Tabi" <ttabi@nvidia.com>, "Danilo Krummrich" <dakr@kernel.org>,
 "Lyude Paul" <lyude@redhat.com>, "Alexandre Courbot" <acourbot@nvidia.com>,
 "John Hubbard" <jhubbard@nvidia.com>, <nouveau@lists.freedesktop.org>,
 <rust-for-linux@vger.kernel.org>, "Joel Fernandes" <joelagnelf@nvidia.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20251114233045.2512853-1-ttabi@nvidia.com>
 <20251114233045.2512853-6-ttabi@nvidia.com>
In-Reply-To: <20251114233045.2512853-6-ttabi@nvidia.com>
X-ClientProxiedBy: TYCP286CA0040.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:29d::15) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|PH0PR12MB7839:EE_
X-MS-Office365-Filtering-Correlation-Id: c349d3aa-3dc1-4bf6-2ce6-08de27185dc4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|10070799003|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SlZtbzNnZ3dwWXRWSi83V1Q4d1h4UDMvUFU0T2RXUzVCalFnUVpCR3ZqWDNP?=
 =?utf-8?B?T0ZNRytjWFBYS0tGM2pxeE1GR0hqZCtNYVpvRW9YVFM3b3hCcXEyS05sTHBM?=
 =?utf-8?B?TU9ZMkViakgwY3diM1VRV0pyWHEvWFR4dVYvbHZsV0kyMTliU1I3REgyUWtN?=
 =?utf-8?B?WkxkT3c4TXlhZVJ3NGFHZ2xIUlhGemNKYTdSUjYwN2h4QzhDemJ6REZMb0NL?=
 =?utf-8?B?SGRUKzg5L252K21TaDFHWjhQOFRiK0FFZ1dxaTdSeWNQU0RYWnk3Ukhqdm5X?=
 =?utf-8?B?UWR2eDdvejN4ZDVPRSt5NGJxVURkV25rNHdNUWhqRHByQytZWVZuQ3FCSG9w?=
 =?utf-8?B?SGJMSS95aEIrMEVlamNBSEpMU3RDanl0OENCQTUrOThUeW10N21mQ2NmeXBR?=
 =?utf-8?B?SmxFMUZvM1RjMW5iQVluV2dHMWJySWF3b1pRbkdCMlBBSmJRME1VYU5UY3Ev?=
 =?utf-8?B?dno1V0VjcVVCZWtiVFJPNWtsak5FTnRkeHRVQlZYSmdONkIyNEJpSTNOYXlR?=
 =?utf-8?B?ekd6ZWVXQVJhZlFpSmNHY28wRlNTVVhQYmhWamZwWnc0N0RGQkRlWWJLeVpq?=
 =?utf-8?B?YjZ0bGVMd29NUjBOc0NMNVM5c3UzTFBnWExGc0xrSmxIaHgvcEEyUUVGMm1H?=
 =?utf-8?B?dy85ZkoyRzgzUCsxQzZoV0pPcW1qUTI4OHlBQVlQNmV6RHhHNUkwOGp4Q0Z2?=
 =?utf-8?B?b1FTeEFNOEdiaitGSk83UlFOWSsxWVBxWmZRNkI0bEpRWmtDNTFQcXhtYzJO?=
 =?utf-8?B?bVlaN1Y2dDVlU0UyNlE1R2srUkFIaTR2L0lBdm4zYVNLQi9QN3RHMmwwRU5i?=
 =?utf-8?B?TXp4b2dLWkp5ZTJXUTRmZS8rWHRvRVF1Q0xRRmxXbFowbmVSMVJmak9PQS9j?=
 =?utf-8?B?bnV3VERzT2NTcmt2SVFOamp2Q0ljRkhFTGVJK3pDYW9KY2E1MW81SzB2NjFG?=
 =?utf-8?B?bXExdjhlWEh3WDd1VDFIS0dUV3RkU3JWT2w5ZitTbjVHMWlxbFB2TTR0S2xn?=
 =?utf-8?B?N0pUZjVzV2tGWFg2blFJZ3hkVHJUdDV6S1d5aVJ2ZlZ2NVRkU3oveXpuZ1VF?=
 =?utf-8?B?THZ0VVhUWStlNFFrSDZZT1BXM0N1QTdIcDBLd3ltdnhld1ZXYU9qM2pTTHh4?=
 =?utf-8?B?QmFmNUh4TXQ2dm4vVVAvdW5XVG9oODhCT2NzSmE3OE1UWnpuZnpJTlJReEhr?=
 =?utf-8?B?ZCtBdWIvZzRYb25xcXVLT3NiVStWMmFMbFdQQ2p2WnpjWTNudGM4cE9ZWm84?=
 =?utf-8?B?UlVCYTVLaUJUUjVwaVdYckY2cHZBYzl3OFNZb2FLdVBNcGQ4U3JTZW00TUJW?=
 =?utf-8?B?cE5oRWVyR1FuN1IzdzVQT2ZNbFdvSGxDeEpOZ1V5bWRPVGFISWxRSUhhKzRG?=
 =?utf-8?B?QnZ4T01mdDJFaVU4VEF4RENFL0xuZWtZL0M4MFRsaWdnbVlBdmFqWm9rNlg1?=
 =?utf-8?B?azZxcEFDaFB6ZFhCQzJDcjFwendaSlliTzdLK2EzcTJEbkdWM2RRNHA0R1FL?=
 =?utf-8?B?dVRha2tCMC9oTzlRZE50SVZJcjhES3FBKzB1em5zWndKOGNFN0VPK2QvQ3hL?=
 =?utf-8?B?bkIrUDY2WkExZ2NyTVAxb3VDbWw4V1gvRkFvMGVFakdzb29McEQrZy9za001?=
 =?utf-8?B?K2VnbzlRQUJpRG05NjRDL0wyWnU5ZFd1c0pCYmpCL2lkM092bDhMYzdWakVK?=
 =?utf-8?B?SW8vOU1xY1Q1ZjdTQ0l5TlhNcUdNaFY4N3ZnQVBCUDIwazNqTnhaK2xyUmVW?=
 =?utf-8?B?RVZzb0ZlYVd6SFBnRFlwcTlEWElBOTMrb05LdkpGOWZablhoekh5ZW03dERn?=
 =?utf-8?B?Zk84RWtNZnRDOXo3VDJWODZCWU9EWFhtQisyYjhyd2hEK1BkRzVHaWpodkR0?=
 =?utf-8?B?ZHMyTTdhdk1BVGdXUDhtSjFkUGRjUVhVVXg0ajNZUS80cnRBUVhtWmxHVkFW?=
 =?utf-8?Q?IKHi1JSWstzKTMSuVdAiPrAupWxR1OdG?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Znk4UnBNRnBIaFNmMlRXekVnRE9MSUtjeDVLL3RhZ0d3bjZTTmtoclJpcWNk?=
 =?utf-8?B?RmVZYUE1Rk50bGdMSE5HdlhHMlBianlYK1QwbzZCWm5qaS9oYjlVUUpHZ2tE?=
 =?utf-8?B?R3dqN0xLV0FCQno4UDEzQnFtZEF1UjE1OXVoWDZGSnhOcGV2MTAzemZlTmhu?=
 =?utf-8?B?aURlb3hGL0IvdXY1Um4vSVJtYzV5cHFMUWR3blgvNUZRWVd5ekNMSGZLbnNQ?=
 =?utf-8?B?RGNhNmhyTC84VDdNNDQ4cWJGOUJXdjRpeXVLbEFWRUt1OVhlSG8wWWJMQXhR?=
 =?utf-8?B?RVpjSnlGclFSRHpxUFI0UkJwWnpXUE1ZYUYwaGZWREVqN05qaFZJT3NENktP?=
 =?utf-8?B?VGxmSUQ3eG43YitiMkNVZE8wNHFMVmpPSmVnRnQ5RTRyTUtuRXVPUEpyVytp?=
 =?utf-8?B?dlRxRzBCc3Q4K2FraytmNnZad3lJWmlSMHJzYU9VN1JTUzREaWR1SGVRdTkz?=
 =?utf-8?B?WTNRWUdZREpQLzllV2F1ODl2V2ppVWh6UXRGOTlZcWhzazdRcDRRZXhMQjc2?=
 =?utf-8?B?aGM5U0tqbWJuaXZLeC9yamFhK0lsVkIvQkdQUUJBT0hHSGNrQURyMXNUb0pt?=
 =?utf-8?B?TjF6UXlwY2lTZ3g3T01TYmhMMTVCTGpvdmw0ZkFYVkhLdHNzSFRybW54UHFp?=
 =?utf-8?B?dVpPZXdjQzQzVHVZeTduRzA0b29BUVhBSDBVa1FzM1Z2VjF3akpmY05wZTJO?=
 =?utf-8?B?dmlPT2ZHSlFDNkM3UjdnUnNrUnVlcFZuSWRhSHZXRlJVRkdtU3JPR0xMTEFC?=
 =?utf-8?B?eXZSVlBncHpqMm9zRFV5TFZORWV4RGZFR05JLy9sendYNjlZUUhXcjdXbFhq?=
 =?utf-8?B?YlpDdlYyWk8yeGZZeGFqTStZUzVlN3hIajI4ZUJUZlF4VFIzdG5CaHhnZW1I?=
 =?utf-8?B?TmxCbXBKTFhGVEF5QVNQSllTMTVHOEhOL2tEN09yc0lGUjZyTFd1OXpTNFds?=
 =?utf-8?B?THlobkhWTjk3VVhQcVFWYXFnczlpS2d3VDRUR2xsanp6RHhUREVtNUhSTDVV?=
 =?utf-8?B?SXdnaFFFTFBmVDU5ZW9CMXNJLytwdTl2WnFYa2ZDQUFHUUZqQXdrN2ZlWlgy?=
 =?utf-8?B?WEdwcmNOMDl3TjdacVI0aFdTRkRBMkFzWWh5dmREbFVkZkZxbnRHWnJUUkF5?=
 =?utf-8?B?T2xISWN6VFRMNzB4TG50QkJhcUhuRDQ0RkkvY3hOZFA0ZmQ0aEVUVS83Z2VF?=
 =?utf-8?B?UHU4bHhvMXJSY2tna3F2dUF0MzN0MmZTcWN6VDQwUEpKTDI1azVJeFJxVDBM?=
 =?utf-8?B?dkcvOWtxSjFaWEV3MGFDck1RUTRkb3k5L1EyK1RhVEpGdzZVRC95NC8rbmo3?=
 =?utf-8?B?b2NaSkZRUnQwYjFzQ0pZaWk4SUhlVVZBZ1hSWmZrc2hYTVc2U2g5MjYrRi9Q?=
 =?utf-8?B?VVRpVTJuZ2JVaHhGZ3NtWUN5ZmZwN1FBendZS20zSUFLbnVSd2g1L3Z4NTh5?=
 =?utf-8?B?ZnlSRjVITG1zS1NlMzR0ZXhMRWZ1emkwN2oyTEdMMy8zcFJ5d3hqTU85YXZ4?=
 =?utf-8?B?U0MwRHl6elpyRzNLMnlsamQ2MkRPK2lOVFRybGMyR25weGZaeFZtUWhyT25I?=
 =?utf-8?B?dTRqTWVrbldUNi83ZUowVnNKY1NuUUpSWW5xOHlPUHdWdEFQMkc4UWd5ZHBQ?=
 =?utf-8?B?bU5EYkJJTkpISVBRZElYUEtKTm1MOXl4S2JqMFo0TWRlSC83RHJlSThNK1p3?=
 =?utf-8?B?M1IzWHY2U3FVc3czUGhldWcwZVpYSW56TTZGREttWHNucWluVG1HdGlsKzFR?=
 =?utf-8?B?ZytnTjV3L0haVUdJeDZLY0FodG9jRWh3d0xJckxweS9WMXNnVHVyQUNkd2V6?=
 =?utf-8?B?NWtHNHQrRHd1T05ENnNFVnduSjU0S1Z3eW55b0o2NWZoRnZHeUdud3E2ZmNo?=
 =?utf-8?B?UEtRQUhYY3dSUFpVSTRSckpnMjVGT25zYVIvcGxLN0U5T3IxUnFreE1ZWEp4?=
 =?utf-8?B?VzlJY1hmd2hCMlBhQUprVjIrT1F6UnQ5VXBkeWx1TTF1bFBzZWk3NmxVMjk0?=
 =?utf-8?B?L1NsM1FRUlNPSG9QU09EdHFiRkZaS0RNbURNWmJFTzBZZE9RKzZoY3V5bjVO?=
 =?utf-8?B?dGNuaXBmbVd3NFhuYjhaOHRFaFp5eVV5YmJSekora21kdlFtVllhMVZEQ3FP?=
 =?utf-8?B?ZWFvVXJYK1RpejhEazZrdUpuZ0RoY1d5WHF5bWtpRTIzWmVKenU2QkEzd1hR?=
 =?utf-8?Q?sPfmEd2yAg5UVAPXu9+Fsoh2fmNYhT+G62AnESZk0iIr?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c349d3aa-3dc1-4bf6-2ce6-08de27185dc4
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2025 03:04:34.1550 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OpwOgKUh8+dlo76mzwrKqV1TNNeaJSIUZ4YI/6cttBCML3/D4toqTLOyqPOtQnXCQn2i8Q9+NWhcScbkGu2m+Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7839
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

On Sat Nov 15, 2025 at 8:30 AM JST, Timur Tabi wrote:
<snip>
> @@ -290,6 +291,15 @@ pub(crate) fn mem_scrubbing_done(self) -> bool {
>      16:16   set_dmtag as u8;
>  });
> =20
> +impl NV_PFALCON_FALCON_DMATRFCMD {
> +    /// Programs the 'imem' and 'sec' fields for the given FalconMem
> +    pub(crate) fn with_falcon_mem(self, mem: FalconMem) -> Self {
> +        self
> +            .set_imem(mem !=3D FalconMem::Dmem)
> +            .set_sec(if mem =3D=3D FalconMem::ImemSec { 1 } else { 0 })
> +    }
> +}
> +

After merging `ImemSec` and `ImemNs` into a single enum, you can change
this code into:

    self.set_imem(matches!(mem, FalconMem::Imem { .. }))
        .set_sec(if matches!(mem, FalconMem::Imem { secure: true }) {
            1
        } else {
            0
        })

