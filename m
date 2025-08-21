Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C8C3B2F85D
	for <lists+nouveau@lfdr.de>; Thu, 21 Aug 2025 14:42:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1EE210E975;
	Thu, 21 Aug 2025 12:42:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="pSpcNT4l";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2083.outbound.protection.outlook.com [40.107.243.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8698410E975
 for <nouveau@lists.freedesktop.org>; Thu, 21 Aug 2025 12:42:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l+Ce9HPNPsojksLcZ3sQuddKmuK001okkhJ7IdwXJDwAdXyC3InjO61JU1dHMNRVtItnEYuQQvJqPN+nwPyV7OW9X3pVxrlL1g0/Rl/yYIepSnUATdR8jfHFIimsJb7qQiCQBAe92sZ9YVp9JOOUSWL3J6pGUBnqpCnktZSjA5OMbrevBqgdHQHJlH0L3pTuJC1a+1Rhwd9X/X+kTqt8MGO/S0GijIedhtvjuA7TYTkQypIv05Ro2Zn++7UYyfbSJ5hSztsxrQjAj1DEhd8zgVphjPSsKmL7JcHIp5WBMa8daxJ3T1rRYXpqwSmUjyMQfKKr5G5mvQCanOyqbTR4MQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VipooqB11ep7EWMCOdd4i+DLXkQOR+JH8YF5M1D8/zg=;
 b=qT8JyIJcYEJy5YM7NjEL4T8sH/VaO1XQWQP61WPRFvJcAPPZuamTbIFDIzsHOr8tfwNnA3FnTKoEmnTBsJp66ntevWQuU3jXeHSoSp5QV5I1eAzTWrtpgJlqIOCja1tpd1uTLjsrX9w6NOeQL1kro5RHPWpT0s6cSvLJgHvOHjsTuPZR2PMWwea++kcRLwtnIUC+Mx4l1iocfWI7BUZFjDbRpMsaHdoh0Q69oDYd0hBm/tI8mvtKoWqMUvp9CunAqXFqldQTRccxcvEFvDyFTqRTtClCqM5JsxmwdaiJoGxNwtjTj7E0DPt7eG+WFl3VIxSbpkpHXGnyCDM6HuZXMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VipooqB11ep7EWMCOdd4i+DLXkQOR+JH8YF5M1D8/zg=;
 b=pSpcNT4lCicc/D1H9iW+NdcWdrzysVmBtOvZXyOAar1P3Db1uZcMxkokKFz55kUd7A072iYf4LTnhl9B8mJ6mWbVRA8Z8GlZX4sdQYPR9X71XU3QaaZbFurru1GpL3NWuauSM8XgL7YFrikWf3Ow/eWVnMB0DIC84tc4TPx49yBdPgCmXhNeSzj0o1zC+foBL71JTxJKL39jQNZYoiTysBSdBomiyCcJtRgKR7yAK8gZZVj5A0peSNua+C/NWv4Rh/2BlnT3EjWnCAOrisHmG8i1/5VuCkh8A8ilV0po27Twep+1D8m+WD3+H9/e7Boa3Rt7u3VGtxWzrZjQhfyYww==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by SJ2PR12MB7961.namprd12.prod.outlook.com (2603:10b6:a03:4c0::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.14; Thu, 21 Aug
 2025 12:42:47 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%3]) with mapi id 15.20.9031.023; Thu, 21 Aug 2025
 12:42:47 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Thu, 21 Aug 2025 21:42:18 +0900
Subject: [PATCH v4 2/2] gpu: nova-core: use Alignment for alignment-related
 operations
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250821-num-v4-2-1f3a425d7244@nvidia.com>
References: <20250821-num-v4-0-1f3a425d7244@nvidia.com>
In-Reply-To: <20250821-num-v4-0-1f3a425d7244@nvidia.com>
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 nouveau@lists.freedesktop.org, Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: TYAPR01CA0201.jpnprd01.prod.outlook.com
 (2603:1096:404:29::21) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|SJ2PR12MB7961:EE_
X-MS-Office365-Filtering-Correlation-Id: 2b7a2fa0-e659-4988-528a-08dde0b03b3a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|366016|1800799024|10070799003|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?U1Mya2s0Wk1uRm1rUnlwTDJpeVJQWDRuOEZNVDBwT0Qzclp6TGhQVmdYdk9J?=
 =?utf-8?B?UDNSVHIzQmUvaG1LQUM1RzNmeWh4WmRDMlduZ1R1MG1FNW0rQ2ZLRDhsRHND?=
 =?utf-8?B?K1JGM05kNkNzVEZrRU9rSElxVkhRYkFJL3ZUV1lES3hZYmVZeHhjWlhNYWwx?=
 =?utf-8?B?bkFJd1dJNnFaQVdtUW5wekZ1bHV1Y21FNnZVclpnRDB1enJVTml0UkpzdG5V?=
 =?utf-8?B?Q2IyQ2p5bHJ5K3ArN0lPbnVlRi9yZ0RsNm9qQm05UnFtTHlFbUYrUmY5Q1Fa?=
 =?utf-8?B?dTJFTVZJdjBJR2FMSTlEWGs4WUNsdksyUWFvVWZLRjFFbU0vZlljN2ErcDFH?=
 =?utf-8?B?R1RpaWtrSlUvQ2Irb2h6aHJMa29Fb1dsWFZudTVSZHdGYlUzczJOSDdnQTJT?=
 =?utf-8?B?M2E5Q3B2SDJPZy9UdytKbVRhZmNmcy8rT1hreFhZVFNRbkI1cUdIOFVzM1NN?=
 =?utf-8?B?N0VBRGxjWHBwSDNBckVpVUtJWVZ6UlJEV3BhYVRHdGJ1dXZjdzZ0OTR1QXRM?=
 =?utf-8?B?NU9ZNDJCSVV0cTBVSE1XTlpPRUxZUysyc2ZGWmtPYWZFL0xXT1BVWjFqMVY3?=
 =?utf-8?B?K2dUaXhwa1A1WGN5elFoTXBiUjFKcG96Z1JYZWtZOVhvSTBrb0tDTlQzeVZz?=
 =?utf-8?B?ZWkrQ2F0OVA1aXlRSkFDR0wzMXk3dDNQLzJsejVpNHVsTFc3MWdCeDBDdE1j?=
 =?utf-8?B?MWhJYUtBNHd2emhwS3h4TGhBTC9vVHZ4VjRhMEt1d1NBNTN3Tlp0d1FJYWJB?=
 =?utf-8?B?Wi81RWIvV0RZY01GOVN6QnR1Vjc5MkJhZ0FuQUVJUi9RWHByak5DeFQvQTZa?=
 =?utf-8?B?ajBzS3hDbDNyL3FDSC8xOHFtTHFrYjlMMzhuaGpPY1RSRkd6eERCWjROcnRS?=
 =?utf-8?B?ZlVwVlA1YjMyTGJYWjZNTUdOdFp0YnhQNFJtWExzZXZBRXgvOWVGUlo0UTRn?=
 =?utf-8?B?cyt1RXJScHE0SG9jTzdnQUZaTjJYNnR1Y01KZ3VrejBtc0FydDgyazRaQzA5?=
 =?utf-8?B?SFdiVzNxUjd5NDJoWlk1MkZkdUFyMW80UWZZOWhjREhYanFkS2lGcUxBM0Fm?=
 =?utf-8?B?NDZsUmVHZzkxSWE1dTFmSU1vS0ZTUFpNV09INko5bVBFWnB5czJVcGpIRVJR?=
 =?utf-8?B?Ung0RTBleTd5YlRxZWpNWUtkQmVKTGd6cjhsQVM3dzBQckcxb1h1VmFMWkto?=
 =?utf-8?B?dkpOcXpPSkNiMC9yMnBjR21oRUNBYWtSaHpEMmZIcjUxNDB6T1hmeW8vQlNZ?=
 =?utf-8?B?Mjl2OWZGZlVtM21UWjNFK0RyNnhNUjJ0ZzJoTjNNOFYySmc0VTZaNWJHNmtK?=
 =?utf-8?B?bjZJeG8yOHJ2cEtVWThUMC9DeG9qRGZYMk5MNksrUTUydnhqamRuMWR5ZjdC?=
 =?utf-8?B?cXpNWTE0QzI2NjB4VXJDTzM4ZG5rZ1daTDBGS0I4K3JQaVlCYkhCRHVGNjhj?=
 =?utf-8?B?ZWZ4R3Y4THNIRU5SUHFIRmV5SWQ2dlBhUXNjcVNBR3VQTUpWVm5qVXFTSDlD?=
 =?utf-8?B?cDZ5RGJwUk04Ni9lRFJqZVl1blkzbWxpMDA1ZHFLTVlLRVVVTWEyQ1hzZDZX?=
 =?utf-8?B?YXlvem9iSGFqK3lxODRKNXR0bWgvRlR5ekR1ODh4R0NXVTRWcE5CeVV6aHND?=
 =?utf-8?B?eUJEOFhkN0JDUGUzN3V5Yk5VTnN6WDBTR0V1ajF1SE9xUXFxNmljY0ZwNUZC?=
 =?utf-8?B?Q0E2NTVFUWhJZDBTMEE3aVkwZFhhejkzdHFvRkpYL0hRVENjWjdoNjRaaHd6?=
 =?utf-8?B?MzhpaDNNWmNpVXlGeGFEM2p4WG1pSEZQd3A5MWpPUDZXOWMxeGN6YXZJNG03?=
 =?utf-8?B?dEN6SzhwTDZYTzAxMWV5OFl3QkV6SEllWUhXU280S1B6YStpT0pjbjRzWXU0?=
 =?utf-8?B?cnJzMW5kTFFQK2c4dVIxb3VVaWRrM2JlbEU2UE5xM1E5aG5ILzg1ZnBlS29r?=
 =?utf-8?B?MlcrVENBZWthWG9VdUl0clhqTUNYWVdrM29aVGd0SDRGRUtIaGlTazFETEl2?=
 =?utf-8?B?bDlNVlVxOGl3PT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024)(10070799003)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ejE0alNXSi9PZjN2TVFCMzQ2UXNXSVNWSStGSWNEYVVtVXVJSTlRWDJlNnlE?=
 =?utf-8?B?MklUbkZ4R3JrSENXOUJNd0ZhYTcwcXZKNE0zTTJRd0k0bmtiK0k5Qm43ZEVJ?=
 =?utf-8?B?Y3RmRU5xMjkyS3dIcDZQdzlsK2o1bGF1c2E3NGZaREk1Wk9FNmhZREVoQnpX?=
 =?utf-8?B?bnBBcm5KY3pEams1S1JiTGdmb0tyOE9mblJaa1FEdEkzb1Fpa29icjJlSFJV?=
 =?utf-8?B?SDArekpjaEs5WUpYZlVWdGQ0blViZG0xSTBCWkJjM2dvUFJTOFZoeXNycDBU?=
 =?utf-8?B?UFhPRlMxbDlwciszajFXM1J0bjVUM2FqTE9uK01CRHNWWklETGUwK01LUDlr?=
 =?utf-8?B?Ymk1MDFtbnRoU1MyOTFCUTBsTEhpRlpWYXNvOFNzcDBDcmZCOWVoZmZ0dlFH?=
 =?utf-8?B?STh3dzVyaTkzMzVDY2VMM25WSGVUTEIwaDBDMk81RnJlNk1weVl6aTVybEdx?=
 =?utf-8?B?MDdmejhQL0U1L3FXZHhRR1A3NDdVb1RDOTIzRVVJTFU0dXRWbnUxS3Yvdi8w?=
 =?utf-8?B?RkwxejMrd21kVTFCWWlEQloyMytqZ0VRT21nL0x3YUxXMktSTXFFNm9lUTRI?=
 =?utf-8?B?MjFaWkNWZ3FXVjNueUZpd2kvbWVrL3B6RHBEVWxZTHN0UldFSStoZm1FK0Jh?=
 =?utf-8?B?dnowWjdkVjRTUFdaYTJFZmFDbTVFaVd3SkhWVVZ4cGVaMnhyT3ppeWpHRGJF?=
 =?utf-8?B?cWU2Ri92SVZ0MFVXblkrM080OTF0SkVpWkVKMnBNRW5aaDBIMzZaNm4yMnlH?=
 =?utf-8?B?cFFzYTB6MGhBYWIyQWRSN0J2cjhKYnYvSGpMeno5L3VIQ1A2djdLNnN0aGJq?=
 =?utf-8?B?bm9UMnVmT1VOakJjVTNoZWpEWkNoZXBLRG1ScjZlYWVVVnJxRGRWUGRnVW1u?=
 =?utf-8?B?dVA0c0wrOFdIWXdwZ0FUQlhxRDRTendvRzB0WTdPUnBuT3duQTZuSGhaOGFU?=
 =?utf-8?B?ZWMwcG9XRjNPd1h1NXRDWnhvSEkyMmo0bFB0VkhlUFlvSjIwQ2lnOFBqeERQ?=
 =?utf-8?B?YklQc1l3dmJSK0JsSFBnZVhjRzVIR0d4ZUdDOW9TRjFDdXJ4WWVVUERaMzlO?=
 =?utf-8?B?aU03ZE80SDZzcS9JNkh6cTNac21LZFJlRjN2d1BqckhmUFFDYlJjaDI5ek0z?=
 =?utf-8?B?ZUR5NWRISGtoN2pFaE1YTXMwS0doemxyZnFvcHBkakoxUHBqOG1pRG1pblk1?=
 =?utf-8?B?S256Z0tHK3FsYURJUlo2Q05VZlIxR1EvNENSckpRblNCeXVFVjRMZllYZHdG?=
 =?utf-8?B?ZzhwbStzVUQzQ20zNzlsY2Fma2UxaWpsaVhsU2VzQnV5UUdrTkwzN2JjbHV5?=
 =?utf-8?B?bWhFZWdXdk1FR3RPZUhJaEVxODVJaWcvdTN6YkVnTDFYWG1wbmVER1VYVS9o?=
 =?utf-8?B?SDZTWkJ2T000dWp1WHVWRzJZM0xmYTZxeUFoeWxpeG1GejBTelIwNG1rK0FM?=
 =?utf-8?B?emhYckY5N0pET0dOSkIxMWJHemNhcDlQam1pa3BJZHp5UzIrMExvcU81NmVi?=
 =?utf-8?B?RStGSHkxUVcwcFBKSUlKckcvUllhMlZGNGEwSmthcUF1dFRPdk1qOVZKUE5w?=
 =?utf-8?B?R1FEMkZSOWV2cnFZb1FsNjRKemRYb0dEbVVhYnBBS0wyYXhFWXR3eU9iT0p5?=
 =?utf-8?B?OTRvVk9xTjlkNUtiYVlFTWNlMXdmdzhuWVJqblV0NGZqZnRtYWlIcUlkVlpt?=
 =?utf-8?B?WTc5TmxFTFFrOFdzMVRsRGc5MlZlNEdBZFh0MG5hNURxdWRVK3dLT2ZHUGZQ?=
 =?utf-8?B?Y0J5Q1EzSHNGdHZmNU1VSTVaTHVZRFVya0xMeDdxZWFxaXVoREtCMTN3RzdV?=
 =?utf-8?B?ODQreVNDcUVQTytuVktUdExNWTB2R1gzcjRDdm55c1JsMWNGSGNQUm53MEZn?=
 =?utf-8?B?N3IwY3EwRkkxd0p5YVBHN2IrcFNoNkMzUkNOQlI5WWpPZm1MQmk0Vmd3bXBT?=
 =?utf-8?B?UnFONlRTclIzT2lycFBNTHJ1N0J4bDVyRUZ6d01wVEVmTlBFRkZjcG02YnNO?=
 =?utf-8?B?cGI0N1FGVjJDYTNmWmhSdzR4d2c5WkdqT29XeHhJaDJHSHhweUh2Q1VXVDJN?=
 =?utf-8?B?U2hnU1FxRC9KQm5qRFE4QW8vaGo3TExCajJ2VHkxREV5VzZXZnVXdUpUTk1t?=
 =?utf-8?B?VWpSWjhVRCt6N1RrL3dYQXBadkdPWExNOWZCVWpMeXNERVRzbmticDNiMmZV?=
 =?utf-8?Q?IPK+DTFfjsDrmULDIu13B+0bmnINCEMMrg32wxHqSJFI?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b7a2fa0-e659-4988-528a-08dde0b03b3a
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2025 12:42:47.0412 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sH+whSAxheYsQwLG/TrxCLrO+g9XB22YzZQ92V2Chz79VxsqIJQnkCte2qH822CjxNg/hBRcsF+eoH242+U3sw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB7961
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

Make use of the newly-available `Alignment` type and remove the
corresponding TODO item.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 Documentation/gpu/nova/core/todo.rst | 1 -
 drivers/gpu/nova-core/fb.rs          | 6 +++---
 drivers/gpu/nova-core/vbios.rs       | 4 ++--
 3 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/Documentation/gpu/nova/core/todo.rst b/Documentation/gpu/nova/core/todo.rst
index 48b20656dcb16056db7784fa186f161126aae9aa..89431fec9041b1f35cc55799c91f48dc6bc918eb 100644
--- a/Documentation/gpu/nova/core/todo.rst
+++ b/Documentation/gpu/nova/core/todo.rst
@@ -145,7 +145,6 @@ Numerical operations [NUMM]
 Nova uses integer operations that are not part of the standard library (or not
 implemented in an optimized way for the kernel). These include:
 
-- Aligning up and down to a power of two,
 - The "Find Last Set Bit" (`fls` function of the C part of the kernel)
   operation.
 
diff --git a/drivers/gpu/nova-core/fb.rs b/drivers/gpu/nova-core/fb.rs
index 4a702525fff4f394b75fcf54145ba78e34a1a539..344cb5d2d919c456212d60d7210667de8041f812 100644
--- a/drivers/gpu/nova-core/fb.rs
+++ b/drivers/gpu/nova-core/fb.rs
@@ -3,6 +3,7 @@
 use core::ops::Range;
 
 use kernel::prelude::*;
+use kernel::ptr::{Alignable, Alignment};
 use kernel::sizes::*;
 use kernel::types::ARef;
 use kernel::{dev_warn, device};
@@ -130,10 +131,9 @@ pub(crate) fn new(chipset: Chipset, bar: &Bar0) -> Result<Self> {
         };
 
         let frts = {
-            const FRTS_DOWN_ALIGN: u64 = SZ_128K as u64;
+            const FRTS_DOWN_ALIGN: Alignment = Alignment::new(SZ_128K);
             const FRTS_SIZE: u64 = SZ_1M as u64;
-            // TODO[NUMM]: replace with `align_down` once it lands.
-            let frts_base = (vga_workspace.start & !(FRTS_DOWN_ALIGN - 1)) - FRTS_SIZE;
+            let frts_base = vga_workspace.start.align_down(FRTS_DOWN_ALIGN) - FRTS_SIZE;
 
             frts_base..frts_base + FRTS_SIZE
         };
diff --git a/drivers/gpu/nova-core/vbios.rs b/drivers/gpu/nova-core/vbios.rs
index 50fbea69fc0038255a0a2b8f7bad57cd55eb65a2..9b81c39b11cea91a93359a239078576165a07200 100644
--- a/drivers/gpu/nova-core/vbios.rs
+++ b/drivers/gpu/nova-core/vbios.rs
@@ -10,6 +10,7 @@
 use kernel::error::Result;
 use kernel::pci;
 use kernel::prelude::*;
+use kernel::ptr::{Alignable, Alignment};
 
 /// The offset of the VBIOS ROM in the BAR0 space.
 const ROM_OFFSET: usize = 0x300000;
@@ -177,8 +178,7 @@ fn next(&mut self) -> Option<Self::Item> {
 
         // Advance to next image (aligned to 512 bytes).
         self.current_offset += image_size;
-        // TODO[NUMM]: replace with `align_up` once it lands.
-        self.current_offset = self.current_offset.next_multiple_of(512);
+        self.current_offset = self.current_offset.align_up(Alignment::new(512))?;
 
         Some(Ok(full_image))
     }

-- 
2.50.1

