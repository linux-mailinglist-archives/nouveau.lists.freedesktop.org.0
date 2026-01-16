Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 129C3D37AB2
	for <lists+nouveau@lfdr.de>; Fri, 16 Jan 2026 18:50:06 +0100 (CET)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 5A35410E91C;
	Fri, 16 Jan 2026 17:50:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="nEfKSAGh";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 6C7B544C96;
	Fri, 16 Jan 2026 17:41:27 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1768585287;
 b=vnaPk7FfKLTxOIyDDipr7dZEcQEbzb1g5IllB33kBgH8GBwTK5dUjWTK0r9phT1JqVl+W
 y02ItqZ7yl7aa/HxuZMwqb4THiBfNNPNjSQJDhzyvRUtGTt2g9yldQnKXBKS/v8aAODCPbx
 3zb3HChj5PmdGjBzREDU0qOb4YLZ6XQF18SnVx/jbp0gV846P6VSwU/nScwrzie5uLe7Kv7
 gb5VDkGxXie/PzXoIRsjT8QHugo/+TMcCAs3gs9UTdHhhxXIyp/adDzAEYjqRMvX4QAFL8J
 NqYJ4CbF0G4w6UUFsT9pHzzZ/Zt7o3YMQnILKw6zvzOGGjyY0DZlSjdPsz8g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1768585287; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=xV2Cx+sqaAFPfOgs8dhgf6nRx9XJJ78GMLl+Q/s9ygs=;
 b=kjnXpo4uRnIImIIkVucSXsrrbz9kjcUUhuF7OCv/iZJLx8I+vng5z7v0bWM7CJb9CsN1d
 CuCveH3oGD/9sSzn/S7e2Bq4QKOJiCKc2hkUSPK3t+Mjsd3u7AG6JLPKHG2Ft6KK6JLe7yk
 pszn9QMNVp96kZcxkqY4H8VKjqSN65mv+QHZoviFtf+u+/WbK/8zwZ6J9YUHLxs+BF7GUYS
 T4/DZHyVb/YWYr/WKq0Q9LAfw53sHGoLW4B+MWbjZ9GwQYLS7oSiBDfnPOD+OBUy0rnzc6E
 q/r6AaDwoBnolMuMTi2rdJAm4Lq1DxUaaTtqUI7v+VE9f2FOTQ0Jwzk+5HQA==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=Nvidia.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=nvidia.com
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=Nvidia.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=nvidia.com policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 61ECA44B97
	for <nouveau@lists.freedesktop.org>; Fri, 16 Jan 2026 17:41:24 +0000 (UTC)
Received: from SN4PR0501CU005.outbound.protection.outlook.com
 (mail-southcentralusazon11011003.outbound.protection.outlook.com
 [40.93.194.3])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 07A7B10E915;
	Fri, 16 Jan 2026 17:50:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rhhkydaSPeSxydHfYpVP02AyimjGfehCZMkKfkxIXew61MAcUk7pPqaPVpRMGHELd+8HNlDqRPfLOO7axqArBx3drr8rV9iBm2hhEM+Mj+eKw2Er8utuX4LAayYIxKl3qvFuD8g5UnOqt26fvujtRTGMkrLyIOwEejS16T0MbYPhToUwcvircnECv8c26BRqyCsVhbQiQ6wHPiBFm3bimQxB9oiJV63lGDB82zgfg+W7rcP8SxqL/n01tRQPZ72WkjqzMFBDAKnz5d53WJjx7wOC3cD30IGhp8QOM57ouatrwqo16v7KwqN4qzrJjS8hQQLOfNfA4+r70zUwoLosJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xV2Cx+sqaAFPfOgs8dhgf6nRx9XJJ78GMLl+Q/s9ygs=;
 b=BIAb+OlRn+JHC1vlVhanDRZIQ2ilLaqU6Bvd+JnA4bfPoakLbd98PydCmQkjhiDtF+OkDjNgNZv97xJmc8DZLFCuRxzz9g+q/LvTvu+rPQh/7HZvJeyeKsL9pfd+Tp3rUipMsUyZHc75uc2KduhsUMj6nvCEewn/4IvCyulDFzQBAA0P2Cw2zdzVaVGiwXPfeJ1d36pj5hPYzpGHLMUttOmbHBAeDknUI95D1zueRvSqHMbaWUeTW9/0oQ81SGRoqYtfemPbsbGEyWOvB8Gw9kEPPlOgyVQXUKTuIcuaIMGw3f0xn8bn2s9ULX7xbg2BIn/PJabfq9gSceWM4V8+XQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xV2Cx+sqaAFPfOgs8dhgf6nRx9XJJ78GMLl+Q/s9ygs=;
 b=nEfKSAGhj+o/7qfKCV1DNQ4VBlBcTRUxoJeC0KLfxvqMS47OeInkAUWRRV3ITyTLlG3meHyZO80NJGTwKc2DtmzbZG8FAqcd9os8b+aiyFJQiNWERKcgRearPEJq6xRJ6p6I3vW7elIxsdGudU01OkK33bx2uYXQmy69fXdpCATTpZue2kz7tSI5ky1hw1ileZVb1nh0g8qE5HhIIO0sNCh6A/m5LiXeBkLa+FxVhFLXKNRWFoltwGPYhjOhmADN/QtVERCgaQKgeZYUAntF+ccy3WPkEgVxaRoVsn+PJkYfdHoMGiDSjjxHRzn4rSjX+OMlfFkMzGOsPApsvEuEMw==
Received: from LV8PR12MB9620.namprd12.prod.outlook.com (2603:10b6:408:2a1::19)
 by CY3PR12MB9605.namprd12.prod.outlook.com (2603:10b6:930:103::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.5; Fri, 16 Jan
 2026 17:49:48 +0000
Received: from LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::1b59:c8a2:4c00:8a2c]) by LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::1b59:c8a2:4c00:8a2c%3]) with mapi id 15.20.9520.005; Fri, 16 Jan 2026
 17:49:48 +0000
Date: Fri, 16 Jan 2026 13:49:47 -0400
From: Jason Gunthorpe <jgg@nvidia.com>
To: Francois Dugast <francois.dugast@intel.com>
Subject: Re: [PATCH v6 1/5] mm/zone_device: Reinitialize large zone device
 private folios
Message-ID: <20260116174947.GA1134434@nvidia.com>
References: <20260116111325.1736137-1-francois.dugast@intel.com>
 <20260116111325.1736137-2-francois.dugast@intel.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260116111325.1736137-2-francois.dugast@intel.com>
X-ClientProxiedBy: BLAP220CA0023.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:208:32c::28) To LV8PR12MB9620.namprd12.prod.outlook.com
 (2603:10b6:408:2a1::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR12MB9620:EE_|CY3PR12MB9605:EE_
X-MS-Office365-Filtering-Correlation-Id: 308b4c01-ef95-4192-f891-08de5527a468
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|366016|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?ddD/1EYCzj+9fHThuWnm49SEIkIGMO7M38xpnx8V6Pw2ElWJAL8H8GQh8WdS?=
 =?us-ascii?Q?/aPcE7RLQuYMIMO2EuGL/YdcripJJWq4eE5eIuRqGfWX8eNKu2sfcT9OBUOs?=
 =?us-ascii?Q?isTM9DIxtIAiosSIK/R8HbdOA5EK6VGrZhSNsP2rlm4mAy+2gGvnIzo/mB7A?=
 =?us-ascii?Q?DWsmp0LxCXKQHivEvjhh6BjVGMuWhdm7M5Z+/XUscA0kEj1/p+IYlSBLCUfJ?=
 =?us-ascii?Q?+nd1roKHDh3SrpLhSg4XQ2/Sp4qXtahEYIrowbqgrdi2FiFKhoqxwrwZIqob?=
 =?us-ascii?Q?oiO9ph6UdnJNxbRY/nyxCh32FpBvCpjJSiB11qZTWhPRwmR6Q4b4cgq8bSDp?=
 =?us-ascii?Q?DyFp4yO5fQWh85GXtC/F8yivK0XQCNTUsr7NgzWKVq5X008VcOW7OFN4K/oT?=
 =?us-ascii?Q?mwulTqdqq0N7slzn2fAjfo2nnK56GlG52q7woVCHuZp0TaNsj7Nxc/ByDliP?=
 =?us-ascii?Q?3B2ZsTYKX0h4zZ2IiRGAcCWuVumdNoiK0XfVY5V3YQhmjma7nzaDO/ERkDYh?=
 =?us-ascii?Q?43gDcM3yKAdUcy1YSL3Yo/KhB0CkajewqjKRyndqs0QBL/BQdZu76DUiUoj9?=
 =?us-ascii?Q?pY8eXEAsjEDR5Es4RkYgMS0zLgFkCZp9DgrhUNlVwOBIc5wfG7T+x6a1n5Kl?=
 =?us-ascii?Q?uFH2Q3NNT26t+sYSwKNpUk6hKCpAdSxWIDQ8VppSzx/Q0qOj8UYWB374lXu6?=
 =?us-ascii?Q?KEGPVeNcGbnQnoWfifDX16iqKHlUObSkysy2oc8+sS4XIn4O7/XZwR8yNBBR?=
 =?us-ascii?Q?wlZX1d0vSQct92SnxAqt5CIvXhPK7Eu5+jzI/qerrZRTV6on/G6LlEFOmLBC?=
 =?us-ascii?Q?9GpXuTqkn4Cry/xjyKTB1ucd60ZlCiUrP99lqsS9W9mRJMhvFlbrgsLrf9yE?=
 =?us-ascii?Q?kOymidIhg5ER7A4kveC9/NlDLCBrhMKhK3gYFMy/+sa2TK346CHz6NGDMvO3?=
 =?us-ascii?Q?BC58C2sde90NNI/E7/dgPfNsNtRZ1cBgREIZ4K1k71EUlN4YeJcgm3f7LY2m?=
 =?us-ascii?Q?aVpKkThUVuY8Bh8+42pszPamzUFxGokl8ftFJIOpEoGa/Ae/UcTL4UTyIl8a?=
 =?us-ascii?Q?2NEBmaumqXSxntquVAXCFuLGxKe69ZPRhSYqaqduqdXxVgWdgxy1pTXbK91D?=
 =?us-ascii?Q?NVEs3CbYVaCdLTQwt3sr4Wiwu8+ieWvNpXLw4ly0dGdJI0uOEeKhgJFrhVVn?=
 =?us-ascii?Q?BeYb/inI5lakrESjbDZLwbbg1fdAGAoxCqgsseJxXwL4XjCsygxquyeqKMk3?=
 =?us-ascii?Q?SvEHjxzfJn/D2CoboV4OOsZLfdI9VSbJm0eFXvBUM+gswvEc4/ulu8QXR2TM?=
 =?us-ascii?Q?vO+/VgwFRgIC+SXjkPXV8IkytyKR7q4gULoo1/gDXgGOp/xXUOQBFb/AYqJR?=
 =?us-ascii?Q?e4JnD2YkvTuqM72aLWCI+JTu3WH0hEdJD+iDgbHINUR6F4a/VvM6saWTnWTk?=
 =?us-ascii?Q?4eYfyHIjnZ4lP/QGlYh8PcfX2yYPvIvVc8NI5YLK7QM23qTz4B+ua38vM1FB?=
 =?us-ascii?Q?uYPCol5II0vnGHMNTaFJChb1QiaoYB+HbQ0ajEHSyw11RxN0WZBIly3hkftA?=
 =?us-ascii?Q?B+mBuOnkyse3FgqWupk=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV8PR12MB9620.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Pv6IStIuKRJYPnb7b06RWzGKG+hgLQXA1adq5/yuzoaA0WAkzK4j0tL8XPOH?=
 =?us-ascii?Q?+O9aqzCg43xwrK8CBtU4pi9idPQ9TqHK2KtH4Ogze/vrKNXiDAvrw9khgnY7?=
 =?us-ascii?Q?9vss+L7Wafoe/eF50Yo8+ghV7PLNx7FhVrimAAI8+6iUjgE/cbqgQX1NXokX?=
 =?us-ascii?Q?GaHjVHrYJliNKBmHl/XHuCzXbTMS8UDKguFU+V90rPk4U7cZ+XpVxlucs5Yl?=
 =?us-ascii?Q?xuBviykERoZq5cbJb0CCB7btpTGX0Gjka4uaXF3DJzhm4C0ELUAG1hZ9cgsd?=
 =?us-ascii?Q?4sVdqPnbVkJ5qUePo58OGsXoWUzpZPKTNe7MZ2BbqcVamSkJt3eyDlkv916z?=
 =?us-ascii?Q?/hVZRJSVevFAJJj1nyK92P2GkDIiJvNm4FS2SQRT/lWOA5bp+gqf5NF0olpJ?=
 =?us-ascii?Q?u3tEwaXH1BWZNdHQ+XK76WYFddKw5NJ4Yv9lZIMX2865/lt0IWonbmUMiiZe?=
 =?us-ascii?Q?OECoob3RXSRd8zM5OfbMRnYcEAOebfBpIbagkdVgLW7bz1SkpSMl43ttc/vV?=
 =?us-ascii?Q?/pxIDPT15Nd5Wf6DuKRCbsNXVghvXl3DNlxPrBml2lOu+w+0XFtHomlA57hZ?=
 =?us-ascii?Q?gDkZSAmLiD2+oY3bcocMEbKPgV1CD8CljPYe2Hp52sVtrDqahHRnKZW8jmpr?=
 =?us-ascii?Q?S34eauTLQcdYhK9hBPpZE4Rep66N4X0SxQbYdFacRQnJFb5uCdcj0T8g0Y/N?=
 =?us-ascii?Q?yjQcZIy7nqf4+eNfsylScirUfN1I2dv24uOADPkiQfzLLMP/ZURpFFz8N6Nj?=
 =?us-ascii?Q?349bkgOZkEqXxCydphoPdkTSHcqHydkCCnUcZEfoGlozX+Y/j2OhW2jU3mnB?=
 =?us-ascii?Q?WG0ACDMvRT9ePJ2fiTLk4jtF9oHKhN6NVc+RkK9cj74z0xrZQ9FkMjSicD2E?=
 =?us-ascii?Q?d+c6Dg61QI4Ts7EYNZnusqrWrMmc1o0sYv3YES2WxN5q6ehPh83o7yt62u5a?=
 =?us-ascii?Q?jsMPgb1DvZT/2ep7y+DotyLcgXdoIIbhPFCTihJjxydAgb0NnGZPcz+zo5OI?=
 =?us-ascii?Q?72QmVSJ2fA6257hmHVzx8WRHxh7xr3pjJI26KAxyNppstFCkvozGCxgYMgpZ?=
 =?us-ascii?Q?5O1yy1L1xbPABB0OWzjJezYCY61H3mpoYly6D/TlOKFUI29JY+J/Tv2NTgG4?=
 =?us-ascii?Q?s4Ahgt70aZSVguKlYdvsfcH2XQiLtPtdWcY8is/oNiOuTanA5mpTxLbQkTX9?=
 =?us-ascii?Q?F/j5mNr43b4d8QHsi/ufHudg0QKt2s+FvVe3yU3idi22DnxrT9eDIxLu+Sa5?=
 =?us-ascii?Q?kcIbRCq4FmL9NXSDWGGU8ra15trp/7Qbu8EBLU63h2Yi1kd7PB7+H63kTJ7/?=
 =?us-ascii?Q?hOz3wNDuPzb5Zyk3IcZbI705ePsuR9x2d4v1SuOl5ODX8ehOGKH12sHcQVHm?=
 =?us-ascii?Q?wuuU0uVLssORwEpksCmxT0L/uHsJnfk+oVXD3hPb6Rtghb7kc+BenQFZbf0F?=
 =?us-ascii?Q?URqTlFESQTN3dllr50iI8xjSQJJmPIUteWZ8qVV6GOen/HWfuZpw6q05YYPO?=
 =?us-ascii?Q?A1kcX+wlQxfFYugGqovtGEoJ8CFFIpSrig5ZcGhfeRBlAllMisAi7P0oflBf?=
 =?us-ascii?Q?JpdN/sAi4RvbFJW+2S8awZaErgEOLEU+9hBG0IhaVAxFdbL4hTy85T3+4UN7?=
 =?us-ascii?Q?IcnuforGuantQyaDVA8GjE/POjOzFVUu5E0A1l32XvwDdBMCXSYLI5/o1rnW?=
 =?us-ascii?Q?ERK7fF4ncXaW/AAZaNmhpp8oXrYAWD8adOzzAs+iPwrwH7w+lkWEygQMUunY?=
 =?us-ascii?Q?JOnLf+c8fQ=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 308b4c01-ef95-4192-f891-08de5527a468
X-MS-Exchange-CrossTenant-AuthSource: LV8PR12MB9620.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2026 17:49:48.6127
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 iNj2D3EJnE6mnpQiDNm+mHq6bMRycR2scWsT80AxhfBSiAPUeXeNhQ/YXFKQNNvS
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY3PR12MB9605
Message-ID-Hash: L4BEPJL3VQBSLFZIMDHOUDLBJEUZMSWD
X-Message-ID-Hash: L4BEPJL3VQBSLFZIMDHOUDLBJEUZMSWD
X-MailFrom: jgg@nvidia.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Matthew Brost <matthew.brost@intel.com>, Zi Yan <ziy@nvidia.com>,
 Alistair Popple <apopple@nvidia.com>,
 adhavan Srinivasan <maddy@linux.ibm.com>,
 Nicholas Piggin <npiggin@gmail.com>, Michael Ellerman <mpe@ellerman.id.au>,
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
 Felix Kuehling <Felix.Kuehling@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Danilo Krummrich <dakr@kernel.org>,
 David Hildenbrand <david@kernel.org>, Oscar Salvador <osalvador@suse.de>,
 Andrew Morton <akpm@linux-foundation.org>, Leon Romanovsky <leon@kernel.org>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 "Liam R . Howlett" <Liam.Howlett@oracle.com>,
 Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, linux-mm@kvack.org, linux-cxl@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/L4BEPJL3VQBSLFZIMDHOUDLBJEUZMSWD/>
Archived-At: 
 <https://lore.freedesktop.org/20260116174947.GA1134434@nvidia.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Fri, Jan 16, 2026 at 12:10:16PM +0100, Francois Dugast wrote:
> -void zone_device_page_init(struct page *page, unsigned int order)
> +void zone_device_page_init(struct page *page, struct dev_pagemap *pgmap,
> +			   unsigned int order)
>  {
> +	struct page *new_page = page;
> +	unsigned int i;
> +
>  	VM_WARN_ON_ONCE(order > MAX_ORDER_NR_PAGES);
>  
> +	for (i = 0; i < (1UL << order); ++i, ++new_page) {
> +		struct folio *new_folio = (struct folio *)new_page;
> +
> +		/*
> +		 * new_page could have been part of previous higher order folio
> +		 * which encodes the order, in page + 1, in the flags bits. We
> +		 * blindly clear bits which could have set my order field here,
> +		 * including page head.
> +		 */
> +		new_page->flags.f &= ~0xffUL;	/* Clear possible order, page head */
> +
> +#ifdef NR_PAGES_IN_LARGE_FOLIO
> +		/*
> +		 * This pointer math looks odd, but new_page could have been
> +		 * part of a previous higher order folio, which sets _nr_pages
> +		 * in page + 1 (new_page). Therefore, we use pointer casting to
> +		 * correctly locate the _nr_pages bits within new_page which
> +		 * could have modified by previous higher order folio.
> +		 */
> +		((struct folio *)(new_page - 1))->_nr_pages = 0;
> +#endif

This seems too weird, why is it in the loop?  There is only one
_nr_pages per folio.

This is mostly zeroing some memory in the tail pages? Why?

Why can't this use the normal helpers, like memmap_init_compound()?

 struct folio *new_folio = page

 /* First 4 tail pages are part of struct folio */
 for (i = 4; i < (1UL << order); i++) {
     prep_compound_tail(..)
 }

 prep_comound_head(page, order)
 new_folio->_nr_pages = 0

??

Jason
