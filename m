Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8946FAE85A0
	for <lists+nouveau@lfdr.de>; Wed, 25 Jun 2025 16:07:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A629610E739;
	Wed, 25 Jun 2025 14:07:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="ej+26TgH";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2083.outbound.protection.outlook.com [40.107.92.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE97310E739
 for <nouveau@lists.freedesktop.org>; Wed, 25 Jun 2025 14:07:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hHAGG3X/6C5ULC4ELH8wmSqkgBKoNrHU/YHY3yN/JqCS4eIKZ/ckDzy7D0nOnffO+CYkDNtjhWLAY+y8Nx4w/AOv42Uo9nJk+1m9CeHOf8R5spH1/1SRjK9jvPOFNABiAFvy1vOi2drDz5wtG5wHfobbgBIhH0wFuGoVCX0r4PlVMzdVks2NpEGC6ThNVLwGi8WJbYg5ScI07YSUuCZ1tGz+Y0qMe/iSVi9KNPqfDMG/Sx3lGSmCnVP9Bl3EWk6P8IC9HQ018vsBUGl7ngVCEWo6XZW2igR0dWOfLFqG+9JcGiFIqKJ2sZADD3M3IrxLkN6fDfISzKsst0EeyLZDyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fdr1bjE/l6ddPRd+rG2PCED0D+QJY8rVMPZtD6NVDsE=;
 b=wYKSzdr6alr8yrgW3ADATv6i/qMO+vy90cTWO3f80BAXlD2QWhbWJvsl05wIwsEw/iiMcg7SCKAk3mWmu7PEhmfc+bTxM158LkZ/g9KVQRDo7ptvfgEVM15VXwB9iypkfUMrGTJ0lVE7J0ulklu/lJZAWKe0MobNEY8QkvmND3SquV/dQ0C4i2oOmwTFO2MZot86y4j2fCC3VB4v84O96xrZOxGVzAPGZ8Ee9wzmYkUkZ23E1uc2Rz00edNJSyPBOXwT02rL26ZLVanMPXu/uMl5wOlblltsv5A1NHOS/mKeivxErxwEb1WzdKqCt1Kg+eTLvVJaUDWqsSL+uxlr0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fdr1bjE/l6ddPRd+rG2PCED0D+QJY8rVMPZtD6NVDsE=;
 b=ej+26TgHM8brymskfdrVb2WoPHLaUGLQoUPVJBZ0N8r9EUXZ2OOOf/0yWKox8YeB012DGJvEMJTFXW0hRxfDWPVn18Jt2HWf3z5+2t9DJG3ABP2Yg9wZEhIebWVz63d60xme/eMhV4wpWt+JIeSWkSDiBWYzBywIDU7Pf3pex8+RdcOJW30IArvU7XNCfZvSdaXJ55ZA6XGofMPSN7vIVWeWd0GzYgLFuJPQDZFxcwXzYTU63Vps4UQe+hb+zCwC9ALYq9hM+vF1fEYo03CPPu/rOGy7SvWapvOp047GIkiSholniChgvLj7KBClAlnEEshUd5XmPIgBh6w+O2LyXQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by SN7PR12MB7911.namprd12.prod.outlook.com (2603:10b6:806:32a::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.29; Wed, 25 Jun
 2025 14:07:29 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%4]) with mapi id 15.20.8857.026; Wed, 25 Jun 2025
 14:07:28 +0000
Content-Type: text/plain; charset=UTF-8
Date: Wed, 25 Jun 2025 23:07:22 +0900
Message-Id: <DAVO878E49AN.1L5TPHANBBHE6@nvidia.com>
To: "Jesung Yang" <y.j3ms.n@gmail.com>, "Miguel Ojeda" <ojeda@kernel.org>,
 "Alex Gaynor" <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>,
 "Gary Guo" <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>
Cc: <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>,
 <nouveau@lists.freedesktop.org>
Subject: Re: [PATCH 0/4] rust: add `FromPrimitive` support
From: "Alexandre Courbot" <acourbot@nvidia.com>
Content-Transfer-Encoding: quoted-printable
X-Mailer: aerc 0.20.1-0-g2ecb8770224a-dirty
References: <cover.1750689857.git.y.j3ms.n@gmail.com>
In-Reply-To: <cover.1750689857.git.y.j3ms.n@gmail.com>
X-ClientProxiedBy: TYAPR01CA0005.jpnprd01.prod.outlook.com (2603:1096:404::17)
 To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|SN7PR12MB7911:EE_
X-MS-Office365-Filtering-Correlation-Id: 4f6ac23c-52e2-472a-9555-08ddb3f19cd6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|1800799024|376014|366016|10070799003|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bzBaZDJZcGwxd0xxUHN4Q2xtY2ZqcTVuTUd5alpZVUxxWkZZMkVXZnVYQ3BS?=
 =?utf-8?B?cVA4QTZvVVl2TXA1dDkycnlFRXFXZWZidE83elI1NThqU2EyZHFhd3JvbTZV?=
 =?utf-8?B?MmI3UExHMzBPZzhZYkNNSVNmWTFiWHBDS0tjTnZwdTBtLzY3OFN4R0hSY3Y5?=
 =?utf-8?B?d0xOYStPb05tbzVVaFF0amVDQ2RpajgrME0zOFE0akwrL3pCZjVlcWRwUDc5?=
 =?utf-8?B?eFdTbnhUSWttSCt4cXlYejhhQnRyYUN1emNoeVRiUnJ2MDV5OXlGYkVDM21p?=
 =?utf-8?B?Nks5bDhsVjNlWHpKQll4TGZiUmVBaC8yZlVxZ09BTUxrbHFDdHZpVW1oWU5B?=
 =?utf-8?B?ZnVCNzZLdm10WWszTFVyN1FHcXBNRG9Pb2ZMazVHc3prWDgyK2E4UkR4aXRs?=
 =?utf-8?B?VFd6THpLRXhxc3Q1VjNkbjQ0U0R1aGFITXRWdGcrSk9CWFdZTXU2N2EyenNw?=
 =?utf-8?B?N2dLcTVITlIwOGdxZERlcDVtaWIzSjEvVUFwb2hmQmFTYVBlNS9WcXpiNjUv?=
 =?utf-8?B?WHhRUjBsT1VBdWhpdFRXZ2NoMWNteEN1Yy9ZbTFKcitNK29nWDIydnREZlFI?=
 =?utf-8?B?S1BoSUpLTzdvcUMyazliTGlveDlZQk1WZEd2a0diR2RpNW4vU3NweGFad2gz?=
 =?utf-8?B?MytlWDBOMmtBT2JyTGZqeUhwdVU2SlNHWUhGdVFWczBHTkxnRzBsVG5GUTdR?=
 =?utf-8?B?NllHdlJRQnAxTEpDVzdOSzk5VlRRVTN1eW1PUE5ML0JKT2hMWUN0SUlaSEVq?=
 =?utf-8?B?TmRENHRiNzhSQVdxUG5FQUQ3TVB2Q1ViZFZsN25ySkZqRjlXMjJ2Q2tSUStU?=
 =?utf-8?B?aDVIWFJ4MlQxUTBpb0xXanFndFduWkFJb3Nqd21hTk5BZnV0VGwrbm1DZlBk?=
 =?utf-8?B?V3U2U05BTE5lY2VybTY2bkFYYjVFNGo4MXhJSk9TUlF0RG5zbkp6bENkS1hW?=
 =?utf-8?B?RnJYN2lPQTZ6eXA0d2dDQkx6NExYdXJmay9tQ3A5T1lYMHlVejU4Um9wNHVl?=
 =?utf-8?B?RTlsYjRuZjB1VllKMHQydEo4ZjRiUUV1TGdyTGc4YzltMDl1dUtmUmJTNFZF?=
 =?utf-8?B?ZFFkUTJ0ZWhHbVhsVWd0dzI0YW5YejVONFU3YVMwZ1RBc3RuV0tZcEdRVVJp?=
 =?utf-8?B?OVhoWnBnaFZMeFdvYXBXOVRrOGdFYjJLUE44QlRqU2ZPYllvZmZkWVZzNGtD?=
 =?utf-8?B?NzVNdFdPSXRKK1hHR0VLb1RYWDRHaWZnbUZMaEhSckJMVTJQcFNYK29aQUpX?=
 =?utf-8?B?encxcXBQWXBaaUFlSTZUK3RadTV4QlVHeUZXQnVobVIyQ1U2TjJRTkhiMlE5?=
 =?utf-8?B?UlJna3BRTjYxb3NXdENBZkpLUlR0MEhoZXhqbngwdm5FeVhOVG1xVzM0QUhp?=
 =?utf-8?B?bHdPUCt3ZC9DL21obW80RHpubDFnVUNPWWRPWHNFN1NKYjNoZFFBNlVycjNp?=
 =?utf-8?B?QnhMa2xlT0k5cWw2bGtZSGxjWG1sNG1xU0s2UEVJdUxuejBJRGJLQVoxUW56?=
 =?utf-8?B?ejlybEZWKzNwODZLMUJDNXJHUXFlVWtLZFY4L1M1b3JrOUFMOFQ2dU1tVDVm?=
 =?utf-8?B?UDBmWUxyRjBFU1RFdUlkemNHME5NNmRrNHFvV0RPZnlBUmlzUzZYeDZ0SUZY?=
 =?utf-8?B?enVDY0FLTzllU2dKcW5UdVppakxGOFF2OGltblVyamp1TW1hRlBpbXFUcHJ6?=
 =?utf-8?B?dzdTdTRmazg2YW1nWTdCVVhxa1FQdUNmajJhMFJSaHBFYjlvRE1yNkMza3g5?=
 =?utf-8?B?Sm9DSFpxalY1ZmtBdVByTjNZNUkxRkNlR25IRlVzeHovQ2ZJSm5XL01QZjFF?=
 =?utf-8?B?bUdHUzlPaVNPWlBoYmJnZHRhckFDaFRSMGxuQjlZM0FGaVhEQWFwQ1plUURU?=
 =?utf-8?B?NVlBWWQ3RGxLQnhVOGNKdXJYSTl4eUVvbEkrNDg0Y2ZqbnVpZ0xkNWl3SFRC?=
 =?utf-8?B?MVczelM0RGkrNmN4THlGZEdtckVSSkYxeHQwQVNiUFgvZXY0ZnJqRytrdGtF?=
 =?utf-8?B?WTNEeVBNL0VBPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(1800799024)(376014)(366016)(10070799003)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZmFERDNIWm9YWmhqU3N4UEx2WjVHV0lyb21hQ0p4cEdDZDBWSUVNc3BqRjhl?=
 =?utf-8?B?L1lidUpOckpEeW0wTlR4a05PbThkTUowMGFUZE8rZGZWb29ZUE1aMCtYUU1w?=
 =?utf-8?B?Sitic21PNUVwUHgvVVcvSFVRSVlOZ2hnNkszK2RqS2ppRXlOc01xc2RXZXpt?=
 =?utf-8?B?S1U3RzNYQmxrQjZKVXZzbmpLTUYyUkZRUFh3V21sa2JOQXZoQzd4bkdLQUdt?=
 =?utf-8?B?bW41Q3h4eVNtUmszV3NpeDA4MG81cFBLVVViSE5yeVNBbU9uVWM0ekwvSUVK?=
 =?utf-8?B?QjNvWkhtU1IzRnpBOFRWc0Q4TTd0bnFCS2pVbi9LVTFoRDEwd0pGUldPbWcv?=
 =?utf-8?B?amJ5MG8rd3RldExyMmFvTk1TUHhwcW9tbXBla3hQUU8yNkdZY2lsMmVQcita?=
 =?utf-8?B?MXpTOXM5YTdNVDlJaG5lTHA3cXdEYmFXTEZ0SFovTFJQcHh2bmxSU2ExeTJP?=
 =?utf-8?B?YVlVRDVrS0NlbEJSS0FySmNiN0dFR1Q5RGs3bkgvRmRNUVVWYWJDeFBJYkhE?=
 =?utf-8?B?Z0NiMVowSkZDZ0g4Q0pHMjR1WVd0c3Z2emw4cjJOYTRMbU9JZUZRbU9kSDRI?=
 =?utf-8?B?aVhNUWtBWU5IcmdpdFhkQkl6UkhqNll0QXJPTWRpeDFDaHlBSi84elRvTmE0?=
 =?utf-8?B?MXVjcUNiU2hSbldwYXN1NEFVdVRsUHhlcitoK1RoUTVKUS9rLzZDcGtUNEoz?=
 =?utf-8?B?NS9CMzl3MXc5cVpoMXBabEdnSkw1VWE5Yzd4WkNaL3V1UXhJUm5CTzZLQ3da?=
 =?utf-8?B?eDAvVlpkUjEwS2phYjkvVVVaQlhaREVuV0E5ckFPT3RQWE9xM2d4VHkrc2Jn?=
 =?utf-8?B?S2xPWFFXc21MUEs4U0g3M1ZTbEJOMVJYb3pJWHc5Q1J3cXpjdFRRRGJyUUMx?=
 =?utf-8?B?eTkyS2pYTVViZklUV3ZYTitnelM0OGhCSzZZeWk4Q04vTjhRQ0gzSDBLOWdP?=
 =?utf-8?B?NXgyWThZejFwVUdrcXFWWGcwTDNzb1JqdVU0cUNQVHkxM3l6RjhEamhBSWxk?=
 =?utf-8?B?UWhTd3o3c1VVYUpVWlArK2lieHVQVUJ6Wit2eFJ1Q1FQSU9sTURyNk1rVVIw?=
 =?utf-8?B?NU9MNzhMZDJHcGVINWl4VnpYQzN5SmtxazNTSXBLcDVvYmlpaTBQVzMxVEUv?=
 =?utf-8?B?ZVJNblhmR3kwSXlwN2Ewc1c0ck5kT3FwTGZGSWZjUDg5ZW4vdGJlNWNkQ1FX?=
 =?utf-8?B?ZGJ6aG50TTN2UWNoNDRzekRjY2hlbWtsRkQxU3ozRTZBUWk3c2xHMVdCZVd6?=
 =?utf-8?B?eHQyeE4yWDUrU01yc1EyQ3lsZnE0a3dLSENwSHBCU1hNaU1GSVY3Wk02U25I?=
 =?utf-8?B?M1JpWjdPRUNjT0ZiUXl1cEpqc1FUdDhiWG9Va0lnK0xPeU9RUkYxNjFlRVk4?=
 =?utf-8?B?WFNhMW5VSEZzV0VlVlRPTmVoT25WcjVFRitBY1lTc0d4N0pQMUNQdHNiMGxa?=
 =?utf-8?B?VWhWTVJsZ1Z6YXZSRk9ESCtSTXJ6c1Y3ckpHd3lPZnlXN25ZRnNGQ1MyY3k4?=
 =?utf-8?B?eExKVUlwcHUzeUNBMngzUitlYVdreGVSMnRCOGtMNUJFRXpZVWFTSFVOMHpL?=
 =?utf-8?B?VU9La1czL3hSelhjVHVZc1g4cTNIU2lxN1RGMzFrbGRXaEw5M0NCQXlXN3dh?=
 =?utf-8?B?UDUzYm94bUxlWXMyRjJvZ09yNVZOZTFFMll5Vy83QWY2eHlYMld1Q1pkbFRa?=
 =?utf-8?B?K2NabVZYVDdWV29IRjJRRGwxRjJNMStlNnZRUHlhQUhMM2NVdnZvR0NKVC9y?=
 =?utf-8?B?NG10L2ZUWnNDcVZyUnovR2gzRWNHVnN3S3F5K3FPdmRqc0VtQXQwWVhiN1VT?=
 =?utf-8?B?QTN5WDcyekpJakc4VGJWRHhMdXFZMzRFOWxWc1R3VjBvaENuUFkzOFZJd3M4?=
 =?utf-8?B?QThQaHNkeVNBL2NzZytOY2V2QXgwUjcweno5NWY0WFFkSFNITGQyQnJJeWFj?=
 =?utf-8?B?eTY0dTBuZXVyVG5qa3hMbVNQeGxpTnhnOFY3d0tJNWNCSUJ1VmMrSUJIVDJJ?=
 =?utf-8?B?TXp2SE1vZi9naWM5UitCalN2Y1JVU2VUQm9DbEU1SGVxSDg1aVlrMVorbmls?=
 =?utf-8?B?Si80VTNUZVNKdTBWV0Q3Qjl0a0dzL0h0clZqTkIzMFcvL21oTkQvTnhUV3k5?=
 =?utf-8?B?WnBta0daTnZiUmRqMDRzdEEraVVIMmFIVytUV2dLQVRWWlRQVXFaUUlDR2Jk?=
 =?utf-8?Q?o6ewv/KMKSs+D3rOWBg7bgmtIJX2ESBOZ2OD1Mw/ZlU3?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f6ac23c-52e2-472a-9555-08ddb3f19cd6
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2025 14:07:28.7672 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 97/oAaAS5IgD2Fvr0ydCV+iQOlNYHcFpg3X8NGPqmn3/sIJiosirXVTtKFaMLNxPAGInebSpS/uWkDJYCMS+Wg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7911
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

On Tue Jun 24, 2025 at 12:14 AM JST, Jesung Yang wrote:
> This patch series introduces a new `FromPrimitive` trait along with its
> corresponding derive macro.
>
> A few enhancements were made to the custom `quote!` macro to write the
> derive macro. These include support for additional punctuation tokens
> and a fix for an unused variable warning when quoting simple forms.
> Detailed information about these enhancements is provided in the
> relevant patches.

Thanks for crafting this! I have been able to sucessfully use it to
provide the implementations needed for Nova's `register!()` macro.

>
> While cleaning up the implementations, I came across an alternative
> form of the `FromPrimitive` trait that might better suit the current
> use case. Since types that implement this trait may often rely on just
> one `from_*` method, the following design could be a simpler fit:
>
>     trait FromPrimitive: Sized {
>         type Primitive;
>
>         fn from_bool(b: bool) -> Option<Self>
>         where
>             <Self as FromPrimitive>::Primitive: From<bool>,
>         {
>             Self::from_primitive(b.into())
>         }
>
>         fn from_primitive(n: Self::Primitive) -> Option<Self>;
>     }

This alternative form looks like it could be more suitable for us
indeed.

The userspace `num::FromPrimitive` is a bit too exhaustive to my taste,
as it makes methods available to build from primitives that we don't
really want. For instance, if I have an enum type that should only be
built from a `u16` or larger (because it has variants with values bigger
than 256), then it will still have a `from_u8` method, which looks
terribly wrong to me as the very fact that you are trying to build from
a `u8` indicates that you have mistakenly truncated the value at some
point, and thus you will possibly obtain a different variant from the
one you would get if you hadn't!

So from this perspective, having an associated type to indicate the
valid primitive type like you suggest sounds like an excellent idea. I
probably also wouldn't mind if we only supported that specific type
either, as callers can make the required conversion themselves and doing
so actually forces them to be conscious of the types they are passing
and be warned of potential mismatches.

But I guess that if we do so we can just introduce a derive macro that
implements `TryFrom` for us, without needing to introduce a new trait. I
might be too focused on my own use-case and would like to hear other
usage perspectives for this work.

If you add an associated type, I guess this means the derive macro
should have a helper attribute to specify it?

Another important aspect discussed on Zulip is the counterpart to
`FromPrimitive`, `ToPrimitive`. Here I feel more strongly that we should
*not* follow that the userspace `num` crate does, i.e. having all
operations return an `Option` - that would result in a lot of unneeded
error-checking code in the kernel. No, here it is pretty clear that we
should only provide infallible methods for the types that can store all
the possible values. Which is basically... one or several `Into`
implementations?

So indeed I'd like to understand first whether we actually need a new
trait, or whether our needs can be met by derive macros that provide the
right `TryFrom` and `Into` implementations. For nova-core, I think the
latter would be ok, but maybe I am missing the larger picture.
