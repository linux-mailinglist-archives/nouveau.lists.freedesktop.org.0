Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 00A83C42C2E
	for <lists+nouveau@lfdr.de>; Sat, 08 Nov 2025 12:45:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 634D110E00F;
	Sat,  8 Nov 2025 11:45:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="Ri9usgnv";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from BL2PR02CU003.outbound.protection.outlook.com
 (mail-eastusazon11011002.outbound.protection.outlook.com [52.101.52.2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E89D110E00F;
 Sat,  8 Nov 2025 11:45:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KHcq/lsZs5eWYlpPd5CxsJkIX9YrNoyQTReG+OyyW9GrbKCF3zrv8Llh8P1qjgj16uHEz4S7xxDc5pQXbQQirBZGOZIN2/jqnSUXkOoD9dQNzv7jRPc0+L6fCUPZYwXTgiMzWwYwn2XbJVxZxDBvCevo0ulbd0BsDR7onLQyVnTgEqBhWraG/vAEMj0WRCP8rBukDtP7bc7AfZeH+gQhonCYOrz3XMPh08nDdL2Lon+DGG5vZne8Y1dDHfas+LbHggKWX8tuKVmoRvG8SVlcdBqNlCQ7cjMPMOwdg/vmI6n++ZXPbYS4VzwXnfG+b7aJHAXkSEqOP3eE4Y446wkXNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sZ++MRCshAs9vMJzKbm2tVLZiQpIewGOajLAJy1PXKc=;
 b=yJG9jhX87Zsf0t9/wX+FdbBKXJDbi2feBJPmBfrDz24ycHHBagw19j8d2uXkk/aBU3me/s/zYT79CUPPLABgocXOfGjglPQhwhJ5ZtvP7zVYKoOlUVTSiULBTGPaR8+BGLViubaqiFcJN/fO0BL/cgFFDLfGLxAd89E+DTHRHxkzOJUd5VLjaMjjTR16sF/ozuqnirpxK3waoUk0c0X+gBGsPWCnN3FgIhuL8PSjva/M1RL3lgsmzRSEJzWEnmv4laBMfK/q8gXdylfWUnhzLHqtSrNi1jq6Jk25/lua4UyeVdwgFubtR+dIJ7+AJvxU8fBxW3oyJ901+COZhqC1/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sZ++MRCshAs9vMJzKbm2tVLZiQpIewGOajLAJy1PXKc=;
 b=Ri9usgnvfD8H6MvrhHw3a/Gi6cmxqg1xCEHV0eoezvcY6lzVhrOT44X8bR5nJT8v4wqA8vr8sQu0oHXZGZ0CMP6/GImdVJrS+B4OAAdKvqu1Y0i5hu6Mst98+tC3x8cPObAffYtbP7Yo/doi4pjljAVXALfUwZ0bDuj6dsUJygpTjpzQRMUCOOu+/hyMgDCZM+OEmLHk9qvd6jlq8eGtofc+iwLsZ2YcjtyZXPdgrudDRtbGIO4+LBS8AvAMN5UBVeBF6RQRt2Np1vw4MHxJHVwtXzQkoR5eulrmQCCDQAY/M7DQcJbO8IaStAPfeBhqW4S4W9LoO6/BoMkj9fsYBw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by DS0PR12MB8574.namprd12.prod.outlook.com (2603:10b6:8:166::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.13; Sat, 8 Nov
 2025 11:45:05 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9298.012; Sat, 8 Nov 2025
 11:45:05 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 08 Nov 2025 20:45:02 +0900
Message-Id: <DE3ADB75TBUH.3ROHW8XJAC6K0@nvidia.com>
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "John Hubbard" <jhubbard@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>,
 "dakr@kernel.org" <dakr@kernel.org>
Cc: "Alexandre Courbot" <acourbot@nvidia.com>, "lossin@kernel.org"
 <lossin@kernel.org>, "a.hindborg@kernel.org" <a.hindborg@kernel.org>,
 "boqun.feng@gmail.com" <boqun.feng@gmail.com>, "aliceryhl@google.com"
 <aliceryhl@google.com>, "Zhi Wang" <zhiw@nvidia.com>, "simona@ffwll.ch"
 <simona@ffwll.ch>, "alex.gaynor@gmail.com" <alex.gaynor@gmail.com>,
 "ojeda@kernel.org" <ojeda@kernel.org>, "tmgross@umich.edu"
 <tmgross@umich.edu>, "nouveau@lists.freedesktop.org"
 <nouveau@lists.freedesktop.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "rust-for-linux@vger.kernel.org"
 <rust-for-linux@vger.kernel.org>, "bjorn3_gh@protonmail.com"
 <bjorn3_gh@protonmail.com>, "Edwin Peer" <epeer@nvidia.com>,
 "airlied@gmail.com" <airlied@gmail.com>, "Joel Fernandes"
 <joelagnelf@nvidia.com>, "bhelgaas@google.com" <bhelgaas@google.com>,
 "gary@garyguo.net" <gary@garyguo.net>, "Alistair Popple"
 <apopple@nvidia.com>, "Nouveau" <nouveau-bounces@lists.freedesktop.org>
Subject: Re: [PATCH v6 3/4] gpu: nova-core: make Architecture behave as a u8
 type
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20251108043945.571266-1-jhubbard@nvidia.com>
 <20251108043945.571266-4-jhubbard@nvidia.com>
 <5342a0f10a3e9ef7d3165bd8912bd042ae7f68f5.camel@nvidia.com>
 <05cdeb51-2731-43f0-b24e-53534b524a44@nvidia.com>
In-Reply-To: <05cdeb51-2731-43f0-b24e-53534b524a44@nvidia.com>
X-ClientProxiedBy: TYCPR01CA0108.jpnprd01.prod.outlook.com
 (2603:1096:405:4::24) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|DS0PR12MB8574:EE_
X-MS-Office365-Filtering-Correlation-Id: 7a6a1888-5953-4915-97f6-08de1ebc4292
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|7416014|376014|10070799003|1800799024; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NVhhMC9Kc28vakZqOGVQeDg3aGltL0w3MGxRekJSZTBUaXlFMGh2cWZVSHpm?=
 =?utf-8?B?d2VBZjg4WVRMcFdvY3BuTUp3WWQ3OTY1RjJVNU5UMmRQU25qZlhIMVo0NnVG?=
 =?utf-8?B?YnBUYTF5VXUwSEJnYVBLcmxLempNMWJXbUpnTzdtZjlJQ2p3WFdDcUtmKzZm?=
 =?utf-8?B?cE1xUGFENStydlNUdlhvaXlNazFlUVIzV0xGTURFU2wzYUg4bC9KL0RZdExq?=
 =?utf-8?B?c2o1N1BCK2JKZ0QyZUIzdTh4cVhoNmpyc295OU5iYUdVM3FpWHlnMXZhbStH?=
 =?utf-8?B?V0dOSGZTaHpjT3FDSGN6S3BhdS8yR1h3ZkwzZnRhSUZrbzdBN3lvNGd0QXJV?=
 =?utf-8?B?Z2xrTTRFLzlSaU1GakNEcVlZbHF1MWpyNitwUzkvcUdQYjFJZ3ljY2lCazFj?=
 =?utf-8?B?NFZYLzk3djBTUHNxSTdUYnNaN1lRd1l2SmljQW5FWXE4UGNNejkxK1VsQUxW?=
 =?utf-8?B?RW51NDZkNTFVQzh2SXF0alF5ZUR4cVJmOUY3VzRkS2pLSTdlallxWnlQZUcw?=
 =?utf-8?B?QjJwR0hRWUNWc0lFVnhDb1VQSCtRYTNpWTltYXlZd1g0cmdIRGMxREI5eWN1?=
 =?utf-8?B?L3dLbVB0bEdBSVEwV3p0SGFpODhVRU91ZlNCNGVBcDA0NGFVai9hbmJrYzVO?=
 =?utf-8?B?a0QrWURNd1JPWkVGalA0QVV3dEdBR2Z1NVBRMW5VRW9kL3RvSmZWc1UwdmRX?=
 =?utf-8?B?UHNka0xHZXFuTERWMk8xaENTUklFZEdsaFdKaDFFaUUvamoxSEhhaE9nQUhp?=
 =?utf-8?B?cVBoWkRnTmF6Y0JNRFlxQUpCTkoxYUxjWEF6VThMSlFDWHVmVzJEcGNJak83?=
 =?utf-8?B?VTgyUFBtR2R3TWlpNTlVN2gvSFVueWIvTTlPMm1FMTFSQXZYUi9Yd255ak1z?=
 =?utf-8?B?S3F2ZDJkV2ZvTncrdGhWYkRxbVp5Q3BSUFVPaSt4VkJVQmZpYWpFY1ZORVI1?=
 =?utf-8?B?UjREM3ZFSk9nRmhnQUkyWm84ZTdwU0Jwa2o3elBEOWZvTU9BcWpHRWdCbnI3?=
 =?utf-8?B?cWNpbmVNL2ZvT2ptWDBJcUM1enF5dk5pdGxvNHZIdHA2dmJSMFZrMEdzTUZw?=
 =?utf-8?B?WEN1UmFMWmV5eGVxamJ0K3dGd3RPbXU0b3NLeS96ZGlTYjVZdlFCQ3VwdUdZ?=
 =?utf-8?B?aXVJL210S0xwdFRMQmphL1I5MThmTjI2MFhHZ1VRZFBnRlVzL1FMOStHMHJw?=
 =?utf-8?B?NW5lL0FNODdGL2NMNncrVXpXQVQ2VjZxYU1pWFNBQzE4QUhrU2FkYXVLa3Mw?=
 =?utf-8?B?ZmJiYytmYTJuejVNK2o5K0ZYRG9QTHgycG0vejRsS3NiSjJlOEhCSHc1MStm?=
 =?utf-8?B?dks3Q2RKWXloNkI0akhjczVSMXhkUnBia1BpWEN6WllRcDJLWmFzTlB5RUtQ?=
 =?utf-8?B?dSt3dVQ2Y2JQVkhPbkxLVC9RUEZ2a3VhVUFwUWgwZ0ZORmtjK2ROLzdoR1F0?=
 =?utf-8?B?NlFmWjI3QUErdW9RMnJvcURqTlNtc1dtN0hWaTVDbGUxVUNnWUlOdHp1Uzdq?=
 =?utf-8?B?cnkvN0NrWUwwak5LN3picW51OG1QYVJFamg3K2swcDU0cGFvRFdVSkltVXRU?=
 =?utf-8?B?b0FFaWRxQkZ5cHNFQkRKbHVMc0Mzb3VEWnRKODl4OTRIY0EwUnlxemd0bW0x?=
 =?utf-8?B?NTBxckhmejVUblZpMUdIdElJUFVzQjJEdkU1L1EvUVlXa1RUSXgvMmc0a1Ju?=
 =?utf-8?B?bHNMeWFHa21UemRCNEZGdzM5UlFWUUVBamtqM3N4dlB2OXNxUXFBOUtOL3RL?=
 =?utf-8?B?eG5YcFZPaWtMQW1SWVJVSjVOYkt4d080MzdNUk1sOTVhL3FZUkg1aGkwZ1l6?=
 =?utf-8?B?SGJWeFRzRXlrcmN1MXpLTGpDb21JL2hZblcrcEdRRHRqLzhNUHdGVWZ5anJG?=
 =?utf-8?B?YTJmT0cyQ2tFWmRxZzFMeGEwMk9lYyt2bit4dThJR2p2bzZCNHZDa3RLVW9l?=
 =?utf-8?Q?/nfuA34t0Tjn70kquFFHpry4DdohObAr?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(376014)(10070799003)(1800799024); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L3NlMkZKckZacVVZYWY5K0tiNk9qRWRwRWtmOCtVVVBIcStiTjAvTUU1VGc3?=
 =?utf-8?B?TktNaGRaa3dGNUdvaXMzOVZ0TUhWdzZPNnJqcmRMYnRnRWp5alhldENNd1cw?=
 =?utf-8?B?QTkyNWY5dFVoYTlKcmNCckpKT1ZoM3hpQWE4OG84UlVSWmtDeWxTdlVZcTJB?=
 =?utf-8?B?cUl1OFFWNzA4N0pONkRRdEUvUVVranE4Z2hsK0VWdm5FN0tYbjdYdkxuYlo2?=
 =?utf-8?B?L0xvYXVZTVRxeG1TdHU1bi9zNEVkTVYwekZFTGRqVlBTZ3A1eGlCSmdBKzRs?=
 =?utf-8?B?U1hOalJYMmRzTi9aQWpjaXk5ckVrZ1J4ZzU4ZmU0SVRlK2xRNjl6RDg1ZzlJ?=
 =?utf-8?B?UXFrYThhUjBEZnVrck5LNGZKWXJoK0Q4L2ZjSWRzOU51d3BGbWdxOGVrMnJN?=
 =?utf-8?B?Q1J6Zk9rU2pybzdGcnZDY0phRkgwYTYxVElMVFJMM21jS3pnKzhQbmVpSG5K?=
 =?utf-8?B?K0dJWFpGOExYZ2daWVpGU0htL2d1SzU3cEtBL3BlYjJMcis0bEZrUDhySU8r?=
 =?utf-8?B?dHNzRXRDMEx4djZpRnYrNmhxZEpka2lsaDJ6MUF0UFVRbHg1WmlPUEZUT211?=
 =?utf-8?B?b0g4MTFFa1YwTmZ4Z25nbEFjYWcwL1ZPb01tNndpZDhOUEcvdU8ySzJEdC9P?=
 =?utf-8?B?KzNoa1hYQVBtNkxnRkNPd0dPL3VyUllhWE9LWGwzYWMvQzV4SHd6TFVDZnJU?=
 =?utf-8?B?QlZpekoxRkllYnhVb3FWcUhXeDZyeTBwYWw0cStGS2xJSDIvRTdjcTZTRzU2?=
 =?utf-8?B?QWpjdFlkVUpJQ1BkTVZLUDNBTHlIRDdHTHBzak81emVheXRoT3l1dis4RVdn?=
 =?utf-8?B?Ymd6SlNyK1pwV25NOWlqaHhRdG1WdTBnYS9nd3pKMXowOHFZeXpZZkFPY1BR?=
 =?utf-8?B?Y1dtUlNHT2pHN2tFVWJvSDR1UE5CRXpIVDhOZEVlMFA4MUkvTnVCV1JEMG5Y?=
 =?utf-8?B?SVhuWHFIRWtlMVZ2dnFDRUc0WHl2SGdnWlZKVGJiM0lGSmxuMWs1M2Rucm5D?=
 =?utf-8?B?cERhdkhvNjIwYitqQmdXeSt2UUc2Ti9nWFhXU1UybEtnckhCVTNXd09xQnRi?=
 =?utf-8?B?Nzl6bEptZFBtOWd3TUd6cGZWeUpVVVNjTG1wNzFPd0cvaWErUG9zY2Z6WVNE?=
 =?utf-8?B?UUZyUk5ZTnFMQjhVeHEva2QyYUxRT2lqdWRzUmM1TWdVZFpKVGo2ZUk4c29u?=
 =?utf-8?B?TWNIUW9sanlTTnIzVGVkQS9ROUR0ZjVLSlRkTm1iSU9UWThwSTVJSWZEV29O?=
 =?utf-8?B?RXpEOFFPQkhWSUI2ZUx1K2VUenNocXhzTmxDM3hPdzN4bzJUVTUwektaeFdv?=
 =?utf-8?B?WXVuZW1JWkFBMmxHTWFhZjRNeklYQ0M3Uk9WR3R6TTdZVmVhRXduWG1lVEdq?=
 =?utf-8?B?M0EwWElpSWRJakpZWlM1QTdZYWttZUxReXNKQncyWUE4TCtabE1vODUyaWlT?=
 =?utf-8?B?R3JudHFTMG5VbUFmV0NCc3N2aTVSNnRFNWZjc0s4a1JxS0duZGQwSjBuMC9p?=
 =?utf-8?B?WVM1akxJM0Z5c09uSHFpUlY2b2dxVXdCc0FKY0NjQXBUaTdLa0xaaTYvSE1Y?=
 =?utf-8?B?R0ZYTm8wbGVsNlFYU0t0SXhZQThqY0hZUkYwT1RYUWlrSWE4SDAycnNFQlN2?=
 =?utf-8?B?bksxTkhwdythVWQ5bUZOd0YrODZBblR1Mmk0eUtLcG9nbTllRVdnU0JudU83?=
 =?utf-8?B?N29PWHM0YUh4RU1zMWdzN25FU284bUtoSGZTNVZ1b1B3dFgyemltREdJR2hF?=
 =?utf-8?B?eW93a0I2NkhLeFc0TjNId01ZMHZrRENYelZPV0tGbWFLK0RtZ21UQWt1NThC?=
 =?utf-8?B?REUyNmZhb1B5aU5JWGl2M3Q4TFh1dnlHUWJZZWVYQW9sZDl0WlZjemFCWW0x?=
 =?utf-8?B?WHJZZUlRbWlJNGQ4STI1c3J6c0lJZ2hiQlJLd3pDVXBkLzBwOGpLV1JPYS90?=
 =?utf-8?B?bGcxaHBsMHJ0d2lOQm5FWjdxbU1SY1ZYck1lUDJCS0JFL3E1enFQTTV3RnIv?=
 =?utf-8?B?WmRYVVRmTU9aUHU0VWdmUEJIU0RVVEtyRjBHVG1lVTVwMUg1OTA2cCthQWRq?=
 =?utf-8?B?ZlBjY1pFKzg1dEZudGJ3MkhmZmsxVWc1VFhzWXFFRnAzQkNGckh4dEFlNXoy?=
 =?utf-8?B?cUo3WEdKeXRqZDYwK0RhWk5xSm0xNUxKRis0a2pGR0gxMGovSEcvSWVLcERD?=
 =?utf-8?Q?s+zpRviJuBLHzE08w7DnHDtEzXoEWVK2q+MvnV27cpKn?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a6a1888-5953-4915-97f6-08de1ebc4292
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2025 11:45:05.6617 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ltla3LYALBoVX7M5WOu+TMDqkKLT0uHVrVeC+JowXa3c8mqVJKISHQ6QlUgROpqgtjZ/3XSsTdQw0dgX5cygqg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8574
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

On Sat Nov 8, 2025 at 2:08 PM JST, John Hubbard wrote:
> On 11/7/25 9:03 PM, Timur Tabi wrote:
>> On Fri, 2025-11-07 at 20:39 -0800, John Hubbard wrote:
>>> =C2=A0/// Enum representation of the GPU generation.
>>> -#[derive(fmt::Debug)]
>>> +#[derive(fmt::Debug, Default, Copy, Clone)]
>>> +#[repr(u8)]
>>> =C2=A0pub(crate) enum Architecture {
>>> +=C2=A0=C2=A0=C2=A0 #[default]
>>> =C2=A0=C2=A0=C2=A0=C2=A0 Turing =3D 0x16,
>>> =C2=A0=C2=A0=C2=A0=C2=A0 Ampere =3D 0x17,
>>> =C2=A0=C2=A0=C2=A0=C2=A0 Ada =3D 0x19,
>>> @@ -142,6 +144,13 @@ fn try_from(value: u8) -> Result<Self> {
>>> =C2=A0=C2=A0=C2=A0=C2=A0 }
>>> =C2=A0}
>>=20
>> Does it make sense to designate a default Architecture?  Turing is not a=
 fallback for Ampere --
>
> Definitely not! However, we do want to use Architecture in places
> (register! and bitfield! macros) that expect u8 or u32, and that also
> expect to use integer defaults.
>
> So that's why we have to supply it.=20

To be precise, we need to supply this because of a shortcoming in the
`register`` macro: it doesn't support read-only registers yet, and write
support requires a `Default` implementation for its fields. This is
subject to be fixed in the future but for now we need this little
workaround.
