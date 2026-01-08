Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E854AD00822
	for <lists+nouveau@lfdr.de>; Thu, 08 Jan 2026 01:58:27 +0100 (CET)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id B2F8810E676;
	Thu,  8 Jan 2026 00:58:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="acLvH2Q/";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 40F77404B2;
	Thu,  8 Jan 2026 00:50:05 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1767833405;
 b=Ih0dX/W4LS860cwtztWPZeCrFviEGvbP5fUKHJv0bvd6yqC+sJNMKqULe6SbIFpW8bsX/
 dQB2P20+nlkpR/Khz5wD9D2ofod/dal66lJd8LF2w1Tf7I6y0K2Nl2n2n2tBpVUouZKQ+rw
 ATog1xHJEvHqfgd2JWenlF6/ja00rid39fxvUdOpxjJupnwb8RewzYqdbn1MaFyfh0h74Uy
 GN2sCtI1MZIZqQgfwV1zxNGh3dJh3MaHXRpRptbPRcpHKoCRb+BTPJfMFVT1l/7Ht7LdZKD
 V/wQpvPBbR8FI+We1RKUp8LhLBLV9kfLfeLDbk/Xpo1T5fSRMyOAzEpgwXNw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1767833405; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=iJBXJcnSWLEvx2MgPywHFSFtgbyuX0rr92DPtOnrX7I=;
 b=OCAAj9eD826prDNBeO8xJElG91bIKgIspIXDezVgMuyk/mTIhx2MDYzrgP7J6nkgPLMAA
 9htfE0NzapLMevEdRTT/7pUIpfZJvU3O+WAY4JXotiJPwdFvdPuoxoGGP38r0SVKr+QGwfV
 bKySvsdwhMoCshocVdeTtgaDu+2dYlb5nRrQ+4zDomJF90u4d1Ii3h5QYCUmhRq5gAivVs1
 A0pT5uOBjS6KJQzCHUdh5Z7xIwJ2nkOWtfrTBkY3zqO+1YZ9dHUd3D09OU9x8sZmzenGSr+
 Q8n5wEnrMF89tsuKnKXfYIV9IPf/1+pr/fGv1J/6NrWOnUCz8A9nQ8o1/53Q==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=Nvidia.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=nvidia.com
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=Nvidia.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=nvidia.com policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id C2426404F4
	for <nouveau@lists.freedesktop.org>; Thu,  8 Jan 2026 00:50:02 +0000 (UTC)
Received: from DM1PR04CU001.outbound.protection.outlook.com
 (mail-centralusazon11010070.outbound.protection.outlook.com [52.101.61.70])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 0CEEA10E2E0
	for <nouveau@lists.freedesktop.org>; Thu,  8 Jan 2026 00:58:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c/fLuToF+opd8mcSsINrDiLCkXFEYUmUaKnVftaAilZdG2B/LXMu0q4N4Ms0H0VhGvD4dgNRV1jBQZGwqMfIEv3bMvEQ/XfkS9oOTUZ7GMCyWFFL1gJHfSq6LC3FlG35dlY63cu2rpE7CtQRTwRpw20OfiOHbCga44tfB8mFXt+Y+lLpVSo9bTtP9cvmc6Yltq9VcZaPMDN63KGZHtUU2vzHcVzSIsxP6cEhbrNnxUEfpu//XZsQoya8m1oSdIJPA6ye0Z8GNGIlWc0pvoAKL++604UC65gvq7dQN4vFXRWLLMFI5epQQXepPRzRfOSkX5/noCEZDGiyD+YCnNwBQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iJBXJcnSWLEvx2MgPywHFSFtgbyuX0rr92DPtOnrX7I=;
 b=KbiByfA0aM21SlyKhb0sFBLIubekg+xZzYakPdDJQus7shXTHxk9W49fNg5XOz5MApkpYYe+HzG2O0rjac890VV5P4JMJWjW1jMUJ/ce29JzLPBwhL+a06yISbTeHqsnetWg0+Sh4nF2AWxlk+lFHuQYLT6MyasPaZM4RayTS/nbg/voYgO/hm4tnlJw44XEfb8fmjFkKnOX+c0Wnkvgv3GXwLisFPlLiDMn9qZAMtXslZhlu/S4dhjHbbPnEbALi1sd5ohtNBJ+sbse4i1xVarkr0zz9apZQmJQ6/eVWnHjEXctpYp74LcZff92ONmNAESdsIfZ/J28oHrQp2IiBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iJBXJcnSWLEvx2MgPywHFSFtgbyuX0rr92DPtOnrX7I=;
 b=acLvH2Q/A3DxQ+mH8+zYLSoz5XVNJO+B7aGWS0zWD+8whaO0M/vLN6dRiRzRESCLOhdQAznCdDORT9KobJB2c69K3z4SWceSyiJpq3Xof+K28dOF7ApWbZMsEPQmMF9fp/PmBEs9K+XA1owt14gn4x1UnK7ol2x20ze7exPm8Mwq8GE+Bd/HDiSEHb6M14kDS8DglqML/mPpoMxpfF2fS+rHe2gcC6rsibFL0dk3RBFq7ZPYzcp+FnJFaPNV+P4WTZmxMNfJIyl7jtbZLYcArcE783omfWOAMeEwgcLMwkLEKnKlzHPqmkNeaAVgXXWh2MCYhI7zMHEUj0ApOmLEBw==
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 MW4PR12MB7285.namprd12.prod.outlook.com (2603:10b6:303:22e::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.5; Thu, 8 Jan
 2026 00:58:15 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9499.002; Thu, 8 Jan 2026
 00:58:15 +0000
From: John Hubbard <jhubbard@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>
Subject: [PATCH 2/2] gpu: nova-core: don't print raw PMU table entries
Date: Wed,  7 Jan 2026 16:58:11 -0800
Message-ID: <20260108005811.86014-3-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260108005811.86014-1-jhubbard@nvidia.com>
References: <20260108005811.86014-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY1P220CA0015.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:5c3::10) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|MW4PR12MB7285:EE_
X-MS-Office365-Filtering-Correlation-Id: f85fbe37-0eec-4d0e-67c0-08de4e510147
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?wzD378qN0fKhgDk7pU15dyQcYVTr2/bIfeENhrc7GWC3v5yDRnGwEOmgMdjf?=
 =?us-ascii?Q?3HPWM+EcKplZ0O9hyWMbpsy0OL/vREk5QSlrW1zHUuW+VpPwp0RlzGv5MtcS?=
 =?us-ascii?Q?VGOv+a7A0DeMbE2pwynu/I3gkI5j+Kcy01v4102ylID7QwfOuUw8pmaPT/k0?=
 =?us-ascii?Q?tZ/rZR7MMrKA4ziMjW8+HX5GndhHbQoSogdB5Sy9DAm85M3qBGLToTD5ub9I?=
 =?us-ascii?Q?zV82egJIcukK06Pfj74YMK2mvSWYIlf7RZutpiIV8H63dpB1WHeImnY6sow2?=
 =?us-ascii?Q?KSwmfDqOZkEs7FQuvnPOB0huVj33+mhiXv+BdP7ABe23unJNtqM07z3VRfYb?=
 =?us-ascii?Q?HVE7apa5TWOEZVILsDUnRPWlNL/UIA0tz2HRKonmqefz6X0V2t997oZQ4HjN?=
 =?us-ascii?Q?YJxswEiecVsLvJHSQFbCRTgqHq64pMqWJzs3/6KyVTOdBVO1cYoFAtEV0kPB?=
 =?us-ascii?Q?PyuT0v8ZBm1GNEj50wF2HyQ+Q5eO2M51cB/qokmQ38b6G/+sH3fGhm4Di5sy?=
 =?us-ascii?Q?QJ/0qJ5OO8aN3Z7FcyMrv+dJhL0XIiPXmsvYFMm5GZGDHmBKMaSVeQjuezgc?=
 =?us-ascii?Q?Md43PCQePAhzUjvPiQOqDG0cKZwrxQvnSnzj4HUkpSGwmjpo9XUtI8I9eC/U?=
 =?us-ascii?Q?3vp8YZDoeNCX+oozufLGMZ31ib5uJKbSSScugbcIGUr/ul1zMaBYUHZFqwT2?=
 =?us-ascii?Q?bUrYAJ5rbkVOXxxCHSaDK8HWvU5mrxZAMZOQdImgu5oXT4WHiia154U8j9OO?=
 =?us-ascii?Q?MAvG6fFUl93rvjmkCEGccutGQJseSY4zIi79hnuOX7YMINcTvSysZoetyDI+?=
 =?us-ascii?Q?V1dsijRDNPJ8PAqJUtIulwoCW++7nY8Go4Wzw22GAZr0e6x7UjdCdpYpNhrJ?=
 =?us-ascii?Q?lVtADo714ULVWahSmAygCrMFK3O4asbRufIjKTQWe0da6M5qYpED16gIqDQw?=
 =?us-ascii?Q?fwgQC2bUg7o8Y94IAdav+u9VhZSDM4sMy2cKEVdBxayL5L5fw3mxrBndcLDw?=
 =?us-ascii?Q?Fg0d4fkG/Gt/twCRKVtgj8ODlTs5ykqq83j9vFTbhaZ168YDIwSJB4SQh7+n?=
 =?us-ascii?Q?0ribJZJw6iUVXcM4KSRoV7Vdn0Vqfz3opC4WOtFAtAwInjY2Js3Uy0vY+5YQ?=
 =?us-ascii?Q?sNJRNeJOtyGTclruQJA3DPaNIrHuPsJav/6nlU6a79GaL6vh5Q4dJ2yMN3uU?=
 =?us-ascii?Q?OrJ+xPHbFv3DPYNWccdJUx4Hf9BSlz7klOCo0d9dIS+h0ieie2YzeTXLKPIj?=
 =?us-ascii?Q?TTAUwr5PjpMTXyJpMXCVbTneN30sqdAJUwlQ4xINXchX2lNHTABGHSh2q1Db?=
 =?us-ascii?Q?pOOTT4C30Z3euOPf0vSi+zDrmoYXEUD2A4J0e2U94ZmlMoQhAMFsbXcFjRQ3?=
 =?us-ascii?Q?oQoVqSQSu7nW+XWYGyxK9W2mw2Nkcu+keHpb0XHOYQ111ph0ka1kcsa/qRmx?=
 =?us-ascii?Q?/OYfpQ7ann/DH36lQ3gpWj1eBep2ZzIU?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?L9P9+i5C4qGR/1SQkmqhMy6OQAkKE9Peg6VsliyOBwYDpNmZK2gesN4KWx4n?=
 =?us-ascii?Q?BElUUt7XCm1B04hkwveq8iwpxOnxyugG1v7DEA/lkgs4VN/NwpGNFVTQ/SLm?=
 =?us-ascii?Q?cQBE8INQ9Q41G2Reh4NkwqyTQDtFT2v382cWLFzt3dS1cbx6pqXME/42+iCU?=
 =?us-ascii?Q?JLaiIwW0CbQgRiIvAjdUDmrGzTxORbRPoXQn2lugv6MF3zmhVCcsQx0VdZCP?=
 =?us-ascii?Q?uOKrouChVeWFnuv3d9C8tP4DFp1hd6cn9letReCIieQJLyQMi7heL6crsV6m?=
 =?us-ascii?Q?TRv8T2M2EXZqPxIufROuOjEY8Zs9RQpI0u1Tv3D/7v3ew4cO5x1+CyUss4Ps?=
 =?us-ascii?Q?802XcbV092DuLG9vEGt50Qho6DrwwHXia08mhrSh+0uLBnpFQ8gulyCp0UR9?=
 =?us-ascii?Q?vd8Ej1/zX7ursNHOSsgyqnuz1it66+yS9C26ZANQWkE0IH0a8O9WkezzKhU5?=
 =?us-ascii?Q?1g3/a9RjTHSsdJsfA88s208YE+i9FheuSr5UZ6dyDscgwVJjthKL26zIkRqi?=
 =?us-ascii?Q?z2GKecVuvHkE9H1UjKOYbMNkJ2eE/8tcquE7moeo5+e4D39jiqoRyxts5BmI?=
 =?us-ascii?Q?EGqtc4ZV8MWwMFXT+BAwH39Ap3pHO+o79WVLoOjf0bIOjsHxVb1F/erTCJkh?=
 =?us-ascii?Q?Gcye85rRC3JQSVpX5/drrICcua/t2u7sty6UPFyXKOHfjYIckHuDg/45kDI9?=
 =?us-ascii?Q?446f0ZE7oMnbyBOF2MTIbHneFqnmSmHL28d8DbdPQ+fz765U8toMzCgaajV1?=
 =?us-ascii?Q?HedRXKKlbMUA7wK+wVjBWhukOnqXEox6WQxtpEdIAt4aWoOop791EaJdSmDS?=
 =?us-ascii?Q?4pqN9g2vpSaco0SVQRm9QUQ2cXkoCkp8KoZCeUzv6mvCA64l6Z7IqNT8laKl?=
 =?us-ascii?Q?YjCkeTt6AZPjun2zVW1ntVcZt3HKUKN1EL8ibfDW4r6B8YfUYY8ktNGahldb?=
 =?us-ascii?Q?YFH7KJdPACwV8ne2aAWVWyO0qQtUXHzPmGYUwv34ke00FtUGgk4uXeeeNpX6?=
 =?us-ascii?Q?AMcSREuATQruBia3w9DPWQOFfirNpmIBcrOM+YiF562Uz+ME5GfsUhqZFaqs?=
 =?us-ascii?Q?jFLRpU/N0a3f3roK1XCQN7sv6cPasnyrP6g9CELgAHncV1kV0S0aVYzjI4It?=
 =?us-ascii?Q?fyUAFhCs5Pum/z7p9fzF2gDf5+fJslkcDzM3Bqs7BWV0hV7LSlDKFmbiyCMM?=
 =?us-ascii?Q?Gj+e0JljR13gswsq8n+xc8JDi74BfGoyfH0A/yt4cvS6O9MUnej3NbZP4+Ma?=
 =?us-ascii?Q?mzNCzrDmvuNcEs1Oce+AjR0lMp15GEy+I4tLjaOn55PJR5f/ZvZ53QkVWq/6?=
 =?us-ascii?Q?pZ4Pt5uYh1VmalzPQUN2dSUsEiOnyK78uT9HoCXAKQk/6dwqu18ftBDg9g+u?=
 =?us-ascii?Q?LfS9mfKAImzZND3IajJSqJtx8poiUoO12SFbdWuE85czWAL83XuTuDrnH2jr?=
 =?us-ascii?Q?HGODH0ssAQHxWo2Ra/v9sCSDTulFDIoa5aacWqeiinUSsIUuRLDUhuWzNdUw?=
 =?us-ascii?Q?PDfS+OrzoDM0jZuM245TCiljGFlMd3zMn5JYl7fAE5wpNNjhBxeVzvSC8xpC?=
 =?us-ascii?Q?wc4xGY2dtMI1pnz0+t/L68VIU8KhdC0RVEBfnB4ix4ug9+8HEfA4Etvxfqco?=
 =?us-ascii?Q?Oo8o+c6RUY4vgp9K5BC+xNqic0jhW8owA/zrLOzunPEnAbVj9pParlijrjLI?=
 =?us-ascii?Q?vOrINuhBH6aZMfh9h1TbGxGArSSbtZoHkiQZKFzCI3ymqp4rYATAxULORUea?=
 =?us-ascii?Q?xitfUgqjJw=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 f85fbe37-0eec-4d0e-67c0-08de4e510147
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2026 00:58:15.5144
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 8aICAIdsUgBAIPV91BLTWCIjJSdKa0QISmimqZLvOKwvx744IyR8M3ntySslYWI9oOlWLYX/DRauNbvboAUe/A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7285
Message-ID-Hash: XA5TOK3N2AXFYALEHW2FMBJ7FKKQZEPB
X-Message-ID-Hash: XA5TOK3N2AXFYALEHW2FMBJ7FKKQZEPB
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/XA5TOK3N2AXFYALEHW2FMBJ7FKKQZEPB/>
Archived-At: 
 <https://lore.freedesktop.org/20260108005811.86014-3-jhubbard@nvidia.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

Remove the (large) raw form of the PMU table entries. The resulting
PMULookupTable is still getting printed (in more useful form) later,
anyway, so this was redundant, even for debugging. This output (the
example is from an Ampere GPU) is what is being removed:

NovaCore 0000:e1:00.0: PMU entry: [01, 01, 54, 54, 01, 00]
NovaCore 0000:e1:00.0: PMU entry: [00, 00, 00, 00, 00, 00]
NovaCore 0000:e1:00.0: PMU entry: [00, 00, 00, 00, 00, 00]
NovaCore 0000:e1:00.0: PMU entry: [00, 00, 00, 00, 00, 00]
NovaCore 0000:e1:00.0: PMU entry: [00, 00, 00, 00, 00, 00]
NovaCore 0000:e1:00.0: PMU entry: [07, 06, e0, b7, 03, 00]
NovaCore 0000:e1:00.0: PMU entry: [08, 01, bc, 56, 05, 00]
NovaCore 0000:e1:00.0: PMU entry: [00, 00, 00, 00, 00, 00]
NovaCore 0000:e1:00.0: PMU entry: [45, 07, 88, da, 01, 00]
NovaCore 0000:e1:00.0: PMU entry: [85, 07, 34, c9, 02, 00]
NovaCore 0000:e1:00.0: PMU entry: [49, 05, 7c, b3, 04, 00]
NovaCore 0000:e1:00.0: PMU entry: [89, 05, 1c, 05, 05, 00]
NovaCore 0000:e1:00.0: PMU entry: [00, 00, 00, 00, 00, 00]
NovaCore 0000:e1:00.0: PMU entry: [00, 00, 00, 00, 00, 00]
NovaCore 0000:e1:00.0: PMU entry: [00, 00, 00, 00, 00, 00]
NovaCore 0000:e1:00.0: PMU entry: [00, 00, 00, 00, 00, 00]

And it is immediately followed by a more useful, interpreted list of
selected PMU table data, which is *not* being removed as part of this
commit. That looks like this:

NovaCore 0000:e1:00.0: PmuLookupTableEntry desc: FalconUCodeDescV3 {
    hdr: 78381825,
    stored_size: 59904,
    pkc_data_offset: 1444,
    interface_offset: 28,
    imem_phys_base: 0,
    imem_load_size: 57856,
    imem_virt_base: 0,
    dmem_phys_base: 0,
    dmem_load_size: 2048,
    engine_id_mask: 1024,
    ucode_id: 9,
    signature_count: 3,
    signature_versions: 7,
    _reserved: 37449,
}

Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/vbios.rs | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/gpu/nova-core/vbios.rs b/drivers/gpu/nova-core/vbios.rs
index 7c26e4a2d61c..ac01eb195fb2 100644
--- a/drivers/gpu/nova-core/vbios.rs
+++ b/drivers/gpu/nova-core/vbios.rs
@@ -887,11 +887,6 @@ fn new(dev: &device::Device, data: &[u8]) -> Result<Self> {
             ret
         };
 
-        // Debug logging of entries (dumps the table data to dmesg)
-        for i in (header_len..required_bytes).step_by(entry_len) {
-            dev_dbg!(dev, "PMU entry: {:02x?}\n", &data[i..][..entry_len]);
-        }
-
         Ok(PmuLookupTable { header, table_data })
     }
 
-- 
2.52.0

