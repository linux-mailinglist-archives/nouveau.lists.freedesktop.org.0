Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C5D8B1A0AE
	for <lists+nouveau@lfdr.de>; Mon,  4 Aug 2025 13:45:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E368B10E445;
	Mon,  4 Aug 2025 11:45:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="h6BGnned";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2047.outbound.protection.outlook.com [40.107.220.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D166C10E445
 for <nouveau@lists.freedesktop.org>; Mon,  4 Aug 2025 11:45:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LkSlnbIKdTOzKNRHhDZt4kinHxs6tbGM1zxLkPt3sXcxGsc4Y6C9kLJ2vrexLykYCM0SWqoPZgfFTR2RQNIVFpgd5dk+ZSvNQhRd+OM9hy1i37OS9tpgzT99w+HOP9I/kkCcuN73UCX7iZgYwBLKsOLgwS4rM5w+Z69UbbJqgffN3vmEOMoz+KcJaTF5bOgVCr+3KGq8J2GLA3prARpI+kFpDElYp4EaTDK1A/zWIDrQrSv2NMF/7/aMSpPxHR6Pkh1cMO/TKbEqyEfE2Wxe+zPTEtDH+VEGkl4uVHeykFx+6juUcfh1XaX/gVSAwsyp1UGHI1iC3tsI1aV927N0Ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2FYGVmSkFDhJhxgA9KVszDuELPp34tiKUPp68dK5VbY=;
 b=YcZy6hrzwhBmkTfY8qif/ssIr5qXVPirpX5+yXRlhapQyKCRTtIb97m22AOzdFyBlpn+lLD4w3YZ8h3hy7mnglU64iIfJ4oGKZ+BisOf6biDizdPLMsQzr9/fbs+mejWX9sVuHbfDK6ZFjiNVsgLrcPCZacjrVc7tHffR/7HUqZQIm2OxQCDi+Leu84+tjeR3ElBQz6o1X13tHhpr7rU3z0IeP35dSk7nmw/k8MNSjVogQe/pba6QQG3lf368CxFsOBtlqk6fOpGNhN0lCprkDF0cnjY1rtMhjJbzf9ptNTrJxBOxHojhrVi577JjfxLOx4DgMwLKij/WMzYaokr/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2FYGVmSkFDhJhxgA9KVszDuELPp34tiKUPp68dK5VbY=;
 b=h6BGnned7yZlbi5cJrpe+OQCEeu0CKlZHMFYGEfvdTOTSRKaGapnsP3kg3quIjgZ0cu8GmQMQAFEgejQ2Qf8PmEIsEEPkxeBCDxIhX7rQRDqpPM8WsfnTldORIDQdov2r44aUASOinQm1g/s8mg7HD5RgRIGHfWxJhXwNPV22lLAqZUD36qwy/oRTBxoGXLe4FU8F3cPckOofappAHUPR+lLono87x2hFGxcp25dyforfw+GRX/1umJp923ApEB7YNIsD+wZzM6J9B7lYtKU79g/PUtk6DgpZqZ0Q37/B/awnQDLo+ZOwQWZG/iin4VtTg+OCqj6fPP+NGex/n8zrA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by SA1PR12MB8841.namprd12.prod.outlook.com (2603:10b6:806:376::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.21; Mon, 4 Aug
 2025 11:45:42 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%3]) with mapi id 15.20.8989.018; Mon, 4 Aug 2025
 11:45:42 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Mon, 04 Aug 2025 20:45:25 +0900
Subject: [PATCH v2 2/4] rust: add `Alignment` type
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250804-num-v2-2-a96b9ca6eb02@nvidia.com>
References: <20250804-num-v2-0-a96b9ca6eb02@nvidia.com>
In-Reply-To: <20250804-num-v2-0-a96b9ca6eb02@nvidia.com>
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 nouveau@lists.freedesktop.org, Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: TY4PR01CA0084.jpnprd01.prod.outlook.com
 (2603:1096:405:36c::11) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|SA1PR12MB8841:EE_
X-MS-Office365-Filtering-Correlation-Id: 2383e9d7-fbd8-41af-281e-08ddd34c70b9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|10070799003|366016|1800799024|376014|7416014|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OFNuNmQ3OWdGcUUvNW9YNlVmdEhCZi8yQ2l2OUhKQVNRRnhDVjcvZUJFRWRR?=
 =?utf-8?B?Z015TGR4eUtHL2lIQ2Z0OGRFcDJCOVljYzJuTXpwTFAwWFd6aVJNUDhwZnJF?=
 =?utf-8?B?TG13QTA5dm55TEtYODZKdEdZUm1vRzhKRUxSUjl0cm5XeXRQalJPaW56WXpL?=
 =?utf-8?B?TnVRSkZTSkFXWFdOK1hlS2VRYmYyeXc4YmN0K2lteUFzVnlVcW4rcjBDTFlj?=
 =?utf-8?B?MFh6SjVCT3o2c3hPU2xkdStXSjBXSEI2UHRaZUhwcWlFdk5aU1IzYUpObHUr?=
 =?utf-8?B?emJyNTh5QjJ6enQ5VWlTWlRHMW5STG9BUVlmNzRzZ3czVjhiQ1RyV3pKTjJz?=
 =?utf-8?B?c3M0WEJGaFFpRjR2WXV4YWxRVlY1cVk5TnNWTzFoUk93Tk9abkVkbG82WnVS?=
 =?utf-8?B?L3locWlVbUtVWURmWkg0YUlJc1VNSGs3a0pYRjdNOEpEaGowcmd6dmhLQXpI?=
 =?utf-8?B?L0cyemJib0U4WnVVTStHcnNhUkNqTVA1aDlUa2hPVm1Hdm10M3RNS1M4Wm1V?=
 =?utf-8?B?cmFQUUVpRmpSNkU0enRNRVcwNHVSTkJ0ZDlEVUNQY3A3UFd4OE50QW9mSTI5?=
 =?utf-8?B?SnZ5WkxzQ2IwRzdJUDErT0pOSkw0SHVlWnBtME1TNThVWXllTHRMcFIwN0d6?=
 =?utf-8?B?QzZ2ZXlob2lYZHd1MzJJSXpkZEgrVXpkSSsvSE5UNlBrOW9rcklQZDc3QVlu?=
 =?utf-8?B?NlNvalJtZW43Uldac0ROUG16UHNVUTNvV3JtTDNid0t2Uyt5N2h3b3BKa2FJ?=
 =?utf-8?B?RVpZTWxvRWpZUlEyRU1aUktqQ1F4OFVpYTN1bWtrTXlabGdRWkZ3VXNjaWc1?=
 =?utf-8?B?M3lhSU5saWExTWZFVXFwc3NNZVFjOXIxNCtqZGl2all5ZGlVQnFCcllDc2xw?=
 =?utf-8?B?S3N3aXJoZ2lNWHljSVNvRmlHa09qaWR0UVdjb0I5Z3hMbHlHRklMSnhuNSs5?=
 =?utf-8?B?a3FwWlFpTy9DNTdlRGtmSGhtVjc3TXBVWHBOR2RNS3VyMjZuOXB4dzRUd0NW?=
 =?utf-8?B?Qy9SekhtTk95aUZWYmdiN29sS09MUXloSm9IQitrUnZ4UFQ4K3dETmpWSXlQ?=
 =?utf-8?B?MjBKajFKdmFzaEloakY5YnJrQVFXeFgyKzdyd3NFMG8rdEJ2MCtha1EzdXdu?=
 =?utf-8?B?TnczZ2cvMitHMHRrWHJvMmlEUXg3eXJONEhXTmZxRjRrT00xMG9nWlo5c1Zo?=
 =?utf-8?B?cXFoRm9TaUVVWmFrZHRaM2RWQVFqcmJuZTJaaXlsTDR1MWJaenMvOU1zWXlz?=
 =?utf-8?B?bFhUd3lVZ0R6OXFjQ3RHVWYwZ2IrK0pJSElhV0ozUm1HR3VDcXpCakZNVmhq?=
 =?utf-8?B?TDYwdEFKbGowVGpweTk2NEhXV292RDUyU0F1Rmk2RDFwMTNOTFp1TE9wWGlt?=
 =?utf-8?B?SnZKaEM0YmFGZHVWK2pHUHYxaUxmWm1Oc2dCR3JEei9kOHlBcTdsSU1DWEVJ?=
 =?utf-8?B?N0hEdWZUUnE4NTB5S0tIUnU5NnRMdEFYRjZuVUVyUHhrT1p1TlpaSDNNWHN6?=
 =?utf-8?B?N05YdW9VNVdGS3plZ09iOFJ2Smd1bHJuZ1EyeDVOSjlQVTNuSUt0b1JqN08w?=
 =?utf-8?B?QkdabkYvODE3NFNDNTZwMjBCQzNzR0hjRk9TY0Vua2RLOCtJOVFBUlk5c3Bk?=
 =?utf-8?B?aG9kcGUrRTEvYnNBcHBVUjVnUUxvd25yc3lQOE1XVTRXVXEyVnhwM3lHME4x?=
 =?utf-8?B?b2M0YURGVUJBWXZ4c29ZY3BaTVNIUzZNWElnV3UwWlkyT3JGcWIzSm5uMU16?=
 =?utf-8?B?ckR5cjdqeEFQL1k0RXJLdTFoWlpiWlkralNIVXdKWENxMC95aTl6cERzaFZD?=
 =?utf-8?B?Z3UrYU9lbmllejVKcVFNR2JBNzJ1RkxvcTJlUzUxYW5jZEpSM3BXYnlvOFhF?=
 =?utf-8?B?akZ4aUE1Y2g5ME1sTFVzam5TWlkvOEFoUVlYSGVONFdjTk5EUElWV29IQVM3?=
 =?utf-8?B?SmgwY0wvMElnK0dmU2NSMzdGbUlRU3ZrbXBMVnVvN1U0V3UyVVhKcHl4Vjl2?=
 =?utf-8?B?UTdYK0t2V1ZnPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(366016)(1800799024)(376014)(7416014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?clM1MC9GTUliaUxlSVFmcnVVdytzRjl0b2FROWVaRGhMRmNNMWdYeDdSWVpW?=
 =?utf-8?B?WjVDdG5wQmFxbkxKZUg0SEU4SUVIYkFYVndpdnhFSTljUHByaURCa3l5dTZ4?=
 =?utf-8?B?S1ZsSHVSZHlUeEFiQnhUUWJNbDc1clRja3FKZXRHekkwbEw2VlIva1BIYi90?=
 =?utf-8?B?bks3bTdsaEpTRE9ZZUUwNUJkVFlsQjVLSmFlRkdDeGhneEZIaVlVWGJvTkty?=
 =?utf-8?B?Tytka21IK3VJMmRUSE9Edi9CcnFURTI3d0VwMmhrY0xJV2RIRXI5WnZWM1JE?=
 =?utf-8?B?dlN3dmVCelRvSnZZeXlvakYzSXR3ME1MOUtoaTZGNzk0M1R3S2d6WlRTOW9I?=
 =?utf-8?B?NkdTdVIvSytreWp4QlpQdFBjWU1KSDRnSzRzVW5pYm1UcnZmL1IvQzU1L2JJ?=
 =?utf-8?B?QUE3MjZBQlZ1WHR6aVgxZjMrY2ordmZFbURhaGR5cURTYzI2VnFnSllCcVJI?=
 =?utf-8?B?RjRRT0FVcXdiWHhDenFUUFZPT09Wa0Z2cEJnY2xOMVBpOEpaeVpNc0V3bU5U?=
 =?utf-8?B?L3VJVzBUc3NpMUNsWW9rcVMvbTJTSU05eFlMbjlUcUIzZ052RWtFQ2plWU5B?=
 =?utf-8?B?WENOYkxzMW0rcWRJQ3ZOMU9yK1BLMnVBZHBqQkk4TjF2ejU0L0lMbGRRTkJp?=
 =?utf-8?B?dWY3ZFA5NTAwSXY1cFBkSDJWMUI2VVhOdEs5dmdBbUJMN0tZYjFZTWhjL3FY?=
 =?utf-8?B?SXk0UTdoRHp5SEJTdG0rUnpZdm5sVElJMnVSL2VlMCt2WlJjWDArZ0xhSkVE?=
 =?utf-8?B?TmROMW4veUFpZUlwcGJQM3BNeXVmMGUraXV6MjlsQkx1TXU1TUphU0Y2ODZw?=
 =?utf-8?B?TEd3Z0NWeUN5QkVkakM5NHdaT2gvTkhBeDNRQXpHeW1HZW1PVWM3dUxoUHRz?=
 =?utf-8?B?ZzlvOWl5TDg0WlVVaURHQ2oyS3hySGlIMm1jamVSbDd0aWdsNlBvTWhJcXR1?=
 =?utf-8?B?dm4xYlhvcW9XN29sL2cvamxGdml0czJMRTEvUDhCdUhUM2V3b1B2a1VjNDJJ?=
 =?utf-8?B?OWppQWpscWMxckJteDRNdVdSZXB1eVJtNUFOYnNEWG1JYk5NOHVLNUtURkEv?=
 =?utf-8?B?NWRTL21tYUZZSWcyLy9RVFF3OStxR253ZnRrTmJtaG9Hd0JuMWNjOTdEMHNZ?=
 =?utf-8?B?WHo3MkdnMTEyUG1SNk4ydmZPdkkwOTRBZFFLS0MydEUvZGpwaXZzNitINzZi?=
 =?utf-8?B?MWVPa1VCZ3JKdnFHSUZVWkhjbkU1bWFSYWs5ZWFnOTJGdmNlMVFHU2dsNFlG?=
 =?utf-8?B?ekd4ZkNJOFdnS3VsZDd4OWRRcGt1QXBZcUkxK1Rjd3F2VE9hWGErSGtGenpZ?=
 =?utf-8?B?Y3lOTVhqS3NJVWRPcVNQT1h0bUJtUnE4NlhpSFlCMHBrQmdMYVRhRHZUaUZW?=
 =?utf-8?B?djBteDdNV0xiVGl0ZTJTM1NteW9UbWJ4NmJBcWJCU2xlNytHZ0tWakhXTjQ2?=
 =?utf-8?B?MGJXRDJEOUljd0hzOGtDODBYeHBNY3pNZE5wZCs3dHIyZnI1WUxJZjlrSzIx?=
 =?utf-8?B?UkN2cW9CWE54YW5lRzZlNUN6M2NDSHNMNGwvZlZ1Z3F3Z3M5Tm56elFER1Ju?=
 =?utf-8?B?NUJHMGhOTUJzUUdoekdzSklLK2srTnRyTE9weU9HVXBzY3J4UGtwV0RxR2xO?=
 =?utf-8?B?blBwbGQrRnZKdGlPTU1YZzRnUE8rNHhtY0p5TUZIYzZsWHBPUzEveVlyRGV6?=
 =?utf-8?B?b3ZQT1JwVGVNamhRUko3U05XOXRIUDl0dHdIL2dxMlhoNkFJWjcwekFYai9L?=
 =?utf-8?B?UWFtbkNwOWNLTndrTmg3VWFxQm9rUnBZYjlRVzhxQUxMcms4TDdwVnNIblMw?=
 =?utf-8?B?OTBwek1ZUmRtS3d5aVllTnkwandRdmpvYzFrSVZlWHNJTThsZWJIOVBLM0Uw?=
 =?utf-8?B?Vms0UUc1MEpnckdDUlBFU0wxaG1rTDBnRWF5czVRNzk3bjFiSktQZ2tjc1U5?=
 =?utf-8?B?Q2pISkRJZ09RN1BpU3RNOWFlTXkzM2dNQTZyZTQ0MDBiaHZsMy82YzNZbi80?=
 =?utf-8?B?c0VXZlp3NW1CVDY0WWNUTU5DdXhCblRwZXdkcmNyWnpPRklUR1MzaXNNbDJx?=
 =?utf-8?B?TTgyLyt1M3BYWnZDM2xLTnRvTGdpejZqamRtVkpvSGdRVVFYWTIySmw2dTRT?=
 =?utf-8?B?RmNnRVlkUVZua0RwWXBzZEl0aEJ3SEs5Y00wYlZidHhxczA1RTJNdTY5TEZs?=
 =?utf-8?Q?2kFFy7VW8YhJGuAe53RcWZZHAhZmJnC0uV/o7v0ApUtl?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2383e9d7-fbd8-41af-281e-08ddd34c70b9
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2025 11:45:42.1990 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dP5w3Ws8kwbsFN8tgBX/8k6bkmBvaD5QI2MHsSYi4/+LVdxedQAh4Gz8218edUbfbBJlqMd3QON0n0dlRNV8xw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8841
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

Alignment operations are very common in the kernel. Since they are
always performed using a power of two value, enforcing this invariant
through a dedicated type leads to less bugs and can lead to improved
generated code.

Introduce the `Alignment` type, inspired by the nightly Rust feature of
the same name. It provides the same interface as its upstream namesake,
while extending it with `align_up` and `align_down` operations that are
usable on any integer type.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 rust/kernel/lib.rs |   1 +
 rust/kernel/ptr.rs | 213 +++++++++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 214 insertions(+)

diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
index 2955f65da1278dd4cba1e4272ff178b8211a892c..0e66b55cde66ee1b274862cd78ad465a572dc5d9 100644
--- a/rust/kernel/lib.rs
+++ b/rust/kernel/lib.rs
@@ -100,6 +100,7 @@
 pub mod platform;
 pub mod prelude;
 pub mod print;
+pub mod ptr;
 pub mod rbtree;
 pub mod revocable;
 pub mod security;
diff --git a/rust/kernel/ptr.rs b/rust/kernel/ptr.rs
new file mode 100644
index 0000000000000000000000000000000000000000..6d941db58944619ea5b05676af06981a3ceaaca8
--- /dev/null
+++ b/rust/kernel/ptr.rs
@@ -0,0 +1,213 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! Types and functions to work with pointers and addresses.
+
+use core::fmt::Debug;
+use core::num::NonZero;
+use core::ops::{BitAnd, Not};
+
+use crate::build_assert;
+use crate::num::CheckedAdd;
+
+/// Type representing an alignment, which is always a power of two.
+///
+/// It be used to validate that a given value is a valid alignment, and to perform masking and
+/// align down/up operations. The alignment operations are done using the [`align_up!`] and
+/// [`align_down!`] macros.
+///
+/// Heavily inspired by the [`Alignment`] nightly feature from the Rust standard library, and
+/// hopefully to be eventually replaced by it.
+///
+/// [`Alignment`]: https://github.com/rust-lang/rust/issues/102070
+///
+/// # Invariants
+///
+/// An alignment is always a power of two.
+#[repr(transparent)]
+#[derive(Debug, Clone, Copy, PartialEq, Eq, PartialOrd, Ord, Hash)]
+pub struct Alignment(NonZero<usize>);
+
+impl Alignment {
+    /// Validates that `align` is a power of two at build-time, and returns an [`Alignment`] of the
+    /// same value.
+    ///
+    /// A build error is triggered if `align` cannot be asserted to be a power of two.
+    ///
+    /// # Examples
+    ///
+    /// ```
+    /// use kernel::ptr::Alignment;
+    ///
+    /// let v = Alignment::new(16);
+    /// assert_eq!(v.as_usize(), 16);
+    /// ```
+    #[inline(always)]
+    pub const fn new(align: usize) -> Self {
+        build_assert!(align.is_power_of_two());
+
+        // INVARIANT: `align` is a power of two.
+        // SAFETY: `align` is a power of two, and thus non-zero.
+        Self(unsafe { NonZero::new_unchecked(align) })
+    }
+
+    /// Validates that `align` is a power of two at runtime, and returns an
+    /// [`Alignment`] of the same value.
+    ///
+    /// [`None`] is returned if `align` was not a power of two.
+    ///
+    /// # Examples
+    ///
+    /// ```
+    /// use kernel::ptr::Alignment;
+    ///
+    /// assert_eq!(Alignment::new_checked(16), Some(Alignment::new(16)));
+    /// assert_eq!(Alignment::new_checked(15), None);
+    /// assert_eq!(Alignment::new_checked(1), Some(Alignment::new(1)));
+    /// assert_eq!(Alignment::new_checked(0), None);
+    /// ```
+    #[inline(always)]
+    pub const fn new_checked(align: usize) -> Option<Self> {
+        if align.is_power_of_two() {
+            // INVARIANT: `align` is a power of two.
+            // SAFETY: `align` is a power of two, and thus non-zero.
+            Some(Self(unsafe { NonZero::new_unchecked(align) }))
+        } else {
+            None
+        }
+    }
+
+    /// Returns the alignment of `T`.
+    #[inline(always)]
+    pub const fn of<T>() -> Self {
+        // INVARIANT: `align_of` always returns a power of 2.
+        Self(unsafe { NonZero::new_unchecked(align_of::<T>()) })
+    }
+
+    /// Returns the base-2 logarithm of the alignment.
+    ///
+    /// # Examples
+    ///
+    /// ```
+    /// use kernel::ptr::Alignment;
+    ///
+    /// assert_eq!(Alignment::of::<u8>().log2(), 0);
+    /// assert_eq!(Alignment::new(16).log2(), 4);
+    /// ```
+    #[inline(always)]
+    pub const fn log2(self) -> u32 {
+        self.0.ilog2()
+    }
+
+    /// Returns this alignment as a [`NonZero`].
+    ///
+    /// It is guaranteed to be a power of two.
+    ///
+    /// # Examples
+    ///
+    /// ```
+    /// use kernel::ptr::Alignment;
+    ///
+    /// assert_eq!(Alignment::new(16).as_nonzero().get(), 16);
+    /// ```
+    #[inline(always)]
+    pub const fn as_nonzero(self) -> NonZero<usize> {
+        if !self.0.is_power_of_two() {
+            // SAFETY: per the invariants, `self.0` is always a power of two so this block will
+            // never be reached.
+            unsafe { core::hint::unreachable_unchecked() }
+        }
+        self.0
+    }
+
+    /// Returns this alignment as a `usize`.
+    ///
+    /// It is guaranteed to be a power of two.
+    ///
+    /// # Examples
+    ///
+    /// ```
+    /// use kernel::ptr::Alignment;
+    ///
+    /// assert_eq!(Alignment::new(16).as_usize(), 16);
+    /// ```
+    #[inline(always)]
+    pub const fn as_usize(self) -> usize {
+        self.as_nonzero().get()
+    }
+
+    /// Returns the mask corresponding to `self.as_usize() - 1`.
+    ///
+    /// # Examples
+    ///
+    /// ```
+    /// use kernel::ptr::Alignment;
+    ///
+    /// assert_eq!(Alignment::new(0x10).mask(), 0xf);
+    /// ```
+    #[inline(always)]
+    pub const fn mask(self) -> usize {
+        // INVARIANT: `self.as_usize()` is guaranteed to be a power of two (i.e. non-zero), thus
+        // `1` can safely be substracted from it.
+        self.as_usize() - 1
+    }
+
+    /// Aligns `value` down to this alignment.
+    ///
+    /// If the alignment contained in `self` is too large for `T`, then `0` is returned, which
+    /// is correct as it is also the result that would have been returned if it did.
+    ///
+    /// # Examples
+    ///
+    /// ```
+    /// use kernel::ptr::Alignment;
+    ///
+    /// assert_eq!(Alignment::new(0x10).align_down(0x2f), 0x20);
+    /// assert_eq!(Alignment::new(0x10).align_down(0x30), 0x30);
+    /// assert_eq!(Alignment::new(0x1000).align_down(0xf0u8), 0x0);
+    /// ```
+    #[inline(always)]
+    pub fn align_down<T>(self, value: T) -> T
+    where
+        T: TryFrom<usize> + BitAnd<Output = T> + Not<Output = T> + Default,
+    {
+        T::try_from(self.mask())
+            .map(|mask| value & !mask)
+            .unwrap_or(T::default())
+    }
+
+    /// Aligns `value` up to this alignment, returning `None` if aligning pushes the result above
+    /// the limits of `value`'s type.
+    ///
+    /// # Examples
+    ///
+    /// ```
+    /// use kernel::ptr::Alignment;
+    ///
+    /// assert_eq!(Alignment::new(0x10).align_up(0x4f), Some(0x50));
+    /// assert_eq!(Alignment::new(0x10).align_up(0x40), Some(0x40));
+    /// assert_eq!(Alignment::new(0x10).align_up(0x0), Some(0x0));
+    /// assert_eq!(Alignment::new(0x10).align_up(u8::MAX), None);
+    /// assert_eq!(Alignment::new(0x100).align_up(0x10u8), None);
+    /// assert_eq!(Alignment::new(0x100).align_up(0x0u8), Some(0x0));
+    /// ```
+    #[inline(always)]
+    pub fn align_up<T>(self, value: T) -> Option<T>
+    where
+        T: TryFrom<usize>
+            + BitAnd<Output = T>
+            + Not<Output = T>
+            + Default
+            + PartialEq
+            + Copy
+            + CheckedAdd,
+    {
+        let aligned_down = self.align_down(value);
+        if value == aligned_down {
+            Some(aligned_down)
+        } else {
+            T::try_from(self.as_usize())
+                .ok()
+                .and_then(|align| aligned_down.checked_add(align))
+        }
+    }
+}

-- 
2.50.1

