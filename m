Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 651FEB1A0B1
	for <lists+nouveau@lfdr.de>; Mon,  4 Aug 2025 13:46:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB88810E447;
	Mon,  4 Aug 2025 11:45:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="LBoYM7fY";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2088.outbound.protection.outlook.com [40.107.220.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DB6510E2D4
 for <nouveau@lists.freedesktop.org>; Mon,  4 Aug 2025 11:45:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JvjdznJP1AeOTuHr77boXq5h+ASaacQVRNsa0e/VyFeQGZmw3sMzFAjv/igjr4HXCf1GIf5nzo8i9hew+6X9N/ylpI3YK4w7kEWPMxEeoCVpFEa7jH6iXqUOlSwrT2PDrWOIZb0NJ5H6ATiSCAVNuwYliox5AD0p/tKWKdzDaxPSB0OQZGjGMqS7aAov0Nu0xB5GUZo8tUXSngRZPTZa/M36gF5IxYFQbkYnMG8fp/+bsKsMgNbyPuF8+j2mVSXd9KRpwsq67ihIUUui6egv3rst8Wk4UnVS34qq4oi8sJOLwqjns0xkm8G1uNlcOBhGDEiLi1CWxPFUE8H1V/0uuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LPTlKqmV+UVsokxjqq24pZ6GJPvL5+3DZm+g0DOE1iw=;
 b=p3HGwZEDywvcLOhpccYOe7iyOlS+Vj+5kFvqf/mT52KHjpQs6ediS4C141ga/ePclNRKe8gjlbmzE05U58H/Q4oZ6bxahSOG1kpeg++QWfTXIpdBJyBPY8v6VT6sVXR9dNQ3cCnGY6Lp1r8BVqPmbLldoRq8zLOmmT4LPyNqP0Vsu9ZXLURcVfekKkTmCcYR5Iw83BiUBFV1wmpzEAm2k635iafbSHbpOHnZoURWNvk3dN2grWEXNCp3TcCdlLKgVsTuwVdFa00dYjK9XDcNoEb21Oinl6URQGUMDl1B1RPXoWrMPK1uPpPvkvC/XhrhCHJxo0MVR8aAs7FWR3M8zg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LPTlKqmV+UVsokxjqq24pZ6GJPvL5+3DZm+g0DOE1iw=;
 b=LBoYM7fYVo67TiGzWVopPQYoLe0kFQWEGnlZjJ8bu+NU8J3+94f1jCVLmQajIhhffWrJ7UjbBmiEfxnGYybvoGCbIBbnkgNfsP30i/gdg/17smR6DgIbQhGtaLqxDNlcbp0av+cwTUQsc5OKp9zbi//ZZg/uHZQsmXDvGff0RNShcCy1BGEw9O+T5h9G6qYV69eZgol+QhkGMunT5dOyw3MJzAnnOFNXgt81JKm9bQhHAKuKGn2jxFR5KERxS7NhSfWH4gtP2MTiKGTcc+fKglU9z5u36gmZESCnE1rFGRszHfeX1HNfHnC2J6cLiwdapDzuKY9rDkGr6035pKkKzg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by IA1PR12MB6020.namprd12.prod.outlook.com (2603:10b6:208:3d4::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.20; Mon, 4 Aug
 2025 11:45:50 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%3]) with mapi id 15.20.8989.018; Mon, 4 Aug 2025
 11:45:49 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Mon, 04 Aug 2025 20:45:27 +0900
Subject: [PATCH v2 4/4] gpu: nova-core: use `checked_ilog2` to emulate
 `fls`
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250804-num-v2-4-a96b9ca6eb02@nvidia.com>
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
X-ClientProxiedBy: TY2PR0101CA0006.apcprd01.prod.exchangelabs.com
 (2603:1096:404:92::18) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|IA1PR12MB6020:EE_
X-MS-Office365-Filtering-Correlation-Id: edc1b474-dcd9-4f20-811b-08ddd34c7567
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|7416014|10070799003|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Ym01aS9vWXpoWFY5VWpvZm1yc205N1FYcWlRV3pVZG5hNW16UG54UXZPNTM1?=
 =?utf-8?B?RzlObUpveGZYUkhaanpPdHhEdll1clJsSVdZZlMzZ0FpeEF6RzBiWE1BNUZS?=
 =?utf-8?B?SlJMQ0UvN0k0L2ZlTUhsUW9RdFBNN3lPTU02K2ZsRjh3SHVNdHFhL2ZUSEoz?=
 =?utf-8?B?T3ZXN0lKY09ZZ2NsamdKVW1jMzJBUUtmVUNXTERpOU55c3ROa0NMajNKNng5?=
 =?utf-8?B?eEM2NFhRUW9PZkZRMktLVno5d2c0NjdtNEFCZjVvd3pLeGR2RzJubEJZKzho?=
 =?utf-8?B?T0NXb2w3ZFFFbVhSY0crZzFIOGZPVDBwTnRVMUtlM2hab3V2bnZMWDJYQ1Vl?=
 =?utf-8?B?OUp1aFlaeitvS0xqcGRxaUlXbkpyREtxV1dtT25CRlVvNGNoVjJ4aG1UU2Qr?=
 =?utf-8?B?MjRpL01VQ1pHaFkrTVkybGl3eHE3TUJLWnhLWnRSYTE4Y2R1cGJOSVNSV3Ew?=
 =?utf-8?B?ZTlIam80YzFNVXFHNkVBbUpISjFkWWpDMTVNYUV5c1VqREZtNmp1ZnQ3cE9a?=
 =?utf-8?B?azhDb2h5TitjZzlrUHR2RTZtT1pTYmhFRExnekpDQkI3VVorY2dqeVR0c1RD?=
 =?utf-8?B?VjZ5WXRCRkJqM25XbVM1S3RkMFNBODZUTnlqOGdSSXhFcDN0Nlp1dVRMUWx2?=
 =?utf-8?B?MXFZOUdVeERHMTc3aXEyb05rSWpzaS9OUjJYb1h1T2xLVUU3cTJJc1dCWUxK?=
 =?utf-8?B?MysxSFpHNVJ6VG9nY3cvMjJaR21HTzBwWEo3b1JOYUIyamdWd0ZpVlNKMWtj?=
 =?utf-8?B?TzU2ZFBDaWFVT3RvNnFrRmFpSkE1cDVzbWR3bzcrRFZNSjQwK29LNkRuOWp3?=
 =?utf-8?B?T2xldUZXclNEL1RHL0dHN2NiK0xsMjBvRUU3Zld4T09IclU5YmQ3RzBxNSsv?=
 =?utf-8?B?MmpEbS9YL3dPUzcycGZremEwckg0cWJYZUlqTGlHUG1jWmw0WDF2UVNHeEpm?=
 =?utf-8?B?K2RKMW1iYVE2b2syd3paOXdBa0JDZ2lXbExRM0lZYm9nY2ttV2RjaFFVdURx?=
 =?utf-8?B?TjhtdnhxdU4reDBveG13VlZnd25xejR5QWlEQVRJVTAwbmN4cmpwekdvSFk2?=
 =?utf-8?B?LzNiaWRJclZLQzZRNENTbWhuVnRhQy9zV1B3VVBPWHpXaHZUR2hYVFRIUnNu?=
 =?utf-8?B?cU5kZFM5NHNoTkZIellCTGpyMTNMb25USFZwVGI1OEJOaWVBUVpMdHN1bUNH?=
 =?utf-8?B?TWhMZHpSN3JlOFFaWVRaQ3AzenArYXBjRXVRRnU0TU1uSytUMGdPeUdZS0JG?=
 =?utf-8?B?RmRHWDMzZldLU0JqRTd2VGYxL1JYN1hMSlpTRWNUQ1d1b09VNEx4TmVLWmYr?=
 =?utf-8?B?cUN4eGhwK1Y1QW5BbnVKRGFlVGZjYldLN0FpSWVBbVRGNHBTR1lSMXo4Qnlu?=
 =?utf-8?B?Nm1XdzJlWFlhTzB1UldDYnJFTGh6V3NFS3hoNkNRQURINS9xblF0OGZ3RDdF?=
 =?utf-8?B?ZWdYSWlUNTk2TTk1bzZCbHczR2laTkI5SEpvTnhpaDZlY21nKzROcERLL2o3?=
 =?utf-8?B?ZktZVitCSWVuNm5PZ1ZRUmVKMUFscE0vb0NHNkRkVUlId2k2MkxzaW5RN2dM?=
 =?utf-8?B?dS8ydlUzUHRON1AvZnNkYkVYOUdBOFBHdHVENnQ2YWhiWEd1WlV0bktEdFQv?=
 =?utf-8?B?Z0VGS25selcweFpqUDJ3dDF4bEV2cmxGcjRuSmdSTndYTWdPOVNwWllTSUhl?=
 =?utf-8?B?YzUvTVpKWXk0MzVOU3ROVmExQllkT3ZaTXNENUtac0lrM0hLZHIzT1poRVZW?=
 =?utf-8?B?akJwamllYWxZVGpTNTRqN3JNT2tORE1QNXRla25lbEEvRThZeS9PL2lGLzJE?=
 =?utf-8?B?RG8wZThLWGV0azhnTWYwZ3hXZklRTk5nWFlkeEJzUlZMNlAxRm5nWWlTWjhq?=
 =?utf-8?B?d3ZzSUlYZ3VvdndNdXpUTVBhSnBWL05zWUFzN2pOdjczaUFhYWNoamFDSzJt?=
 =?utf-8?B?cGh5ZmV5L3FTUTZKcnpyQVJxZFg3TXVaUEFxOFN3MGZ1MWVzK1JNSzBIUXR1?=
 =?utf-8?B?RTEwcy9BYmh3PT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7416014)(10070799003)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NE82ZnBPUXI0OTNKd0hTeDkxVEZoQ2lpcEVadWxmcEx3dzJsdUxibEdBVGZD?=
 =?utf-8?B?TDBWTlJtVUNaNmp3d1ZyaGs1d3lDWUZYRVB4RGdQZGVoQ2NsZUFwK0JndVB6?=
 =?utf-8?B?eEF0a21YT3hoVkI0YmZ0ejBOa1UxTmV6WERGN0ZkbzVmSklYUjAySmhSalpY?=
 =?utf-8?B?aDVpY29wdVArRzE1R1M1N2kvejRrZ0E1NVI4by9qcGRtVTJrV3g4Vk9ZaExF?=
 =?utf-8?B?REZFSURabHpvaDU2NFZWZUNDLzZFRDFoNDVPalRXb3RvaFNLdlBud3J2Yy9S?=
 =?utf-8?B?SGp6ZUZ1Tk9lU09RRnZQQjI4dDBKVERQL2tndlEzZTdoVnF4eDFxR3Q0M2x1?=
 =?utf-8?B?eXI1S1Q2R3lMdS94dkFxbVF1TmE3WHhvY0RUdVZNVlJmci9pY3Vva25pL0s2?=
 =?utf-8?B?VWU4V1FYZy9JaUVYcFV6SXQvM3BsRlorNVE3NnlQazNQVi9wOUNBY2dySFR1?=
 =?utf-8?B?Q1NsYi9sS3BLQUhFcVlNLzVVblQwMlh0SHUyZWtCMmFJOG9JRkNlai9JMWtq?=
 =?utf-8?B?Rm1wZXh4QkNKNkh2Y3JWbHk3U1RpVDVJTGZDSll5TENmK0RmSlFGbzFpcjZY?=
 =?utf-8?B?SlBUYnZpWmFycGNQcFVTbGp5bUZ3ZWpaNVdOSGJ6ZzJtNTIyZkx0TWRGYUVn?=
 =?utf-8?B?a0xLR1hVclFOZWNlYmRZbE8yV3RjeEhGbks4THl2TzFhRnB0Vi9mdW1FbW1y?=
 =?utf-8?B?Q2xpS1VUazIxRGRVajZHZEZvb1VpbzJSeWJud0xNR1djR1drdlp2U0gyZFRF?=
 =?utf-8?B?blQ0VWFqQ0JHclYvajhaTUVGNHczVWN3MGRJS21aK1cxdm0rcS9RZ0lFVG5Y?=
 =?utf-8?B?bk1xcTFEQUM5djhicVA5QXdjRXNURk4rWEZZOFBycXhVYlhOeWlBcDRlaGtq?=
 =?utf-8?B?MDZqeG5wdnA2V1RNV3pYS3ZaSEdkU2hIL3BkZVlDa3JVSmUydUhpZ2RpME9l?=
 =?utf-8?B?WFk1R0dSeW1TcWxGeU1XUmsxaHRROGZySHFYRllodnduYTd1S3JFaXJ3MW94?=
 =?utf-8?B?bll4WEVvSm9aZkxqNEl0VCt1cFZHdWM3WGRGdmd5eVdMME5mVjlZTXUzMER4?=
 =?utf-8?B?OEYvRHBRMkdWTTBUM0EyQ0cwcnBiU3hEaDBnQTZsR0M1bmd6WW5vdWM1SktK?=
 =?utf-8?B?c3ZzNFlIVkpOa3ozS2FwVUY5U045dkFiMEVrV2k0WnROc3VJZ3JxcENzNS90?=
 =?utf-8?B?MEtubmJ2QkZIZFBtNloxeUJDcHFBM09KWjc4U3R3VjlaTzJ5V2s5czFKckJE?=
 =?utf-8?B?c2E4Q2lOVE1Ec3JCV0NCTHVxYktWUW9GeU50bGpCU3VkK3AzdDZIQkpqOENr?=
 =?utf-8?B?anlXeFEyUy9JcThsR0tmcW96SjVXM1RLVytjMmtHcG5yQVk5N1lKTEpzcHdZ?=
 =?utf-8?B?eTFkaVRXTUw2VWxubTdoUGVlalBxS0VPQ2FJS3BvUTNzbXNqL1hBQ0lIQ0th?=
 =?utf-8?B?THlCeXozb1pab2krTDcvblk5eWswT1lxQmkzK1E1MHhrMXdDN25LNXF4Z2Nt?=
 =?utf-8?B?RDVWYW94RTNpMTdXL2dKTDhpRklEZ0MzQ2Z2endrSW9uSUNWSHpLUHJqekh4?=
 =?utf-8?B?MDBQQjZSQTNIT0xzWk5jR0RHTFNFUHNYV05oNDczTjdWQjdNMVJTc3RrY0hl?=
 =?utf-8?B?eW8yMTV1WmdPaHFCTyttSGVhbUlxcytHYVowN1ZrSTZSN3ZUSUtJblhpSUNZ?=
 =?utf-8?B?T09yZ2g3dk9xU1hJQVRQdmVSWTdPa29yb2FXNENyVVVVOVFGNFZXREFjSUNO?=
 =?utf-8?B?RWRocCtmWVNkTXRJNncreTQyT2JQVGV5R2VaVFNoSDRLNGJBOHNwRllXK2Vl?=
 =?utf-8?B?QjJqOUZWSjNiaWxCUk55WkN6KzJYcjJjTTg4eG5FRlFpeE9ZTkRUWFRMRzhj?=
 =?utf-8?B?U2M0WWNQTVozVlN5WHBYYzl2djFQWWQ4SDJHMzFjOFErRitXMW9CclNxbWZQ?=
 =?utf-8?B?U0FJQlUyUllqNmF1WlNYUVlwZmN2UmZ1QnFrSjZkTEpQSWpib2tHSmJOVHF4?=
 =?utf-8?B?bW1mbHBWU0haaS9RUWJPZ3I5UVV5aDFYdDhNRnhKK0U5cXliNFZLTm1uVTJY?=
 =?utf-8?B?OWp6bjkyWjhmSDJJMFdEakNpcWQySnBQaFNKZFFXZEY1WEJtNDdUeXRIbGxV?=
 =?utf-8?B?T0lhVWxNQmY1cStxWTNjMDRxVTBoU29jbHUwdmluVXVHbkRKZitOaFFrbE4y?=
 =?utf-8?Q?0Z8/DMCU+P2WwBi2d5eoZgYIMq7vpyIpoJ7oC3VvywLa?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: edc1b474-dcd9-4f20-811b-08ddd34c7567
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2025 11:45:49.8799 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3znCYAv133Pl+mBGr1Gzx0timAA1YMOR63R9+kn9ZEtCYsHcx098u0Z+8J+l8Q869GoRh3vS6LoW5CWimgHVDA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6020
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

Rust's `checked_ilog2` is in effect equivalent to the C `fls` operation,
with the exception that its result is zero-indexed. This means we don't
have a good basis to introduce an equivalent of `fls` on our own.

Convert the relevant Nova code to use `checked_ilog2`, and remove the
corresponding TODO item.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 Documentation/gpu/nova/core/todo.rst      | 14 --------------
 drivers/gpu/nova-core/falcon/hal/ga102.rs |  4 ++--
 2 files changed, 2 insertions(+), 16 deletions(-)

diff --git a/Documentation/gpu/nova/core/todo.rst b/Documentation/gpu/nova/core/todo.rst
index 8fdb5bced3460a3971699df79ffa2c69f84b2735..01dfa858d11fe377c345b463742c13c37878e334 100644
--- a/Documentation/gpu/nova/core/todo.rst
+++ b/Documentation/gpu/nova/core/todo.rst
@@ -141,20 +141,6 @@ Features desired before this happens:
 | Complexity: Advanced
 | Contact: Alexandre Courbot
 
-Numerical operations [NUMM]
----------------------------
-
-Nova uses integer operations that are not part of the standard library (or not
-implemented in an optimized way for the kernel). These include:
-
-- The "Find Last Set Bit" (`fls` function of the C part of the kernel)
-  operation.
-
-A `num` core kernel module is being designed to provide these operations.
-
-| Complexity: Intermediate
-| Contact: Alexandre Courbot
-
 Delay / Sleep abstractions [DLAY]
 ---------------------------------
 
diff --git a/drivers/gpu/nova-core/falcon/hal/ga102.rs b/drivers/gpu/nova-core/falcon/hal/ga102.rs
index 52c33d3f22a8e920742b45940c346c47fdc70e93..430a511aa1f85477690e78cdc1104f0e0097b0e4 100644
--- a/drivers/gpu/nova-core/falcon/hal/ga102.rs
+++ b/drivers/gpu/nova-core/falcon/hal/ga102.rs
@@ -69,8 +69,8 @@ fn signature_reg_fuse_version_ga102(
     let reg_fuse_version =
         bar.read32(reg_fuse_base + ((ucode_id - 1) as usize * core::mem::size_of::<u32>()));
 
-    // TODO[NUMM]: replace with `last_set_bit` once it lands.
-    Ok(u32::BITS - reg_fuse_version.leading_zeros())
+    // The original C code performs a `fls`; this is equivalent.
+    Ok(reg_fuse_version.checked_ilog2().map_or(0, |v| v + 1))
 }
 
 fn program_brom_ga102<E: FalconEngine>(bar: &Bar0, params: &FalconBromParams) -> Result {

-- 
2.50.1

