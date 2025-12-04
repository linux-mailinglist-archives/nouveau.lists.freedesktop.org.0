Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DF11FCA411A
	for <lists+nouveau@lfdr.de>; Thu, 04 Dec 2025 15:43:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96B3310E1F5;
	Thu,  4 Dec 2025 14:43:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="jUs5xYLV";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from PH7PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11010027.outbound.protection.outlook.com [52.101.201.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0704B10E1F5;
 Thu,  4 Dec 2025 14:43:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K9iXxSpXHRvergH2BWKGzFnE5SvM3RhgB7SKrOPzNrVvDbLM91h5UdNoSOA4PS2TY+XkmhxPMfB5eLuGtMH68KCK3UjwruYgSjAmhqU5lL27Ik+OKBKSUohdyWuk2JLrH406nfdMLm9VxAVHpTzr2ILHpak1AJ7om4lu7P+O5EECLOZi2qeGuT6zvjbkAJZg+k/O8Fu7aG004TWiuYb5aqUDsVPTID19gGlPk/o9mHyjbSNe0UW44j/NDdN5L/11syQrYIxhPvYh84urugSUseXQhbVNZd2RaN+58pqfNsr37C5UI/c0ia7miU+jWi4oynzodGlwBgWN13yojQVLjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EafrRPsEV/jPeTX6dXG0UnZR7uVfoaGEVRm+De5Mn6g=;
 b=xIn/vO94Mm4NNeyZ8AFk4ngEzTCCNBYYeRN80rFmzAUvjCDnHKbvXljk9LAUNquvLwRjVMpPdmqMQWPzb5wqSaEMAif78rfItIqWG1/0BGZCTRm7tbaNiT7qrQyxjhDxTiYAD18CWr154+y1bn+tS6OzL/N6XTz4xg4H7yAjjuBmuvs5H6Gy4GmtRZe+k05BcPPPd4keNk7W19CK5iDEJu/B+Ci1EemmGjCtQsWYYM2hHfZLqU0POoEQJXd6+KuBEjtnTljtRjW2bW9wG2pZqRRswRQOKDEmQOdqYj52nzH8Ma5FBMrj+zBvpZeXicJkkER9860Wffsh/4YwvP4i6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EafrRPsEV/jPeTX6dXG0UnZR7uVfoaGEVRm+De5Mn6g=;
 b=jUs5xYLVcAGpbtlPlFrsv1GJ9qHl9D4daax0kIeVcWaXvp3+Czd2to1TTXMWEjTNy/LnLvjQvh/Xh5uOwJfwXMupHuE1qBxBylnOC7oNesRpcGxFQdXVAixxgMbvXuxZmV85Mm7XJxzF/T29MOqwVr6Wvr+c5bMZ6DW3YdHiS6Amn9eQdNJQtX6SPRcwbKPTN5mBbNR+6cqErNIT/HnhS8QDnuTNQWql4y223UTgyRmauGL2bzeIEKri6s6XSQlPF3kgtGknvH4SSF1yjJSR52j2wsnl9yl4lmLZLFAr8k2ko2gLwdc+pflj7hajTEg9d90RmjGdiN4zmsVX6PP5Aw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by DS0PR12MB7769.namprd12.prod.outlook.com (2603:10b6:8:138::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.11; Thu, 4 Dec
 2025 14:43:24 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9366.012; Thu, 4 Dec 2025
 14:43:23 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 04 Dec 2025 23:43:19 +0900
Message-Id: <DEPIFZFMH34K.31NETCKSPOIEL@nvidia.com>
Subject: Re: [PATCH 10/11] gpu: nova-core: LibosMemoryRegionInitArgument
 size must be page aligned
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Timur Tabi" <ttabi@nvidia.com>, "nouveau@lists.freedesktop.org"
 <nouveau@lists.freedesktop.org>, "Alexandre Courbot" <acourbot@nvidia.com>,
 "dakr@kernel.org" <dakr@kernel.org>, "lyude@redhat.com" <lyude@redhat.com>,
 "Joel Fernandes" <joelagnelf@nvidia.com>, "John Hubbard"
 <jhubbard@nvidia.com>, "rust-for-linux@vger.kernel.org"
 <rust-for-linux@vger.kernel.org>
Cc: "nouveau-bounces@lists.freedesktop.org"
 <nouveau-bounces@lists.freedesktop.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20251114233045.2512853-1-ttabi@nvidia.com>
 <20251114233045.2512853-11-ttabi@nvidia.com>
 <DECCV8XB5U56.1NBFD1KFJ59LU@nvidia.com>
 <b28cff274d79de78496c7f0fcc3627b2f816d3dc.camel@nvidia.com>
 <DEOK871CSNZB.W94R3SDUDZ22@nvidia.com>
 <df975795b0dbe58214ad302d7182ce6fe92e5fd8.camel@nvidia.com>
In-Reply-To: <df975795b0dbe58214ad302d7182ce6fe92e5fd8.camel@nvidia.com>
X-ClientProxiedBy: TY4P301CA0095.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:37a::17) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|DS0PR12MB7769:EE_
X-MS-Office365-Filtering-Correlation-Id: 19f6c2f1-a70b-4abf-aae3-08de3343797c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|376014|366016|1800799024|10070799003;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OG9yazdaQzNkRDAvTUFRdGZyWG5OWTVuT0FRd0tLelQ1dmE2N3dUWkVOVHda?=
 =?utf-8?B?ZytYYWZOeTd0a1JGaDRFeks1M1Z1UGpQY2RJTDVyVDRxbW8vVUlGMUZHaXRK?=
 =?utf-8?B?V3hZVHlKL3RCZ1pBZFBaK2MwdmhTdnB1ZCtFNCtSVFc0dU1aNGZDQ0NwRGlT?=
 =?utf-8?B?UTVicndZNVV4YndTLy8vSXZBaEErL3Z3TlRWR1pDeVNEelZHV3lsT1d6L25N?=
 =?utf-8?B?V29aMEd0VktOMi9rbGdJRWw0bkdGQm9nU0Q2eS95VXRjY1dIM3dpSmZ6WkYv?=
 =?utf-8?B?ZHdzeG1OdFZ3b21qSWJ0TjROMjNlRmYrTDZ3SVN0WVNwaEJGWDIyTlVKcVRh?=
 =?utf-8?B?K1hrdFFBUU5QR3RPaUlHeU5tT2Y1RFRERWhac0ZkMFJSZHRKUUhtSjZDNGsw?=
 =?utf-8?B?RGF4OW85dzRqVTNUV2xCL3NhSmRTZ0tRaWQ5TVBUT3pnUXpZWVBXZldheUxG?=
 =?utf-8?B?QzNWY3VweGFzVGR4VXJpUmtCMGtvL0tEclVWQ1ZIWXB1c09WL3pIN1NyWElB?=
 =?utf-8?B?RHg2MGZRZXF3VGNSR0lmcEpXa2ViN203NGJxUU9qNzVDUWNScXRWQzlLWDlB?=
 =?utf-8?B?Um9nekptY3RLMUVXNDdSOUVLdDZGdUJ1S0ljWFgzaFJ1WHNFSnRxODhFU2Y1?=
 =?utf-8?B?WGZKa3htVEtKRHdIVUd3M3NoS1hwRzQrM0F4TWp5WVVUWmIxN1lnU2luM3RJ?=
 =?utf-8?B?N0dwczZHTS9QbEZJYkxjT3lRVm1SWnZIZjBoWDNRbWdkcWxtNkRSTUpVUEJy?=
 =?utf-8?B?RmsvM2lML09WejFHT3ZDVWI2K2xDL3lFMHFkVmJoVERnY3VtSXh1Mmo4V2g0?=
 =?utf-8?B?Q2xWdzFTYW9EdkZUV3I5cnBoNW9vS1dPVXNBSndZajJyNk1KTDRTb3cza3Vq?=
 =?utf-8?B?Uk5xbnZEQUZIN2VLdWtjS0pDM01Md0hHOWNLQlM1ckZ0dGJYNXhjYXkzN0xv?=
 =?utf-8?B?ZXZ5M01vRjR1R3JvUE5FNVVuNzJyTFNsNGwwZGxkVVZsWmFHZ09DZUZOK3NB?=
 =?utf-8?B?dkdQMGM3ZGlscHp4OE0xaWF3bll0TktiSlMrL095WnV0TnJGUEZTdUNYcGRO?=
 =?utf-8?B?MVNYTUxRY0lGQ0tvQTVIdURrVTFsOFpaajdiNmhQNDArcGZML0R3THVseVhD?=
 =?utf-8?B?MHBvYVByTk1lWFdFT3hlN0s2WEhyS0MzbkUxVjZTSnNQZlNYS0tsRmJpMFVJ?=
 =?utf-8?B?T0lUQnVZL1BHQytVT1NkNlhDMDh3dGJ1T0NDTy9jb05yU1VxRGNwWFNUeHRS?=
 =?utf-8?B?TjBlL1d4YUptck52b2dFQmRqMHRRMlQzb2lrN1puOVNKU3oycVg4UzVUR0d0?=
 =?utf-8?B?S29SQ0xXRlZTaXlWS2RnallPNW1mNmVFSE5EUkdIQ3I3SldJa3JGVUdrbldP?=
 =?utf-8?B?dW5pNzByWVRSamJlcHBqbUluSjJRMzd3YnpTNmxnNGV1ZU5xYkU2SFE1NGVH?=
 =?utf-8?B?NEJ1UWdrdXpzUGlxTCs1dHlFVE1JWTU0MW82TXBNVzZCbjZta2tNeVN5TGN5?=
 =?utf-8?B?c2dPZisweGZXZ1h2K251bjVuWUdNMzRWTFRMcWwwQ09PaWd3M2dJdEhwYUxt?=
 =?utf-8?B?ZjlhVDJVZ01qOW83bmVsaWxiZG1tNmJ2ajVRaXRNTHFHL0NzdDZoamtuU0ov?=
 =?utf-8?B?WCtLMjFFTGZiaHN2bklhWjF0czB5YzRDT1c4bmFzZlJNaklocWpKekliZmtI?=
 =?utf-8?B?MDNRTWdtMzg5Ym91c0oxdENCMEJFekdybnV4UnJsOXlDQUtrcTVGNjRoRnF2?=
 =?utf-8?B?dWs3a2diK3V5SGtlNXpwajVUOThHU3hxWFNFZ2VuaUdvbUJ5cjZMNllQTmFV?=
 =?utf-8?B?OVhxcFdhcCtQYXRWaEJETURtTW00Ty83NzRXOHU3UGk4RVdWQVhHSm1JZ0NP?=
 =?utf-8?B?VUwrSDNwaU05TnBQekVOMlB0dzJTNGJCNDdwRjhObzNKc2pybWdnTEoyNmhO?=
 =?utf-8?Q?SdoZcXAZmtPJ/wd3hSRI94VTWW1/9fY+?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(10070799003); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TTZtMnZWWDFxUDRYZ0RrTkxFQk9GWStHbWNVb014VDYrMCtVR3gzNHgrdEwx?=
 =?utf-8?B?bjlkdGxxMlo3NzRGekFvb1ErY1loT1huMjJGYnZ4VGF3eUhldVQ1c0NORmg5?=
 =?utf-8?B?U3o1eXVETk5uR3hqUW9GSHVUNUhNb0lwM1FCNVgyWENyVHluRURXQ3l0bG16?=
 =?utf-8?B?T1VtT1JEYVB6L3U4bGVSMk5jZUtyM1RKcHlHUnpiSkJEYWtOYjNkZkFkd2tI?=
 =?utf-8?B?elVrSEJLRm1zOEk5VEdpcE1ZY2Zsa1ZJai9MRk5xUmRnV0ozc2psbURQQ1Y4?=
 =?utf-8?B?bm4ydzJJaGNkNmd5Y0l0WkthNUVSNzNaVTZaN2o2REFPTFJoYlJFZVFqcEdk?=
 =?utf-8?B?VjAzU1krcnhPY3RnMEtjc1RHRWZ2eEl1dzRuOW9ROGxRZlVMSTVxc0prRDMz?=
 =?utf-8?B?d3dscGh4clhjUis3Y3d0UEs1Z1RkRHl3ZDJ6Q3FFY2g3YkYwQ1JKQkU4eTlQ?=
 =?utf-8?B?anZ6cWE5MWhaclR6dEhtY3BycFY3SGd3ekRGM29JT25LeW84S0JXMTV1OUts?=
 =?utf-8?B?ajNkak9veENXN2xSTDc3TWtGdURvamF1MUtTR0RKOVBjMUVsT01NVlQwbEZh?=
 =?utf-8?B?VmVjMlRjUGZHTW03SURvSmhLOG1LYjc1QzAxZ2kyVEExL1gyWFU2NE15dDVx?=
 =?utf-8?B?c0pQSzNqeFhINjhFSmFtTmlzRXZIdUVwd3AzQjZNbUJQU0lvL0V0VEJzVG9l?=
 =?utf-8?B?VEZlSkVyakFUaXBXTEVXclpHVXpUa0FncXdOM0wzbEZoUFpZTzFKeE53cktT?=
 =?utf-8?B?cGltSDFISVBldmZwQzZnZndNRmhXMkg2d3JBei9ucGFGc2pmOVFvNDl3b29L?=
 =?utf-8?B?SkVCd1VDVTlMZ1VOdGlCSTRXYlNON08vWGdPRTYzUWpWQk5lOTJidlgxZU9V?=
 =?utf-8?B?OHZpSkZjOXY4SXlZQ2hkZFcyMCtPMUNnOURhVTRmZnNJbUpOVHRuNUxrclF5?=
 =?utf-8?B?WldENEtGNDB6Mmt6VGtRSEN1WHh0STU1RWtQY21QOHI5OWlBYzk1eFllRzA4?=
 =?utf-8?B?SW1ZOU9jQnZFKzNjSkxxc0tsSE5FZmh1cjdTWHlxVXlkTkFJS1pzbjNjbGVK?=
 =?utf-8?B?NFM5VXBscVFCVHBhS0pRQzhRUlpwdFAyV0FDdGZrOFlYcG5BK1J0bGtzWk5q?=
 =?utf-8?B?Yjh6QVNWRUFDZ0ZtaFVFcFJDaWhxZlh3VzdqdFlVQ3dXeGRzM1BZV0VPQkRZ?=
 =?utf-8?B?UUF2RmUvbWs5dHl5dUJ3OStja0J2UnBuZFV1UXkwaHV3WVJ2WW90cW1wZzh2?=
 =?utf-8?B?dmw2OWNFWTZyOUJNdWhzdVAya1Q0MTVBUG1icHNCbDdIZUJ5Vm96TTVydWMy?=
 =?utf-8?B?aGFGS1hHVnV6dlFsV052SUozSWhuVXY4REFzZzRkRFJUWURPbWJyTlJ5cUxG?=
 =?utf-8?B?d3A0TlBwYi82ZHBHZTdRRzhhYklDUVFrVDlNQzRyekY5NWZJSnU3cnRDZGF3?=
 =?utf-8?B?RCthN01BeU1iSUcxcFpLSlNCeEtwYm9hajhGZ2F6RjYrSXdvK2pIQytiRHBK?=
 =?utf-8?B?NWs3UHluWjRiMjY3ZUtxa3JWZnVvRkNOa3U0YVJNT2prb3d5NXFKakN6bFhu?=
 =?utf-8?B?OXBsclg4VWpJTG5XZzJya1JNU3Y1SDFOWDNTUFFyY1MzcEcxMUNJS3E1MitH?=
 =?utf-8?B?VUNVemMyUVhqclhmZEgrVFJoY05JeTlQNWdkT0tsbUFJTW53ZHpVKzFXUDcv?=
 =?utf-8?B?eDh3TTZEM2FkbVh6S2VUVWRBVXc2dHFYeDBIK09CL1l3N3lGcmNETFNUZmRJ?=
 =?utf-8?B?WjRsbjVQRklqYXlVeE1VY0RUQk9scTFyUENxUVZwak04UkQ1NEt3WnhjMFY0?=
 =?utf-8?B?MXZIZ3VXdkdtQzUxZ2VKQ3ByRGZIenFqMUI5WlB2cE14emk3TlBjMmgyYVUy?=
 =?utf-8?B?TGhpMmVuYjdVR1c2TUpaVHRrQ1BtakwzMEZOMGl6L0l0Um4yWTdPbDQ2bkpS?=
 =?utf-8?B?ZEY3ZFMycmRDdmszSTdNWktKUTFNdlZPcTdXakdHekIza2Fqb1dYMldhV3BB?=
 =?utf-8?B?eVV0cXFZWEI1SFAzNEIybmkxT0IrbVdWOTBkaWZYZkQvQmdINGdVamRWL3ZY?=
 =?utf-8?B?S0dtdFZCM0xwZmpsU2lZejB4K2xJeVUwc1oxMnVVRU1BYU9QK1FvYitMWSt1?=
 =?utf-8?B?eVJUREcyZkVyL1ZEeTBjc0lXVVYrYS9qbm1UeDhISHJHbkxncnVRKzN3T3BK?=
 =?utf-8?Q?BnjhGgCA0aAPhEgeaiCDFsQi6XGturyY6ML5U75i1aLS?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 19f6c2f1-a70b-4abf-aae3-08de3343797c
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2025 14:43:22.9590 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: N96iarhf/hZSw9KvB5YLZyqM/8Q46gW0mOEVLUKyy3/2Znk8WSl2RQGjPV7Dw5142TeEqCW3dGzdAonvc5F4Ww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7769
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

On Thu Dec 4, 2025 at 3:31 AM JST, Timur Tabi wrote:
> On Wed, 2025-12-03 at 20:54 +0900, Alexandre Courbot wrote:
>> On Tue Dec 2, 2025 at 8:25 AM JST, Timur Tabi wrote:
>> > On Wed, 2025-11-19 at 12:36 +0900, Alexandre Courbot wrote:
>> > > You can use the `Alignment` type here, as the rest of the code does:
>> > >=20
>> > > =C2=A0=C2=A0=C2=A0 let size =3D num::usize_as_u64(obj.size())
>> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .align_up(Alignment::new:=
:<GSP_PAGE_SIZE>())?;
>> > >=20
>> > > Now `align_up` returns an error in case of overflow, that we will ne=
ed
>> > > to pass down to the caller by changing the return type of `new`. It =
is a
>> > > bit annoying, but better than the behavior of `next_mutiple_of` in s=
uch
>> > > a case, which is to panic. :)
>> >=20
>> > I see your point, but these are u64s that we're talking about.=C2=A0 T=
he only way next_mutiple_of()
>> > can
>> > panic is if obj.size() is greater than 0xFFFFFFFFFFFFF000, which is no=
t possible.=C2=A0=20
>> >=20
>> > I would say in this case, a panic is preferable to a convoluted error =
return that will never be
>> > exercised, because failure here indicates a coding error, not an input=
 error.
>>=20
>> The input data is a usize, so technically we could get an input that
>> triggers that error.
>
> Actually, I still say it's not possible. =20
>
> Say I change the code to this, so that .next_multiple_of is called on a u=
64 instead of a usize:
>
> 	let size =3D num::usize_as_u64(obj.size()).next_multiple_of(GSP_PAGE_SIZ=
E);
>
> Again, the only way this can fail is if the allocated object being passed=
 in is almost 16 exabytes
> in size, which is physically impossible.
>
>> I know it's a very edge case, and clearly indicates a bug, but the
>> general rule is: don't panic the kernel. And in Rust, if possible, don't
>> even let me compiler insert panic-handling code. If you don't want to
>> change the return type of the method, then maybe use `unwrap_or` and
>> `inspect_err` to print an error before returning e.g. `0`.
>
> How about this: if .next_multiple_of(GSP_PAGE_SIZE) does return an error,=
 I'll just assign size to
> obj.size() as-is?  After all, at about 16GB/second for DMA, it will take =
about 31 years to DMA all
> that memory, so I will have long since retired before that bug shows up.

Please allow me to commend you for doing the computation, that really
cracked me up. :D Maybe we need a `ECAREEROVERFLOW` error code for cases
like this.

And yeah, you are abolutely right, but my point was more about not
having the code to handle panic conditions generated. Maybe I am
thinking too much ahead, but I dream of a future where we could make
guarantees like "this function never panics" and have the compiler
complain if it does. So as a matter of principle I like to avoid having
these, especially when they cannot happen in practice.

So something like using `pr_warn` looks reasonable to me as a last
resort.

... or maybe we can address the problem differently. Reading your commit
log again:

  GSP-RM insists that the 'size' parameter of the
  LibosMemoryRegionInitArgument struct be aligned to 4KB.     =20

sounds to me like "it is a bug if `size` is not aligned to 4KB to begin
with". Could that be a correct interpretation?

Because if we align up past the valid data of the object, then what are
we copying? Granted, `CoherentAllocation` will likely have an aligned
size, but that's a lucky implementation detail. So maybe we can just
downright return an error if the size is not aligned, which would solve
the panic problem.

Or we fix the problem when allocating the `CoherentAllocation`, making
sure the filler data exists and is zeroes, and providing a valid `size`
from the beginning.
