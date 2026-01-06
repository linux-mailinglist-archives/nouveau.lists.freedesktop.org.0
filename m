Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A36C9CF698B
	for <lists+nouveau@lfdr.de>; Tue, 06 Jan 2026 04:22:29 +0100 (CET)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id E23F410E1D0;
	Tue,  6 Jan 2026 03:22:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="WabbQddH";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 8FA9544C98;
	Tue,  6 Jan 2026 03:14:14 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1767669254;
 b=l0YIXAFP/1QBAUlQcU/38Bftw5RTb8E8GI5frA79V90+YAVWx9OMt7pPWx2vTjM8pnHSJ
 BSL7M/nckOReAPkLLOwLSBLT2oxnP7SkdF7iRufHnnQQiGF3anIUBWW5nm2zKb0CEusU9s3
 3zqZU7GiytIEYi+TqdEF3iVe/NZKKQe7lmaOkZVKPm2Cd6Y03A/sYET0fX4xqU+Gua9yqi8
 YofTWOGXLPBeMseDCQ/lCFdPoAYswDOfnH0yzTPUy2QEgaqDjP07/7p5OEJJJaR3u0YhmAU
 d3FQJ67w8ctnV6yuCExBbE08bmfSM2/RoehtqwPSUFNBKZpCTLYy0NzmCG3w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1767669254; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=PtnuQOUXGQzhazfOpwhKYhUG8vruqePPSkxPCVirjuE=;
 b=VPbskX+DsokDbT0QfEjHZJoeFFovneAZfxY4SnQkeR34/DpDHKlKJZUxNW48+OC+r3KQ1
 iGgzrAAbWVNZjWSH8Tk0f6Lh/I+ymhSINxvZHanoqiYVFs2jYfbcjYr9YltbM6NxMAsYvuD
 Y7y+/u+ILwLHIlqb+c5PxP9qqoMvE6YXPBUBEvbxexlmS+S6kDPT2XqYTQ2diZ8eDdydg1M
 PXozOULGrjwUtWWjJHFEW/YbJXMYETRr+ztcultbbPJqiTNE084mCNAZe8rCL5Ffeig6Qkq
 sWhTZ0MsGtWiFhWZaO97GECxbJ0kdEYsicr6AzrzLG50yhXyDZG4ZAnPlJOQ==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=Nvidia.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=nvidia.com
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=Nvidia.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=nvidia.com policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id D499644C5A
	for <nouveau@lists.freedesktop.org>; Tue,  6 Jan 2026 03:14:11 +0000 (UTC)
Received: from SA9PR02CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11013064.outbound.protection.outlook.com
 [40.93.196.64])
	by gabe.freedesktop.org (Postfix) with ESMTPS id B7CD610E044
	for <nouveau@lists.freedesktop.org>; Tue,  6 Jan 2026 03:22:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MhCl8GOZO5R9hQPG48lfajTLQ4dr8GqM38ftdcxix6uCstfnPG/QdHh0oeziF1lzKY1NCVlGWZbvtLYCRQDUZeE20YSqL1ZFjhao+Nh76wnl/QvR9iXr5LF5JQ9TtpH9gWzKed3XUxpO1jtxcC4xrOEtsI8m94V9WCghitgc0EQg0x3n9gk5Haq469Pync8K3UDsq7J+Yr6O15UNU7iAONyVZaZvhyzxIJ5EmvCsSdiktIE6ml/s4vclyxEa2KiHoqvX6kN9XS0vYM7RxIqib7yQwY9a54SKse+bwb/tpy6F4yACA/rfwJeYxRlueUAbmlBlGCDGs3yx4cmyYeLQ4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PtnuQOUXGQzhazfOpwhKYhUG8vruqePPSkxPCVirjuE=;
 b=GvbxrIeGUEQQBhvJL3lwE0YEdib5gnWf1+Ry++ckVmrD9tdU9CZE/DSSQnW2FZGH3ycaZqALvKQLPDRyP2bM8g/UelroU5zTk+aoiE4e71eiqVG7BPz63JeSQi1Z0oCa6UOVHAxfn7aZGzWet45561PCiAZFLAMI8WtZF1EKdc02w5YZw/dJVOtw9cZ+3jf832B1o1IBpvvsSEbJ/CQwtdKb5iJgtpaHuuUIpwIQBpOVajp+aXAokJSSeD8C7cThyclqm7tJ4SlyLUjoHCfMmIZ90uAdjFRxa1zMXO6MgN/3MPylemws8geX+Rthf3qV8csAr5DogxjgCRgm49vk+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PtnuQOUXGQzhazfOpwhKYhUG8vruqePPSkxPCVirjuE=;
 b=WabbQddHopV5jbgBRC7naZC8hD9QLkzp4OR8RkyVgH3VhkyNOMWlBJsiqMKyegRBZ3SUJmCkkgpi2+S1TR3uYaSU5xnmjP1kJoTGDdMjRN9ycIMBAijXXfJJGOut7RBbxQYp7C0nmJMCcFkfK6fr729HpfLOae0uhc3zzyO7fvfuClfZiOFF1trn90kboK3JoY4CjdK5wKgFvLBnxhpvb7dt6fxhaueFhhCmUkm0CrOiHylpl/eoLMA6XOQzjQfaaTPsgvDJoMkQ0fJ9V3hyjdkgcn2sQ5J8X3m0mliGbtaBYFM/5BeatnkG93lbjEd8pHzUyGiOOJ3Cpjiem2URYA==
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 CH2PR12MB9493.namprd12.prod.outlook.com (2603:10b6:610:27c::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9478.4; Tue, 6 Jan 2026 03:22:21 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9478.004; Tue, 6 Jan 2026
 03:22:20 +0000
Message-ID: <c5c5c0a4-249f-41b0-b5f1-87a58514b120@nvidia.com>
Date: Mon, 5 Jan 2026 19:22:19 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] MAINTAINERS: Update email address for Joel Fernandes
To: Joel Fernandes <joel@joelfernandes.org>, linux-kernel@vger.kernel.org
References: <20260105003051.122076-1-joel@joelfernandes.org>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <20260105003051.122076-1-joel@joelfernandes.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR13CA0130.namprd13.prod.outlook.com
 (2603:10b6:a03:2c6::15) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|CH2PR12MB9493:EE_
X-MS-Office365-Filtering-Correlation-Id: 4ab59def-952a-487f-821a-08de4cd2cd6a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?Nkl3OGFydzBzNzdhSnp5UThFZmw2UktJMFhQWHNXZCtTbzVBV1VoQVppcTZI?=
 =?utf-8?B?czM3Z042NFdNcENmMWFMdnZYbnhYdTQ4Znh4cDE4cFljVU4zZDBsV28zZ1Nh?=
 =?utf-8?B?Y0pkendEMFFjakI2TC8wUGpORVZmcGJCZmlwSkViUGtJcTZsbmRreWVuZjZD?=
 =?utf-8?B?MFc1WjVXdEdOR2JhVVI0M21tOFNsTTloQngwdWtwWHlOZUc5ZktIMDVUSEpt?=
 =?utf-8?B?ZkVDazVlNW5xR240UWw5MkhCMGUrbEhXbDgzMkQ2QmZ1eU9MV0Z4bkxXS3pI?=
 =?utf-8?B?ak5PTVZwQUdDcmljeVJTclpmZHc2NTk5cko4dUx6dXhpT0RJb1YwRURuNUdi?=
 =?utf-8?B?N3JKY2FXMzFWY2YzdnY2M2o0WGNuOHhvKzZ2YVIzeHRjVXJNUm1MY0FmNXlB?=
 =?utf-8?B?bzhCbGk3QmFOckZCZXJkb0JuN2YvYS9CYjdHbmFTLy80WHkyeWhydEhWd3B6?=
 =?utf-8?B?bTI5Q3J6ekg4c05BWm1CMUgzS0lSM3Vwdk16SWJOMURqTzV2YldSQktZVXlk?=
 =?utf-8?B?eTVTYmQ5WVFtNUFTbVNKaUh5d2dYYVVOR2dNenY4Vjg4eFRyQzZtMk1hTTE1?=
 =?utf-8?B?enludnRYaGhZUEgxYkFGMWVSdFFpR3NuNzZBdG5UQzlNR0p5YXk2MGhYdHBX?=
 =?utf-8?B?MFF4RDVpNWtFUURvbjVidlZGWDlXd2NLRU5ScVdQdFAyRzFSUUpwN0g1OE1k?=
 =?utf-8?B?Z1Bjc1Q0TVJpaGkrWC94L29MUUUrZEdnYmg0NzdROHl1NTRhNDd0M3huQVNv?=
 =?utf-8?B?V3VOdFBsckw4bUVqV09FL1hTaDQ3akZaYVNMdzNBcmJUbW03TkRGS1RMWmpS?=
 =?utf-8?B?Z3FOcllURGdJSEU1VWhPM29WVnFrNjg5UDMxVmhpR0U2a2NESTJTUkkxZmlV?=
 =?utf-8?B?endnRlVWSEZ1dVpEcG1seTROMEdqMldHb25BVkR4eURyYjRUUGoyRU9iUEdI?=
 =?utf-8?B?Q0xzOVg0OHliOVZtRGphSWRITFpzay9hbzZWa0RNVzFWUFVJME9Hay9FQm1s?=
 =?utf-8?B?NHlLcjRNYTVxVUJKbGc5MDZScGNLRTI2dWtnSU5QUXBTSVg1eG9sZm80SGRI?=
 =?utf-8?B?NTNTblJjS0NoL3lEcWRzbnpZVlFPQmhEM08vU3BzZkswSVpOS3ZZS2lLZ1dH?=
 =?utf-8?B?YWZmekx6d1pvNlNqRzl5WnVGSUg5VTI4SGt3bzd5QlllVEw3dlAvcCtIWEU0?=
 =?utf-8?B?anhzT21RbTI0eUFYQ2ZTL1VoTmNsMDc0SzhjSzdocVdpNC9MSmFLUzBKakRR?=
 =?utf-8?B?M2VCbVNjNFYvdWh2Qm50SHJUcHUxOU5URnQ1aDZ0dzJ6bDNyNGZVMTQxc0k3?=
 =?utf-8?B?Mm5LTWE3U05PR1docEtVdlpqdnhINnlGblZFdUZHOUE4RnpNeU9mUTkwUVRP?=
 =?utf-8?B?U0s3cm40T2dwZ3Z3RDh5Q0M1UmxDdllBV0J1dGwvK054SXE0SHAySEtqNk02?=
 =?utf-8?B?QkdUT0FtM2dPOEZLYjF3YnBBSitlN3pFWndsekFNNDJ4T3piSjlEaHNhU1RG?=
 =?utf-8?B?MHR4N01LaXAycVp4cWhRTGIwaXJVSVRacS9QakNxRDdKWkF6bDU1emhXenAv?=
 =?utf-8?B?aWFGcjhYN1NPVGNDMVZFN3ovcEFLMlFPNy85TSswcUJyYU5KcVdqUjkxbjli?=
 =?utf-8?B?SGRCcjQ4T2VXZDdQWHd2emh4U0FGMUxEZWJNb1JJMEV6NFV2U1RDdFIrOEJJ?=
 =?utf-8?B?WGtteDhlM3dpMU41V1VQUDl1WkpVYXZuUWVQblRVblFjQXY1MDlNZXllSkVC?=
 =?utf-8?B?Ry9tcHdjd0tEcmhzaUFFV0U0dXVGemhEb3dnSUpjSDhmSEdNUnhxRTZQOW9M?=
 =?utf-8?B?KzQzVW9FTzViSFpNS0lacTBjUis2RFFvS1Zrd1NTZXZKQm94bGZaZEk1bUVH?=
 =?utf-8?B?UEZRUmZMVmY3UHl2MmkzNFNaVFd6YmNqRUtCZWE0Vkk2eG9NUFlMSG01Qnhz?=
 =?utf-8?Q?MZH4WcIfSTAwbkdDNQl92SYeV60zHlUf?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?R3lvUGdUbEFjVFFhQnNWZGh2eHkxeUhjVERGL3BJRkFueWU4WVlpTWpmUk5y?=
 =?utf-8?B?ZlMrMUFiOFppSFE3bTRjTVluUnh4NTVBTXJIRXNYTnF4Y0c1VEVtMXZPWEdn?=
 =?utf-8?B?WnBGQzYxdEFkbHN1eUIweGVTaWg5NXRGbUtBR0pWYldXdWtYL0FiV1dBV1A0?=
 =?utf-8?B?d2dnNVpJek16NVJROUtYcGIxc1ltK0x3VmVCNlFYNUUwbldLdGx2TDZSMjNE?=
 =?utf-8?B?TXhQcERzYm5PMUVyaW9NSFV6bUE0WjFrTjl5VEFRRU5vWW1UdWNoZTVKcS9o?=
 =?utf-8?B?QWlxMXRBRnZUUkZRSlNVM0ppQ3FBR05tbHdPMmh6ZVg3cnNqYVA2bXkyMVp4?=
 =?utf-8?B?QmhsaERmVnJLeG9hTzZVeFI1bm1jNnQ1dTRZVkFCeGlueXBmVWx1d1lGT3I0?=
 =?utf-8?B?emxhUjVUdUd2TnlWdzBFNXF0OGhBRnNMWWsyUUFpUUJ5UVNDdFh5VUZ6b0Vu?=
 =?utf-8?B?MmpHWnV6MS9qM2NZV2REWFNvUTU3TXp3bnkxb0Z2dlVUcVpWTUpUdnBhQ2ti?=
 =?utf-8?B?bzdFZ09HbG1tRUsySEdWZVZDSUU2bVNsclBPSEZmRmdYbHJ1SU8vSWpVNGJN?=
 =?utf-8?B?bElVVlJaTVlNR0JwR3N3NlNBMlVRM2FMS3hwUE95VTNqa2dMYjNEdUM1OThy?=
 =?utf-8?B?TU5yZUMrYzJZVENqYWRiaXl1NXpwaGg0YjJPVWIvMWlqWUYvekFibnl0NVpO?=
 =?utf-8?B?b3dlY2dodWRDNmxyby9xcG8vTFNIaUNpWDNsSHhxMldwbTQvZThuUEtQa1lS?=
 =?utf-8?B?bUIyS3pCZXJMVmtGRnFKbzZRcmxGRUlzRktzRmVvalFvYVNmYWRKOXJJSUNZ?=
 =?utf-8?B?V0JNMXRvWm1rN3g3RTFjMHJaNzBWRm8wdDR4UGxLZkFqWDh3dnlsdE95T0VF?=
 =?utf-8?B?b1NIcmhDYTRTMm93UU92SVJiSzM2OG1LMGZPakFDd1g4eTFPL2VsWThvdERL?=
 =?utf-8?B?WlhESnVnZUVLNHpPVnltWGl3RHVXRVprV2dYN0E2VVdwbEdhU2hEM2Jndkwr?=
 =?utf-8?B?SytQK1FRMXdSQ2ljSDNHcFYzeFRzUmpDMnNVLysvelVQSkx3NkdZNCs1TWVo?=
 =?utf-8?B?TjN5dlNlR1JGNEtZNVJSelNMQi96SVJnc1NNOVBnZlNpbVp5dXlrOGJ5VW11?=
 =?utf-8?B?bWlhUkdBZ2lTdERzZ0N1eEJJUXBYNUI5SGVJRTRvNWFYS1BwYnkwUzFMbmli?=
 =?utf-8?B?US9kZW9yeVNtN0x0NnVQSDVwU01ZOElPM1U1cDJLbFc3bkZQRW9KWGNTMGtK?=
 =?utf-8?B?Ykp2TnFBejcyRDRGR25tSEV6aTN3TXdETDRaZEtmcU5rb2FTamZibmh3cjF3?=
 =?utf-8?B?cEV2VmxuRDFOaVpYdkNuZDhUSnNPR1ZXT05VY09oMFNFMjN3QTh4OGd4b0Z6?=
 =?utf-8?B?dlNDSjU2cTYxNVVXQnhlZEVrTEZjSWx0bENIZDNuQjV5eVZZOUtiLy9aVEor?=
 =?utf-8?B?c1RXV1JPRWc4eHg3YW9jWXRSMmdBYU12TE5FM1ppSW1kRWx2Q0swTUdhWlEr?=
 =?utf-8?B?dVgydmg3dHRoUXpHbzEyK3ZZK2RQMTJGbEVlYm0weStacDNyd1J5VkJ0TG5O?=
 =?utf-8?B?M1VQR3Nsb3hjK096QmZhK3pzaVpIT3dLbTJzbC80SnlVaVFqMmp6d2NVc0ll?=
 =?utf-8?B?UE9FWGc5SlI5bXB4STNnSWJzTUlWTHFvV0V2OFVucXpKMVJNdng4Q2RGN0x4?=
 =?utf-8?B?dWVEK3VvS0ZNN0tldWRVZDNyQlJOaDg2TkRvWFJYUHZlaGVhWmFMOFZmQXV4?=
 =?utf-8?B?SmhvT2JnNkNKMHRBYjlmV2pGak95UDZuem9kRTdHYUVTUHh1cDc0SkNwVTdG?=
 =?utf-8?B?eHlVTGxtQ1hlRVM2T21EblpsNXRueHBEMU9KK3J1RnBGdHZ6RG9MRjM5cEpl?=
 =?utf-8?B?ZWNlTlk2SGc2RnZhWnNxYkZqem1vZ1BtUmJncC9FelovV3RpZ0c1S3BBM29R?=
 =?utf-8?B?YTVpU01nQm9Bb0g3enVJZ2NuRkVsVDlmckwzYXF1WE4wUmR0YkFiaHpKM3JW?=
 =?utf-8?B?YVJKR1V6Slh2eUZkVjlENGEwNW5VTmtxKzdNV1ErWE5Fa1p4Tm96T0J0cFN1?=
 =?utf-8?B?SkRCU3R5aEFQY0VXV2t4UzhzcWdJeE0rd0xaWGU0aGZyMFFIdGE5QzJGWGR3?=
 =?utf-8?B?VXd5bG00YTNjVEVWK1EzcGlOK1orNWZGbjYzVXMra2RKUVc4VVc4eDhDNkZu?=
 =?utf-8?B?NFJXZmdaWHB1ZDhzV1NLTmVJQ2pWNURzcGo2MWI0THVONTdaRFpXMnREdHpq?=
 =?utf-8?B?QzFlTHdJWURsSjRkZ2crR0tqa2g5L2tJMWZDc2hYWEZyMmQ2RHdrVXk2UVB6?=
 =?utf-8?B?S1VCWG90WEl2ZU1ZcmU3MTdiK0s1dnQ4dlg4b2U3Y2NqVUZZR2tVQT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 4ab59def-952a-487f-821a-08de4cd2cd6a
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jan 2026 03:22:20.8195
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 0wn3bP1o64TdS5TNv70FaoLaLLwKMC89w7ysAXEbJQpfpnOszXR3XeCcvgx/6FVF1Lu+n14NUV08/F2N8TUrjA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB9493
Message-ID-Hash: UG4EQ2GTPRVHSAFVE7HAMVFSESRA47Q2
X-Message-ID-Hash: UG4EQ2GTPRVHSAFVE7HAMVFSESRA47Q2
X-MailFrom: jhubbard@nvidia.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: rcu@vger.kernel.org, rust-for-linux <rust-for-linux@vger.kernel.org>,
 "nouveau @ lists . freedesktop . org" <nouveau@lists.freedesktop.org>,
 Boqun Feng <boqun.feng@gmail.com>, "Paul E . McKenney" <paulmck@kernel.org>,
 Jason Gunthorpe <jgg@nvidia.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/UG4EQ2GTPRVHSAFVE7HAMVFSESRA47Q2/>
Archived-At: 
 <https://lore.freedesktop.org/c5c5c0a4-249f-41b0-b5f1-87a58514b120@nvidia.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On 1/4/26 4:30 PM, Joel Fernandes wrote:
> From: Joel Fernandes (NVIDIA) <joel@joelfernandes.org>
> 
> Update my email address from joelagnelf@nvidia.com to joel@joelfernandes.org,
> which I will be using for community email going forward.
> 
> Signed-off-by: Joel Fernandes (NVIDIA) <joel@joelfernandes.org>
> ---
> Boqun, could we take it through the RCU tree for 7.0? Thanks!
> 
>  .mailmap    | 1 +
>  MAINTAINERS | 4 ++--
>  2 files changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/.mailmap b/.mailmap
> index 84309a39d329..279f8fb223e2 100644
> --- a/.mailmap
> +++ b/.mailmap
> @@ -389,6 +389,7 @@ Jiri Slaby <jirislaby@kernel.org> <xslaby@fi.muni.cz>
>  Jisheng Zhang <jszhang@kernel.org> <jszhang@marvell.com>
>  Jisheng Zhang <jszhang@kernel.org> <Jisheng.Zhang@synaptics.com>
>  Jishnu Prakash <quic_jprakash@quicinc.com> <jprakash@codeaurora.org>
> +Joel Fernandes <joel@joelfernandes.org> <joelagnelf@nvidia.com>
>  Joel Granados <joel.granados@kernel.org> <j.granados@samsung.com>
>  Johan Hovold <johan@kernel.org> <jhovold@gmail.com>
>  Johan Hovold <johan@kernel.org> <johan@hovoldconsulting.com>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 12f49de7fe03..43bbf12e2c80 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -14558,7 +14558,7 @@ M:	Luc Maranget <luc.maranget@inria.fr>
>  M:	"Paul E. McKenney" <paulmck@kernel.org>
>  R:	Akira Yokosawa <akiyks@gmail.com>
>  R:	Daniel Lustig <dlustig@nvidia.com>
> -R:	Joel Fernandes <joelagnelf@nvidia.com>
> +R:	Joel Fernandes (NVIDIA) <joel@joelfernandes.org>

Hi Joel,

Can you please hold off on doing this for a few more days? We have both
NVIDIA and Microsoft involved in fixing the email issues, and it looks
like they may already be solved, in fact.

thanks,
-- 
John Hubbard

>  L:	linux-kernel@vger.kernel.org
>  L:	linux-arch@vger.kernel.org
>  L:	lkmm@lists.linux.dev
> @@ -21895,7 +21895,7 @@ READ-COPY UPDATE (RCU)
>  M:	"Paul E. McKenney" <paulmck@kernel.org>
>  M:	Frederic Weisbecker <frederic@kernel.org> (kernel/rcu/tree_nocb.h)
>  M:	Neeraj Upadhyay <neeraj.upadhyay@kernel.org> (kernel/rcu/tasks.h)
> -M:	Joel Fernandes <joelagnelf@nvidia.com>
> +M:	Joel Fernandes (NVIDIA) <joel@joelfernandes.org>
>  M:	Josh Triplett <josh@joshtriplett.org>
>  M:	Boqun Feng <boqun.feng@gmail.com>
>  M:	Uladzislau Rezki <urezki@gmail.com>


