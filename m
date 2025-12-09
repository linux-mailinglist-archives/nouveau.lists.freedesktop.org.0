Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 013EACAEC2E
	for <lists+nouveau@lfdr.de>; Tue, 09 Dec 2025 03:55:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DD3910E33F;
	Tue,  9 Dec 2025 02:55:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="RvrJ/iK3";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from SN4PR2101CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11012057.outbound.protection.outlook.com
 [40.93.195.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDCDC10E33F;
 Tue,  9 Dec 2025 02:55:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l6h+fus4WmFLxnMNNKrDYmBeEDM331R7vNvu7daea3RiZLLGOdJictliGT7YSbwuIFkSBvTAfrPTctXuVPrVk9hvPB/M/hoRGg61jWzlu8F5rtLQ31qtM+9J0GeSMwBCfFGtYWL3jViOaH6FdCir8Zn/qjaJJxo/0b1rCLpowzyQWBIHtkK4EUIKPltQLawsJZuQcEy3/AdlDw8UH/2NOLpOrU3NmBov2yImPa2xlGr3PlY452ITS/280JKdmDq3wNm85qgeEfRyw87grC/KSGP9zyBp1wxGiZoPmNggo57TgRx6hgp0vx2KkLMM135zJjlyTwgolzpJ4TB18rhj2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WRrPE+be/1ClW2wtkhf1fRjPGSkkaBzCM8ormkC0bXQ=;
 b=q4BNjF9MYwUg1KJwdaVOOoM77BuqzqqsT7DnOMvVKPdcRLtmyhW/D7vdYVYunSZUhsWRYfrr4dNo4cwqnULFhWwmP5/H2B1zwyTKBsylLIJ8t69dqXN932LuGmCHdeu/3qibCxYowW8QWu+W1jcWF2PfSFO7yrfWCGHjylF02SNCkwHVTWekWbgWrVHc3Dvf8ZKXXuq0hcBKUg40WGTQbOS/+OIg8wGzwPwIxwkxaVSw+flna2zqaPFML7I2Mc14WhwwdvtYylAhFRU3FUb8cOgsVY9n/NbEBuRHBEefkVNP+zZndCR008n4gl3GKyICbo0zNLV+mB53kWQZhT/ETg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WRrPE+be/1ClW2wtkhf1fRjPGSkkaBzCM8ormkC0bXQ=;
 b=RvrJ/iK3bmOOix9AhBp6ZVPfUx93HtL+5hSYS9Al9DrD3k5FeQMlItq/1r1s39ojn5TSlKfGqGylDrmZ39oCA57XvpFf0Tc1FUPC+F7OyO8zRNxdL1L7v18pIA+qX32g9TscdeyAl/5nYTuZ55IHPvtVhzPpOQu+uT2tLNUpq0JeyCmHY+xfVqmpQyxA1GVP9SJar6qQC9i4BnIk6em3ASnKZ++SFqrQx/o+PPCiMQy6J39Abp25HgkHhpIMqBpi3s/7p6b11sBphzxtC6Sh/CAT9jIGslyoB2wR4hcZcdvkOVsx/XpCO4LrzjgqbYEVASNvL7ycwc0TU5Z+sPC6ZQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by DS7PR12MB6309.namprd12.prod.outlook.com (2603:10b6:8:96::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.14; Tue, 9 Dec
 2025 02:55:11 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9388.011; Tue, 9 Dec 2025
 02:55:11 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 09 Dec 2025 11:55:07 +0900
Message-Id: <DETCIGZTKDNM.ZE5381X7ZB8E@nvidia.com>
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Timur Tabi" <ttabi@nvidia.com>, "nouveau@lists.freedesktop.org"
 <nouveau@lists.freedesktop.org>, "Alexandre Courbot" <acourbot@nvidia.com>,
 "dakr@kernel.org" <dakr@kernel.org>, "lyude@redhat.com" <lyude@redhat.com>,
 "Joel Fernandes" <joelagnelf@nvidia.com>, "John Hubbard"
 <jhubbard@nvidia.com>, "rust-for-linux@vger.kernel.org"
 <rust-for-linux@vger.kernel.org>
Cc: "nouveau-bounces@lists.freedesktop.org"
 <nouveau-bounces@lists.freedesktop.org>
Subject: Re: [PATCH 10/11] gpu: nova-core: LibosMemoryRegionInitArgument
 size must be page aligned
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20251114233045.2512853-1-ttabi@nvidia.com>
 <20251114233045.2512853-11-ttabi@nvidia.com>
 <DECCV8XB5U56.1NBFD1KFJ59LU@nvidia.com>
 <b28cff274d79de78496c7f0fcc3627b2f816d3dc.camel@nvidia.com>
 <DEOK871CSNZB.W94R3SDUDZ22@nvidia.com>
 <df975795b0dbe58214ad302d7182ce6fe92e5fd8.camel@nvidia.com>
 <DEPIFZFMH34K.31NETCKSPOIEL@nvidia.com>
 <3c6219f90ca9e1d548c98ab1c54857a63a5d94cb.camel@nvidia.com>
 <ae07b871896b79e3d6180874dfb07d4d3aed4bdc.camel@nvidia.com>
 <DEPV1LDH9K7I.2GGJ4YQ6UMGMS@nvidia.com>
 <5c0eddd0aeb573ea7f73a285924acd1732a71c56.camel@nvidia.com>
In-Reply-To: <5c0eddd0aeb573ea7f73a285924acd1732a71c56.camel@nvidia.com>
X-ClientProxiedBy: TYCP286CA0187.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:382::11) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|DS7PR12MB6309:EE_
X-MS-Office365-Filtering-Correlation-Id: 34e11a92-dc1a-4fac-68e3-08de36ce5e60
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|10070799003|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?V2dGaDdzU3J0b29HZllPWmt0aTB4RmJXUmlhUnZ1dy85WlJLZEI3RXZXQ3ZL?=
 =?utf-8?B?NGN0d0lPbmdwOEsyS3duWFJJYU80bUswbTU3bTExMGFpYXQ0bnk4TnI0UUY2?=
 =?utf-8?B?RGovY2VUZ1FKZGo4NkR0REk0L0swZWpoWDJqRmR2RlZMdGRHcWxEbkJjcUpo?=
 =?utf-8?B?QUpybmV1K0VGbG9QV0EyTXVvcm5waVMwNk9scThPM1o1a3dzN0dPQ2lVdnRO?=
 =?utf-8?B?ZTBWdXB2bm1IV3REa2FldVgyUTdoSDkvUkNVQnNaVy9oOVJFanArMkYxM1Va?=
 =?utf-8?B?WW90bGo1cHBjeVg5QWFmN0h4ZWIvMERzRlZSTURrVW9GVVRna1Awa0R6Z2hU?=
 =?utf-8?B?WDI3WFdMS0svUGh1WXdaajcwdFR0YnFrWUtIYUpxOThTcFdvK0p5ek1jUEdF?=
 =?utf-8?B?SFdLTDBTbk1mQWF1T0JJZitVSHdXN1UvRHlaV1g2eXdzQ0tzRnRQVHRXMlZo?=
 =?utf-8?B?T3p5amNDN2hOSTZTVU9LM2duMFI5Y05zeVM1VTJzOWFUa1dJMjBSVnVoSXdD?=
 =?utf-8?B?UUlHd054MjV3OUttSFc5Rlo2ZFZzZG9qTitMY2NWMU9EM0ZMb3NwdjRzS01m?=
 =?utf-8?B?dXNKUHNqelFiODFnOWU2YjRhT1BUWE5wbXIwd01uRi8weW5VZXkveUlLU1Ev?=
 =?utf-8?B?eTlVRVdTdHNSdUJXK2cvYTZ0Zjl5N1pWaDUyL3YrZ0dERXpkZUtQMmJwMDRO?=
 =?utf-8?B?Y1I2czdSTzVKRWJvMXRCS2xqditaeDNEcGk4dEVRS1pMRFpEVmdOUGlSa1I4?=
 =?utf-8?B?ejdyY2liakdUeUN4YU13T0ZmMXpLZ3RPSzFtcm5aOVJiSWFkSkVqUW1FWmg5?=
 =?utf-8?B?MmtOV2VVWmRWekh4dTY5S3QxOEFOS01oazBkbUsxSm1oS1k3Qlh1YWtFQVdO?=
 =?utf-8?B?Y0crbDI1MFRVWmVUTTBkTHphd1oxME04M211S0x4MlFSVGtQc2FiL1JhS0xQ?=
 =?utf-8?B?cFBpT1cvdHVRZ2xHMGZsbk9OdzlmWmZWeEtxNlNrY1JBQTRVZURjM1RxL09Z?=
 =?utf-8?B?UUlsMnhLVlAzTzdCU3VGNTNpT2dyUWpISHVRdm9Pem5uU254ZFBBMGp6MGNu?=
 =?utf-8?B?cXo0bTRVV1pNNE56RHB3emdZQis4bzJWdWM3anIzMEwvQlBmVGRxRVYzcGtl?=
 =?utf-8?B?YmgzdXNqTEwrR3hlaW40SmxDejIrNERnbDk5VkdQUUZnK0VqRDFHcFVncllB?=
 =?utf-8?B?elZhQVhxNFNvb0l5Z2FPU3lkaSthSTNzSTA3aG00RlZHL1Ixa0pOb0gwZktZ?=
 =?utf-8?B?SXJQaC9LUWU4aDdGVlhsdGt4TXV2aDByWDBhQWc1L0M4emdzRkJ3a0E0ajZT?=
 =?utf-8?B?RHJYUjRuUkxYeEpJNHVrQ1BiWDM5TFBYVlI0RklQMDM1TmdYQ3h4ZElhQndI?=
 =?utf-8?B?WXYzSU5WeGsxR2VDbUcvM0t6L2laN3JHOWI1UWRiSFl2U0Z3YkR1U3E1enZF?=
 =?utf-8?B?U0VENm9xRHAwMElVY2pPdnZCSlB6YWNOR1ExUFB1RWVXeU1yNjJoQ2RpRDA3?=
 =?utf-8?B?ZXREYytKb1A2TGpXTWJVOUR0OVFBcDRxbUxMSmVTS1loM1AyZ3FJV0NYUDhW?=
 =?utf-8?B?eHU0Mmg4UTNyckFYVXZZYTZvUUdXNTRWUldua2pLQ0FmMkg4RHkrM3BLSG51?=
 =?utf-8?B?dS9Jc2M4Y2JZRjhETy9UdkJJTUlHS1JOZTJGZVR2Z2dCaDVCQW50dVJhMVEv?=
 =?utf-8?B?QmJjSUs5ZnZlalV3ZzcxN1I2YjNueXZsZTRGWmN0UkpCdndtVzhhZGVaT1ZB?=
 =?utf-8?B?Qnh3VGRSVUh0aWNVb0JxdFZpNno3b1RjRDIxZlhZOWZFOGRJS2cyZk1IOUtn?=
 =?utf-8?B?Y0FPTzhKbElQNUQyNzJPZXBPMGdUeDQ3c3U3c09ITDRtLzRtNUhIV09RN2tN?=
 =?utf-8?B?RFZobmVnL29Zb3hNZk9RYThMT3ZjS1Q5OWlLeUVTOFB5N0kzNGs1SnFlcXhX?=
 =?utf-8?Q?1OfSF7TfdwxhsSQ/7/WvQ9aJaPo5Be15?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aHBUOGJTOXhDa28yMGNZZklnM3dtY2JVTDhmQWJQUmozcHkxdGEvcGRaSkth?=
 =?utf-8?B?SHRNZHdXQlVVTUF4YWdYd0gwbjNXVEVRb2l1QmpjejVTZlVkd1cvV3JDeE14?=
 =?utf-8?B?MUR6TjZjejVReVZXa3NnTE9HajBDeGZZT3paVkxhbWk0em9XMXRlZ1ppMDhz?=
 =?utf-8?B?aXUwTHA1SU9vaHNrVFVmdHlCYmdtLzRGekNueE5tQ3EwU3VCdXFUaURoUGZj?=
 =?utf-8?B?M0NDdmpiT0xvVjV5c1lXM2dWYm9qbTBTaS8yek9DY0RrOHpPMEg3TlEyQjlG?=
 =?utf-8?B?ZDZzQXVhcHpQdGFaRjFabmV5dStxdVFaemJ1VXB6ZUdTemw1SHp0M2xKME44?=
 =?utf-8?B?Z2sybEw3QUQzTU9oUXBQQXF2UTdiVk1la3E2eldiT2IyYVVlY0hzYVhranRI?=
 =?utf-8?B?VGFlb2twaWJsbGpNRnNPOEtncTN5R3I5eTRwbXVLbytkOGtDaFFFdFBRVTZw?=
 =?utf-8?B?dWtQVGpUbVV3Ym81TDhyWHRBM1hUTThpRUJBSUNldlJJdVUrK3ZpSnJGLzQ1?=
 =?utf-8?B?ZFVUVTlrNkdhdzVId2VtcE11WkNTRnFjaEU5dFZ4SVhxUS9IVDIwTUtSMjZk?=
 =?utf-8?B?Vm45UStvQitKWkl1WWc2NE9IT1R1dDkzbUtsYWRZMjJOT3ByeFF4RnZzZ21P?=
 =?utf-8?B?NHJoRGJVei8xOFl2SzNyT3BNTGVaMnRHWE5GYXdreENVeWhPektTdXJ4L2Mr?=
 =?utf-8?B?Z0xWOVpOcU9ZZGJpS3BnVUtLQUsxSENDcHpZZ1BQZDBVRnN5ZzVsU0NvSGQ3?=
 =?utf-8?B?OEJuWWN4UDN2dU5OVUNYZjhUUFhtc0pLSGpVL1RtZmZEbW1hamhDRkcwL0N4?=
 =?utf-8?B?dkFwNHBQUjdCZjJJOGlQMVp0eHpzYnNVMTM5MFA3MG4rOGI5WmZLNDZ4RUpH?=
 =?utf-8?B?ckVGNm15bHNqbGxoWk4rcjIzeHI2RVgrTDZmd3EyUGxZQnlROUh4US82U3lW?=
 =?utf-8?B?ZitHRUhYc3YyZWFpd2p6Tnd6TDgwTGJUeWFia2RhMjNoQmlnbUJ0K1IvZFFu?=
 =?utf-8?B?OGV6VTE0TU5xQk9RdFV1OGtCSk5lWHVIUWVVL01TSmxXU3liR1l5VVczSDU1?=
 =?utf-8?B?Nk4vZUs3eW91M3lhZ3U3T0RyOVFSMmJTVkJLRmhNWnRPMXpOa3ovUmJxOXc4?=
 =?utf-8?B?OERvWHA3Y0FORzNBcitSS0Zyd3dmcXFGZ00rQ1ZhcTdTR1pPenkvbk1HUmRh?=
 =?utf-8?B?UC84UVgxMExPUGN0dmw0Z1VhL1VvcGhIbFp6a1pPNzhRd09SdEl2T2RSSE1F?=
 =?utf-8?B?UW42ajBNd2xvYmgvSEwxaWlUQlFNMTRRT1lVSUEyU2ZBajdXaVpvK0hjYzZi?=
 =?utf-8?B?WDJLaWFNMjFRT1hSRzBFSlN6YUJ2bW5VWUUvd2ZOSHBlK1J3RkhMUHNieFZJ?=
 =?utf-8?B?N2tFVk9TV215Vm9JMGowaTltc21HcEEvbFpEc2Q3Yk8rRG5GMGE2c2duSnRw?=
 =?utf-8?B?anFQSkV3bzZZM0tNam1Cc3BCOUF4aHBRNmd2VUlNeG4xR0xGbU51Vk9IUkNk?=
 =?utf-8?B?aXl5aG04cGExRjdXaTVGRlMxd2lCeFJUYmVjZ0phZHd1aWZjODVjcHVmVmxX?=
 =?utf-8?B?N3FOdGFxd2FYOEhtZjY2K2tKRUVvUEdvR21CWnlLbld6R0MwY0RnSytVNFZR?=
 =?utf-8?B?MUJianNQUXhFUVVmWjYxajdvWnh2SGs3ZHdDS3lpWjNpWlBUM2FkQVdCallj?=
 =?utf-8?B?SlVmaGI5RzBpOHJGdmwyYklNVXJET3JXOXhWVm1Zb1Nsb2hqM0cxTFFDbCtJ?=
 =?utf-8?B?ZVBFTlpRYXkyRW1TYkpocWVORmRKelVLSXVjd05OUG05YjBLNGkwYjMrc1Fk?=
 =?utf-8?B?K0VDSzZ3ZFdseGhNbGhiY3B0ekJNS3dkbmZ4RUt4U1hDOEFkQmVpRnlQR1BZ?=
 =?utf-8?B?QnJFNTYrRDhxVTRBSWlSbU9XYWRBZlhySHBJeG95czRaUGhoR2o4V3JiaGZW?=
 =?utf-8?B?NFM3Y3dObk5iZUFtdU90S0doWTdPdDZyY1A3Z1hDS0k4a3dFbldRVUhUb2dG?=
 =?utf-8?B?Tm1VT3VTcFBmWlFacGVCVWQ3bnRnU0FUZW1PdHB0OFpsS1JBVjk2YTVzY0lN?=
 =?utf-8?B?dTR0dXMweU9CL0RyVUpMMTlOTkVtclBGcS9yNGNRRXBwTjBaNW5FS3JvRHZT?=
 =?utf-8?B?RnROOXIzZFB1REFKWjFyaWtQV3pVNTlrUDlUT2xEejFhZHRET0JGUEJLU2hB?=
 =?utf-8?Q?k7D3+Nc+NTWwAS8siZZ0NGc3KxpZNVP7TjG87fSapO//?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 34e11a92-dc1a-4fac-68e3-08de36ce5e60
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2025 02:55:11.0692 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tPbAyADnE3C0AnM0OT4HGTITD3az2dxE2Bi07M+e9ybFwfXVKb1ejyQILySDxx5FmeijRJp1h4YNxsTV7Ig1xw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6309
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

On Sat Dec 6, 2025 at 8:22 AM JST, Timur Tabi wrote:
> On Fri, 2025-12-05 at 09:35 +0900, Alexandre Courbot wrote:
>> With one caveat: `new` now returns a 4K object on the stack, which we
>> definitely want to avoid. So maybe we can have a wrapper for things we
>> want to align the 4K:
>>=20
>> =C2=A0 #[repr(C)]
>> =C2=A0 pub(crate) struct GspPageAligned<T> {
>> =C2=A0=C2=A0=C2=A0 pub(crate) inner: T,
>> =C2=A0=C2=A0=C2=A0 padding: [u8; GSP_PAGE_SIZE - core::mem::size_of::<T>=
()],
>> =C2=A0 }
>
> This doesn't seem to work.
>
> error: generic parameters may not be used in const operations
>    --> drivers/gpu/nova-core/gsp/fw.rs:894:56
>     |
> 894 | ...::mem::size_of::<T>()],
>     |                     ^ cannot perform const operation using `T`
>     |
>

Argh, the good old "can't use generics in const expressions".

> I've tried different things and they all generate various compilation err=
ors.
>
> I'll just post a v3 with my version, and then you can experiment with it =
to see if you can get
> GspPageAligned aligned to work on top of it.

Sure, let me check.

>
>>=20
>> We would then allocate the CoherentAllocation using a
>> `GspPageAligned<GspArgumentsCached>`, and initialize its useful data
>> with:
>>=20
>> =C2=A0 dma_write!(rmargs[0].inner =3D fw::GspArgumentsCached::new(&cmdq)=
)?;
>
> So I assume you mean this:
>
>         let rmargs =3D CoherentAllocation::<GspPageAligned<GspArgumentsCa=
ched>>::alloc_coherent(
>             dev,
>             1,
>             GFP_KERNEL | __GFP_ZERO,
>         )?;
>         dma_write!(rmargs[0].inner =3D fw::GspArgumentsCached::new(&cmdq)=
)?;

Yup, that's what I had in mind.
