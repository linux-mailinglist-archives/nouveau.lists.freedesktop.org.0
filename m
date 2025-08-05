Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3429CB1B3E3
	for <lists+nouveau@lfdr.de>; Tue,  5 Aug 2025 14:59:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5799910E26D;
	Tue,  5 Aug 2025 12:59:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="nAFbkXxm";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2079.outbound.protection.outlook.com [40.107.92.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE35810E26D
 for <nouveau@lists.freedesktop.org>; Tue,  5 Aug 2025 12:59:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fi4NS0vyw1cQHGUf62uhaTU1bdfTd4pWiQekIxykXgI1FhWOmsIR+rIpd7SZ9YZTkFbK5vTDdwWbmkSo3HjtZd3T+zXD2LBAKzbskSd4xSLLsI91vRe+EsBOEMyyXcVy0JmooLACvBb3/bhjaqEDPElHlTz/TuK0uY8GkdO6S333JcHX3Bh+9coAE30VFtSdjykGimOpMS+Qd9cnWhZNBM09TXWADCvc+BAvUVkIHUDkqA6Z4d7oPK9Iv73AMGTXZI55YRsl0POrTszZwQ4XmBn7XGHJdsyKBh69wwXUFgTbnovib+IvPcbMnyGr7T21uIlSaiLIhpFXumIH56S/SQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CiHuLuajGNpuptdKrHKQPLbZQvumyyxg8W1FCEPVb/g=;
 b=wQ4rR07d45BsrkZkpihgGf1IWSKsykMMvwsqrSt6ISF16N50qs66/x3zhOpxmGqqV9xogYfpRrwFUEVA34Iokg/Q6rEFVxoGiv/d1vce+1R5yOkjYF3Ou8Ul7Y9JkmdkjBhF+wxqjWrQAC0DzSvrMkoE6Ps1AjifweWQ/6ul4NnNg8Gzq60fO/8OS2mdIYB2GlKUCfPF2Qr/Frprc82a5p3kZJAEOPco4lyNq3O0FfECDGkSsNsAeB9Yq8UkmK6E1aoz9w2egHz8G8OJJLKhYCxV0I9WRH/zq4FmOc9wHNc1V+R6XBPIZDKfhS5tmTqPhoRSI4SSvQtlJTKJrPVOAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CiHuLuajGNpuptdKrHKQPLbZQvumyyxg8W1FCEPVb/g=;
 b=nAFbkXxmRz5JEyHWq+sQJULj9yBZ3vzm1YPLdhiOR+JMkpp+2Awi79IoePH4OX7R+ZEM3ngTqr03OkS55ZHGDxpWTCxAdX2AHTad9szckaGTjfs85d+xtBB3dltGtbjWjboN9rbjVEnLYHPuYZ+OudEX2vR9QCLyF72UkClaDWlkh2XfcRMiQ9TJYg8LMGX6T7ul+0EX272HniBpBsNz4ELGydgeFb1FJEidMhNE2qYNqGBLWUpt50Jlf7EMDgPxBkkGTPJ7bP59aWtfyYHiALiTUqIDWrtsP2tRfHK8W/OtZ35KPua24yrVkFA+Btq92lRq+mRKbWTD/s5Tvs6tdg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by DS0PR12MB6605.namprd12.prod.outlook.com (2603:10b6:8:d3::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.13; Tue, 5 Aug
 2025 12:59:35 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%3]) with mapi id 15.20.8989.020; Tue, 5 Aug 2025
 12:59:35 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 05 Aug 2025 21:59:32 +0900
Message-Id: <DBUIGLIA3Z09.2XZSEM3MW7C6N@nvidia.com>
Cc: "Miguel Ojeda" <ojeda@kernel.org>, "Alex Gaynor"
 <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>,
 <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>,
 <nouveau@lists.freedesktop.org>
Subject: Re: [PATCH v2 1/4] rust: add `CheckedAdd` trait
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Daniel Almeida" <daniel.almeida@collabora.com>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a-dirty
References: <20250804-num-v2-0-a96b9ca6eb02@nvidia.com>
 <20250804-num-v2-1-a96b9ca6eb02@nvidia.com>
 <395DD2D6-CCCE-47C6-B195-20091382195C@collabora.com>
In-Reply-To: <395DD2D6-CCCE-47C6-B195-20091382195C@collabora.com>
X-ClientProxiedBy: TYCP286CA0324.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3b7::12) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|DS0PR12MB6605:EE_
X-MS-Office365-Filtering-Correlation-Id: 8ed07fc3-4db8-4b52-ece0-08ddd41fedac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|366016|1800799024|10070799003; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?V29EdWx6cDM3U2VsakIxbDNoQ285QThNSjlRUitrM3N6WVZGU3Y3SXhXVE1R?=
 =?utf-8?B?L3FGcGZJU0F4RnRjbnNwS29OQWJJSjhpZWs1MmlNSjhTS1hjK09rckQyWENW?=
 =?utf-8?B?WHVuZDkvNXQ1MzlPbk5HVW8wWEEyMUdSSk1IMUdlR3JhVkNtZ3JpeFBYdUQ2?=
 =?utf-8?B?TkpzNE9BSzIwWWR6M3NSWGhjZnRkYUNvYzloQmttWlQ3T0YwSkNuZHk3SDB6?=
 =?utf-8?B?OUFwb0tlN2hjeHh1My9nK1lnMWQ0OFFoTXZNZHlTMWVxRlhvWWo0M0cxWGMv?=
 =?utf-8?B?MUIyMWRoS295MjZwd2ZkZ08waHB6dUc0V3NCZ2ZLeWVNTDdzZS95eXN5aHBT?=
 =?utf-8?B?Y2Y1bjJ6dWpPNVMzeDlmVWpWaVQwZ0hmdnRqdXRKUENoS1JNeG4ydVpQSy8z?=
 =?utf-8?B?ZXlCVC9NNkRFVys0TWJ1WTc4OWk1b2U5dFZ1eTdYZTkzTHZiSVZtMjZUSkpG?=
 =?utf-8?B?a2g0OU5MbVk1M1pLZkxFVjhuTDVwM0VtbmdrTlNsZDhlc1EzRVhDVk51di9t?=
 =?utf-8?B?NkVNWGR5VGlnVFRRbzQ0VUNsUkYraVdpV3MwRGVHenRrdzAxczIyVDVWdmtW?=
 =?utf-8?B?R2x3eUpEYythWHJkcHJhak1qRjQ1eXdSVDNZUnhPNTZpd2RQQ0lzTFpyZHkx?=
 =?utf-8?B?emV0dHBNdzNpSVJlWnFRVFhyaWtqVHRjcFlTNFpZSlU2aWtjTk9pMEZLckhH?=
 =?utf-8?B?WWF2bWJnblh3N2dKM2h6bVVzR3RYbmc0NVkrSW4xNG9JTldPTG1pSGEzTFlJ?=
 =?utf-8?B?M0hSY2RLaVZLRVpMRmEwU3RmR01aOGdoM3h0TlNlbENNdlZlMEp1Mmh4YUFr?=
 =?utf-8?B?REU3K3RlVkJyYlRaWXpXM2xMUU1ZN2p6OC9DQzducUFTQUt5RXFkakdEY0hR?=
 =?utf-8?B?SGo1NnBMbHliN3l1UVR2NDdkVi9SNEJzTGFQWngxVTlSc05sdE90TDdmZWpn?=
 =?utf-8?B?ZkJFdzNueXpSWVlPMHBqQXA0eWVmRUtMMm14U0o5dGVUWnp6L1BtdzNwRno0?=
 =?utf-8?B?Mm45UyttRmVVUlZ2WG1sdUtvZ3pTcWhWbHlaUnlUd3J3SkVuL0ttVkhBYXRj?=
 =?utf-8?B?U3d2eURhN3NOMlRxTHdMNkRNK3ZBYUJhNk5oZXJkcldWUHRQV1JQakJSYTRn?=
 =?utf-8?B?M2VENmMxcmE4M3dLaC85Y2FIdE0wdWZ6akErb3h1bTRndS9OeWtFc2RjdHpO?=
 =?utf-8?B?clYwRXI1cDZyajkrTlZBQjRhSGwrL1QwUmd5WnNyUWxER1EzOWp3S2pteEhx?=
 =?utf-8?B?ZzJ4OXc4dWtJNkIvUXdnYk04azJSaVVObU1kY0N5c1ZsTkdSZXRxeHZLSFF3?=
 =?utf-8?B?eUwvOGNaZnFqcTc5NEp3L2dNbHAzaDJ0NmRRNTFxZlVBSnU2TS9vUUdldWRS?=
 =?utf-8?B?TVVOM1d6SG1DS0U3SFJkWlpJdU5NR0ZUeHgzMXpQNVFQY0o4dHpyUHhYUm56?=
 =?utf-8?B?M1ZMdXdXUjZQSnNjNVBwaE9ZcTc3UG91Wk9kSWRiNlFuMUVRR09lbjFoOUFR?=
 =?utf-8?B?T2VWTXR0bS8rUmZtTVBlZzhLRGs3K0gzWFNhMWxpSWVDTjF5bUpFVmRZaUFm?=
 =?utf-8?B?dXpBSHhYUDV6Zms4OGk1TndHMmlsK0s2ZVMyNEI2b2VwbXloaUdqM3Y2YTU2?=
 =?utf-8?B?QlRsM0xONG52alM0bXJ5TGo3aXczamVSSU5nczJCU2hPT1VPMGZGZGVQVUpW?=
 =?utf-8?B?T21LVmlyT044Qk0rOE9FWGJnWkwwOFVoU0tMVk45WlBkSXhuRDY0Yko3Y3BU?=
 =?utf-8?B?Z3RkTlRHQWRERTlQaEZ5UDl2eWhlK3cwL3NBeFVTK2pTckJ2M0V3NW9LT01V?=
 =?utf-8?B?aWxQRUpidnpkblgzaUhLcTVmMDhDOFN2QWVIam1LWGU5YUo0TXlEa1hzQjlp?=
 =?utf-8?B?c2VJM0xKd2h2QlF2anR0bS9nZlpneDF2cDkydlJQai8vOVgzSzdMaHZuWjhM?=
 =?utf-8?Q?mP597BDR1L4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(1800799024)(10070799003); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SkdMTHdvYmVQRlprRmdrK2ljSlJURFIxUFo2dDFyQWVKTXlvM3dUYlBZVys4?=
 =?utf-8?B?TDVRc0xJQkJrMlNra05jdTErL0g0MG8wc0IwNjB5TTIxWUF6TFNsa1pmMzVz?=
 =?utf-8?B?RUpEWXI0MndiazFIRVpmYTh1WG0zeWhud1lNaTU4WkxCMmNqK0NaMmg5d0s1?=
 =?utf-8?B?a0dRMHlwYXk0WWJvYTBvYUdtNDNURFY2VVp3d3h4TzliOWloZHFNNVdvd2FL?=
 =?utf-8?B?OElEK1hHM3l5OEdEaDFKa2xlZGpPVFkvNUFSTlhYR1Q2WERoNHBYVWxDQjQ4?=
 =?utf-8?B?Mys4cmZDNWxIbTRhTnZxb1Z3VExRdHdTems2aU9JanhmL2ZXZndCcmdQSjk3?=
 =?utf-8?B?emY3REc4dDladnNXUjhIQmtaZUlWWTZjMmtJZzVJNmRQYTNyWUZ4ZzFsT1RE?=
 =?utf-8?B?WVhqRVlLaWdtWXJkcm5HMXRicUQreVNKZFp4cUJnTGRjcEVFZ09xY2xCQzdZ?=
 =?utf-8?B?c1lrdVcxbFd5Lys5L2NMbk9CT3o5VDc1Ylg5MlVlOWYveW5CN05OWnBjb3lE?=
 =?utf-8?B?SmVpYUdLejkzZGtCR1dVZWVWZWZmU0M1djBRemRMdStBcTVoMjd1enZ1R3Yx?=
 =?utf-8?B?YStkZXR6RGhZcnZ2VTZiY0lpRkluWEc5OE9kRkVaY1hRZ0xkenJCYjNCMzFx?=
 =?utf-8?B?R25LcUg1MDBOMjQ0Um9kdkRlMCt3MFZZaE1BVGFyMkJHQXU3a0NHeEhyN0My?=
 =?utf-8?B?UE1ibnFoSUdHVDZ2S2pOQ1RkZlZXSGdXTkJFeE9XUnUzTnd1bGFML3hucnNH?=
 =?utf-8?B?SG01SmpIOXlDbjBsaEFLY3k1Zy9jeUMyWEp1REhmYk01Z2pEMUE0UklEVE5P?=
 =?utf-8?B?Wi9YakZlOXhoaDZIdm40NzdSOGNNbFZkQlR6QnprRzJQMVc2LzJQZEVuZkpB?=
 =?utf-8?B?MHRjTWhJRXp3WWVFSFdpL25qV0NXS0ZGbWpKS05lVFZXejNjeXRaSFdZVU15?=
 =?utf-8?B?d0hFejNKSTNwM0VtOEllWmtad2lkbFZRc3htcnVOcnNyLzVnUXM2ODVNVHdK?=
 =?utf-8?B?akxVUll0ZmlCK3NWbFgrcU1vYlUzZWJZa0M3RDh5QUFkaDlDR2tFMzhSYnpx?=
 =?utf-8?B?SWFJSVplOS9wTVlQQlU2OTFQUzlORm9lRkFzemQ2NlNjNGlOUVVNRzlMYnNI?=
 =?utf-8?B?djNBTG1Xcm40VE5SN2NKYWQ2WDNTTEV3NUZLNjEydHZjRmJwUVh6Z0ZXTSts?=
 =?utf-8?B?SWdYOFJ1dUtzc0lpUkNJNENObkZPZzFoU284U1hyK0Nrc0lZdlN3dFVmSHMv?=
 =?utf-8?B?eDVmNmFyNU1NN2Uzci8vQ2tuRnRKU0U5bWU5a0FjWGt2a2VSVmxaVzNRcnBh?=
 =?utf-8?B?ajFJQVVndmV6N3FqNFZUdXlEcFZOVENpN3pmSGdsM3VzMnhLUStmNWdsYTJh?=
 =?utf-8?B?WFRDV3lVVVEvd2RyeU9hdDV6d3RwKzZ0VXZrVmluRGQrWklWSnYxTE0wOXJQ?=
 =?utf-8?B?RnBpZXFMT3JVeHpGb1BBZHR6NWZseFZlV3RJWU8yeS9BbkRvbEFudmFHZDJt?=
 =?utf-8?B?RnhNWHNjRGJvU25LWVJmanBOSkp5Wng3R2p0Q0NoRlBmbldyMWl5d2lZV29S?=
 =?utf-8?B?V2orUVJ2VkM1Zk56eE9rK01uRENXWXpDMVB2aWM1VmxocHFuUmZnOTY1QkRi?=
 =?utf-8?B?TmhwdC9GOTVNYi9HdXRxTTBUWUNyakxFeXJCTGQrcGovbitrVE9KZ2trNXVM?=
 =?utf-8?B?SHpFa3hIMG5GQllXNm1FM2lYR0lMM0tMK3pNcDduQVBXazJpMzFwQ3RKRU1S?=
 =?utf-8?B?eXVKSkJvSUVGZFI1VDRETXE0VW5HRjh0YVIxZGFWS1FGNm1XU0MzbFVzVng3?=
 =?utf-8?B?N2U2Uzd4TVo5Vm9DQUdLdFg5cUFFTkE2b041VDJjaFVzNFNyNEtiREF2N2kz?=
 =?utf-8?B?bkFzKzhJNG9aa1JOK0FHTXVyTGIvby9ZVWwzRjljdW4ybVpuclhLeUVqamxD?=
 =?utf-8?B?TFppbjhRdFY2cjUyNUdLTWNwMW52TkpCbExYa0Jra3FnMytqV0tyelFsZk9V?=
 =?utf-8?B?V0VCMTZqSUxlU2g2VGdycUloN0tTMk0xcm1TREp4VGIxTnlmUlNZRVRMWXRv?=
 =?utf-8?B?OEFTZnFOQkRWUXp2NlFudm0rbTBiQ2E2RjFuYjJ5Q0hEQzhGR0xxd3YzajRv?=
 =?utf-8?B?bmlYNk5xcytEUlFIYmVjeEpWbnhlNWFvSnpDOVk1RmlidzdVSmlZU3VOMElN?=
 =?utf-8?Q?cUKi9KFtTKszH2BCQZMQU1qq3fklGb6eIDz16A3CTXzI?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ed07fc3-4db8-4b52-ece0-08ddd41fedac
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2025 12:59:35.4661 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: u+rRc1RuyX9yxrvoY8GvySX/VD6AM9m76JE5M9VFZyVOne8s6CLzhnxfPQ95dmfZ4axO6lsqgRdFVwcpYZbzdg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB6605
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

On Mon Aug 4, 2025 at 11:37 PM JST, Daniel Almeida wrote:
> Hi Alex,
>
>> On 4 Aug 2025, at 08:45, Alexandre Courbot <acourbot@nvidia.com> wrote:
>>=20
>> Rust provides traits for standard arithmetic and logic operations, but
>> in the context of the kernel we often need to consider overflows. The
>> checked Rust arithmetic methods are unfortunately not behind a trait,
>> which makes them unavailable to generic code.
>>=20
>> As a start, add the `CheckedAdd` trait providing the `checked_add`
>> operation and implement it for all integer types. Its name and location
>> are inspired by the user-space `num` crate.
>>=20
>> This trait is to be first used by the `Alignment` type.
>>=20
>> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
>> ---
>> rust/kernel/lib.rs |  1 +
>> rust/kernel/num.rs | 28 ++++++++++++++++++++++++++++
>> 2 files changed, 29 insertions(+)
>>=20
>> diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
>> index 6b4774b2b1c37f4da1866e993be6230bc6715841..2955f65da1278dd4cba1e427=
2ff178b8211a892c 100644
>> --- a/rust/kernel/lib.rs
>> +++ b/rust/kernel/lib.rs
>> @@ -89,6 +89,7 @@
>> pub mod mm;
>> #[cfg(CONFIG_NET)]
>> pub mod net;
>> +pub mod num;
>> pub mod of;
>> #[cfg(CONFIG_PM_OPP)]
>> pub mod opp;
>> diff --git a/rust/kernel/num.rs b/rust/kernel/num.rs
>> new file mode 100644
>> index 0000000000000000000000000000000000000000..c81bb046078b70c321dd52aa=
9c2b5518be49d249
>> --- /dev/null
>> +++ b/rust/kernel/num.rs
>> @@ -0,0 +1,28 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +
>> +//! Numerical and binary utilities for primitive types.
>> +
>> +use core::ops::Add;
>> +
>> +/// Trait for performing a checked addition that returns `None` if the =
operation would overflow.
>
> nit: this can be [`None`] instead, which will let users click on it in th=
e docs.
>
> This is of course pretty frivolous.

... but correct. Thanks.

>
>> +///
>> +/// This trait exists in order to represent scalar types already having=
 a `checked_add` method in
>> +/// generic code.
>
> Maybe =E2=80=9Cscalar types that already have a `checked_add` method?
>
> But overall I feel like the whole sentence is a bit hard to parse, JFYI.

Let me rephrase this as "This trait exists to model scalar types with a
`checked_add` method in generic code." (provided this trait survives the
next revision).

