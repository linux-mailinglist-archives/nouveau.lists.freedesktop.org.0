Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F80AC87983
	for <lists+nouveau@lfdr.de>; Wed, 26 Nov 2025 01:31:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB07E10E4BB;
	Wed, 26 Nov 2025 00:31:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="X2OVYCw5";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from BL2PR02CU003.outbound.protection.outlook.com
 (mail-eastusazon11011069.outbound.protection.outlook.com [52.101.52.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34A7A10E4BB;
 Wed, 26 Nov 2025 00:31:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o6/P8ke+8uAlEzynqHaEjBaQ4oHFwJWrm/vy+JPFHKhd38FAiSCPQ5PnvBJnsYTmeQN+nB+htO9YuA1iuhv/aNG8y9/zwhRx1//ry6raT782fb1OvdvjmULry0mHWyuNp1/emCrypxxU0kuIgvjlsH+mcUuZ6JvON8KNSUVvm/HMBJ+4j1vUV8WoeHPs5RTtJEsre6o9fSHbpQuB5kF6SN7+YTwhD85poMlC/ZgCsAYNXHsl1hp/bpboWFu82BGCu8+9yozJXCF1rMswYRlFzJ2Gdmzb3850UK8UnCV3OJHhZIK6QwQzq+It7gW7gCgrGDtg35bGwTVcxN/FNqk1bA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MPJwKUnxWBrRdCWwRkPOEPj2Jl7FZRXCzELxXIHGYUY=;
 b=XSV1Wsz4RojJjslNSGea1nRE9Ysq/MACQNbhqo4ZOUts1EAEyf1BtI4DSHx/bLPihiss6R5ajsb/uOqZWkx5iiYyM/pMLezo+FEVQ3Zs0RWJhrOZjoNO25JqQZx/iPMv2yfUKiy9/2nZWIgHX260WSJl6CplUN8seJiF4x3deSZcRgoUz01uZumHNGiORaL+Uzq6jO1dXJJlnhd9JzpAvZv1G6Yzj3jjoOvUxPXiqVZlthWALv24Eq0TbP4mr/C0KOTZUlXdA1AJdI8vw/bK+6Z2gjrosz10UVRBYvSDAOpY/DeIs6lm/83JAiT88itGh4nx0XAk7YIijbQYuhOCXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MPJwKUnxWBrRdCWwRkPOEPj2Jl7FZRXCzELxXIHGYUY=;
 b=X2OVYCw5LgE3af19uAC+EKV/M5iBfem4+yBEifcDo0qEgPsdPeDMTIry8lbEbP5AzIxUPWAawjwo4FSwyPV73dLIitNYOkv6dY1tlFto8BaY3EsV6mjvUa9Z/EupRfekLZYVUgE9Jt76+nLc7MRPcVwPjoL4cl7rLNlPw0d+swTMR4k+knJ5W0eEevAWtHPzLZboYkFDLNjdPnaBDDy3wsp7n+/hU8Mb/qEIth4ItD4xCdnyoUycvtT28uOej0TeM4PgLHbOhG8WLCz26nTtlTP70oM0ymUNGyLoeGrIAMcNVgeagVzCk3q6/gMAJ7LDcTfI4Xzb8mfS+lzyUe/IAA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by CY8PR12MB7195.namprd12.prod.outlook.com (2603:10b6:930:59::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.17; Wed, 26 Nov
 2025 00:31:51 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9343.016; Wed, 26 Nov 2025
 00:31:51 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 26 Nov 2025 09:31:46 +0900
Message-Id: <DEI7BMSG3JTC.1Q0OZIUHCK4ZM@nvidia.com>
To: "Alice Ryhl" <aliceryhl@google.com>, "Alexandre Courbot"
 <acourbot@nvidia.com>
Cc: <bshephar@bne-home.net>, <dakr@kernel.org>, <joelagnelf@nvidia.com>,
 <jhubbard@nvidia.com>, <airlied@gmail.com>,
 <rust-for-linux@vger.kernel.org>, <nouveau@lists.freedesktop.org>,
 <brendan.shephard@gmail.com>, "Nouveau"
 <nouveau-bounces@lists.freedesktop.org>
Subject: Re: [PATCH 1/1] drm: nova: Align GEM memory allocation to system
 page size
From: "Alexandre Courbot" <acourbot@nvidia.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <98227EBD-92F7-40FC-A5A4-3FF3780FB2CB@bne-home.net>
 <DEHUHPU6WQ1E.J19KGDPIHN09@nvidia.com>
 <CAH5fLgipNtk7=ad1dFYMDEdKL5b4LxnewU1w+WgAU0QLa-3C6w@mail.gmail.com>
 <DEHV24KY55H3.16CA6ALYGJ68A@nvidia.com>
 <CAH5fLgjUzryZubjfUPfNc_beE80iiptebAcTyFi25OzZkTKR8g@mail.gmail.com>
In-Reply-To: <CAH5fLgjUzryZubjfUPfNc_beE80iiptebAcTyFi25OzZkTKR8g@mail.gmail.com>
X-ClientProxiedBy: TYWPR01CA0026.jpnprd01.prod.outlook.com
 (2603:1096:400:aa::13) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|CY8PR12MB7195:EE_
X-MS-Office365-Filtering-Correlation-Id: ffe535c8-ebb9-4334-ef22-08de2c8330f2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|366016|376014|1800799024|10070799003;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?U3RoSEJ0bXpmM1grRjBGOW00aDcwY21SQUxoOEZ2Y2VxbnVKYThZL1N2Y1FB?=
 =?utf-8?B?dysra05FZFFFQlJMQy9WMCt4azdEMzNMV1NPR2QzRWdURE9wQlk3VWE4YTI5?=
 =?utf-8?B?TDFMUjMyRU44RzhyU01GY3paQk1JSS9YblJhZElnN2IvWHpSNDVRWXlkZzU0?=
 =?utf-8?B?ZDkrUlBiL2RnNVlTZFVFSU8rcTkzU2xGWjZhL0tlY3VLUmlrYVNNazduNERS?=
 =?utf-8?B?Z2g0blg5Y1lOaWVUVXdoZzh5c285dVk4T1Bpa2JLckIyekk2S0tOaVhYYzNI?=
 =?utf-8?B?UTBIdHpKRzREMHBpNWZUOTFRYk5aU3pCMnVTRU9VU3NudzBkakRQck5wOUZN?=
 =?utf-8?B?d3lsVm13SWxGOGZTWEJtVGxnNnQvanVHbTJrMmFPaDJFbFFkNFhhZGh6TUIx?=
 =?utf-8?B?Y3NIZS96VVplenhJOTJzWXJxNnFXdk9QRm9RaldrdnhQS2t6WTBnOGlRbWxl?=
 =?utf-8?B?TDlkWXFmVHRhU3hkSTJOUzdLRkJVelQ0eDk5eGo4UE1HN0V4OTdNNWQzTUJi?=
 =?utf-8?B?dlFGMVhoMUxyN200cllEcytDVktIRTZMeFpNRFFkSkpmY2N5QmhmZUIzbE9a?=
 =?utf-8?B?L0U0R3dGaUtDb2Y1Q0NKeU12dGprYnNyeVYrMnEzNllpcnFnU0tJSjhNOEdX?=
 =?utf-8?B?T2RwZmhoZ3dFSTBIcUZXY2RDdjIxYzNJRFd2MzdJRHc3MWhZQmc5bXJ5UmJ4?=
 =?utf-8?B?aGtna3lKQVMra0d1QW05MkJGQzByQTUvZHlHbkhZZ1ErMDU2djVGWktTY0hC?=
 =?utf-8?B?QzloVFJTOVVqSkJqbTkvbmI2RW84NzRic0RFR291eWdZZUFOSi9oK0ZDVVEz?=
 =?utf-8?B?R3pEOUZpU2pYNEVMTUtzenAwS3hidTMvd3hPaG5BTW5keWVacHRCSmgvQXpM?=
 =?utf-8?B?cDdZRGc0SkFZRDcyQ1M5VU5tZVV2VXo5Y3lINVhrRHJ2RE1lQU1xVS9tNWk4?=
 =?utf-8?B?WFdzTGwyNFZ3bUtxYW9EUklMRzNJcDUrZkpiN052bHlHYXNtaHlXVjVrTEhK?=
 =?utf-8?B?Q0RPa2kzb0N1Smh5bXE5WTg1dkZZNHd4ZU1yUVpDclUvYWMxb2R3WS93TkdZ?=
 =?utf-8?B?b3JsZFJJRk9zN1JPeWcvemtkWjZONUUyam4xUC8xaTg1N3dJNmkwdSswOGYr?=
 =?utf-8?B?NExHS0diYjlhbWV2N3gzUXN2WW5sTExiTVhUQ0FuL1l3UE5jWVJ5KzhBdUFx?=
 =?utf-8?B?T1o0bDFhcjFjSnAyM3BhQzdMSmtIUm9Lb21FVGVWU3NaYzdVUFhlVjZFUGsy?=
 =?utf-8?B?YW9QVWo2a0FLRUhtZ2owTUIyVXlRMGFjc3ROc3hzVmZPeUdzOVUrbzdZdDRs?=
 =?utf-8?B?TmZOT3FJaVU3N1ZqQy83ZmQzMU55RDJ1NE1hNGFwQVlqcjlLcUd5SVFERXZh?=
 =?utf-8?B?c0cyY3ZVZEgrV1pmbXg2SjV2MWZOaU9jMW9SSkFNTVB2U1l3eStCRW00VDBO?=
 =?utf-8?B?RW50WTZZdmJiYWQ3aXR3eHIwakdrZHlLRkorZ1FLQzJBUjFDTVoyVFBabVVU?=
 =?utf-8?B?cldUZGU5amMvKzRKNUFwak1WWVArMXYwTWoxQiswQVFOL1lKeStrbWd5eFNB?=
 =?utf-8?B?d2FpQndwRDRKNUFUdGNZb2R3N2Z6ci9pUWtnUnZJQnJwV2svV0F4OGlTSWFM?=
 =?utf-8?B?VEdlRzhjZm5YeVpoQ0J1bVpIbGNsSE5SeUVrNzM4dG9FSDFsRDhIS3M4SVc5?=
 =?utf-8?B?RkZ6Tk1vQlU1Qk9nZnhKampwTWgxNC91UzJNbVJidEhlRjVDd3ZxSGJIeGlh?=
 =?utf-8?B?SUI4dFZPbHZoVzdGWktOM2ZhQmVwcWhucVViUzZDTXZXT3FNZW9zZFhzNElL?=
 =?utf-8?B?Q1o4dTdNdHpVRG9TUXJMdG1CNzRrQktZL0JOdm5MSUlIbE1qcjRwOHZmQzUy?=
 =?utf-8?B?eVZCL1RDc1YwWVJjQ3hxOCs0WFBVd2tDN014M3NmdjZhd1o2Z2xMcEtvdEkx?=
 =?utf-8?Q?0xTu79cPOjI2NMvzS6bDxU9++TDny/N8?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(10070799003); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K1EwMC9uenp0YWpiM3F1dFQ5aDYzSXpsNlpEZkI4bHdWdmd4cXlmbG1lS3Yz?=
 =?utf-8?B?Z0tvQUxwZEZ1bkpvZkprNUNwaTRXYkFleHkvditVRWlCTzFzUzF2a09ibjVW?=
 =?utf-8?B?S01SVTNwZG1FWC9DbHVYeFpsaUZYWCtGSkFDbkd3dzJrTkVSUGxHRXdHYjJ3?=
 =?utf-8?B?WTZhOTM1THNLUjB2SWRiVC9aemFRNFYvdWVnQzZjazNhcDhGQWptT2p4MG1N?=
 =?utf-8?B?WWZOMVNiNC82OFhPMTlnd2I1V0d3MkR4TUxkMzlwT0tacndMUXhDQ0cxSjJ4?=
 =?utf-8?B?T2c2ZTJvZEl4STMrWnB4YXhGSTJZUUQyZ2RleE1OUXhKQThDNGpFUVVibGUv?=
 =?utf-8?B?dEFwc05wblpVczNPaXhVU2JESTF6L0ZEdis0cjlaVFMxdFFmWHZuWFNIVU5z?=
 =?utf-8?B?WmFqSnhnWGNkVHhnWmhaUzZxTVY5TnNCK253RUtaa3Nxa0MzdDIwcFc2ZG9E?=
 =?utf-8?B?d2ZIbkw3UHYydmRTT0dIUDZtSng1Y2dzbU5ENEhkRmNvdHNSNWlJQjFaZ1dP?=
 =?utf-8?B?dE9ZVlRhNFlQRnAyRGs4elVsVlZpRGxHOXN5V2pEaFpWZjdMNGpUTmpESFNC?=
 =?utf-8?B?SGk4V0loeWhFa1lEN29DQ1g2YUFVRGVQSEkwVWVtUHBwdDlHdlR0TjNNZkhw?=
 =?utf-8?B?VlA2bUhMUHZNU0JSK09WeDlJdWg0RlJ4YmZYbElQcmJxZDltQXF4dDFzdys3?=
 =?utf-8?B?eWg5ZkNRODRwaHNtZmxRN3RDV2hJc1dwZGVaV2VndExHK2NRVmJPU1lRTGYx?=
 =?utf-8?B?TTd6eVdFdWVMSjNhUEU4c0NUdFUxcHNPVkRsdDFGdGFOL29WckVVYWJLOXBk?=
 =?utf-8?B?d1B6QmFISlV0R0o0YmRUWnNqNDkycmgyTmJIZ2w3RUx5a1JQSHcvemtGUm1I?=
 =?utf-8?B?VjJtSi9yYU9iVWZSeklJQ0xvcHArd1hGQmdJdlRCZUV1NDB5cTl1UUd5VUdE?=
 =?utf-8?B?M0xDUDcreHRVRWRpcHV0Z2lRQzByRkJIeVQ0ek1rYXNiNkNLWFFLRFJjY2J3?=
 =?utf-8?B?L2hSYXNCVnVWTklNU2Yxc0xyMDJ2SzJzeG5NQVQydjVsaEdFUG5Mb3QwZWVJ?=
 =?utf-8?B?VXJnYzdjY3NzT0puSEtNUE5YeDB4K2tOcTRZSm5XR0ZBSkpRcmJzR08rYjNx?=
 =?utf-8?B?NmFGenJmMllOT0tjeWJUaTRHeEZhcWZ0eDcrRmN6Wng0WDNmWkg1Tmw3KzN4?=
 =?utf-8?B?ajE2aWJUSzdPdTZreDVQRWFyL1Q1Uzd0UUhiOGlhYzhHaVFPMDZtRVQxdm9m?=
 =?utf-8?B?SFVVVEVUMldYOWtTSWRocUlmcjhZRU1NV2RlMXFUNHEvTUhoRWZKODZYc1VP?=
 =?utf-8?B?TGQ0Z2dYYnlUdVcrSFJFMlNkM3REU3lOOHdobkZKNlFZV1RIL1pmbmhJaVFw?=
 =?utf-8?B?OTlaWkthc0plUm4vM1FKcjQ2RGxlQ29NNkt1ZTVLc21wTUN3N3BONmpSM0Vw?=
 =?utf-8?B?WDl6WWhibGkvM2Q0WVluMm9rb3FTV0hqdnRSSDR1UUZYQU9Ba0Z0S3hNRzRI?=
 =?utf-8?B?Y1YzZlkwY21SWEFGSExBSVJqem5Jcm9PU0lHTXdPZkZoY1dFQURQY1Bqak1J?=
 =?utf-8?B?NjRZU0pHTTFvUExjS3RObXJOR2VBT0JuUFcyTm9oWUlTL1pmMC9ML2pzM0VH?=
 =?utf-8?B?Rm1Sc3RKbVBrSmgvQm9VNHN2VDJUYk45cE15K2QwbEs0TUdVcFlXcWc2RlUx?=
 =?utf-8?B?VzhZU3c0SGNDM2QzaVBFNTFrVTI5MU91V2lNU2k1ZHhVREtGb1BVZWQ0RU1q?=
 =?utf-8?B?RVZONVV5V0RJZDRIZzdFdkN5cExOc2hLL3c5a2xHUUY2SkFMS3ZiQXdNMDJS?=
 =?utf-8?B?NDZEbThFckZua3R6Y2hZdlBrNmNhTE9xK0tZdkpjb0IrcmtUbS9la0JKVlBz?=
 =?utf-8?B?RE5tMi96eUFaQVdTNnBla1pMajN1YVFaY1dVd21Oc1RKSVRjdlAyaytnVUhn?=
 =?utf-8?B?M2tjVnJONys2b2hFK2hzQkUySFp1a2s4dGVuLzhmZEViN3BrMlpheWxrUnNL?=
 =?utf-8?B?VFczbXZsS3dWemU2RzByZVlUWVhOZGpQaWx0a3Z2WUpMMllMTi9XWUFZd1RN?=
 =?utf-8?B?U3l2eU16TjkyZDJad0doaDBpTlZBRGRRQy9JOTRyeUFBa3FFV21PaUdOTHlX?=
 =?utf-8?B?QWNtNFlJdmpmWlRXU1dadjkzZUdROVp0Sjh1aVB1SjFRM0ptMUFabVJzOXRY?=
 =?utf-8?Q?cAJ1LbZlP+zS1krqog9PnHpv6RnvhkepgQWTLknaisLR?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ffe535c8-ebb9-4334-ef22-08de2c8330f2
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2025 00:31:50.9484 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4tT/0y6iP5KDiF2dIWukZeFCIxbLszZb+B8U3nTK7U0pqrTu9618GeSNsXNwlXSQKtE/UQMkJOBsKnWB6fFTHw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7195
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

On Tue Nov 25, 2025 at 11:59 PM JST, Alice Ryhl wrote:
> On Tue, Nov 25, 2025 at 3:55=E2=80=AFPM Alexandre Courbot <acourbot@nvidi=
a.com> wrote:
>>
>> On Tue Nov 25, 2025 at 11:41 PM JST, Alice Ryhl wrote:
>> > On Tue, Nov 25, 2025 at 3:29=E2=80=AFPM Alexandre Courbot <acourbot@nv=
idia.com> wrote:
>> >>
>> >> On Fri Nov 21, 2025 at 1:04 PM JST, bshephar wrote:
>> >> > Use page::page_align for GEM object memory allocation to ensure the
>> >> > allocation is page aligned. This ensures that the allocation is pag=
e
>> >> > aligned with the system in cases where 4096 is not the default.
>> >> > For example on 16k or 64k aarch64 systems this allocation should be
>> >> > aligned accordingly.
>> >> >
>> >> > Signed-off-by: Brendan Shephard <bshephar@bne-home.net>
>> >> > ---
>> >> >  drivers/gpu/drm/nova/gem.rs | 11 ++++++++---
>> >> >  1 file changed, 8 insertions(+), 3 deletions(-)
>> >> >
>> >> > diff --git a/drivers/gpu/drm/nova/gem.rs b/drivers/gpu/drm/nova/gem=
.rs
>> >> > index 2760ba4f3450..a07e922e25ef 100644
>> >> > --- a/drivers/gpu/drm/nova/gem.rs
>> >> > +++ b/drivers/gpu/drm/nova/gem.rs
>> >> > @@ -3,6 +3,10 @@
>> >> >  use kernel::{
>> >> >      drm,
>> >> >      drm::{gem, gem::BaseObject},
>> >> > +    page::{
>> >> > +        page_align,
>> >> > +        PAGE_SIZE, //
>> >> > +    },
>> >> >      prelude::*,
>> >> >      sync::aref::ARef,
>> >> >  };
>> >> > @@ -27,12 +31,13 @@ fn new(_dev: &NovaDevice, _size: usize) -> impl=
 PinInit<Self, Error> {
>> >> >  impl NovaObject {
>> >> >      /// Create a new DRM GEM object.
>> >> >      pub(crate) fn new(dev: &NovaDevice, size: usize) -> Result<ARe=
f<gem::Object<Self>>> {
>> >> > -        let aligned_size =3D size.next_multiple_of(1 << 12);
>> >> > -
>> >> > -        if size =3D=3D 0 || size > aligned_size {
>> >> > +        // Check for 0 size or potential usize overflow before cal=
ling page_align
>> >> > +        if size =3D=3D 0 || size > usize::MAX - PAGE_SIZE + 1 {
>> >>
>> >> `PAGE_SIZE` here is no more correct than the hardcoded `1 << 12` - we=
ll,
>> >> I'll admit it looks better as a placeholder. :) But the actual alignm=
ent
>> >> will eventually be provided elsewhere.
>> >
>> > What about kernels with 16k pages?
>>
>> The actual alignment should IIUC be a mix of the GPU and kernel's
>> requirements (GPU can also use a different page size). So no matter what
>> we pick right now, it won't be great but you are right that PAGE_SIZE
>> will at least accomodate the kernel.
>
> In that case, is PAGE_SIZE not the wrong constant? What's the actually
> correct constant here?
>
>> >> >              return Err(EINVAL);
>> >> >          }
>> >> >
>> >> > +        let aligned_size =3D page_align(size);
>> >>
>> >> `page_align` won't panic on overflow, but it will still return an
>> >> invalid size. This is a job for `kernel::ptr::Alignment`, which let's
>> >> you return an error when an overflow occurs.
>> >
>> > The Rust implementation of page_align() is implemented as (addr +
>> > (PAGE_SIZE - 1)) & PAGE_MASK, which definitely will panic on overflow
>> > if the appropriate config options are enabled.
>>
>> That's right, I skimmed its code too fast. ^_^; All the more reason to
>> use `Alignment`.
>
> Alignment stores values that are powers of two, not multiples of PAGE_SIZ=
E.

Isn't PAGE_SIZE always a power of two though?
