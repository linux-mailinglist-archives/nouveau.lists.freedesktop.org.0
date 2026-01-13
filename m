Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D5FD1D19368
	for <lists+nouveau@lfdr.de>; Tue, 13 Jan 2026 14:57:29 +0100 (CET)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 42EFB10E4E2;
	Tue, 13 Jan 2026 13:57:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=garyguo.net header.i=@garyguo.net header.b="S92mttZM";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 5BD5C44CAC;
	Tue, 13 Jan 2026 13:48:59 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1768312139;
 b=QkucgAEF0Zw7txdzr6sASkxs9ySKCtwduSNfRxMCSkxhes3nU9816wAU3qmNVU4mRPApM
 yd3Zg8EkDI5g8IDf1zLygYEhrXlbcvDFncjX8TsjI6q/YBC5I4/VY2xUW9Lsuu20SCaMn/T
 vaSlAI4wfC0RfvVhQv437eX5LxmQ0vbrmimpIUECZSo05xfs/046gXdCvdn+jHwP+SA+jRO
 0hkHKUmRfi9B5inFBEfD4KmA/8oxneSX6XQU8XTvLNroPkwBHXNy9v/lhQknPaT642kU8yr
 lC9itCl4wGIMyk1C0ixH6sKtH9YSvFiFINdCxLg0n7/VryzrGALSqvGpEIKw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1768312139; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=L3mC1ag8gmKIfKFwKjqrMpra1N+WV9Ed4i6A9RR+jyc=;
 b=zbi9ivtJ2ywncIKbybyQKNrzEvAQMtYqO42u08cHq7krHqG5TD3O/4mLc1TkOLUa0OvNj
 FRQHqFv3MwsO3bqGIbwvnr9B2rlTOLK5G68EyC1CM56JSGiYKHtWlKl4cYjGSgWSaPdc8jm
 0+BoOmAy6+mgipbe4AnnlUi8E+r7mDjDRcTR+orBnj3hNyHn3PN9Rs/LOTHNkWzB/ABdjmF
 VqJst1zonUuLmh/TgBOaQHK8TCMuS08jgWSGQG8jUImko6Ks4ygZEZTTwf1Gs3lKtqWGHmx
 U+hr/gfI+5PO+QD1FDxIgbbrHS6LmxkfobD8mh+/553okPATbBHahtL7jf8g==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=garyguo.net;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=garyguo.net
 policy.dmarc=none
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=garyguo.net;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=garyguo.net policy.dmarc=none
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id E86B044C99
	for <nouveau@lists.freedesktop.org>; Tue, 13 Jan 2026 13:48:56 +0000 (UTC)
Received: from LO2P265CU024.outbound.protection.outlook.com
 (mail-uksouthazon11021091.outbound.protection.outlook.com [52.101.95.91])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 71BBF89DC0
	for <nouveau@lists.freedesktop.org>; Tue, 13 Jan 2026 13:57:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N24MazwQDne97IdxHZYmboqoGEI+TRhxEXRsVw4VEMwD5of1WMQheApw9YddOsGdlULqk0nVDYpkhBvcMOT2uc11TruA/2n5Rg/2OrBfwBo9mfCGsTxGdFPVX7+QLmQYbF/JQjI77RL7K0ybkgLk1DrGeLCzfskCCAiLp+NL/CgEOxh3VQ8mq1aF69MmPH6aRelaR6JjOiZmjxPvAPSsB2dd+bVQXWp6RctANbBR1SU/BfWFOCFWrieaX3y14e3TbOFvdQkNy5tyNupay9bHJ0Kj/EdrKQaXp+10Wu4ywTZwiP+O+wDTdJSiN3bb2ky50/nxtj5ICO+IgYw59VuKiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L3mC1ag8gmKIfKFwKjqrMpra1N+WV9Ed4i6A9RR+jyc=;
 b=KAQoiUdkKOnF7XlJztsHy5DbnMj7eEVPGZAfKxTetAfR88jKavbQbPPHhK/AEhfpJ6HPV3C6mlCnDVpRNpg19zQnqLwddN4PwRIKidr3wOKQjHQf8S/v4a6Ve/FPHq/uA3knkyOrLdsgJ4S7c7keC3a8wPg9lCWBX5+d5t4wgB3UHBMFpz8f3A2hEgzPaVDzBUIYes1YYOsaD3MjPtXXlsyXOKYecoru74V7pOaxcMSJUtL6wzJhLWOMoOg8LNZaxZq1D/d/7Ppk7QhuhEQSCpBYTcSFzRCLz3FWiND1N4XeLU5869epGQeZrget/jU6dKL/rdrJ7xlARfSx3x/gtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L3mC1ag8gmKIfKFwKjqrMpra1N+WV9Ed4i6A9RR+jyc=;
 b=S92mttZMB8kHHRZwpVsB4o1ns3/4afJ5FIjBABV5lj78p0kQgNfMB/5L6kXaAk4rtwLiv0UcgHXN/B9lm2xyr8ET1U5wvItcPMLV6mH1jkIj0QQ0nGZKzrK0n0B8nrUEMPHVhM3/5QBfHbwnzF0vaXuP1X/5FO+8iyGJHfI16SQ=
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by CWLP265MB5162.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:15e::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Tue, 13 Jan
 2026 13:57:20 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9499.005; Tue, 13 Jan 2026
 13:57:20 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 13 Jan 2026 13:57:18 +0000
Message-Id: <DFNIIJH106EO.35SYTYVJYK0N8@garyguo.net>
Subject: Re: [PATCH 09/31] gpu: nova-core: factor out a section_name_eq()
 function
From: "Gary Guo" <gary@garyguo.net>
To: "John Hubbard" <jhubbard@nvidia.com>, "Danilo Krummrich"
 <dakr@kernel.org>
X-Mailer: aerc 0.21.0
References: <20251203055923.1247681-1-jhubbard@nvidia.com>
 <20251203055923.1247681-10-jhubbard@nvidia.com>
In-Reply-To: <20251203055923.1247681-10-jhubbard@nvidia.com>
X-ClientProxiedBy: FR2P281CA0180.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9f::9) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|CWLP265MB5162:EE_
X-MS-Office365-Filtering-Correlation-Id: 11213130-09c2-4cb0-d208-08de52abab92
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|7416014|10070799003|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?NUJjMi8zb0ZTOGV6M2krbGdrVVJkOWdCM1p1alJmYWRvb1RWZEY1Vmo2aW5s?=
 =?utf-8?B?QXA2SnVwSVFiVU5OOXZTcjA3a0tTMHVoK3U3RWtzVFlTVHBCcUtWMjBDYkZF?=
 =?utf-8?B?OGRVYjlLR3V4QktLUU4zbzU3VW00STdQQWV2STNMbUU0bnppTEtlZEIyT1B5?=
 =?utf-8?B?ZlJhOE5qa1hHclJTRVZJY3JiY012REFRRWNrUURCWWxoYVRFUVpoN1E2ZHdX?=
 =?utf-8?B?Y0dVUEc1eEVkL1d6R013NmZmZUJIRVpwb2xPdUNJMSsraDRqaGRiQjQzYy9U?=
 =?utf-8?B?WVRSMjFOZ3I2UGxOSHJqTlJOTS9wMEh6UHkvaXFXOGx1KzNpbHM2RDZHS25G?=
 =?utf-8?B?SGNCTTJxeU1lb0YvTE5zTkNUdWRabnhRVjlPcXhpYzBGZjZpanhoclp6K2Mr?=
 =?utf-8?B?MnB0RFJ5Q0tTTDRaalJNOFJIdGxzMHZIeWNnZENFUlM4Y1ppUUFFT3J1MGpN?=
 =?utf-8?B?T2hyakoxS1FZNVluQS9IVnRFb29mVEx6SW5oc01pNnk0YU1lLys3ZThyU1Uy?=
 =?utf-8?B?Y1NNSkkwTjU0b1c0TytGVXJaKzZSYy9BdFVlTzZVS1FFYjNYaGdTRU9SRzVR?=
 =?utf-8?B?dWJLY2Zva0lvOTlEOTRuZEE0MGJITFFGUklXQlpOVWVZaGh4TjhWaW41RVV2?=
 =?utf-8?B?MUp0bi9ZaUgxTlBwVGhVY25LVVl2bTZaNEpqVTNBbzhjYnRTK0xhWFBaYmtT?=
 =?utf-8?B?SDNzTWRNT21ueXVUWTJTc25NOWVUVFpqUjlsMjN4aXdQNDFXdjJUUEpoTmpK?=
 =?utf-8?B?eDdkZ0pkUnZUSHdkUTcrUUZKcTY1MnJUcXR4NE9STUc3WlhwdVF5enhQdnBR?=
 =?utf-8?B?WEh2V0R1dENHQkhMbUJKWXp1Tkx5WDg0L0RNc0ZJTHdFN21ZNHVBMDlFd0kx?=
 =?utf-8?B?Tkx0c1hCYkhsRzVvYUYwK2J2V2x0SThOYWVMeXE2eHUrUHdML3pqYUo5RWpD?=
 =?utf-8?B?bENmMG8zdGFNR1laa3ZmTTNvaTNpQTJsQzVhbUR6OW9NaXAyTUhEOFpVYUsr?=
 =?utf-8?B?dk1hTXpsTmFaM0M3aGZSWURPdWZYdVAyRW1QWVUzVkFtUEk5V3N6anp2TDV1?=
 =?utf-8?B?bTVkSDFocVFzbEFtM2xMYllOdTR0LytHT3ZkT050b3RZcjBjN3FqaFdsbGMx?=
 =?utf-8?B?U1B4d0JjWlE0SkE3dStDRXJTVVRhdlRWY0JnYlRFdEFWc2h3TlN2L0VnY1ky?=
 =?utf-8?B?M3d0UXhYcmpYeW1xa29zeUtDb2ZMMjRVM2pJQ1lEbFdBWjVmblMwMWJ1TnJZ?=
 =?utf-8?B?RFZsQVFKdVdyVEd0Qm1lTmhFbWZpRkRFYnRiNmNiV0lZNmZ4a1hjUDhuRFk4?=
 =?utf-8?B?SEoyWE9ycDVFNGkzZFM1WHRCTmg1bjlBZUltQzBTRW42Z3VFMFlpYTkrMXZq?=
 =?utf-8?B?NnNMZ0lmNEM5a0N5NXNBVlloRjZmVGNWTm1FbVpIQ3hGSlgyUlJYZjVnYzVh?=
 =?utf-8?B?Tk1KeUJ1bk5YQ05SY3lkREFDQjRIdkJxZ1JzSlBqN3cxTE1tY3ZUOGthOFp0?=
 =?utf-8?B?WUZDVGRWYmhCV1o0djFsQ0I4UzE1Q3FlRzl3NHV4Q0l1SlpMeXlSZy9WMFNZ?=
 =?utf-8?B?SXJTRk8xYVFxbDhycVZaK3I5aUhxOTVsT21mVWZzcXA2WG9VRTd1OXN6RHJx?=
 =?utf-8?B?RkRWWUpJbURXRGw1bUhjb3pRU0h2TGVLR2swRXA0SUV4dGtrOFRxUC9aRFgw?=
 =?utf-8?B?ejBVZ1FMUC9sT0J3Tk9RdmJ6NzEvelkvRHhDWjFwZEcwTlZ6eC94aTN6Mmk2?=
 =?utf-8?B?TVpQNStrT0t0OVFySGF4WWFUUnEyaHpQekdReDJ4eE1EY0xnY3Y3MTNnWEdp?=
 =?utf-8?B?VDNtdGRoSnBiRGRKRm5XbUNZTGM3emNxZDI3SU9ya0lDTldjUW5WTDBkYTR0?=
 =?utf-8?B?OERQbmJPUGkyamdhckp4ZktDZmRXZXh5ZjdSdkdLNUt5YW84MHV1WGFaNm5t?=
 =?utf-8?Q?U3BZaEZTUPloXKUTNN0/A+VIU7tHRsjx?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(10070799003)(1800799024)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?WHl4MENCTG5yeE1DSjlXQWRFRXQrYjNkbXEyMnpkUW5RVWliTHRFMTFaTTM3?=
 =?utf-8?B?QUdxd3lYMUZIWXVNdmNxTjJiVnZrWldBYTBYcXBiSXBXZmMwVXBuOTBwbGQv?=
 =?utf-8?B?dXozTjl5L1U1V1dlaUNyWkJTUS9LVUlJcnVBNXFvTWV1T1BncVE3N2VQYmRo?=
 =?utf-8?B?eFIyRGxaWTUxR0t3VXRWeGtGdkYybWhNdmdIYVhHdG9xbGdwazNzbVBkQm56?=
 =?utf-8?B?aDJXcW1TbUxlc0dMdTdLaVd4ZkxoZy9LOWJLUVlBMUNnbmVtRWYzUkZJZG44?=
 =?utf-8?B?L1FObFc2K0daM3JyOTl3SlIzNmlLS2xaSlR6Rm54aVlyeXppTDErMnNlWDVs?=
 =?utf-8?B?dG0xS0RWTW11KzkyZTRXU2IzdUVONUtyQUpCNGxYdGVxViswK0hDTlV5aWNh?=
 =?utf-8?B?YURpdUc4THYyS3FtSXlBVFE2aGlnSVVIM3lnUkx4cWVyTFU0NkNhZlFKV1hS?=
 =?utf-8?B?MGJkRGQ1aVpNc0hVcWFkaFBza1dOSGtXSGZHeWJqSTRyYysydjN2bWJOMExp?=
 =?utf-8?B?MEtoMHZ1N1NBVHMwbVVydGxJUFI0dml5V2N0QUVPc0FWbnF6ZDVOY2NOWGsz?=
 =?utf-8?B?YVhqbnd3NHFRSTBWOVNHZzZ0YTM2S25DbytRNWVzcnJxVytnOGprUGRWM2FU?=
 =?utf-8?B?N2g3SVY3bzhJVnNkNU1CTlZRUC8xMDhYZUE3N1dwTXl5WC8vVHVLSGhPelJl?=
 =?utf-8?B?U3VsOEtobUFzS1BtZGVXY0RGNGs3aHVjQm1DTTFmdGEwZzhNQjN1UUszak1C?=
 =?utf-8?B?blFkZEQxd1lxVGRrLzdHdjRlcUt6YUpOV2lrSUcrOFJZY3c1dFBZaGx4c3JC?=
 =?utf-8?B?SFhYOTkwRXlRZWYzNGtCR0hNOCt4OVlvNE1Fai9RMldGYXhudGNmWFBMWmZC?=
 =?utf-8?B?enpQcFZ1RkZpOFVCTzBKeG1vbVJ3NC8xbi9rTGxGZDlJaW5rektrbzN2b3JV?=
 =?utf-8?B?RVQzZjhqbnYwcHVlS2ZiT0o5ck9KaExodlNuMkRBSnI4NU5Hc2xNbThDeWVy?=
 =?utf-8?B?SDVYSUx1ZHlJdnQ5RGF4ekl6dkJpc0lCdWVLWmVYekFOb2VjNHVVWFkyRmsw?=
 =?utf-8?B?Sk1NbHlqS0VYN1V1OVlXbzQ3RDVzVmNtbFM5ZHY4aFBheFMxMGpRUzVDcHdG?=
 =?utf-8?B?VWVNQW9Ta2hvaUhRa21uT2dUdVoycFIrb240emMzNmlqUU5LNTRBOXNPdGts?=
 =?utf-8?B?R001dnBDWWFSSzZJWDhJNWFGUkdxUlZ4cUdsTnpidjN3ZzFmWTBDRU9OSlBW?=
 =?utf-8?B?R0NsRHlETEpoSzZ0RVMyNkx1ZG9EUEVKb1pqNnNMUDJaKytPWmRLLy9uRGRh?=
 =?utf-8?B?ODRQMXhUM2JaKy94a2w2bjNSU1FvaGdrdXZEclpoQm9kc0w3dS9FZEVvblJn?=
 =?utf-8?B?ckpIMVVDZ3d5YlE1TGRzQlgwSm5sVkVuM3RIaHNsUHZDUUNvOXhEUlBObTFZ?=
 =?utf-8?B?ZHJZMjJWdDdmVDJsWENLSjNOaFl3d2lzdWNILzV6aUlFL0V3RXJrWHB1ckM1?=
 =?utf-8?B?MDRwYmZBNUpkMm9FUnBOeVRxRmZDbUp4azNVcFh2dWFpT29IL1daaEpsdE1x?=
 =?utf-8?B?UnRYb1BqcytHQjFCR3cwYkRmZlRNUWJjeVQzcXV5VDMzSUhkY0NJbHlSL3lB?=
 =?utf-8?B?em5hK2ZIUHNWL1BqcVNlTXVNRXNYdEZhcFJrQ0RhajBkelh4MXNaNDF2UGFC?=
 =?utf-8?B?YU5ZRE0xYm5uL2ZtdFNLMFR1K283UjB6UHZVd1FZVy82aWpTb0lMWjFzVWlJ?=
 =?utf-8?B?eGVzNnhsU0FlaFRHZWFkTklCWWV0NmY5TnBZdUM3ai9pc2o5dXU5cCtGS2xE?=
 =?utf-8?B?dm9WMXJseTNvQ3ltOHlrMm55YjVFbkc2ZXRlQkZ2L21Od3JBREwwaVovS0Zn?=
 =?utf-8?B?ZTJRNXdYeXVrTklobUJLdWNaQXAvYlBHUlUvNFBGMzhRbzVZWG1VRVp0RkJT?=
 =?utf-8?B?ZkdQaTlGRnVXVGxCSEsvUXBIWFdhRW1BbFd5eGNORWo3RmN4WWdaSEFMenh0?=
 =?utf-8?B?YzRLRkYvaWl6bTM4aHVhLys0WEdDMzVXR0NTeWZURnBBMlJEQktpQ0lFcnNS?=
 =?utf-8?B?Q0UxaUxNMHcxZ3ZJaURZbEtwRlp4eTVBZXhzb3pmN2YwR0xTSndNSzF2UmJM?=
 =?utf-8?B?d3FxeFFsVHkwcjFmRDk5UHFSV2VDSEt3RE1yeWVpN05ITVBBbCttdWM5a0Yv?=
 =?utf-8?B?cXA4djdkUi8wODlvY1l6R3B3Tm5UTmlPOFpWbkg4NDZwdE9XWHhZN3JrVU5Q?=
 =?utf-8?B?VmN3TkpEY2RJeWFMeHFJeks0dlJhQlpJcDhpWGFVa0l3UldsQWljOXZXSytM?=
 =?utf-8?B?UWczeWxoOHlMT0xFL2dEMjdxejZNdVBzODliVVFMY2EzYzVnMmlLUT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 11213130-09c2-4cb0-d208-08de52abab92
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2026 13:57:20.5918
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 xO1vnouPmkr9i6qaCKFuo8EQRJlDHW+espPS34U1etKVFI/dMLrwsbzswkaw5karWN9wwYa3bARJ33y8YusdgQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWLP265MB5162
Message-ID-Hash: ITGWN3TRJ4KNPGBRNE2Q7BCAD2FYSQH5
X-Message-ID-Hash: ITGWN3TRJ4KNPGBRNE2Q7BCAD2FYSQH5
X-MailFrom: gary@garyguo.net
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: Alexandre Courbot <acourbot@nvidia.com>,
 Joel Fernandes <joelagnelf@nvidia.com>, Alistair Popple <apopple@nvidia.com>,
 Zhi Wang <zhiw@nvidia.com>, Simona Vetter <simona@ffwll.ch>,
 Bjorn Helgaas <bhelgaas@google.com>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 nouveau@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/ITGWN3TRJ4KNPGBRNE2Q7BCAD2FYSQH5/>
Archived-At: 
 <https://lore.freedesktop.org/DFNIIJH106EO.35SYTYVJYK0N8@garyguo.net/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Wed Dec 3, 2025 at 5:59 AM GMT, John Hubbard wrote:
> Factor out a chunk of complexity into a new subroutine. This is an
> incremental step in adding ELF32 support to the existing ELF64 section
> support, for handling GPU firmware.
>
> Signed-off-by: John Hubbard <jhubbard@nvidia.com>
> ---
>  drivers/gpu/nova-core/firmware.rs | 39 +++++++++++++++----------------
>  1 file changed, 19 insertions(+), 20 deletions(-)
>
> diff --git a/drivers/gpu/nova-core/firmware.rs b/drivers/gpu/nova-core/fi=
rmware.rs
> index 31a89abc5a87..5ed079a45ec2 100644
> --- a/drivers/gpu/nova-core/firmware.rs
> +++ b/drivers/gpu/nova-core/firmware.rs
> @@ -267,6 +267,24 @@ unsafe impl FromBytes for Elf64Hdr {}
>      // SAFETY: all bit patterns are valid for this type, and it doesn't =
use interior mutability.
>      unsafe impl FromBytes for Elf64SHdr {}
> =20
> +    /// Check if the section name at `strtab_offset + name_offset` equal=
s `target`.
> +    fn section_name_eq(elf: &[u8], strtab_offset: u64, name_offset: u32,=
 target: &str) -> bool {
> +        strtab_offset
> +            // Compute the index into the ELF image.
> +            .checked_add(u64::from(name_offset))
> +            .and_then(|idx| usize::try_from(idx).ok())
> +            // Get the start of the name.
> +            .and_then(|name_idx| elf.get(name_idx..))
> +            // Stop at the first `0`.
> +            .and_then(|s| s.get(0..=3Ds.iter().position(|b| *b =3D=3D 0)=
?))
> +            // Convert into CStr.
> +            .and_then(|s| CStr::from_bytes_with_nul(s).ok())
> +            // Convert into str.
> +            .and_then(|s| s.to_str().ok())
> +            // Check that the name matches.
> +            .is_some_and(|s| s =3D=3D target)
> +    }

What I would do is to provide a helper function to be obtain a NUL-terminat=
ed
string from ELF:

fn elf_str(elf: &[u8], offset: u64) -> Option<&str> {
    // Note that you have a more efficient `from_bytes_until_nul`, you don'=
t
    // need to iterate yourself!
    CStr::from_bytes_until_nul(elf.get(usize::try_from(idx)?..)).ok()?.to_s=
tr().ok()
}

and then you can do

strtab_offset.checked_add(name_offest.into()).and_then(|idx| elf_str(elf, i=
dx)).is_some_and(|s| s =3D=3D target)


> +
>      /// Tries to extract section with name `name` from the ELF64 image `=
elf`, and returns it.
>      pub(super) fn elf64_section<'a, 'b>(elf: &'a [u8], name: &'b str) ->=
 Option<&'a [u8]> {
>          let hdr =3D &elf
> @@ -298,26 +316,7 @@ pub(super) fn elf64_section<'a, 'b>(elf: &'a [u8], n=
ame: &'b str) -> Option<&'a
>                  return false;
>              };
> =20
> -            let Some(name_idx) =3D strhdr
> -                .0
> -                .sh_offset
> -                .checked_add(u64::from(hdr.0.sh_name))

I think the change is making the code hide the error when ELF is malformed.=
 The
old code fails early which is arguably better?

Best,
Gary

> -                .and_then(|idx| usize::try_from(idx).ok())
> -            else {
> -                return false;
> -            };
> -
> -            // Get the start of the name.
> -            elf.get(name_idx..)
> -                // Stop at the first `0`.
> -                .and_then(|nstr| nstr.get(0..=3Dnstr.iter().position(|b|=
 *b =3D=3D 0)?))
> -                // Convert into CStr. This should never fail because of =
the line above.
> -                .and_then(|nstr| CStr::from_bytes_with_nul(nstr).ok())
> -                // Convert into str.
> -                .and_then(|c_str| c_str.to_str().ok())
> -                // Check that the name matches.
> -                .map(|str| str =3D=3D name)
> -                .unwrap_or(false)
> +            section_name_eq(elf, strhdr.0.sh_offset, hdr.0.sh_name, name=
)
>          })
>          // Return the slice containing the section.
>          .and_then(|sh| {

