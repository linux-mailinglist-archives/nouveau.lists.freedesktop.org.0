Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A033D3A869
	for <lists+nouveau@lfdr.de>; Mon, 19 Jan 2026 13:17:32 +0100 (CET)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id D873F10E438;
	Mon, 19 Jan 2026 12:17:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=garyguo.net header.i=@garyguo.net header.b="b2FiUtgH";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id BDEA344CA9;
	Mon, 19 Jan 2026 12:08:48 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1768824528;
 b=iYkOt804YhboSaNsUn8aJkiPmZrmVf328o54ZwRXLRqUXmdwDOCkKam3NH1MAq6L051qO
 IE1xbh3yTgZ0bfu4+7PLW9yVDUgTA4Cb/KPxlJgVtaB+BhOmYilCytBwOvuf4Ya6PoLl4OJ
 shI1h5Zwa1lYPvZIOmmnYe8dsClrYpUriPvz79yGGreBWpOT+8117zYpvBpDP7q2hQH36jz
 I5Qcc8IWT+gV2GDMnHtoQTE7HGfBrnLYVE/NZYpZDeK7ZGa1fF4Q12TdwZkc/CUsUZpXSmT
 spLPG6dnv0LbbUQZ0kjtvuT52DfaMV+xe1+UiFIo26lfBM3gILvBImcWglAw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1768824528; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=pNrU5UGfVPijVhHwcygWDErrpIxJK4w3hRW1/UkuiRY=;
 b=Zofwh5OpWfA1Eutn96xgo3TqLs6PZZo5XsaGqHPvIv2HWeSboqDDkMKnSn8UhTLOMdVvR
 AfRmLfSy0B4RsBrA9am4vpdh+glCrg1nPfkdLZKHev/y+M84hrAI6knUeftbdlNcxT48kNv
 v/qzjaXuPD0mUH+orWo7XiWIYzUEJtQu20ZVZE0SVTT7gQ5zBY8urshIJZ9cBhW4MBu9cH8
 8k/5uVVCfjjDo+Z9tyGvdkICmfkLXdMj/j0Z8LhFsp+sLYlshLez0JAKykl8rhAggPyCtCA
 aDbHBxTqdqnZsH3xQb4c8GG64/EoTK3y5iuAcFumKRi94eu/jwpowaTQ8cnA==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=garyguo.net;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=garyguo.net
 policy.dmarc=none
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=garyguo.net;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=garyguo.net policy.dmarc=none
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 1011A44BB3
	for <nouveau@lists.freedesktop.org>; Mon, 19 Jan 2026 12:08:46 +0000 (UTC)
Received: from LO3P265CU004.outbound.protection.outlook.com
 (mail-uksouthazon11020130.outbound.protection.outlook.com [52.101.196.130])
	by gabe.freedesktop.org (Postfix) with ESMTPS id C874510E431
	for <nouveau@lists.freedesktop.org>; Mon, 19 Jan 2026 12:17:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OgzjB0pv7yP4EAWcZwKwt19YW0WwnZiNlXsFpG4OD34Y9y9VWChIG8gU2M7Ok6MwL112hHDQWqjgw8dpCifzqjpUWueIXeA11SrDUydpxcksq2urDzNVL9RkUN6k0ysxWMgV3Oam4myzKO6zJFi2DCvMpeLJiXKxoKWRgy1h/UXlShzp6mWzMT0vH1fjChVevQqx3KnvnY4Imm3lT0UH44Xm2/t18SSiQVQz2Iu/JV2Aho0PcZeCH9pVJ3eWyELQOrOFz43QNK9KtwQQAdTnvrpit2v6wBvOjV2sj0iWm/8PA5E5tNNRBncan1XuqwkyheDt7+LXSmuLw5gfdkJKSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pNrU5UGfVPijVhHwcygWDErrpIxJK4w3hRW1/UkuiRY=;
 b=fX7EdGTk5s36WqasTkCGal4unrYqtcNIZqWlWALRka/ykS2e4FQ2X4Hc5ucutXSQjUAkh9shXOypsnoOMVyNr28lKRNmoq8mfSe6rtMr6vLhCrcn08b7EBNpvhntPcVfLYGMuXA/cz1Q28sLK01/8HX1iaP/fxfD7oPypGhSpR64LMHGdeOgvLLhpcsWB7YO0aaNVx/VNZ6pW8NyOp0Lq2IP3EvccdJ0oJunJeCWW2OphFKgQKeE73Lk4eOG1fBTn10GlYCL5GLJrE8RFrn0PXj+1Sf0wF7B64NdxFYry4Yc7zVXdQio/hoNveE7T87gj6mMz5dZix1H9mYAlZmANg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pNrU5UGfVPijVhHwcygWDErrpIxJK4w3hRW1/UkuiRY=;
 b=b2FiUtgHpw6ik4e58ugwrWASzGmZRWGqp8JjBy8HtKsRHllcWO7tCt/DAAjXK2vIFN0sDbW5KVqts5FIlzPqwxJ4WnnEbWRUVuo8rdPQxu7WsqaZoT9q9mO3cj//zPQkbbFNeBWc26EZxbFNRlfGjtb80pXftgBBZGfLN8vvONI=
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LO0P265MB6196.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:24d::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.12; Mon, 19 Jan
 2026 12:17:22 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9520.011; Mon, 19 Jan 2026
 12:17:22 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 19 Jan 2026 12:17:22 +0000
Message-Id: <DFSK5AJR2K54.UNS6PT7MV5W7@garyguo.net>
Subject: Re: [PATCH v5 4/8] gpu: nova-core: implement BinaryWriter for
 LogBuffer
From: "Gary Guo" <gary@garyguo.net>
To: "Timur Tabi" <ttabi@nvidia.com>, "Matthew Maurer" <mmaurer@google.com>,
 "Danilo Krummrich" <dakr@kernel.org>, "Gary Guo" <gary@garyguo.net>, "John
 Hubbard" <jhubbard@nvidia.com>, "Joel Fernandes" <joelagnelf@nvidia.com>,
 "Alexandre Courbot" <acourbot@nvidia.com>, <nouveau@lists.freedesktop.org>,
 <rust-for-linux@vger.kernel.org>
X-Mailer: aerc 0.21.0
References: <20260116214959.641032-1-ttabi@nvidia.com>
 <20260116214959.641032-5-ttabi@nvidia.com>
In-Reply-To: <20260116214959.641032-5-ttabi@nvidia.com>
X-ClientProxiedBy: LO4P123CA0139.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:193::18) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LO0P265MB6196:EE_
X-MS-Office365-Filtering-Correlation-Id: 3f7f24e7-50dd-4656-5f92-08de5754b318
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|10070799003|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?M3dBalpvUklZUDBINUNWVXRBa1RBVmFQeUlKbEhEWTVOMW9WWENHd21vQXFq?=
 =?utf-8?B?OHllczFuWFlSeFdpWnlPZGxLNWtxbzd6SjVva1NQSkhQbXE0NjB0K21pN2Fi?=
 =?utf-8?B?Zml3MmNHbmJYd2huNUdWUDA2UWxXYzd5QTdZR3FRaXluUCtXVElWOGswVDM4?=
 =?utf-8?B?MktneUNINHVVYTErSUYzYUVENzU1MkM0dHU2SXVLdGx6TjdMSCtPemdPSEp6?=
 =?utf-8?B?VW50dUlCeUdOYUJ5SGpJbGdERDJ3MzV3dWJKT1VFUldTTWZMajIvZkZxU1Ev?=
 =?utf-8?B?QlR2c3pKb28vTVZ5THlXY2w3blUrL1dOVk96TUJPcWxEYlJOZHVURjhST1BW?=
 =?utf-8?B?eDVDNEhsTXBacDI1dlRJcXhWZjMybzBTN3p5Zm5FZFZ1ejd4STBYS1BUZGY1?=
 =?utf-8?B?aVZoWHQ0VE5TTGxsNEdKYzd1SjNieUJHWTNsMjcwcjNBcS9nRVQ4NnowRnMx?=
 =?utf-8?B?cUVJSzBBRTRLT1dHTFJHL01sMDdiMmFwQzJLMDY0NDJHSk9nbGNZUHZkZ2JB?=
 =?utf-8?B?TStzaGlJM3d2bEdxeWVXbkhNWmNNSWRKSXlOblJ2UzRPdFBJbVRFUUhrWGNZ?=
 =?utf-8?B?bmQvd0Myc1V5UERLRjgyN213WVpLQ3ZqWFJkb3VFVys2bWhYMkhIWmE0S1RO?=
 =?utf-8?B?RTdBcGo1KzI4Uzl3TWdheXNQdFNyZ2NOQWhZUWxwa2Ixb1RYZkRNdUM4KzAr?=
 =?utf-8?B?NzBHU3lkR0F0bjNDNGhsMWdDdCtzU3ZIUkxNbUg3bHF4N2pUTnNOdnJxRjZC?=
 =?utf-8?B?RnYzQnQyQ3pLcjBFMVc1bDAxZjlIWGtzREJPeG13cUhJOHlwdVQxdllxK2Zm?=
 =?utf-8?B?QTlneDI2TS9NSFBWL3lLWnJzMFZENHQ0L2dMVFlub0VCUXVURUtERkdlQzVj?=
 =?utf-8?B?ZzQzNUMzOFhsaUZralI5NDdsYnE0ZFpwRW1GL0VOSmYwRE9BcG4xeUNXOGlQ?=
 =?utf-8?B?dVBYTWNEK3FUQkphdjJ5WExnazNkbldseUlGckQ4VUczZzZlMWNNNmY3QXo5?=
 =?utf-8?B?MURSOHJ5MDkyeXdxV3F6SVFKWkpJQzU4cWFQR2xMekRKOW9OSERTNDJ4cHN3?=
 =?utf-8?B?TjhZVXh2NGlLdXV2a2l6VGl1M0c5OXYrY0tlNXNMdi8vbW53bzk0TFRyNkpR?=
 =?utf-8?B?cFVZbTlaTjNvdW50MUt6eE40YXBMKzA0MEZsdWdJRGUvbnlxN1l3eVJmdmc1?=
 =?utf-8?B?eDdqcmM0am5nZDVrZnFZeXQzYTA1ME00SzJrNUNvbkdxcDBmNHlXOTJJZWFU?=
 =?utf-8?B?UGNMcW5YVzJ0UHAwWlNpNGtoNnp2WkYwNjhmSW1KYndWOUtIci93MHhYZEdv?=
 =?utf-8?B?bkt4cjFhemFpeGxNOC9oUVBpQ0cydVc3K01MVTZESW9haHR5OHpjT1FabE1l?=
 =?utf-8?B?TjVKUmJPZEpvU1ZHYUhpZjJxYng1eWJXMWIrTkFvYWFoRFUvL1lyQkJrdFJa?=
 =?utf-8?B?WTV1RnF2eUpWekRxR2N5QWJHSGM0ZWhvOVQ3bzRPREVhZGR3azdCYnVzb0oz?=
 =?utf-8?B?T3h6cG15UjlUVGlQd01mWGFXWDFqNXVxNUVYRkFLeXJ1c3JmRStRaFgyZ2VT?=
 =?utf-8?B?Zml0Ni85MEtxTXY5WVArampYYjc3WXNxVGtqWWZYVWJLSk9mbDVPZXE5amxi?=
 =?utf-8?B?YzVqZU1zWlhxdnFpbmQ0NndpakU0c1hwQS9TSGZhZUM1aUhJNE5aRlFvUmls?=
 =?utf-8?B?RlorN1NOYUozUlFBU2srYmVmZElDUFVBQTVQZ1g1SlNaMGFETkJ3TkJHTTJU?=
 =?utf-8?B?Wk0zS2lmb2h0Q3BiUGVweklXb1NBNExlczhrTGVndlMwZmF1QU9lT3dHcFV0?=
 =?utf-8?B?ZVJPV3hKQXdXQVBpMDFGWWQxdmtIb25mTVExUTIwSzZoS08zekxyTkhVTWJZ?=
 =?utf-8?B?UWFQTVRxcGYzWnlSK3FmeGlSb3NBVzdPQ0xBdGtpTGpaTVlTb0dWbkU2ckdM?=
 =?utf-8?B?OENzbTBIWmE0MG5MVGJGQ1I4akh5Y1pEVW4vdDNVNnptUUozNTdNOVFneFBS?=
 =?utf-8?B?NzdPYmtPVkVyNEFSZHJXVnJBc2lJNlpaT1RsRHM1UjA0QXZZdDdKRXY0UVhz?=
 =?utf-8?B?cU5Kb1lGUjAxUHFzVnVsbFNGclg2ZS9HdFprN1FOc0hZZThvcjNDT0hteTlL?=
 =?utf-8?Q?PYqE=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(10070799003)(376014)(1800799024)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?R2JxWFREMEw3NUQwOXdkK0xIdHprUXlsVnZZcXIzOGtHQ255VkhPSGQ4SjlE?=
 =?utf-8?B?bktvWkFmd3RZQWluWGxHS2U1SFhvUjF1T3VPb2pudTRTYjVjMStwcmNLclN0?=
 =?utf-8?B?TXBlQ3d6S2U3NmkwVTVwbWV3M3pITTJhR0x6eDR0OUY2YWJHTWhCdnltdUZF?=
 =?utf-8?B?Vzk1ME5iTmhmUnB4MGZnSnNxdTJwd0lzWG4wV241ZE1iMEpJTVhFeXMrRkRY?=
 =?utf-8?B?TjNITi8xbUUxZlp0RGVmRzdNRnZiUFh3NytJQm9pcyt0WjJ0ZEowUUpuRTEx?=
 =?utf-8?B?SDlJU1lSL04vSmpJZzMzUm9FcDh0S1hKOWdQZlV6OTExak1KNXZjRHR1ekE5?=
 =?utf-8?B?cTlTZGVGYklmZ3FER3U0THBNcWRpNE5OZDBPZ0d5QmlXRlVHcnRKbXF6aUsx?=
 =?utf-8?B?VHhHVzAyekNSRzRBUER1cG1nWXQ1aWhMVFBwZEdZZlhsR3hkaXNibjdhVjZD?=
 =?utf-8?B?eWpTN1VLRnZ4VzYxd0llYmVSVGNWY0lPYTdSK3kvUVhGNkNsZ0RmOWV5ejFL?=
 =?utf-8?B?R1E2TEh0c3BURVprcEMxTmJhVi84RVA5TjhIYlNSMzZMZDE1RENGQ2hFMWli?=
 =?utf-8?B?ZjBmWHBJL010N1Y2ZmhmTjRKcVRIbFNZWjBPTWhQYnA4ZnFhWmxScTdqMUMz?=
 =?utf-8?B?M3lkcHdUVnZHOStlTlhXRklrU0xOeDBaSnpuaFk1V1l6WXhMZzB3bWkzbzZC?=
 =?utf-8?B?ZDVyM1RrcXVxcGF5MS9mMEhXUXFya0liVUV3WVZkM0krODFuUWhxNHU0SVpK?=
 =?utf-8?B?NVlJNFJPUjRVU3djOElDT2p5ZE8rVkNYWGhGbmpDUUdRem1XNmY3ZnBLZzUr?=
 =?utf-8?B?UkQ5YWhObi9wVWdyOVBpVnFQNWNSS3BYMGJlZk9JcHB1U3lXMjZJMHdHMFJI?=
 =?utf-8?B?MzYrSGI1dTE3NTlKciszOE9tT2wwZGRNRFJjZmxOQ21HcE5aMjdaTkQ3cm5w?=
 =?utf-8?B?Y0hnOHkxUHowb3pib3htbWlobElueExpOG1KUWoyU3YxU002NWVCSkpzcVFH?=
 =?utf-8?B?QzBta1d6cVBOQm9kamRkV3owdGxFSUpiZ0ZHMlhFRDdLNm5nQThlaXlJWGRa?=
 =?utf-8?B?K3pVNHFKcDVEdlFLWXY0SmJSalJnQUkvY2lkeE1lM3lhazVFdlJmUWlqVTM2?=
 =?utf-8?B?Y0Z2U0JLSmFBTmpIWWZkTFZ2YTFwblB4S0lqalF3aGxlRGkzYXpiQmVudUFa?=
 =?utf-8?B?d2V1b1loY2tlNmxUdGo1UHU2UlV4R3RiQ3hHTmtmeHByVFVDRUp1S2p3VnR5?=
 =?utf-8?B?QnZsc2VEdWU5WHF2VjB6cG9yaDJBUEgzQi9OdFFhNWhJMExtd29XMWEvdUhW?=
 =?utf-8?B?S3ZHYWhIaFZJZ3Z1aUdBUWg3aHlpWXpDSTRtMW5YalpMYnd2TFI5U09yWGtQ?=
 =?utf-8?B?TWxCdEtvZFdXUWdta3dHWXhxV292QWdPbVE2VitLWGE1djJMdTBrN3NHRklj?=
 =?utf-8?B?V1hSUW8vN2U4ZVJHcU0vWHE0MnRaOVFYZm5OUkpyWUl6cGNKVFhldUhjaVBk?=
 =?utf-8?B?bDdvY2xPYVZpK2MxY1I1bnRlYzQwMEViSUg0czBIVjAyOG52UnB3Q0Y3aVN3?=
 =?utf-8?B?elVBZU95aFN4MGMrQmxTUjVobmY5MU5YdmJXc2FRRnBBTmY0aVR2ZzF6bHlp?=
 =?utf-8?B?S21kdUgyZUtTKzZJa2FQR3RjSlBqYkdOVVFGOXBLb0VEbE93VHM0NFZ4TFM4?=
 =?utf-8?B?LzVGTG1UN25LL3U0MWFBSUR4ekEvc3J1MHZzZE1MdE4rUHo1ZTQxbWlzQmY2?=
 =?utf-8?B?MkgrQzVIUUxmNUhZakZDcEJoSlU5dVVvTGpOV2FCOXplT0V4ejZ4MERIZ21U?=
 =?utf-8?B?NS9CYmdldVJpYjlrOVhoOEVtYlpDRGoxaHlkUEZhYmhPUlFwRFVRbFhLR0c0?=
 =?utf-8?B?a0swS1NmcHNkMjkvb1N5clBPV3p0bHFzVmFvZmluaDZWYXNiNk9OUXFjRjhW?=
 =?utf-8?B?SG5ONmlPOG1RTTBhWXFpUFRjbEpvUTdVK3BJcnNsTk02WmRUODh3SnZlOU1O?=
 =?utf-8?B?ZDNQeGptMjhadmZWRHl0dm1BSFB5T1BQaGw5dnJ3NHF4NTJZemNhckd1U05Y?=
 =?utf-8?B?dDV2VnlVSko0S25YSnJyS0p1ME9VZTFpQjROMTRDckFEUUVVd2twcjlFQlJS?=
 =?utf-8?B?VG1lUmdXTDlPNnpnNTZRcWVjYmYzbFlteWIvVDgvVEZXUjZObndpNzVWZ1Jq?=
 =?utf-8?B?Rno5aGtUUERFUEVyd241RGdxVjdxSTNVQWdhb0JaODBBUnpZNHhNVlFnYlBR?=
 =?utf-8?B?VFZsQU9EbFN1M05Eb1ZabExNVmFqQXVyazRWYXBqNU82TzMyWGFEMnlNenVr?=
 =?utf-8?B?WFY1QUdoblhuU2EzZHZkM21pejVTU2hwRE1zcG9heTFRL3dLNkxDdz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 3f7f24e7-50dd-4656-5f92-08de5754b318
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2026 12:17:22.7690
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 vdt9oAdEzDX27SkXmrPLEn4BFloaBlI+vFR9NL6lgN95YU3KxhzYCacI+OnzLF6vk5Tltoui//ruc96m0qVpSg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO0P265MB6196
Message-ID-Hash: BGL2CYCY4ZEHRWGBFEU5PV43T2K5BYJN
X-Message-ID-Hash: BGL2CYCY4ZEHRWGBFEU5PV43T2K5BYJN
X-MailFrom: gary@garyguo.net
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/BGL2CYCY4ZEHRWGBFEU5PV43T2K5BYJN/>
Archived-At: 
 <https://lore.freedesktop.org/DFSK5AJR2K54.UNS6PT7MV5W7@garyguo.net/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Fri Jan 16, 2026 at 9:49 PM GMT, Timur Tabi wrote:
> From: Alexandre Courbot <acourbot@nvidia.com>
>
> `LogBuffer` is the entity we ultimately want to dump through debugfs.
> Provide a simple implementation of `BinaryWriter` for it, albeit it
> might not cut the safety requirements.
>
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
> Signed-off-by: Timur Tabi <ttabi@nvidia.com>
> ---
>  drivers/gpu/nova-core/gsp.rs | 40 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 40 insertions(+)
>
> diff --git a/drivers/gpu/nova-core/gsp.rs b/drivers/gpu/nova-core/gsp.rs
> index 766fd9905358..273327c33aa7 100644
> --- a/drivers/gpu/nova-core/gsp.rs
> +++ b/drivers/gpu/nova-core/gsp.rs
> @@ -3,6 +3,7 @@
>  mod boot;
> =20
>  use kernel::{
> +    debugfs,
>      device,
>      dma::{
>          CoherentAllocation,
> @@ -117,6 +118,45 @@ pub(crate) struct Gsp {
>      rmargs: CoherentAllocation<GspArgumentsCached>,
>  }
> =20
> +impl debugfs::BinaryWriter for LogBuffer {
> +    fn write_to_slice(
> +        &self,
> +        writer: &mut kernel::uaccess::UserSliceWriter,
> +        offset: &mut kernel::fs::file::Offset,
> +    ) -> Result<usize> {
> +        if offset.is_negative() {
> +            return Err(EINVAL);
> +        }
> +
> +        let offset_val: usize =3D (*offset).try_into().map_err(|_| EINVA=
L)?;
> +        let len =3D self.0.count();
> +
> +        if offset_val >=3D len {
> +            return Ok(0);
> +        }
> +
> +        let count =3D (len - offset_val).min(writer.len());
> +
> +        // SAFETY:
> +        // - `start_ptr()` returns a valid pointer to a memory region of=
 `count()` bytes,
> +        //   as guaranteed by the `CoherentAllocation` invariants.
> +        // - `len` equals `self.0.count()`, so the pointer is valid for =
`len` bytes.
> +        // - `offset_val < len` is guaranteed by the check above.
> +        // - `count =3D (len - offset_val).min(writer.len())`, so `offse=
t_val + count <=3D len`.
> +        unsafe { writer.write_buffer(self.0.start_ptr(), len, offset_val=
, count)? };
> +
> +        *offset +=3D count as i64;
> +        Ok(count)
> +    }
> +}
> +
> +// SAFETY: `LogBuffer` only provides shared access to the underlying `Co=
herentAllocation`.
> +// GSP may write to the buffer concurrently regardless of CPU access, so=
 concurrent reads
> +// from multiple CPU threads do not introduce any additional races beyon=
d what already
> +// exists with the device. Reads may observe partially-written log entri=
es, which is
> +// acceptable for debug logging purposes.
> +unsafe impl Sync for LogBuffer {}

Can we just implement `Sync` on `CoherentAllocation`?

Best,
Gary

> +
>  impl Gsp {
>      // Creates an in-place initializer for a `Gsp` manager for `pdev`.
>      pub(crate) fn new(pdev: &pci::Device<device::Bound>) -> impl PinInit=
<Self, Error> + '_ {

