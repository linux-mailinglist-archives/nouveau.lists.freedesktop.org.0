Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B6B4CF6A03
	for <lists+nouveau@lfdr.de>; Tue, 06 Jan 2026 04:52:37 +0100 (CET)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id E2E6D10E469;
	Tue,  6 Jan 2026 03:52:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="dXdUSilK";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 9DD4F44C94;
	Tue,  6 Jan 2026 03:44:21 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1767671061;
 b=pu1XV128MZaqIMpHgD6z2oNOsKh/WTZvWsppmobuwm0IDL6sHEuQVGogRRzPRAqtAIzs8
 iLxp7+j/IfvnLjmvRwdNtvLWc/F5ijq27XOng4w6X7LCBck7fhnxDbGW220riNjLhfc8edf
 etYAJY0aWk0fxNxK8Fjytx8d2Opd2Dhhj1N+Gz+kxOsao8vsL7cV8M+2Fn1JsXtkARQ9Bj8
 e3T9r2Y+JD4UmYR5KVhPZ1lbNbqzMVFtFhDbu802cGy0jRVoFW7bUQIYnLJCLQqhLpR9Y54
 qGwGimWgBZctxMhZODA1ufjRNIyILeWOcduhOCi6xLqavhzhBlQZPIr70n1g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1767671061; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=khDtRaMM5W1Cm2frb4Z0hNIHcMiZAkGKlsfjgyz+EiA=;
 b=gZ3vlJxQmoRcCYQuxsht1OA36FcD5Ei8yjlT7KWqJKlDX8BOKxRHZxWMfA5utZNYgiEmy
 QlmHNF5NsX/uDyTijdiBwwKut6fB34qG5nIw8NY6ucQoDeAMSo3mOi22lJ+fwi6iMnzXYxn
 PCR5jTjd8PYHoUjcO24VQAAQCSwBwXMNnUUs3zOqyLsq6CnOJfAY3uFjvHdqwap03f9mvAG
 AblTljY09v/+UE64qsQOX4ZnVhCaSjsyKA1T++MEkjuHykLnJyz2TKHGJb2syR9QUBXtiL3
 jmKy0YmS4Mcn5KFZGD9vUB7Jq7jM7XTkUp83UvpMprUHQz0eR3t5dtp0dZFQ==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=Nvidia.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=nvidia.com
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=Nvidia.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=nvidia.com policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 288A844C81
	for <nouveau@lists.freedesktop.org>; Tue,  6 Jan 2026 03:44:19 +0000 (UTC)
Received: from BYAPR05CU005.outbound.protection.outlook.com
 (mail-westusazon11010040.outbound.protection.outlook.com [52.101.85.40])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 38BD010E08B
	for <nouveau@lists.freedesktop.org>; Tue,  6 Jan 2026 03:52:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Cj9NcPsyScf76eiIrRkbYSJccUFitplcjoxJOCrVMYOTIgvHbJfqANTylk8pGVpd9cB35XLoSlWas+8U8Qe78ER2bHHaQ0nJ7SI1JDZM4LLM6ZD2NFyh5IyrR2zUXOHCLD6MIxe7rUoCbYCphFn6ci245VCkQG7wRXSljMnKWbIFVgsoaissqIFXWZJqIOygu2FwrexVenkMFvuWm3rd7Bh5xy78zEE5Nb+GuDFzi85rHJ8cspBd97K7eoSI9wk3xZi68FUINOlrc/oJKdzgRamEXzAbEQEJiiU8Qeskg8OKvTZjIdHtl8wLh3TF/RuDPRvfYkU52WMFZms6JDCvtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=khDtRaMM5W1Cm2frb4Z0hNIHcMiZAkGKlsfjgyz+EiA=;
 b=RgWw07pwrSHlidHBu0o7v7R1Tu/zndf0YWoz9sqU1GH4NRi2VfYh5r/DeY3oS9dOrlSwKB4+bZoiZCO+jCK17q+zQzKMpJQIvXpgrx42jIT9Trwma25x5TOUiDNaVYNeVOihWR0gISqMQ0VqORtpxprePv0GuZHbpdDt3J5etTaiOV1ZH0B3oggQl1mHlP/8/acMVws87t7m7HgwFYNYzbXMWLgUkFSlGG4GHxCob7yNRjJfzPP5OSWWJVzwFlDdVz6L7yzW2Rweq5ti/5ddM2XEyz1tS48KmzDUPYFVHEX3yPQJFS4bXHI49ceFLiGzouMGxB8FN6ZhPl3hjHO6Xg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=khDtRaMM5W1Cm2frb4Z0hNIHcMiZAkGKlsfjgyz+EiA=;
 b=dXdUSilKdQFWuW6s1g22zYdhV/rxj1v7R6NesrnwscWpZCIAY5OIihLTdV8RC7ubvKy463JfmqPc/wegyHPRfD526ZLfHJwsxGORFuOSZdZtX/NSUDG7o81eJ9wwTMWKrhT7Kzzq4RYx0IMxcDl0VdJADTNxNkGoF8B/uRFrIHpuV9+AYgdWS8Swj3S8NS96dqir7SAdFmE4RFnnW9BtB712DqJ/RuCo7YJ2q+GVIrBafPoDEk/Atys0RK3hhRV7s0fS6mXnH54kn+7idimwCPTFaFbPGqRk2tgSRkDic6MN3pDrltRc90OHNgw2Dd/PnZg2IZd5ScTRuZsIoVkJKg==
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 LV8PR12MB9229.namprd12.prod.outlook.com (2603:10b6:408:191::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Tue, 6 Jan
 2026 03:52:29 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9478.004; Tue, 6 Jan 2026
 03:52:29 +0000
From: John Hubbard <jhubbard@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>
Subject: [PATCH v2 1/2] gpu: nova-core: use CStr::from_bytes_until_nul() and
 remove util.rs
Date: Mon,  5 Jan 2026 19:52:25 -0800
Message-ID: <20260106035226.48853-2-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260106035226.48853-1-jhubbard@nvidia.com>
References: <20260106035226.48853-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0230.namprd13.prod.outlook.com
 (2603:10b6:a03:2c1::25) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|LV8PR12MB9229:EE_
X-MS-Office365-Filtering-Correlation-Id: 02560f25-8250-4853-0583-08de4cd70329
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?MLkXEavh4hmEc4O0eFcre+rHj9r+zUEaX0GCUmgK4qNTuIbJj+bPpPyYQLlX?=
 =?us-ascii?Q?Nurspbwy2JS2Dr4rgrRphRs5XK2bVex7kdlpuYbBQFiQceeyGYNpYfHS9Rnj?=
 =?us-ascii?Q?bust8GlneMa83pvwVsEwJSlZue6+I4dRd7DGM1Qwu6GTNMNAmrBSMixj3VNH?=
 =?us-ascii?Q?cI6RvzlsqtQ+HJcQ2EO6tkQXs4PHf/VlRS3XepBou3FddUO5fBwqLmWadYtR?=
 =?us-ascii?Q?MyeZMmxhnA5nzjT8SycyC8vyFSHR/Wt0UEMylq1p4nFSjIzZDjafoHUGRqHM?=
 =?us-ascii?Q?rLCTn1hc1WCVvZfVkGtmsvC0BLR6+WScbcNJOjFJDqel/P1vkBhodd51sU4f?=
 =?us-ascii?Q?ExK3E5RJXiszK6wxE8pB/G2pTfEol0CdgGo/WNYMz0JP2s0xoJ9OELdVEPiP?=
 =?us-ascii?Q?hxxBHGIYv8cB4Z2stomPrUb9NFknGpXJi89G/mjNmXEy6tuQUuiQDJAwSWBk?=
 =?us-ascii?Q?sRn07tmwE+kf7L4tsdJSXRRMFo8F6gIHBLpVJHbvLHmiTN/hvp25EuuteOyD?=
 =?us-ascii?Q?KGUWWcTFYV2hUnNmhnZSpA5UDGjPZlTmNB1MRcskQvpu8Zo2XgfOVrgbbMX+?=
 =?us-ascii?Q?vYD71w17V17v130MLkP6OvKgRKsQujiWxXiDD1AHWGgnLrYSfQtywP+woWVj?=
 =?us-ascii?Q?Lr5NzBtZtktQBwXmbTl0Kx2lbGQBBk+39LQfh+NFVtCeO1t3ztM5+FYWG3nt?=
 =?us-ascii?Q?ujtemqYZP0dpoAx8A8pNcOxf2DCjOP+LGxCgVOtGMZHGWoAWJa1OVEUjcFGb?=
 =?us-ascii?Q?eQt8a1ufNfaVMPxECIQjcvF2kV/t9IBy3qKeZ3gnbWLfQEd3NAh7oH5hKdRP?=
 =?us-ascii?Q?TX1s6F0PbYv3MxqHRx6uv7u/5weveIh/JMhFkEgJiBXzxKVpEJpy7vcCVlZG?=
 =?us-ascii?Q?TgaaAUc62yrJYzndFjsntY3H0mC29/8yAZ11srsVX5xqgi9/dWLKfFb6HbPa?=
 =?us-ascii?Q?LaMPMvz300sQJ47vDthwuFqjMHCDiiSK/Yuq0/ENU1sNxCtqMJSQmDMvXZBC?=
 =?us-ascii?Q?qn9ljaTWQxu0mSromizvod3YWDU9ndpnhdaPTa66R0TofqxoWbRfBlUizGCT?=
 =?us-ascii?Q?Xjmkn6kWLSQPBCPWCUDzKh4w629R7xiJb6tI6qNQFoy3Kq0oFZlcISH7DKih?=
 =?us-ascii?Q?bpKDCXsR0vHZY3bP4vKHkHGNn57bkul/kbeL4xk0HzimtLboH6uu8dF7SW9L?=
 =?us-ascii?Q?dY39C1A27j+VQ7I577Nfpe9RPOCyrV+QeLPGeFxSWPJGIUHF5JevsTFNRVZN?=
 =?us-ascii?Q?L9PKw0kvISiqMzLYoam/Z+upb8P0OPFDV7mWxOsi1N/T1ssKhCgytUMJ/5UG?=
 =?us-ascii?Q?lH3Ra3Y7AWs2xMU1ARynOTl+UQrLu+EiFNSdSAUXGRLJ5rxoFmMTbnHAtxXq?=
 =?us-ascii?Q?r8OB3ZsDvBrtkBaMT9MemorOlRmPl6yXLMQOrNxxRisz1HysKhRiqJeyGK82?=
 =?us-ascii?Q?X+T33Oz/DHmPfwhpTpkzAIx7LDKYhWRz?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?YT4zAtBfI5VNfHzUThSmsYSCGu8Rc5azDyNl+LYx4Lhc+TsezHRoJ9bTauQj?=
 =?us-ascii?Q?P898VSUp+KLBQvWw65L02tr5+hgHYqeDZbZ1HJ+AX1ggwPbj0r096f5Q3QUJ?=
 =?us-ascii?Q?4DkRhV2rOFfrNpWuEnthEBTsePmcVDVshyXzaHdf2NPs3cgGC9Gawvk0/JAC?=
 =?us-ascii?Q?yLwJ3gEPor8pUi6zi1VMy2MUmNelG56SrRl/MGIkfPI5N4k8Nk9/2OR5dHEE?=
 =?us-ascii?Q?JvgI57dvt6HBujzCm73jOHV+HnwMw9LJx9INSCWUhe6brVJlJCp80fX2DiZ2?=
 =?us-ascii?Q?eOIlJ4RrfcTavZmP0XMVsIzgojypqcDGtAGG7R8VBYVkDKqQqTm2UktMW9Ah?=
 =?us-ascii?Q?IcAlEjX/wvSd7Pyv36AfjMJh3L2F+Q1cnpAaFZdf8wxso2FOKfh9DsXudWfk?=
 =?us-ascii?Q?w+6hMMv5uTu+/2RDOnp2N6jDYKbDd41YtJFRBnRjpgVyxnFLRudBAq7kwNm/?=
 =?us-ascii?Q?rJ0T2ShgSK/hu9MBdUFEySfxC5qYFBVHEug8DeVLiFTxg3tHmqLJrbux02VS?=
 =?us-ascii?Q?Kv5jyY7H3pn5GTXHbabYL/WFm9neeGM2worZkAYGciNA34bZ5Xc4qY9gYsfe?=
 =?us-ascii?Q?6Jh0VNND+cDoaOo3dQ6mqX2YVSqwUl6nid4wnXRaTnTfzeR+Heur8O1eGghd?=
 =?us-ascii?Q?dnMy6I/IWOo2MXjNm0riRi60Tj2Q+vFnZkfYyJ4hdLmRHk8rAVdDYXZg2ttD?=
 =?us-ascii?Q?1FKsGJaAyOi1slH3HL0ZzSB0qTXcPbUzRDwXdq57DSv6/HOmqYrwnUILXfJK?=
 =?us-ascii?Q?czwaXPnzHxPKvAuD93DOiDJF8bNjzrcfcZO8Jy8AjSWqNGOFlkCMPd7R6zt2?=
 =?us-ascii?Q?Da829IZX6TBAK+Y8feHF5jBxkUquSzvWHO6hzj6/5QHVvDVyvpuzj2YgB08M?=
 =?us-ascii?Q?sr9DVFf3zj8lySOUDYaew34YmFkThDBf1Xw1UmIswFonu7JETXe39ab5ffAb?=
 =?us-ascii?Q?kYkf/UY4uzWWPiEaDezG6YoP7G1j1kYLtfdeCZ6Gn24ez5TqCGNk2M+3iitP?=
 =?us-ascii?Q?FkNX4Z2BhUKq+0AqFlhpTgRlW1dQCZ569lGSqSI6kL2n2eZhRqkcS7v7sIEs?=
 =?us-ascii?Q?OhT0ofv323jEKPcsC/EyNpF218EIEp7gVbLhCLE8skBspxmW7YLzlsNNdv31?=
 =?us-ascii?Q?ugh0KZMfxhaPef4nz9xGLQn0uszN2Fnv35BMZxtF93Thf2cmRu0cE8a3l6Lk?=
 =?us-ascii?Q?WkLKbEiMW40hwQv3AsO+l+IKvRPDXVfbPHkl7rkmh1R2HytnO2i3UMM0IT8y?=
 =?us-ascii?Q?qjwX523POy3ggHdoy7QhenOSz4rDkO/Ci/n05MJ707tcrtnmF0gsRnvxRAEq?=
 =?us-ascii?Q?dzEYCEP7agH5zUsb7fMsBI7wdgQvAj4pg+HHxPjMNbAJkQhLCi5002a7vluH?=
 =?us-ascii?Q?0Vtgi+q1JN3mwAIVxx+dMP4SD0crHBrzfsjHgMSQuyb+j+PcNGA22APZUkm1?=
 =?us-ascii?Q?7zmvKK8N8cYbpVpqfGMNiiERMJxta9j2e2CdvJXXBJxvJQdw6aU/lvvOonzI?=
 =?us-ascii?Q?3X9wfCMh2B/IIt0PunrPkNc1uRCfm7RbJUylQj6eO+o3z2sYDgpaxmTNs4/y?=
 =?us-ascii?Q?moWvZYCWZ25vMqh2FdH//WDbtRJypPiYR8DMWYwjrpb0diHZzDv7ayPYgz8I?=
 =?us-ascii?Q?gxLpV4bcu9ERmBRIR0YOSDSI+LuvTJtTvwgTPhsXrldMytXqJ5hfDX0nShhw?=
 =?us-ascii?Q?xT1SysOxZYkN5D+PntPIqIbQrKwxanNacnjfYoY2vsuHw7No4+3rI7y43AA5?=
 =?us-ascii?Q?Bp0a1PrIFw=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 02560f25-8250-4853-0583-08de4cd70329
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jan 2026 03:52:28.9579
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 El/6V4Ht96patho5FCpTEY0boEyOZdDb2aNP3oP7I+BTSXFoep8Pt5+pW32OG+vrfEy53taXu2feUcw0IotHQQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9229
Message-ID-Hash: YBBSGUHNCQNRGOIJFEWQ4KPJDIBA24XV
X-Message-ID-Hash: YBBSGUHNCQNRGOIJFEWQ4KPJDIBA24XV
X-MailFrom: jhubbard@nvidia.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: Alexandre Courbot <acourbot@nvidia.com>,
 Joel Fernandes <joelagnelf@nvidia.com>, Alistair Popple <apopple@nvidia.com>,
 Zhi Wang <zhiw@nvidia.com>, Simona Vetter <simona@ffwll.ch>,
 Bjorn Helgaas <bhelgaas@google.com>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>,
 =?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 nouveau@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/YBBSGUHNCQNRGOIJFEWQ4KPJDIBA24XV/>
Archived-At: 
 <https://lore.freedesktop.org/20260106035226.48853-2-jhubbard@nvidia.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

The util.rs module contained a single helper function,
str_from_null_terminated(), which duplicated functionality that is now
available in core::ffi::CStr.

Specifically, CStr::from_bytes_until_nul() is available in the kernel's
minimum supported Rust version (1.78.0), so it time to stop using this
custom workaround.

Reviewed-by: Joel Fernandes <joelagnelf@nvidia.com>
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/gsp/commands.rs |  5 +++--
 drivers/gpu/nova-core/nova_core.rs    |  1 -
 drivers/gpu/nova-core/util.rs         | 16 ----------------
 3 files changed, 3 insertions(+), 19 deletions(-)
 delete mode 100644 drivers/gpu/nova-core/util.rs

diff --git a/drivers/gpu/nova-core/gsp/commands.rs b/drivers/gpu/nova-core/gsp/commands.rs
index 0425c65b5d6f..a11fe6018091 100644
--- a/drivers/gpu/nova-core/gsp/commands.rs
+++ b/drivers/gpu/nova-core/gsp/commands.rs
@@ -30,7 +30,6 @@
         },
     },
     sbuffer::SBufferIter,
-    util,
 };
 
 /// The `GspSetSystemInfo` command.
@@ -209,7 +208,9 @@ impl GetGspStaticInfoReply {
     /// Returns the name of the GPU as a string, or `None` if the string given by the GSP was
     /// invalid.
     pub(crate) fn gpu_name(&self) -> Option<&str> {
-        util::str_from_null_terminated(&self.gpu_name)
+        CStr::from_bytes_until_nul(&self.gpu_name)
+            .ok()
+            .and_then(|cstr| cstr.to_str().ok())
     }
 }
 
diff --git a/drivers/gpu/nova-core/nova_core.rs b/drivers/gpu/nova-core/nova_core.rs
index b98a1c03f13d..c1121e7c64c5 100644
--- a/drivers/gpu/nova-core/nova_core.rs
+++ b/drivers/gpu/nova-core/nova_core.rs
@@ -16,7 +16,6 @@
 mod num;
 mod regs;
 mod sbuffer;
-mod util;
 mod vbios;
 
 pub(crate) const MODULE_NAME: &kernel::str::CStr = <LocalModule as kernel::ModuleMetadata>::NAME;
diff --git a/drivers/gpu/nova-core/util.rs b/drivers/gpu/nova-core/util.rs
deleted file mode 100644
index 4b503249a3ef..000000000000
--- a/drivers/gpu/nova-core/util.rs
+++ /dev/null
@@ -1,16 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0
-
-/// Converts a null-terminated byte slice to a string, or `None` if the array does not
-/// contains any null byte or contains invalid characters.
-///
-/// Contrary to [`kernel::str::CStr::from_bytes_with_nul`], the null byte can be anywhere in the
-/// slice, and not only in the last position.
-pub(crate) fn str_from_null_terminated(bytes: &[u8]) -> Option<&str> {
-    use kernel::str::CStr;
-
-    bytes
-        .iter()
-        .position(|&b| b == 0)
-        .and_then(|null_pos| CStr::from_bytes_with_nul(&bytes[..=null_pos]).ok())
-        .and_then(|cstr| cstr.to_str().ok())
-}
-- 
2.52.0

