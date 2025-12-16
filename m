Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A3565CC1126
	for <lists+nouveau@lfdr.de>; Tue, 16 Dec 2025 07:14:30 +0100 (CET)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id DB92A10E6D7;
	Tue, 16 Dec 2025 06:14:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="pdedfgr7";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 1EFAC455A2;
	Tue, 16 Dec 2025 06:07:02 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1765865222;
 b=wsbmCfBpydnCj/kCrPHtKTHdxSDByYY5N5ovLcdYeZpdMl1jF0DQ7iswgslrbJupy2lKM
 DK/pVRlYyOObZTNKut/yG3/be/TVCBZJM3zSFw3Yqpp6hhBjuq210qQiLKlQLoudcu7Ejdt
 Kh84Pw+OvMvwmfTIiQrdthKJp4oSA3PoIIWzfxQB2Km3IzeH03I9LddGyWqamPb3F9mWS5t
 JyO0RXnGmfxjpOM6IhNTyHxxXcXa24NllaBwAd9c6l6y7kXKyXwHGGBh/l4xNzhWcfZlbPI
 jhITjYHrkMg4TlhPVi9G4CoiimTHjdkc8OzsLJzBGlT5Ri7vpkWPvo4bIpgg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1765865222; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=uSbfEBGsaPiIX2abW9bqJG/MJtma8cEQIliLvUnVBVc=;
 b=BhAde5uETDlKGGQmjfKY1tYBAP/yv4usmv+is5M1e3nLgIwIZ756lq73fKESq04CN7z8Z
 z9/tDh11Hhs77RLszdQchu78Lr+VThz0m47XAGX9uFK9tdWWDJX/PNWvrekbiQROGU6Tjv6
 MihueyUsgXXmJ6KY5P0YCvksoO1tpx0RcCnxq2Rx0eK2gi31iyDtIa6jsESetIQw1f365EG
 KlbUrzL6iuM7FebWx1ovdquVvUueYnydmd4hQ316y3rMoT1FzPx93jmDVzNOMbPkgzDXDyq
 EsZRTAyNX/hs9N5PjTtdeKzD2Z4Uib3rFhsJusvoQ7OAsy2N9PQ61LEqAwQg==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=Nvidia.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=nvidia.com
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=Nvidia.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=nvidia.com policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 63C3C4559D
	for <nouveau@lists.freedesktop.org>; Tue, 16 Dec 2025 06:06:59 +0000 (UTC)
Received: from BL0PR03CU003.outbound.protection.outlook.com
 (mail-eastusazon11012069.outbound.protection.outlook.com [52.101.53.69])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 996A410E6CE;
	Tue, 16 Dec 2025 06:14:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BAKoy9N70mZITHVoecpwtEqPOt3SfRIeC+GJ2tF6j7d7P6FQ8nXINEEppbTJi7AFqggPcdt0CiKsi/IKBBY5Z9ZDRNlXqz6t6prwJWs6xATO/iseCi6jJyMJ3XS7IXBo1A2tpJzaXW8NKGao0g1Kblh0kYb95A8WuCNVZ3Pzt7ZwAX3AiYTRHcFH5LEoNgL1NEueNnw9q7fzjcgk2iCb15d+2VlWd7ob+kZQ4FuwjjNb4gd3Dum8emiDPj92WwjUwaL738Tmf9fA4+TI4WyxYy2meduOtlpFMuOUklrz9v67MYhoNQEa8kJhh+mdoIN3U1vs9/KOt0wnIsXOsVPeuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uSbfEBGsaPiIX2abW9bqJG/MJtma8cEQIliLvUnVBVc=;
 b=mmaf1Z7zGXEEbvBJzAxPoV7sePjylI2D0xkyQAW7Lzl8UKUBLBG9Z1zKpC8IezPWfmlhekrA57LLoXvzm6O+KxHktiLlnlk6rUmCmkJAIQPoNx0mlDDv3Do/WjerHscppVpX0tzeCTISTRwW5cbcLxmNunLI+msfIq2ZFh/vqeBHXVw+wRIHd59LRUr4l5SEpMxSgSSQGAiH2cf5JEhyNwo2HjguReDzwmHuf1/vkjU/l+eKsmpecR73GcylLoq1sNuvF3Y9fY4HKvwQT5u/AQtFpVlCqR3q+++JRTSV+31oHCFQloDobCKNcQ5i0AV+knPZxCMcDhrMigUlSToOBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uSbfEBGsaPiIX2abW9bqJG/MJtma8cEQIliLvUnVBVc=;
 b=pdedfgr7EYXUa9NjLuYEq17czJz/OK+MoWuc9SGDTiKVaj/fUASeFiH+2qDC5T4XUacuWqSRvaMSDLWAJZjuXCx/epizxvgYbTSjVrE0EIMa0O4dmItfKAyecxtzX2jik34Va062mSdOEI6udFD378Z1Yei+S71/9TdGTP17fI+86eb1tJc8iICuGxaT6KU1Zsp8t5AjpcIszB9eqPRGWWHEGWpJnesamEq2x1Y1Nnp5stz9Z0gEAUTyZBZVrdAVcQRsNdrgTO8Ngd+qMV1ZCu0nN/jNrUrzjh6RfmQsGJ48nMaYw/T0PG71yYNsXFOLowAzGByhJYxxeBHF3W39qw==
Received: from DS0PR12MB7726.namprd12.prod.outlook.com (2603:10b6:8:130::6) by
 DS7PR12MB8231.namprd12.prod.outlook.com (2603:10b6:8:db::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9434.6; Tue, 16 Dec 2025 06:14:21 +0000
Received: from DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe]) by DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe%4]) with mapi id 15.20.9412.011; Tue, 16 Dec 2025
 06:14:21 +0000
Date: Tue, 16 Dec 2025 17:14:15 +1100
From: Alistair Popple <apopple@nvidia.com>
To: Alexandre Courbot <acourbot@nvidia.com>
Subject: Re: [PATCH v3 2/4] gpu: nova-core: gsp: fix length of received
 messages
Message-ID: <hbo3azmt6mpaq7dyn4mnitrg3iouk3eeijjqinpl4grlufrvqr@6ieka4obgszr>
References: <20251216-nova-fixes-v3-0-c7469a71f7c4@nvidia.com>
 <20251216-nova-fixes-v3-2-c7469a71f7c4@nvidia.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251216-nova-fixes-v3-2-c7469a71f7c4@nvidia.com>
X-ClientProxiedBy: SY6PR01CA0033.ausprd01.prod.outlook.com
 (2603:10c6:10:eb::20) To DS0PR12MB7726.namprd12.prod.outlook.com
 (2603:10b6:8:130::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB7726:EE_|DS7PR12MB8231:EE_
X-MS-Office365-Filtering-Correlation-Id: 4eed6b42-4b49-4fbb-9787-08de3c6a5a15
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?YStl6rN9H3g/0MgG0fx9oZGKwq1q01ajtOcgUrQGOqPiwMgVAd8p5Kx2ObyK?=
 =?us-ascii?Q?UcwJxxGYPEjicqylcGC8fl1JNdR7RJXoojTjFjTplT+n6s83PxJO8S8uYPLk?=
 =?us-ascii?Q?rvEgwzGX3DKZ0BW4mcZzl7fepXZwAGhn4OOZWb61dpKpZcXvgY9J/T0iDV2B?=
 =?us-ascii?Q?5Zpl1y2ebBzGgSQbak4CvAsk/CAX0bkupAGmfbVuAW9ObdFNScWTdzfiNdCD?=
 =?us-ascii?Q?+a5ynDmalwlKsuh2gFP1pPaqsymhxmuNgPoNIyy5nHaMbkAqfwUBp7ESMIO1?=
 =?us-ascii?Q?3UmQeRVblLT1/7XrxgSjIoQsgWAdp85ZJDpyfCYfgY2WHOqXw9dChiMs8VPT?=
 =?us-ascii?Q?gAjTxSZ7f3T2lc0JKFglkyxla73HNsUmWlmYobTbraMMSE7pSS2xPdaI552y?=
 =?us-ascii?Q?38z9LhU6ms5ovfJCrevBb90NNFvGlB/l9rmjL734b5kwad5qxMrRanUB6cBb?=
 =?us-ascii?Q?dcUVd9FmaQA4vASmv2vW0FnGxWWOGFapykpsqCDQNtub6eqg6Xnne+xWsqVI?=
 =?us-ascii?Q?4xkbfn1qHesAFlXIEt6gqABlPShT/cIfvwGD0QpgRZnCJ1UHvBWPS5BM8gZ9?=
 =?us-ascii?Q?+AFkusOIuLQtyAXpnAZJQ35jr8YpfKgN3Oudr31PJlrlcOjPScGJx8i43Da+?=
 =?us-ascii?Q?gFWapbLSp1dCchNmjRZtfomD4Lqg29DmZ16PgRTPIoWaGbzUkqxlvf1vKYKf?=
 =?us-ascii?Q?eFcx6KvuCy09mVPzmuLJVtzQAGXUSKlS4lkbf65xhRlyao7bxoJAOimY6eOm?=
 =?us-ascii?Q?2sRnm70wBA35td6RTv5h+13g2yPq/RS96FZ6zKp3CvAh9rKTXDhqiVMVj147?=
 =?us-ascii?Q?5JbcRaXMjm4hc8KgqQtpiAmDMLaO0mqbSSdUGPAUWkb8DnkM+ciadMmEyEUC?=
 =?us-ascii?Q?xKJ33SyleN3mM8BIDAczvgJkK6G8IQFRKVnK29LoiZSX8hUwvqpRhyTJP4Q0?=
 =?us-ascii?Q?jZsF5iO6gQRb09y50XKxWdhkejmjxBvqK2jCjomVxTqpMgeW3TKkAvDVSQ7c?=
 =?us-ascii?Q?+m5Q4jVs+DGNGLZaC/UmSCnEYY1+Z7KUmb2t6TD5TjkSkkXcsKosvUYqbaXL?=
 =?us-ascii?Q?BiRwQVS+WOwgUocwJFAuhh8JQx66uxsVD+G11HjOYXYHOGKKEL5gN2c3Zur+?=
 =?us-ascii?Q?pD7tiVFYoXEaRGhiCfABDwumNeg02JShXjNswn4GgVIo984S1h/o1WHnxcEp?=
 =?us-ascii?Q?c6zhrTSrfkmAadxiox6i/2LerckqN7K/lHRunxxl+fFbPlGMD4BtBYMO5AdX?=
 =?us-ascii?Q?YaUltxq8KCYi5CXuYPR3ph+I+6gYlsZYGa7merbRBsoj0Rk6B/uuYacCJHEU?=
 =?us-ascii?Q?ajaf441MwZqXqxyYvazcK7qLXPXM9bTpsMnce4Z6UBk/O4Ga4VzM4k9i+oau?=
 =?us-ascii?Q?1x0vMCd4hxbTd8FaNbq4LIY2FA1jbelCepZSCutNFSRQDvpO/4/4v27ajpBW?=
 =?us-ascii?Q?Fq7i3pMFPWIIUFz5t991HhVRNmxDk9hP?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR12MB7726.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?+/LPgg+r1P8ZzRxtL5rRiXSIajj0Es9xGUS27pwt04dwY/QFfmvBGzGOe63Z?=
 =?us-ascii?Q?pm3kwqrT6jJrDYqxa/D1TcLLiid8Q4UpSEAuqqHS4EqO62EKxK5BSCe9Cfbm?=
 =?us-ascii?Q?+tMuLFA07tHZsyQNolmzKz5siawADqt04prdE/a0xxBzjS/KAroeAtVXMKST?=
 =?us-ascii?Q?rSOGQnAqbEtU0n19OtTIwpkL9f9qPdMvW2m+RPT+dS4Om2B+qWX/PLT+QAN0?=
 =?us-ascii?Q?arsR9vwSIh8vuAxZMdJ/WdrQGwcpvq7lFhq4gPi/PN5PVLFGS+z5ZzJYhMaK?=
 =?us-ascii?Q?Tlgw5e2erL5NZjAmK5GxjheCST0vLT+gvwpLvlymiF85ydPARZyMfJYNVLIx?=
 =?us-ascii?Q?xHiLTwmgGR6hm0qqzjCcQ61nF6gHccNi6X0kya83Uzh6WQVDGRBgo8a6R33q?=
 =?us-ascii?Q?ugzxbi7cy1Ny0WuhBys5791H0fquYbt5E8u6uPCzWdLPQqQgr2KROBbjztG+?=
 =?us-ascii?Q?2YeRzF0yV2N+eAGD4pXuw/vC2ZHUyOxqYMupUywUBPlhjGA6aRe07UP+hdv3?=
 =?us-ascii?Q?vHQtpo7hlcBfvyTuLkH8g+N2ZV9FVedGxljjTXIFSx5WcDtKyZgsFnGovvzP?=
 =?us-ascii?Q?vb+vrPaXt736ycAH5oDnufqNLNGe6pqH9oAx4gTzp9cf2rjTmX37l15w2eMd?=
 =?us-ascii?Q?W4QUcyu+0Frt6VVNkeJZdtxXEfFycNVaW5dhIO06ehcNp2lCqAqud60Re/CL?=
 =?us-ascii?Q?TAVMJowHLt6QPxV1CvGPiLuLSSm3XcRL/iKbAukzqrKPcfmPPvjdfJABrgjC?=
 =?us-ascii?Q?ST02wyGCSV+m+7XzKRHmTDCF6vtAYV63Vwg2E40KMKrLoxyWWwqPOdy8B1va?=
 =?us-ascii?Q?Ic9tmQJFFQwupOmIK0b3Y/uNWqLg0LPcx4pQ3zFY/9cF5rI/1MLbLC/uoT5l?=
 =?us-ascii?Q?eljqUe+T2MiuILfctZO1Z+jbESPzVtCT8dhwbpNu1lSJc5KNz81wjLDzwpNk?=
 =?us-ascii?Q?a4vDpRZ9tRA80HG1YLN49ro6QR4C6babwwX3zwv19lvIJGf7CqaCUWuDbX4l?=
 =?us-ascii?Q?dvlFqPmCH98Ngbz2pcypVgNUrlxqQ63oP5maQCN7k1WSPVfiwuhHJaHSbG9N?=
 =?us-ascii?Q?lbsGv3JW+xepvmnKLpJ4QKrz2lVME7rDPkboABneaasgy6zuckeI804xfDus?=
 =?us-ascii?Q?t5Z0OO+uIxvUcwgvG5Rb1mTbaoYs2OiheMlv2GRTqJm1UE7zB0Y+828GE/o9?=
 =?us-ascii?Q?kSRt/zbj5UlVYyN/TL71t/RtfI9bKmBafTopGQ1xx7tfghR67ktPxHGMdEAh?=
 =?us-ascii?Q?xuHY3R1btl1ZsfuwtHAD1NJkGO7PJGA+Yyo03jTGMTNzrPDgiWcEN5xhf4tq?=
 =?us-ascii?Q?Z1qnSFlXy2bnS8bxo7f4MMt8jxl1ouviOX2ucCb83Olb8EM81yn4BbhQyd3c?=
 =?us-ascii?Q?F+CHfIdgCeqnp4Vxbo7hCrr4dz44kfDckXiRVeEOFWSv7Qa+ZpAI921TXFM1?=
 =?us-ascii?Q?ILrFJb8vFMH7ZccAyQQyfajykCvSWQiGWmx+yxmpfmdm1mV9T9JR6m11Ni5+?=
 =?us-ascii?Q?aftpmxLAvBWze/Y/apvdBZbe9EwZ/biiKU2SVGmnid4O/tvmPrge0/qbe3U8?=
 =?us-ascii?Q?ZcJUJ6/Q5U1VrOnYetwYqkZO02fv44a9gBlU8rc6?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 4eed6b42-4b49-4fbb-9787-08de3c6a5a15
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB7726.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2025 06:14:21.0313
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 SstCbJ43nVg0gXk6A1lAUB6IWkHfmm8DgHZi9gtX3ZtNgIINBkBPG7axJ8iEEk/F3aMJOMWUOfsS/G7cSM6M7g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB8231
Message-ID-Hash: M5NTKLKFLXRWD34M6ULJPS7TFFRHVMOV
X-Message-ID-Hash: M5NTKLKFLXRWD34M6ULJPS7TFFRHVMOV
X-MailFrom: apopple@nvidia.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Simona Vetter <simona@ffwll.ch>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>,
 =?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Trevor Gross <tmgross@umich.edu>, Joel Fernandes <joelagnelf@nvidia.com>,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/M5NTKLKFLXRWD34M6ULJPS7TFFRHVMOV/>
Archived-At: 
 <https://lore.freedesktop.org/hbo3azmt6mpaq7dyn4mnitrg3iouk3eeijjqinpl4grlufrvqr@6ieka4obgszr/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On 2025-12-16 at 13:57 +1100, Alexandre Courbot <acourbot@nvidia.com> wrote...
> The size of messages' payload is miscalculated, leading to extra data
> passed to the message handler. While this is not a problem with our
> current set of commands, others with a variable-length payload may
> misbehave. Fix this by introducing a method returning the payload size
> and using it.

The whole inconsistency of the message element struct not including it's header
fields in the size whilst the rpc struct does has caused endless confusion, this
looks much better, thanks for fixing!

Reviewed-by: Alistair Popple <apopple@nvidia.com>

> Fixes: 75f6b1de8133 ("gpu: nova-core: gsp: Add GSP command queue bindings and handling")
> Reviewed-by: Lyude Paul <lyude@redhat.com>
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
> ---
>  drivers/gpu/nova-core/gsp/cmdq.rs | 10 ++++++----
>  drivers/gpu/nova-core/gsp/fw.rs   | 13 +++++++++----
>  2 files changed, 15 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/nova-core/gsp/cmdq.rs b/drivers/gpu/nova-core/gsp/cmdq.rs
> index 6f946d14868a..7985a0b3f769 100644
> --- a/drivers/gpu/nova-core/gsp/cmdq.rs
> +++ b/drivers/gpu/nova-core/gsp/cmdq.rs
> @@ -588,21 +588,23 @@ fn wait_for_msg(&self, timeout: Delta) -> Result<GspMessage<'_>> {
>              header.length(),
>          );
>  
> +        let payload_length = header.payload_length();
> +
>          // Check that the driver read area is large enough for the message.
> -        if slice_1.len() + slice_2.len() < header.length() {
> +        if slice_1.len() + slice_2.len() < payload_length {
>              return Err(EIO);
>          }
>  
>          // Cut the message slices down to the actual length of the message.
> -        let (slice_1, slice_2) = if slice_1.len() > header.length() {
> +        let (slice_1, slice_2) = if slice_1.len() > payload_length {
>              // PANIC: we checked above that `slice_1` is at least as long as `msg_header.length()`.
> -            (slice_1.split_at(header.length()).0, &slice_2[0..0])
> +            (slice_1.split_at(payload_length).0, &slice_2[0..0])
>          } else {
>              (
>                  slice_1,
>                  // PANIC: we checked above that `slice_1.len() + slice_2.len()` is at least as
>                  // large as `msg_header.length()`.
> -                slice_2.split_at(header.length() - slice_1.len()).0,
> +                slice_2.split_at(payload_length - slice_1.len()).0,
>              )
>          };
>  
> diff --git a/drivers/gpu/nova-core/gsp/fw.rs b/drivers/gpu/nova-core/gsp/fw.rs
> index abffd6beec65..7b8e710b33e7 100644
> --- a/drivers/gpu/nova-core/gsp/fw.rs
> +++ b/drivers/gpu/nova-core/gsp/fw.rs
> @@ -853,11 +853,16 @@ pub(crate) fn set_checksum(&mut self, checksum: u32) {
>          self.inner.checkSum = checksum;
>      }
>  
> -    /// Returns the total length of the message.
> +    /// Returns the length of the message's payload.
> +    pub(crate) fn payload_length(&self) -> usize {
> +        // `rpc.length` includes the length of the RPC message header.
> +        num::u32_as_usize(self.inner.rpc.length)
> +            .saturating_sub(size_of::<bindings::rpc_message_header_v>())
> +    }
> +
> +    /// Returns the total length of the message, message and RPC headers included.
>      pub(crate) fn length(&self) -> usize {
> -        // `rpc.length` includes the length of the GspRpcHeader but not the message header.
> -        size_of::<Self>() - size_of::<bindings::rpc_message_header_v>()
> -            + num::u32_as_usize(self.inner.rpc.length)
> +        size_of::<Self>() + self.payload_length()
>      }
>  
>      // Returns the sequence number of the message.
> 
> -- 
> 2.52.0
> 
