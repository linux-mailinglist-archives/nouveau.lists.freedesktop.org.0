Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B7112CF6A09
	for <lists+nouveau@lfdr.de>; Tue, 06 Jan 2026 04:52:38 +0100 (CET)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 64F6710E473;
	Tue,  6 Jan 2026 03:52:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="Phovjlt9";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 1C2A944C98;
	Tue,  6 Jan 2026 03:44:25 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1767671064;
 b=AZimKGmPun+jhbLDrUo9rL94jgPUR+P1I8lpT9m/ej5kQBtFxIi5XbaY2HL0ewQFAV2Cg
 O2rfDH1Nj3S5r51Kp49Q9fdyNJGqw0rgP+FqdhIA0dXQU3jsjV5TkePRoRfqiG/I4XQFD87
 c0VcqYU2BDqc2TLT2QocEOMTzRlrxn8uHZOfsVpLyGhv4Ck5ORTSlr4hwT1dhReg4WsrbSe
 d8PRv7bIPh5OdnOg7Z3JzAZwl8mRNZBU5S4EUspDQfCTt7bJbiu1dGBWOeeAX9ais1LHN12
 WBehI+IiJRpqqTlMByhBGhzYSN0IYOOvoTobzUAhN+7iOvbfGVFxWbZutlfw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1767671064; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=wUmiMmhThYCVOAcLXh3KaXQ68cEJYb5HvTBXI5fcKws=;
 b=ZsGXc2xGFIaVbrn6fFgKfRPGKCmEwsS5d/icuMbQKY1nfUUH03k31HbN9WBX3FA+vWrmK
 LErU86SitYEjyzP9N9AsqiDYOrFWIYAIL723+Wljs60j0yKrxqG5qXYONlc29s9E5BOAikS
 3fYR3OVsr2yp4pSOOlYLWbeAMW7nqDXpj7RDiWlw36DLaGKDfKm6HYGqpHj6meW4V2ZSFA4
 cWIV6olgdBWZqqkG8FCSjy0kdhqEKE82IgW6P5d5Ci8KJ9tsPF+vUBk4I+u1bIic46sQSc9
 qg4NeqVFNU9+TFmQBCgVsRRrotHtI4tjcrZMEv9WRDsEh86PT9fBNRIdRYfg==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=Nvidia.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=nvidia.com
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=Nvidia.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=nvidia.com policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id EF0C744C96
	for <nouveau@lists.freedesktop.org>; Tue,  6 Jan 2026 03:44:21 +0000 (UTC)
Received: from SA9PR02CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11013009.outbound.protection.outlook.com
 [40.93.196.9])
	by gabe.freedesktop.org (Postfix) with ESMTPS id CD1E810E463
	for <nouveau@lists.freedesktop.org>; Tue,  6 Jan 2026 03:52:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CG2Q4m+BRWBe6mLKGlt+qMWH65J3V+kDtVZgrf89OldMV+EQYhjRVmTxdLt9nXPQ65H97YmkHpkWH4+pLqQYI+ZYXnlvQYNGhW5N7L10IzL9LMFhkZLRKEsUP3A9Ph+Civuuw/T53YkG12lt+l9EANZ3n/aqGCKsiXlb9HriNAh/BLx0Gyb8I68gB29RV3vlQivtUXrjiko0EvOkZwyNSTsXNQK6q7Cd6z8fncb4n5DF/LVzruP/KQTYG3J6eA/qVmaPaR7JDBgSG02+DDGw8kGQnLQ4/7ke/lX17NfIUDE/pFrkdm0BeIRlWzrcjzLh/lqN6JFzexeWc8rq1qmoVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wUmiMmhThYCVOAcLXh3KaXQ68cEJYb5HvTBXI5fcKws=;
 b=We4bFXh9yGcgsT5p1g0SH79Bp/1hvMG5Q0j5IIyC50xFJUGNuUJLiJpJ31iuxtFlYIBDw/SDX0D/MbtTywQReN/DjPpUUo9ojeLvn7wtU7VXKliq7nhAS1YdNkiDbWLHn3Ld7S+w1NZaxPTcd7j0QZNHfFpSWEdhWCiw8/z9HML8dfkn/TW7qAfKk0JoO6UgreKZieT9AGc1XIgns1TCvHbZ4lVpNiRKXf10l3GqbXZnaCxqNZFrOS3lXtEl86T+NVIFU+mycc1rXp2wPIQgNW1CClI+RiKVgkP+9hhh9u+biqphH1CzS/OyBUOaXZKhgfZir3tsUnLeYNztAr9t4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wUmiMmhThYCVOAcLXh3KaXQ68cEJYb5HvTBXI5fcKws=;
 b=Phovjlt9dAY+HLcUbelwWEHFiv7bB2hNZxaU4Y/uH3fIhtIF6n3PS4+DY/b1cvVXXgeDD+yAfgyj6yZZ5H7zwwJW4wbVLz9KfW4gWmTT+dzUZx6ijAtUuvOvdhH8RBqs3Ob4AF8sIXN0AdTjghAOLVaDsHE+JXcJ5gqY2aCteMEqaFAWKbfy8lN4wkHphZ4+ZLP5TQOSRypUU3ZYEVnWTHdHXB+901yfb2Z/97fFevKnJ+Zcgoi/NY3UUz2mzRSIbZf++byBIlVWubQh6MdkP7rxfGZ5aHFmiO9NORir4ncpqqM6N1bWlG+uSjIcm/3h0mfdGoLfwoVemY8SX6MCjg==
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 BY5PR12MB4116.namprd12.prod.outlook.com (2603:10b6:a03:210::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9456.14; Tue, 6 Jan
 2026 03:52:30 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9478.004; Tue, 6 Jan 2026
 03:52:30 +0000
From: John Hubbard <jhubbard@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>
Subject: [PATCH v2 2/2] gpu: nova-core: use CStr::from_bytes_until_nul() in
 elf64_section()
Date: Mon,  5 Jan 2026 19:52:26 -0800
Message-ID: <20260106035226.48853-3-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260106035226.48853-1-jhubbard@nvidia.com>
References: <20260106035226.48853-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY1P220CA0016.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:5c3::13) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|BY5PR12MB4116:EE_
X-MS-Office365-Filtering-Correlation-Id: 9a1901bd-e5cc-4ee4-5f64-08de4cd703c4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?AnaTLoDpwwOXcBFSEeBTNdHppawMZa3YD2x/dlyJcpq3lPXRub/QZ8u+BbLi?=
 =?us-ascii?Q?Fvny1Yr0J4qS/qWd3FUmFttX4P2i33DxdiDEYw3BWkxhen0F/yvK5MJygFru?=
 =?us-ascii?Q?hH1UHX8JJpPExe1hk47ZBpFwkwARiJ2JS6046A5kP96VLJx9ivXBUyzaQfmt?=
 =?us-ascii?Q?//Ml0UK8ggT9N+bAKgZX+mitvCZ67kBfngS12dcWcO0GaaEoG8pxblo7Y4gq?=
 =?us-ascii?Q?XbyLrOFjamuWwdkyR4XwiT4gvN5jYsNZafIoMixOOdL9KjB4p9jp0YIKM3wP?=
 =?us-ascii?Q?mYV4GnYxjdpov3sZN9ZUtLo4K89D+RKta56gJXlhijTOIWMqaaRZ4NfHIGTc?=
 =?us-ascii?Q?Qn/F6prd8+3LlpNQQablJ9k+lKZtG5e+ZLZAVZOeqBdB5tzxnhtXurWGpWkV?=
 =?us-ascii?Q?FqSkd3PB3xN9Z0UH+Hu2duGA9CF56bpJIGiDzh/mSDOEZlHxEQ4Lxlm2+et5?=
 =?us-ascii?Q?tvEj165oJMVH1YWoYtpLxIzqsp7jrOOygwSIFnZes4fDA1N+D2kymTKLvIhM?=
 =?us-ascii?Q?Ljo9p6aIrfhP5fh26oRfejYio2sIqWi9Fj/x7vkJ08YJE13FqtDGrBCoPEDQ?=
 =?us-ascii?Q?F93q3UFZ6fkc+bHjptcWd//UhuASc33f8CgfVx7VCUh/eTCa7EDsFgPBAN/7?=
 =?us-ascii?Q?dChcjAaYBiCNKH7z/OKxRHlNjbbnQbo/Od/uqOfgCeQrEXfDRXuT+LWizGyw?=
 =?us-ascii?Q?4Yaz4wAnRqW2nWgmwh4+8ifIsuWG+OTHg/Gpzc9zj1W1tu6QvZDizQolyiDY?=
 =?us-ascii?Q?uhWNBo3i9UUJnMV86coR+zJ8hTsA8NA8ABAA3xWKkYOZ84sWUL4hJA+D0277?=
 =?us-ascii?Q?VZ5BtL3HzZ1DR7f45l1tFR6UA4z3GfnDfU9TVgUTLoBpyOXMX6sdHebp6kkY?=
 =?us-ascii?Q?ADU+tS5IETnvuqrm6VSmN5jaTkTSdhsszhfUSnoNQxmshDgVq0dbzY9pjbfi?=
 =?us-ascii?Q?FRC4FR0EBYGMPhZPnCAJCZceMInYCE3ufl08AnDTxor+AKTWgYzJS954GTOY?=
 =?us-ascii?Q?ELeEu2PjoFrJFPHaLmAuQyDXpoC+7fuUy76UcAhXjAPdL1XNFAmFHPrG+OUM?=
 =?us-ascii?Q?LxQx9yhmQqE8AfqhM/1i221Pnp7ViE5vXl1PR6aTkMeyGylZWRilg3Rp/0z4?=
 =?us-ascii?Q?V10hYYaprRQte9S02sJUHswuJSJSegBuS2B7/pw33j2R/aq4Q/LUZiewL+UI?=
 =?us-ascii?Q?fXqw+GB/vS6RFBJP8nmjD3pYF0FbRAS+1XJTsuQ1mHPU0FLNJd3z7pOxc1O2?=
 =?us-ascii?Q?7abvp/KfgHni9NkrWo5vQwEXLyN/bf/ac+GgWwXeadXB8v1lRWkocYXp8IP/?=
 =?us-ascii?Q?Y1cSzRwI2JAoq/6IrHK9YA7tiW5/m/mdkNtn2yvDuKfeII1BLebPs3lNlYJu?=
 =?us-ascii?Q?oNxsDya5p7Jt72o7P56WPwjgq3M0HGuS/hPdylWhHbbEJDox7Z9jgBW8Lo1b?=
 =?us-ascii?Q?QC1tyxsRLFcRwEC03E0Sy3I/i/WjFAVD?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?aPsWnReHxkDm0TXqj3pahn6/CpQKhyTis0/jrqXvithpYXLVSwz81REkWVD/?=
 =?us-ascii?Q?S6dS7y4u2bjXDp66tOlxHe0rOhLfuhz7n2nXdUmG9WBZaU4HKiJxu1eESXb3?=
 =?us-ascii?Q?OPgOgtIdPVMMghUuT8YJ/vL/r2UDudxU40aAymmYI+DC1qBe2JjwsJ7yMnG7?=
 =?us-ascii?Q?0FnVPPEqmF/FSLFNzE5BwWEA+HLCeYX5piVW+6HUhgMr5VBeEaa9NYopqebk?=
 =?us-ascii?Q?0rWTknZZ4N5IU2E9q6CVXGSE+3A+ts4hW9b2JyhGxgP+ig48WvtHA9IAic+O?=
 =?us-ascii?Q?mXG3847skgtJToI7r4E3fsLn/d92Los55+IEJMAUjmf5Xcm6vb6UCHdHjtId?=
 =?us-ascii?Q?GqPIuGz9aW1YRwoY3Kn4p+KZ5An7lZSGDTwySK0Ch7uVQbgwELADI19Q9QCH?=
 =?us-ascii?Q?TmX3j6krlde6Ly5Mc+hlTqzIveH55AZHWxjg6s8uMrwbQQQxwUsmfnN269sK?=
 =?us-ascii?Q?cFI3rjEwoW25A2T/jrMnEQrYO7JNiPJlFz5aQcJmD5GMfMqHE+j2wENOeH0Q?=
 =?us-ascii?Q?IS92seSJPwS3m/QpMBt/lvEtwX039/v+cXyKnWuCpPeh2MHcH7IZcEjcDAiS?=
 =?us-ascii?Q?RTYcej8dL1fvAszmb18k7oCD8YJAFF5Nl4rVMYBok0LbLqLizmmrcqVB8/kk?=
 =?us-ascii?Q?L1HSakmx6W+J1WG2rfn9CD6lLbZWQ1EbhbQA22gp96UbRKLsPOXw1vclYa+J?=
 =?us-ascii?Q?aG4+vDQxeD0MrFsZV2biALNOZmz9FxWFukhSq7Aiq7w+8VXoQBnpTwJKpHsB?=
 =?us-ascii?Q?Afr+t25MIx2+Mrtaz0w4+u1Ltvi3udph/0drcuQO1Sd3d9X3Y1t0qTavjqmb?=
 =?us-ascii?Q?0mJYdeFass7dT1lilrDZOAJVBPIwY5iHhad5KszY301z8RMLDepJphfPUD+G?=
 =?us-ascii?Q?UAfr2LO0QluX1c/TTrqHlqpJktk5OcVZKa9P/v3EsRFrKFtJrZNFuXsOSf+Y?=
 =?us-ascii?Q?uz/6F6yvcMq6jz9zsmSxosifIi8UoZPRqEs8nbmEcxOj0V0ikvU7kD/rn/e3?=
 =?us-ascii?Q?DdYl9cVQHn+uf3Hth5IgUtD8D+b0J2Wsxiw1tybw91WWi01V5E7R4a2TH00G?=
 =?us-ascii?Q?lgTX225ur7szY09Nl+p9DTSTFVzmiYQKv7qbhVZUzTnCRU+SYvZGg5wQ8Rr/?=
 =?us-ascii?Q?ottBb7Lb6QiA7xbkvC21oYALrwIzrLCxIS4IGrPtbg+qotkfb2FzAoaYcanD?=
 =?us-ascii?Q?s6gUbLR/hJakxIe2wZQtIJFcFPceSQloI9t+3BvsMcIUM5banuhLvITAOEeV?=
 =?us-ascii?Q?6C4MUGADN4vANZ7+WxdzwUWHlaoegcTK81ZNmgro6xwkq8yFI6DX2fcxrFCb?=
 =?us-ascii?Q?XrOml/05lRfWbzALr0DTf+JEAJ0Tr/ibjlkSvIZU6eeSfHzZ1z6IKT5Wwwrg?=
 =?us-ascii?Q?q8/EBT41J5ulFHq2XK5/19u6GwXvOZGV7R8GKLiyCA6qOGYoTuPbrAkg0yvr?=
 =?us-ascii?Q?L6IQ0vLYDl6AKjDUhb9gxHapO504Ig0Bg5rtNBHAsyIl/AWdbPP9R8J8XFG0?=
 =?us-ascii?Q?2vhm9rfZzOwhDvnIu0mvqK4INEV+Jgt6K07OFQR3G59eXlqDJF4McahwzC/A?=
 =?us-ascii?Q?DB9UEjSiEEpIlW9YhKEVcR2RS8e1EQZ53sVtkxtiiFlgLYB5hmXeq1vfsI6S?=
 =?us-ascii?Q?e4MX8TskewjYKKlUckPQvXY017MImU8QY/79fxdey+vLlBb3k+u6iGgDQ/I3?=
 =?us-ascii?Q?jHBg1ZIAwE5Cn7I/gKVH/ddDyZ9oEp2xsjvLEC5zlVsQ9fXN6paTmnVwdAG1?=
 =?us-ascii?Q?Ht4tYEkyoA=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 9a1901bd-e5cc-4ee4-5f64-08de4cd703c4
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jan 2026 03:52:29.9420
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 CJaa5HA/hEK68IGLumLFOfZ2jg+X/YgScOivZFVbHD2R9PSZECQIOXrasA2M019hQSLBlxG2YIu7UgzXLeexwg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4116
Message-ID-Hash: QEHVCOJ3XHPHC4J6BOXJZPYVQJTJI6OZ
X-Message-ID-Hash: QEHVCOJ3XHPHC4J6BOXJZPYVQJTJI6OZ
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/QEHVCOJ3XHPHC4J6BOXJZPYVQJTJI6OZ/>
Archived-At: 
 <https://lore.freedesktop.org/20260106035226.48853-3-jhubbard@nvidia.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

Instead of open-coding the steps for extracting a null-terminated
string, use the newly available CStr::from_bytes_until_nul().

Suggested-by: Joel Fernandes <joelagnelf@nvidia.com>
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/firmware/gsp.rs | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/gpu/nova-core/firmware/gsp.rs b/drivers/gpu/nova-core/firmware/gsp.rs
index da97814cf859..1025b7f746eb 100644
--- a/drivers/gpu/nova-core/firmware/gsp.rs
+++ b/drivers/gpu/nova-core/firmware/gsp.rs
@@ -93,10 +93,7 @@ pub(super) fn elf64_section<'a, 'b>(elf: &'a [u8], name: &'b str) -> Option<&'a
 
             // Get the start of the name.
             elf.get(name_idx..)
-                // Stop at the first `0`.
-                .and_then(|nstr| nstr.get(0..=nstr.iter().position(|b| *b == 0)?))
-                // Convert into CStr. This should never fail because of the line above.
-                .and_then(|nstr| CStr::from_bytes_with_nul(nstr).ok())
+                .and_then(|nstr| CStr::from_bytes_until_nul(nstr).ok())
                 // Convert into str.
                 .and_then(|c_str| c_str.to_str().ok())
                 // Check that the name matches.
-- 
2.52.0

